Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BC3C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAKA274kKV7X6N7gbFTko7U8o/Ptz8yrLVFqW0cfyQE=; b=ombqegPmvg9lGDwbGECnMmJo2N
	BnSEGJhh195+tqRsWk5qXxYtNrgNu2vQnCOfv0TkCMYErbmoNQcrZEQvQ3NHHp31uoivmCbdqa5Ld
	bHBxSI8FrT41jl/zmNANu7eh5Mc1F3EKhzZDMalyNEHrbNUISn0NjwQXIdAxRSPMLZg27v0jy1n1t
	zURZjLluK+TvfRbUfvPXtOBLAlx4uyjncEE/xAkhNRVA4Dd15Z4s+tWElqQ7EO7RCH84KA0EFm3ld
	opGvZv72l6gHRzUzJd/OFwze+IgN/Az3XEmBYH99FFRwPCJg4uR2vQZDYl6h9Nhuj2tsgd5GgH2QO
	BSvF+j2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEbm-00000003N8L-3sjW;
	Wed, 29 May 2024 08:24:30 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCEbU-00000003Mvo-2wjb;
	Wed, 29 May 2024 08:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716971051;
	bh=dMgf18OgYORvs3EofUsQ2AJDwY1b9mO7EdNTn7eb62Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TbvIX/2QMAVx9qpdB03VWNWhi+dyLQFE2rNdKE/0k25xRW35xRolMACdAu2PfhfXG
	 K5n8NkV/w4PKQXDC4l2rIqxCU3+Ud8PciDD5C1QriMxJaiAew4HzAlRs/T/kSrDTz9
	 yqGudgsDd3jeUvC4505hVU+eMCYXkkPGGDK+9Fg+QoS2XzJiSGfbqaPS3nmBZ/WaEC
	 S1S9KcgyFDTZygL8aA0eaHXr42IDKvEi1kJ+MVegZMlkFa0vlc1626Ns2SeS8Q6wNb
	 RrRhZZZrv9i4spdDVcZYIC6Ejkgkf+cDKL6ypalCIjzLk4qorGMIbkRm/wwZFBjX7z
	 qQnQ3Ph5rbaSw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F681378215E;
	Wed, 29 May 2024 08:24:10 +0000 (UTC)
Message-ID: <c52ff392-703c-482c-a297-c12d4e0dbd38@collabora.com>
Date: Wed, 29 May 2024 10:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] pinctrl: mediatek: Provide a helper macro
 PINCTRL_PIN_FUNCTION()
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
 <20240528194951.1489887-5-andy.shevchenko@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240528194951.1489887-5-andy.shevchenko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_012412_907674_253CB090 
X-CRM114-Status: UNSURE (   6.06  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/05/24 21:44, Andy Shevchenko ha scritto:
> Provide a helper macro to assign the struct function_desc entries.
> This helps further refactoring.
> 
> Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Not a strong opinion but, for commodity, I'd like to see "moore" mentioned in the
title, as only the Moore pinctrl IPs are being touched here (where MTK has two
different IPs: Moore and Paris).

In any case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



