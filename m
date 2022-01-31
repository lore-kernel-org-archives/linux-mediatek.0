Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C33C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4H6Ba/MRcslUFC2smSWsInXp5i6AXj2zuSsnvwniZY=; b=G+ZFc1LTGqkMhp
	Golm+NyoKjrMrCSxTJmN/zHfPi2cIaLnBvQofWqi0234DIY43E4tmcuFU6EvcOOdMvU+ySRdBc4Y0
	o4rUWqYlMHh17uo27q15PGNJoJAN0D0CK72Dsy1koQxJ7jkRC+ronFPRf/M07hnmJ38O+Ned96nDC
	EXQVKVfjfs3uqEG1qFLNUf5XIFo8RgwRzCyIflYUKujlEYEGT5h86CoQb1eTxY3cJM2B7j69D8DIx
	McRq2ZwYdSIO5xK4pYUKRdUSRokYqMFmVZWzXkmD0ThnQOO35hixxt7+lcsgzGcRDOC+anq4kNff8
	kBIEMCQGsGWxdgB+FSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEU9B-008vQ9-0t; Mon, 31 Jan 2022 10:42:57 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEU8z-008vNX-KL; Mon, 31 Jan 2022 10:42:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8E6911F4311D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643625763;
 bh=VDCXS99DUqPI4JTZi8sOBTfPcdansr4DXqBbifuXOXI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T7gW8MflY5Yw4jDPpLHRCD0H+jmD/K1Ftxf57efP1GKkaUZ5mFu5iTqM9cjkuRTz9
 gG3syNyUosHelXFFJUc+PcCJAt9++4QN5wQ/4FKaStzlQSQ50cFMvvT9WqpPh+JmOw
 oiENANtFnUx79DeEfqX0SwWTdYH4ARxsuHvxYixEzTpq1qs94EbKsq8udiK2aMtLYZ
 GTuoXFF52h9TYE3w2OvHwF7a3zjw9iRC0e+Yp1Zjg2wSCDJ40+LG8sxGPkxYvxpmvF
 5zkdcWchc10xQrSMLSy/XSB50ZHtoOtTlBvFvcQ173i+7pZkYBsUDj1nXbn2UxFJU4
 9xBoosZdO8Wdw==
Message-ID: <3d9dae30-5cde-9fc1-6705-cb5d6b9f1733@collabora.com>
Date: Mon, 31 Jan 2022 11:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v22 3/7] soc: mediatek: SVS: introduce MTK SVS engine
Content-Language: en-US
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
 Guenter Roeck <linux@roeck-us.net>
References: <20220127033956.24585-1-roger.lu@mediatek.com>
 <20220127033956.24585-4-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220127033956.24585-4-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_024245_833960_DAC38872 
X-CRM114-Status: UNSURE (   7.72  )
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

Il 27/01/22 04:39, Roger Lu ha scritto:
> The Smart Voltage Scaling(SVS) engine is a piece of hardware
> which calculates suitable SVS bank voltages to OPP voltage table.
> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
> when receiving OPP_EVENT_ADJUST_VOLTAGE.
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
