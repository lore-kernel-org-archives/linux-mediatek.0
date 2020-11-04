Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F01BC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 10:45:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D1A20786
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 10:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYn/OOm8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D1A20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+lepUztu2pkYXWTR0/GTqKi/HlEsaBHJYFnBSUtzomY=; b=kYn/OOm8m6VEo4abWixuqZZBN
	QfSvaMVwVj6Sx/eLEkDnTVdSiXjuZpw1/UkG8/QB3r3Rbg89tPOrjIecAQQ+XQ8zkR1WSXM4mWZRS
	SIqmTV48y28XHI4dSLhlEhb7L3R/DxRAlHpmYe7oBTeyk/oENzrg333YNT7L2ZG9xVY6L1wMU9lq8
	RAylPSKkMUbyzY4UbJh326pHaO204XiU4Tu3UTkS6zAubtkEgCHAzZQgU2TFfAGLGKh8s9XXnbYzH
	wVM4w/ifE+cmGY8aBo6XYngrzKeQK5uPu7fKZkos0glFnj7i+RxLE/QDBpYHEyGfMyNCBojG5TOON
	PUK9jntjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaGHk-0005tQ-3c; Wed, 04 Nov 2020 10:45:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaGGe-0005Mn-9f; Wed, 04 Nov 2020 10:43:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 923391F45919
Subject: Re: [PATCH 0/4] soc: mediatek: Prepare MMSYS for DDP routing using
 tables
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
Message-ID: <e8f42689-4c5f-b5ab-8b4c-ac6b8eafc1d3@collabora.com>
Date: Wed, 4 Nov 2020 11:43:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201006193320.405529-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_054352_592498_DD4D5856 
X-CRM114-Status: GOOD (  18.49  )
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
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On 6/10/20 21:33, Enric Balletbo i Serra wrote:
> Dear all,
> 
> The following series are intended to prepare the mtk-mmsys driver to
> allow different DDP (Data Display Path) routing tables per SoC. Note
> that the series has been tested only on MT8173 platform and could break
> the display on MT2701 and MT2712 based devices. I kindly ask for someone
> having these devices to provide a tested routing table (unfortunately I
> didn't have enough documentation to figure out this myself).
> 
> For the other devices (MT8183, MT6779 and MT6797) DRM support is not in
> mainline yet so nothing will break.
> 
> Thanks,
>   Enric
> 
> 
> CK Hu (2):
>   soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
>   soc: mediatek: mmsys: Use an array for setting the routing registers
> 
> Enric Balletbo i Serra (1):
>   soc: mediatek: mmsys: Use devm_platform_ioremap_resource()
> 
> Yongqiang Niu (1):
>   soc / drm: mediatek: Move DDP component defines into mtk-mmsys.h
> 
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  34 +-
>  drivers/soc/mediatek/mtk-mmsys.c            | 429 +++++++++++---------
>  include/linux/soc/mediatek/mtk-mmsys.h      |  33 ++
>  3 files changed, 263 insertions(+), 233 deletions(-)
> 

Although the patches 3 and 4 are controversial, and I'll work on it, I am
wondering if 1 and 2 are ready to be picked, as they are independent, so I can
send next version without these two patches.

Thanks,
  Enric



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
