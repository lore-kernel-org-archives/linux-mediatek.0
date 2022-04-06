Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4039C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y63ta8epEMK0xlL0bsxScicdwLkB/9k/Jsi/k5Ox9vc=; b=JGwqGMpd3KP1Zg
	hiqUannhzoQa2hvfRiTjtNpc6cXTdSwsL3MearH7PHy4tqLrS11UF5xHPjUhsOVEXpDJ5NcLMcy5/
	mVZVg6rj8ho3EP3sNx9q3K/IZAOl14PtOrqExiq1N5cmg9/C/PH7ZYkDzVQW4dRUd2TGzt4yY9boO
	TdAe2gp9wiCqDiAzi0R8eM32w8ytRA0ZWPLRoBe5u47hkRU08Vjajg7E+hUYs66uY3SwZTkYRXr7q
	598yDmixr7H0ciTw+twb7joInCbPjfAT8C+pDJM6OfEm1lw+Zdgb2pj02LI+WRhIhyiVcMYGpMhAy
	6eocMZTn9CqkomJ5oHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3Iy-005Zlb-Hc; Wed, 06 Apr 2022 10:54:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3GF-005YCM-Oi; Wed, 06 Apr 2022 10:51:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5357A1F40EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649242298;
 bh=au3kCGpBvELGj1O6aCEDgSZw3PDmNnTwCgo2ZapgbJY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k8lcVf8I9OjzL+Yob0GKMFrCpB3OMWOSdFSJ1vEdCc/3LPY7XhF7g1KGHrHyO7+Je
 akVMl7CsoT5V5aCZINzeQhUH3RmtO9hQyQdMsksPUFuULZiaZVd7i/CI08Yx0999Qc
 uKMhT0MPfHPsCxFNq3wbodLtSinV4mCnKSe+cwWmSz1Bi9RAIMl5ZoguOabgGmDeoM
 W2tiM8+ihWlLanFyMB1oKFA3yGBon14UGi/jwC7d12ikEczIYrXo8dHHsAA2tPDWtP
 zpSLlIDK0j0/ObDa8X5bXKRqjWkuXUbN+HivTzFDsR7F2AgbuzmpX2TksYqkyRS0Na
 bv7dX0vBwdH1Q==
Message-ID: <0e6d110d-0637-2be8-cab0-9d936668fa7b@collabora.com>
Date: Wed, 6 Apr 2022 12:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
 <yongqiang.niu@mediatek.com>, =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?=
 <Jason-JH.Lin@mediatek.com>, =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?=
 <Nancy.Lin@mediatek.com>, =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
 <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
 <4ed2dc24d600fa73b91bb411391c98a5bf4f8d8b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4ed2dc24d600fa73b91bb411391c98a5bf4f8d8b.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_035140_037217_E8922390 
X-CRM114-Status: GOOD (  11.96  )
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

Il 06/04/22 12:48, Rex-BC Chen ha scritto:
> On Wed, 2022-04-06 at 18:40 +0800, AngeloGioacchino Del Regno wrote:
>> Il 06/04/22 11:46, Rex-BC Chen ha scritto:
>>> The driver data for MT8192 is the same with MT8183. Therefore, we
>>> correct it.
>>>
>>> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
>> ...though, from what I know, you should also move MT8195 down there!
> 
> Hello Angelo,
> 
> Thanks for your review.
> But for MT8195, disp_aal is using the same compatible with MT8173.
> 
>  From the MT8195 project DTS is using:
> 
> aal0: disp_aal@1c005000 {
> 	compatible = "mediatek,mt8195-disp-aal",
> 		     "mediatek,mt8173-disp-aal";
> 	reg = <0 0x1c005000 0 0x1000>;
> 	interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
> 	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> 	clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
> 	mediatek,gce-client-reg =
> 		 <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
> };
> 
> BRs,
> Rex
> 

I'm sorry Rex, I've just realized - I was confusing this one with the
8195 gamma binding instead!

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
