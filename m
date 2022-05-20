Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A98C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdQdc0eBkbJhTdbE5k6VJj+aTi26uxwJ+OCz6r788co=; b=3bKnhg5wayrMtd
	E+fjISNmwhQz3SY2DDdt1/ogFiH9k5ZWVrziKeIGGid6RIfRx2BfhICwqk9JS3aKH4WeHDpcv0G/L
	AjgruotW0FPyBMi//Oj3GFP3PsHbFUjJGZBR6lyQrOjs2SqdPvHOk0IBiODoe6O6FNTd4xyPcjWHN
	jfxKx1YASA1Hjx81VVicVjDAcsCXQetqLrO5n+SulUpHdR3ySTBfedA0WCgm3fHY3EYzTNGIzZbh0
	7Bvj29eyUnZLfhk2LT1Taz6llxdi5Q0vUm8AoCJrbzqgDYl5EaPKjajnfARuF4TAHkeIHDo61eb5w
	ezEUG+P+qPQZ6CajGxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0Q4-00ByKB-Kv; Fri, 20 May 2022 11:03:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns0OP-00BxEJ-F6; Fri, 20 May 2022 11:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OE6raZbucX9LQfP+TUClB+u691iV9kBCVX1IaiFUTRE=; b=GBAc4E+d890dACNmy1V5iNzH7n
 XiCNsIPrBp13FTu7pC6+wuJsXxCv1rn6JpntHwSs6wURzXy19oVinvyco81H1KmEiUtpuKQgfv7In
 MABC0AapBKLeyHuQCLzjhR/9LsPi7aQ18mtEAM1n4WwuOQBdGAoOSSPt09RUiq4lpizu6RweK+I0E
 4XKx7dc9KjuAnOybVmZ6+HcB8RUT4aukfFU2RAgifDkDAKuxV8FUjsrNZrsgqOCoXmyzNJmZmv4YD
 DRZxFKfX9KKJXDUtnF25AXcbhZiWZXxsTh8c20Z4exSyZXZvTLEAM0og+xCthbEmLNy1IUnZjgMdg
 e6Wp0PoQ==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzNm-002Inw-EU; Fri, 20 May 2022 09:57:22 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5UCw9026795;
 Fri, 20 May 2022 04:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=OE6raZbucX9LQfP+TUClB+u691iV9kBCVX1IaiFUTRE=;
 b=OZjWqUg2GB9AJ9JqFusRILLr+RJoWNaMdCe9RA8DZ3zC+BqhasJKotr9r087ufLn2CfT
 ImDGP7AQdM1dEhMs05cuGKULUV2UMVhWKhwv1lv9aIYxP58hsADDle5oYJD73+1i/5E/
 DJ4PIeWt9ouGrMRIwpVZYIv2N+Hl3NLhwUKoEL7upZzJBlhj+H8WMUIA+0c0utHrFXib
 6St0njUEwySoagUHdfOhKQMIhve6czUMiuHZthPtAEsJdIL2UVkqXmo+S/ET4vQeKKCR
 eK2EWlTLp4WJJ/WhIR7yVYO0bDmrZEz1nQCC+kwy9kogs86oLbScSXA9l5o3Xs/ta2/U LQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upg5ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 20 May 2022 04:56:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 10:56:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 20 May 2022 10:56:54 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 42FB3476;
 Fri, 20 May 2022 09:56:54 +0000 (UTC)
Date: Fri, 20 May 2022 09:56:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Samuel Holland <samuel@sholland.org>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <kuninori.morimoto.gx@renesas.com>, <nicolas.ferre@microchip.com>,
 <nsaenz@kernel.org>, <shawnguo@kernel.org>, <linux-imx@nxp.com>,
 <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
 <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <daniel@zonque.org>,
 <srinivas.kandagatla@linaro.org>, <linux-rockchip@lists.infradead.org>,
 <krzk@kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
 <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
 <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
 <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 22/56] ASoC: sunxi: Update to use set_fmt_new callback
Message-ID: <20220520095654.GK38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-23-ckeepax@opensource.cirrus.com>
 <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 0o2bd6ilE3N_-d0xNvYBerQp3pGSYvGE
X-Proofpoint-ORIG-GUID: 0o2bd6ilE3N_-d0xNvYBerQp3pGSYvGE
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_105720_162570_4BAEA60F 
X-CRM114-Status: GOOD (  20.73  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, May 19, 2022 at 06:40:11PM -0500, Samuel Holland wrote:
> On 5/19/22 10:42 AM, Charles Keepax wrote:
> > As part of updating the core to directly tell drivers if they are clock
> > provider or consumer update these CPU side drivers to use the new direct
> > callback.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c   | 20 ++++++++++----------
> >  sound/soc/sunxi/sun8i-codec.c |  8 ++++----
> >  2 files changed, 14 insertions(+), 14 deletions(-)
> > diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> > index 0bea2162f68d9..6e9ef948d6621 100644
> > --- a/sound/soc/sunxi/sun8i-codec.c
> > +++ b/sound/soc/sunxi/sun8i-codec.c
> > @@ -286,11 +286,11 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> >  	u32 dsp_format, format, invert, value;
> >  
> >  	/* clock masters */
> > -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > -	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
> > +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> > +	case SND_SOC_DAIFMT_BP_FP: /* Codec slave, DAI master */
> 
> This is a codec driver, and it is only ever used on the codec end of a link, so
> I would not expect it to be changed.
> 

Thanks for spotting that, silly mistake on my part. Will fix for
a rev 2.

Thanks,
Charles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
