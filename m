Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE0C4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 09:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zdln1ZYdoazs8E0q1blg57dp1RK+XGBEu2fpQYjh3Uk=; b=P+Qx02qUR3lnPv6cYdyljjZlb8
	ODOMu7z5REmu7ZZkcjE0DNDA002+kPg6cZyv5qTIDKA2A/UTJbIQY5IX7mMRNm+r5DTDvf6S/AOwI
	6yhs3KGEZ2YjoPLudhYdjCmAFZyTvheRvq2o5geZARSJ69HMDsjDH6vqO9zZ+owtq6bHLkB2tinoz
	e52G23W84cP5sc/dftmD6L9Cda9IUwCKL0lnu8si2FX5p/1zFBki0P3Rrcknz/a32Xv0RXDmfLkEt
	sRQTSJ9ggqm14++tF7IKpkkyuef8s2Z3M9whtexkQz08d17F1A/SkgXpaqn1Uon3mu+hJpqTIXk5Y
	O9av5m+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0gyf-00E1mu-1M; Fri, 24 Dec 2021 09:35:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0gyT-00E1kQ-6M; Fri, 24 Dec 2021 09:34:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D8F331F45BEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1640338490;
 bh=qZF4je+LerA+OqBTDGJZEJVXwlNuPorsNcMLYzAa4mE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Wg3hniFlgAgdm3+vcSd+eEaeyLtW+YGGquc/J66XoOcZZJmWSoP5yHq1QqHbFJ8xg
 a6UBjbyr1qNmhueOZ38UDEgHWRyyB9HeL1TLmBnOdlSHC+WDvm6nGCL4aBd4S8OdET
 wRdm7ILxTeJ0O4Zji5PCMyoIlwnJj/T0UphNwoFSvybGmnV9fGfuQbjCDWXnFX7Ec4
 o8Cw2NB7P3KIUiX8UOG4znfp3z/DNk0gprvhs/ZzD74KMPQKhgW7dSq7jKxDnQZx9J
 rsFOuzP2hrT568VUNyAGUxmBMsX2TqnJkkn9gMaa+8n20439BASD3L6vOzf9fUil9M
 NJ2HkW59ys1KA==
Subject: Re: [PATCH v16 3/7] soc: mediatek: SVS: introduce MTK SVS engine
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-4-roger.lu@mediatek.com>
 <c97f7dcd-32e5-616e-1bf9-fbd110ecd218@collabora.com>
 <6cdc903250723a6c547bccf2546dd10091b76249.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <fc825af2-7331-fa05-26e0-f3054557333a@collabora.com>
Date: Fri, 24 Dec 2021 10:34:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6cdc903250723a6c547bccf2546dd10091b76249.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_013453_409344_669EE8E0 
X-CRM114-Status: GOOD (  16.65  )
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

Il 24/12/21 10:27, Roger Lu ha scritto:
> Hi AngeloGioacchino,
> 
> Sorry for the late reply and thanks for all the advices.
> 
> On Thu, 2021-10-21 at 10:46 +0200, AngeloGioacchino Del Regno wrote:
>> Il 28/04/21 08:54, Roger Lu ha scritto:
>>> The Smart Voltage Scaling(SVS) engine is a piece of hardware
>>> which calculates suitable SVS bank voltages to OPP voltage table.
>>> Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
>>> when receiving OPP_EVENT_ADJUST_VOLTAGE.
>>>
>>> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
>>> ---
>>>    drivers/soc/mediatek/Kconfig   |   10 +
>>>    drivers/soc/mediatek/Makefile  |    1 +
>>>    drivers/soc/mediatek/mtk-svs.c | 1723 ++++++++++++++++++++++++++++++++
>>>    3 files changed, 1734 insertions(+)
>>>    create mode 100644 drivers/soc/mediatek/mtk-svs.c
> 
> [snip]
> 
>>> +/* svs bank common setting */
>>> +#define SVSB_DET_CLK_EN			BIT(31)
>>> +#define SVSB_TZONE_HIGH_TEMP_MAX	U32_MAX
>>> +#define SVSB_RUNCONFIG_DEFAULT		0x80000000
>>> +#define SVSB_DC_SIGNED_BIT		0x8000
>>> +#define SVSB_INTEN_INIT0x		0x00005f01
>>> +#define SVSB_INTEN_MONVOPEN		0x00ff0000
>>> +#define SVSB_EN_OFF			0x0
>>> +#define SVSB_EN_MASK			0x7
>>> +#define SVSB_EN_INIT01			0x1
>>> +#define SVSB_EN_INIT02			0x5
>>> +#define SVSB_EN_MON			0x2
>>> +#define SVSB_INTSTS_MONVOP		0x00ff0000
>>> +#define SVSB_INTSTS_COMPLETE		0x1
>>> +#define SVSB_INTSTS_CLEAN		0x00ffffff
>>> +
>>> +static DEFINE_SPINLOCK(mtk_svs_lock);
>>> +
>>> +/*
>>
>> Thanks for using kernel-doc!! However, to be proper, this has to be
>> /**
>>    * ..........
> 
> Oh okay. Thanks. I will use /** to add multi-line comments. However, I checked
> kernel doc-guide and it uses indent as below. So, I'll follow it. If I'm doing
> it wrong, please correct me. Thanks a lot.
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html
> 
> /**
>   * .........
> 

You're welcome! By the way, yes, the indentation is as shown on the documentation.

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
