Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1694AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 10:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mQhhKWdw81MnqzLbTlovB2jTo1ukFEkpXTl8/cUfH4=; b=iNS5qzvAnjxVn3
	cyd70QXdPhj7w5miMK/HZOllH1ZU7ogMXEE9oNbHHs6UfEh/OAPNzNY5T86VP2hYRsEH00VXTpYA/
	23tO1TEFzt98ShGoErAR0zofT1yAqIChn7E6YqVxNd2fM5wzy7CL7o31zKeO+vcHNK1BnyRNHyKrL
	kIpB3SqhIp8rDU74VUqmFW7EXEFQZ6IwMbvgL2MFBcOKHPhg/f+EJbOWNM9V7Tmc12LJe9KwMxaBs
	1wWiZoEVAb6LFxoAiHrv9zEN/eke3mlwaVkRQaFs+AcrHVdwFcsmNXEQe+4nWHngN3OLAvq931mg4
	MVooKwztbpjaFy1gj0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAzY-000E0V-IG; Thu, 24 Feb 2022 10:04:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNAzL-000DwB-Pd; Thu, 24 Feb 2022 10:04:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCAD8B824FA;
 Thu, 24 Feb 2022 10:04:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEC3C340E9;
 Thu, 24 Feb 2022 10:04:37 +0000 (UTC)
Message-ID: <c28641a3-4da4-af49-dcc5-ae46d1f52972@xs4all.nl>
Date: Thu, 24 Feb 2022 11:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RESEND,V7,0/6] Enable two hardware jpeg encoder for MT8195
Content-Language: en-US
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com,
 srv_heupstream@mediatek.com
References: <1645693637-627-1-git-send-email-kyrie.wu@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <1645693637-627-1-git-send-email-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_020444_181498_0A3A7520 
X-CRM114-Status: GOOD (  27.31  )
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

Hi Kyrie Wu,

I just noticed that none of your patches ever arrived at the linux-media mailinglist.
And since they never arrived there, then they also won't appear in our patchwork
instance (https://patchwork.linuxtv.org/).

That might explain why your media patches aren't picked up since I rely on patchwork
to keep track of new patches.

I've no idea why they do not arrive, I see nothing wrong with them.

Perhaps you should try to post a simple test email to the mailinglist to see if it
arrives.

Looking for mails from you at lore.kernel.org:

https://lore.kernel.org/linux-media/?q=kyrie.wu

only shows replies *to* you, and not a single email actually *from* you.

Regards,

	Hans

On 2/24/22 10:07, kyrie.wu wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> This series adds support for multi hardware jpeg encoding, by first
> adding use of_platform_populate to manage each hardware information:
> interrupt, clock, register bases and power. Secondly add encoding
> work queue to deal with the encoding requestsof multi-hardware
> at the same time. Lastly, add output picture reorder function
> interface to eliminate the out of order images.
> 
> This series has been tested with both MT8195.
> Encoding worked for this chip.
> 
> Patches 1 Adds jpeg encoder dt-bindings for mt8195
> 
> Patches 2 jpeg encoder builds two module for using Multi-HW,
> export some functions to make them visible by other modules.
> 
> Patches 3 use devm_of_platform_populate to manage multi-hardware.
> 
> Patch 4 add jpeg encoding timeout function to judge hardware timeout.
> 
> Patch 5 add encoding work queue to deal with multi-hardware encoding
> at the same time.
> 
> Patch 6 add output picture reorder function to order images.
> ---
> Changes compared with v6:
> - new yaml file for mt8195 jpeg encoder.
> - some modifications for patch v5's review comments.
> 
> Changes compared with v5:
> - use of_platform_populate to replace component framework to
> manage multi-hardware in patch 2.
> 
> Changes compared with v4:
> --No change compaered with v4
> 
> Changes compared with v3:
> --Structure patches for consistency, non-backward
>   compatible and do not break any existing functionality
> 
> Changes compared with v2:
> --Split the last two patches into several patches
>   to enhance readability
> --Correct some syntax errors
> --Explain why the component framework is used
> 
> Changes compared with v1:
> --Add jpeg encoder dt-bindings for MT8195
> --Use component framework to manage jpegenc HW
> --Add jpegenc output pic reorder function interface
> 
> kyrie wu (6):
>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: export jpeg encoder functions
>   media: mtk-jpegenc: manage jpegenc multi-hardware
>   media: mtk-jpegenc: add jpegenc timeout func interface
>   media: mtk-jpegenc: add jpeg encode worker interface
>   media: mtk-jpegenc: add output pic reorder interface
> 
>  .../media/mediatek,mt8195-jpegenc.yaml        | 174 +++++++++++
>  drivers/media/platform/mtk-jpeg/Makefile      |  11 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 292 +++++++++++++++---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  81 ++++-
>  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c |   1 +
>  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   3 +-
>  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 261 ++++++++++++++++
>  7 files changed, 769 insertions(+), 54 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
