Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E85C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 09:59:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C378D20679
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 09:59:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RypftQE6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C378D20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Es24+WejW40+M494jPIrg4OE+lvIJzmRZJAng7op7aU=; b=RypftQE6QWlhA84lDCZ/v2Dxl
	KVLKg5qg96uowhsFd4lcIwPKm3/Q0/r7aRTY6hpOC+tzmGzEQUq89ynghB4HbcUSMSXd8nlGFNi06
	rU9VBLEoUZ0559BDZeNd/OrMcc/kyj+6JtKPOXi181Iijl0Z/PDFTnrkdHH7p2IX+8yWqGcTse4or
	qso7uVOTjY4vuda1W8p0zUDdarklGeDbxx1Q1OR0lUgg4C19ogd2mmliAcqPVQvba1M5V6rgd0k+6
	w/KT5CT8g42DRxPwoPgfsuX7TCUc323yOnr/U54xtVTOcNwOrsUXV2+mKEOMo9+9PiWNV8I5hcKBx
	60oJG9mTw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jol8L-000712-7m; Fri, 26 Jun 2020 09:58:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jol3t-0004Zg-72; Fri, 26 Jun 2020 09:54:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id EE0602A04F6
Subject: Re: [PATCH v2 0/2] Refactor MDP driver and add dummy component driver
To: Hans Verkuil <hverkuil@xs4all.nl>, Eizan Miyamoto <eizan@chromium.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20200506084039.249977-1-eizan@chromium.org>
 <25cbac25-035f-9c2b-24ec-f59403b56424@xs4all.nl>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <177292b5-ebe9-6e10-c93e-0106e312ba83@collabora.com>
Date: Fri, 26 Jun 2020 11:37:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <25cbac25-035f-9c2b-24ec-f59403b56424@xs4all.nl>
Content-Language: en-US
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Eizan and Hans,

On 24/6/20 16:05, Hans Verkuil wrote:
> On 06/05/2020 10:40, Eizan Miyamoto wrote:
>>
>> This series depends on all changes in the series:
>> https://patchwork.kernel.org/patch/11530275/
> 
> I plan on merging the v3 of this series.
> 
>>
>> We are adding a dummy MDP component driver so that all the components
>> are properly configured with IOMMUs and LARBs. This is required for
>> us to get hardware video decode working in 4.19, and possibly newer
>> kernels.
> 
> What is the status of this series?
> 

First of all, sorry, I should have had answer before but for some reason I
missed the track of this patchset.

> There was some discussion with Enric, but that didn't come to a conclusion,
> I think.
> 

Yes, my main concern is how this driver is instantiated, it is using one of the
rdma nodes, see the rdma0 node vs rdma1, to instantiate the driver,

       mdp_rdma0: rdma@14001000 {
                compatible = "mediatek,mt8173-mdp-rdma";
                             "mediatek,mt8173-mdp";
                reg = <0 0x14001000 0 0x1000>;
                clocks = <&mmsys CLK_MM_MDP_RDMA0>,
                         <&mmsys CLK_MM_MUTEX_32K>;
                power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
                iommus = <&iommu M4U_PORT_MDP_RDMA0>;
                mediatek,larb = <&larb0>;
                mediatek,vpu = <&vpu>;
        };


        mdp_rdma1: rdma@14002000 {

                compatible = "mediatek,mt8173-mdp-rdma";
                reg = <0 0x14002000 0 0x1000>;
                clocks = <&mmsys CLK_MM_MDP_RDMA1>,
                         <&mmsys CLK_MM_MUTEX_32K>;
                power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
                iommus = <&iommu M4U_PORT_MDP_RDMA1>;
                mediatek,larb = <&larb4>;
        };


My point is that DT is to describe hardware not a trick to instantiate drivers,
so the "mediatek,mt8173-mdp" is completely unnecessary. We had the same issue
with the MMSYS driver and the mediatek DRM driver, and we solved by having the
mmsys driver instantiating the drm driver. I think we should apply the same
solution here, see [1] for reference. If you want to continue the discussion
maybe would be better


Thanks,
 Enric

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/soc/mediatek/mtk-mmsys.c?id=667c769246b01c53ad0925d603d2a2531abd3ef2

> Regards,
> 
> 	Hans
> 
>>
>> Changes in v2:
>> - remove empty mtk_mdp_comp_init
>> - update documentation for enum mtk_mdp_comp_type
>> - remove comma after last element of mtk_mdp_comp_driver_dt_match
>>
>> Eizan Miyamoto (2):
>>   [media] mtk-mdp: add driver to probe mdp components
>>   [media] mtk-mdp: use pm_runtime in MDP component driver
>>
>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 172 ++++++++++++++---
>>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  32 +--
>>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 182 ++++++++++++------
>>  drivers/media/platform/mtk-mdp/mtk_mdp_core.h |   1 +
>>  4 files changed, 286 insertions(+), 101 deletions(-)
>>
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
