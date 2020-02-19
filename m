Return-Path: <SRS0=zz1H=4H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E127C34022
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 21:17:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CAB024671
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 21:17:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P73Lt99O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CAB024671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47wE7LToUeo1zN881b8LMMIPhfQAMPq2h13gmfBQTUI=; b=P73Lt99OQIWjey
	OTbCu9gnalnEk2AiZuZgVtFQxhpBDTMhB7T1M9irZv2qNlc7T6pbTtOZmEn5b0lsjKALZSigtmCgL
	3eKTywNKstP9IXEzfFkqvoVD9XymkcojT3JNnYtRCguLtCeH4PtNVeZtnFqSvIBCyvYMENOFG/vl8
	ARWBLW3oRfVqBmA1HM2YKmWBuCalUUk8jMiUWijwj9ewPmXkQve0u9durWuIs/LR6B6PGKSGKcCSI
	/nNlT7qGvPbX6wlxVPuFxL7mzfDSmKAcC6ML4V+WsMyXec464XnSJ1r0iM2Edn1NWnsF1hFC39PL2
	7OLVC2vqvICvtg9PJMQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Wis-0006St-VI; Wed, 19 Feb 2020 21:17:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Wih-0006JO-IF; Wed, 19 Feb 2020 21:17:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: koike) with ESMTPSA id C31D428DE65
Subject: Re: [RFC PATCH V5 0/3] media: support Mediatek sensor interface driver
To: Louis Kuo <louis.kuo@mediatek.com>, hans.verkuil@cisco.com,
 laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org,
 keiichiw@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
References: <20200129081650.8027-1-louis.kuo@mediatek.com>
From: Helen Koike <helen.koike@collabora.com>
Message-ID: <f825b943-610e-ba19-cbfd-eea2dae2245f@collabora.com>
Date: Wed, 19 Feb 2020 18:17:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129081650.8027-1-louis.kuo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_131723_734827_D4CF102C 
X-CRM114-Status: GOOD (  17.68  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 "kernel@collabora.com" <kernel@collabora.com>, Rynn.Wu@mediatek.com,
 srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Louis,

On 1/29/20 6:16 AM, Louis Kuo wrote:
> Hello,
> 
> This is the RFC patch adding Sensor Inferface(seninf) driver on Mediatek mt8183 SoC, which will be used
> in camera features on CrOS application.
> It belongs to the first Mediatek's camera driver series based on V4L2 and media controller framework.
> I posted the main part of the seninf driver as RFC to discuss first and would like some review comments
> on the overall structure of the driver.
> 
> The driver is implemented with V4L2 framework.
> 1. Register as a V4L2 sub-device.
> 2. Only one entity with sink pads linked to camera sensors for choosing desired camera sensor by setup link
>    and with source pads linked to cam-io for routing different types of decoded packet datas to PASS1 driver
>    to generate sensor image frame and meta-data.

If I understood correctly, the subdevice represents a bridge, with 4 sink pads and 8 source pads (12 total) right?
And you can only route a sink to a source at a time and you can't use multiple sensors simultaneously, correct?

> 
> The overall file structure of the seninf driver is as following:
> 
> * mtk_seninf.c: Implement software and HW control flow of seninf driver.
> * mtk_seninf_def.h: Define data structure and enumeration.
> * mtk_seninf_reg.h: Define HW register R/W macros and HW register names.
> 
> [ V5: use recommended coding style, revise DT binding documentation]
> 
>   media: platform: mtk-isp: Add Mediatek sensor interface driver

It looks like patch 1/3 didn't reach linux-media mailing list
    https://patchwork.linuxtv.org/project/linux-media/list/?series=1706
I guess it's because of its size, you might need to break it into smaller patches.
I see that mtk_seninf_reg.h is really big and not all of it is used, maybe you can split it up.


>   dt-bindings: mt8183: Add sensor interface dt-bindings
>   dts: arm64: mt8183: Add sensor interface nodes
> 
>  .../bindings/media/mediatek-seninf.txt        |   66 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   12 +
>  drivers/media/platform/Makefile               |    1 +
>  drivers/media/platform/mtk-isp/Kconfig        |   17 +
>  .../media/platform/mtk-isp/isp_50/Makefile    |    3 +
>  .../platform/mtk-isp/isp_50/seninf/Makefile   |    6 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf.c        | 1112 +++
>  .../mtk-isp/isp_50/seninf/mtk_seninf_def.h    |   72 +
>  .../mtk-isp/isp_50/seninf/mtk_seninf_reg.h    | 7747 +++++++++++++++++
>  9 files changed, 9036 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-seninf.txt
>  create mode 100644 drivers/media/platform/mtk-isp/Kconfig
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/Makefile
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_def.h
>  create mode 100644 drivers/media/platform/mtk-isp/isp_50/seninf/mtk_seninf_reg.h
> 

Thanks
Helen

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
