Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB01DC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyhZA7HsRzRmWGnr3NuvhJh6Luug31bGsk9Q3srPBxc=; b=nEcC/NXEr/2/IS
	k0LK2nYKpe83nn7rC/aBKYLQV90uhVOMjy8aBJViTv1ZdEKs8KsL8cPV/9Nmhx5Za+7ap2CxhwHLl
	N24nP3OM9eRz4S8BDrc6ayW7Hu+2juIV19bKzMvB1uaLo+/6TfKJ6ri/lFX9H9qKrG+yRROfdu6td
	w9qs96+/BS5Ij+8XfDH4EctcDD4CvxmzK5/pSfcpbCc2rj8vUm9pEHAGoS+GMJ1o91kL3IJezh1Od
	ish1spfvp9RWfuYT9X1ChkjF6qtD26YOkWwYYG+pjXY+z9IzFjoBDAcfvrhJ42xb5yDmGy8VTVocm
	5/2Jjehjkh0m4sMggTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMRSV-008kVK-SM; Tue, 22 Feb 2022 09:27:47 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMRSI-008kPC-60; Tue, 22 Feb 2022 09:27:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 505E91F43FA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645522052;
 bh=9uIWhkgh5zj+kS+T5nmX1TTemvU0JjPsg/tDayMXXIM=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=WGzSpzkFjQqTS2z3k6akWiB7z9JcJe7NQtCE5iLTZ+xtjOkyjRk8g3pUm+HXEUEwS
 wC1joSSu8ixjFIRti1u6wvw0Uokl5Y/0mQD68IITDkDTvxEK4kqEiKRyzT3ku36TfZ
 Cn77ERP+0FfeK26yCuP5PWD/TeqRfSVNw+LlnJaSv8aEmoAA07rb081xrBMLAkrfw4
 5T4GdVGvf2qkn049NMlMOGxY5PcICG/3N3NwQF1A4k4Fl7QNwpxA00mayoG0/Y81t/
 9lJ/6LWYJhHMFTiOrRKAh+i8BQrULno5quArIiQ3+3lcCSsq/PnX5BBAPsH/6JQKvo
 MaSFQE+q4Rkog==
Message-ID: <88cf418d-69d2-2852-1ed6-d96143694dac@collabora.com>
Date: Tue, 22 Feb 2022 10:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v23 1/7] dt-bindings: soc: mediatek: add mtk svs
 dt-bindings
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>
References: <20220221063939.14969-1-roger.lu@mediatek.com>
 <20220221063939.14969-2-roger.lu@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220221063939.14969-2-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_012734_425191_33D1CF7B 
X-CRM114-Status: UNSURE (   6.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 21/02/22 07:39, Roger Lu ha scritto:
> Document the binding for enabling mtk svs on MediaTek SoC.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
