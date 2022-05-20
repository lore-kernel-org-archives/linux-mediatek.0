Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F410C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gs7Abw6v+2w2OmJNHm6fqhSIhlztni3IHF71bJXp5Q4=; b=A5dmwg50Rs5/bu
	hxSsMNM9ikKGfjiNFUsRibwMgJjDUQ48LlfkUABnvBnYwx3UPmtVOVtsERbObKxrReJUdBIsH+wuZ
	T3svj+RtAOmNzxRfEEIGn12ap3qSgcTLUACffBVc4K1XxYgE9nrFsu48zY4JOytF6hX3dVtVu/qoj
	cBGe4f0kj6Dni84NSTzCSC2sePbkOIHntCCujp1otVRHGY1TJ4zELrriQKHJmA6I2BEJIS8k/5P0P
	T+jDx0nOKx5Bhy/xpM7m2ct77TLWZ0uxo4W2ftVgadRtfEMyJZfXnxhWaXWOX89F8GQRvCPO0G0BI
	kWL6R2Jl0j5bikOTRakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrzor-00BsOi-3E; Fri, 20 May 2022 10:25:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzop-00BsMw-IA; Fri, 20 May 2022 10:25:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WSOvhMBIg+CnexC+Y8X+ZG7BYMkoKeetiZYSiJmE0cw=; b=EOoktUHChXRYEYWKii5MVDtiyi
 kS+dAPJ6Ekg5JNdq1mEhTUSUYvxSProQ9DM1LfwfVLYm0V6/djh5F6aCoswLJTh2BXFGKZgRFGsCM
 vRWlX3xtLjoiGT7Yrpe+aIubWp+q58YH+G6yHpvxomkBykyH/6hV46yxR1V7bq5OtknIHwuAgUDiH
 NNE5pSzb33dNJFoaD/ayO1UjFh2sA8dgFBS+mKa2Yx8gQ9g7zh87iTVPShBkYwjFqLG6/51mVHtO9
 wULbVakzYssjMprd26LEupA6EXdq9XcTSqZQ+2JNOXPlhEeF84qKwt81Rs+Gz6iFjCzU1WGQDxpbx
 KsVYRJTA==;
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzoh-002JLT-0u; Fri, 20 May 2022 10:25:09 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5UCxB026795;
 Fri, 20 May 2022 05:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=WSOvhMBIg+CnexC+Y8X+ZG7BYMkoKeetiZYSiJmE0cw=;
 b=E3MDFwXsbJRiBaE4OT2ai+JBwbYdqbCNDnTM5WTrjlOXZlrikeuJ1tiL+m5bGqsZo03j
 hZNgysmRG2QNG9jfqt9CJyU1HKdQikMi9FpVUiaR7mHeBwbTedb07Mex56RR9EocUbFP
 vjQtPAGfK1wk5RM/9IUs9D/tVUYW0yOqIgk1qYoeQRhBJEla3nFqJiatKvzERFcXHqSI
 Q+/Hno0xMo5/BjF4Kn3iHQ0QMOXFJX9/9GuLbAmIRVv9J84ewdgkmDjMuNAiVSG2dbUO
 otHvJplf8L8ZVHcLm7hZgWu0kIHYmP+5RyytltwUsoK/TaAybqvdQMM8AE7gkhiA4klo dQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upg6de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 20 May 2022 05:24:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 11:24:47 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 20 May 2022 11:24:47 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 20F84458;
 Fri, 20 May 2022 10:24:47 +0000 (UTC)
Date: Fri, 20 May 2022 10:24:47 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <nicolas.ferre@microchip.com>,
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
Subject: Re: [PATCH 56/56] ASoC: simple-card-utils: Move
 snd_soc_component_is_codec to be local
Message-ID: <20220520102447.GL38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
 <87czg98193.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czg98193.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: EewLKkNvojqM2gQAbwrh9EQ5fKjwiv7u
X-Proofpoint-ORIG-GUID: EewLKkNvojqM2gQAbwrh9EQ5fKjwiv7u
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_112507_643729_1CA32371 
X-CRM114-Status: GOOD (  27.63  )
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

On Fri, May 20, 2022 at 01:02:33AM +0000, Kuninori Morimoto wrote:
> 
> Hi
> 
> This is not related to this patch, but...
> 
> > -static inline int snd_soc_component_is_codec(struct snd_soc_component *component)
> > -{
> > -	return component->driver->non_legacy_dai_naming;
> > -}
> (snip)
> > +static inline int asoc_simple_component_is_codec(struct snd_soc_component *component)
> > +{
> > +	return component->driver->endianness;
> > +}
> 
> I have added "endianness" "non_legacy_dai_naming" to component
> when convert old "Codec style" into current "Component style".
> All codec needs to have these 2.
> 
> 	69941bab7c7aeaa7bf7e84397e294c17f0b7c6df
> 	("ASoC: snd_soc_component_driver has non_legacy_dai_naming")
> 
> 	273d778ef38a8861f880e9df5799029dc82bd55d
> 	("ASoC: snd_soc_component_driver has endianness")
> 
> The reason why I didn't use "codec" was that try to keep
> original style as much as possible.
> But it seems this is good time to use "codec" for it ?
> I think the code will be more understandable.
> 
> -	.endianness
> -	.non_legacy_dai_naming
> +	.is_codec

Yeah I considered this but it didn't really feel like the right
way to go to me. Firstly, at this stage we almost certainly need
to keep the endianness and non_legacy_dai_naming flags, there are
corner cases when endianness probably shouldn't be applied to CODECs
(as noted in my endianness series), and there are platform drivers
that use non_legacy_dai_naming.

We could add an is_codec flag along side the other two. But it
means a whole extra flag and means the the core is still requiring
a concept of what is a CODEC driver, which really we want to get
rid of as part of componentisation.

My thinking was that, whilst making this function local to the
driver isn't perfect, simple card will be used with simple CODECs
that are likely to exist on a standard audio bus, and thus have
endianness and the newer graph cards don't require specific
identification of what is a CODEC driver. So it probably works as
a solution for now.

> 
> Thank you for your help !!

Absolutely no problem, thank you for all the work you have done
on this over the years.

Thanks,
Charles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
