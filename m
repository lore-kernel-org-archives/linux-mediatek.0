Return-Path: <SRS0=YRwc=GW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14125C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 04:17:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B738320773
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jan 2021 04:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B738320773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JJeJ6I0svunaJzkg8oIA71zx7msXTIPrhZQrccdSHAM=; b=KblFBFcjPM9fftel8ARRtVeYe
	CJ8n0PJQRQd6gShCKHVXEuAbsg2HiQJUY8UKIEbOiIpMi1N9S3Q3GKwYPsIXps9WhchhxPnHOUwsO
	T/aVf/7SFPZZoaKqvnR7mfcbeBIHCMoMtjDRBZ8RzgiOYMKmgF/2yOhDFDWGnqhbeLkr2W8aMcQan
	sCQ8pT6qUAwfjFKYG6kdFz0rBKS4HSmuEHZsXPGjy6fjXJExL6ZxN+YTZZHbBdH/zF+K9NDOi61U/
	vj0+pJcSsvrx/RN1hwqLBRQ+1Ki8hHNyHNUtqerz60RttOOm3+93dgHc4mDAgzr8xdf4QQR3AnTUX
	+/I8liM+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1iRs-0003EE-UB; Tue, 19 Jan 2021 04:16:56 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1iRo-0003DF-Gj
 for linux-mediatek@lists.infradead.org; Tue, 19 Jan 2021 04:16:53 +0000
Received: by mail-io1-xd32.google.com with SMTP id e22so13371934iog.6
 for <linux-mediatek@lists.infradead.org>; Mon, 18 Jan 2021 20:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZJDrgzZmYXfIo0lGIMXEXiySIw3gPtBzcGCID7s8Rw=;
 b=LcbM3pmru0ucPXbMjeSV2nKL0tNYuwj4P09n7fLfJPRKFXp2iIi7QXy/+oQYIs9uvG
 VHMTvgy0LY64CPN9Ugci67iTo1g4+gw9SR79kPv+XTLTCZFvDAc7wp+iKxqK2y6H6EWf
 Qvmw/MOkOu0xWdJ9HNukA/J8BdAgyhfZSMpMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZJDrgzZmYXfIo0lGIMXEXiySIw3gPtBzcGCID7s8Rw=;
 b=kClQIRhPRbTO+2AlEjWxly5s9YgZqmBaPMzobhwwRKpXpIAvn/qveS7B/bYxoZmpm8
 WZ6yBcJaPauDfz4dAT/dAx1xlzLOle2yIPPp4aMlXUyQ07NGIhExQCll360dn+t06K0M
 Stv8h/pHSsMYBaLCgl4s/pVehk7Ol3ExkKAzIOGMVCE7Y9CBkM447SuOycz+eQHjxDQB
 Nc7W8/uustkwJ0/MsRME/ZfD4m1fhxBcAPIfu4nSRKGNAhowZ/i22ffmm+NgkC4gP8Z/
 WtjK8//Wu2GpS5FpZZ9pFOofW3P7GkrYYQbA8x+YU0HXSG5wBy6xSxQV47kGKVcPLGN5
 03XA==
X-Gm-Message-State: AOAM530hyMoZ7p3g2Iezu11l4r3rkAgwwrj5DmPOYPgmJib39STYFOHt
 DuDQqMePl/al6EdJi34Tocs+vwKl+ztOkVqC2u0fxw==
X-Google-Smtp-Source: ABdhPJx1/ogNcijA0/Z5AfgmfPpBpPyqkRKX8ipSYmZcentmAty4lVh6xCNc6+Ml/YaghCmRKnI08Jm+P91hO3WNZy4=
X-Received: by 2002:a05:6e02:1a8e:: with SMTP id
 k14mr1905628ilv.308.1611029808923; 
 Mon, 18 Jan 2021 20:16:48 -0800 (PST)
MIME-Version: 1.0
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 19 Jan 2021 12:16:23 +0800
Message-ID: <CAJMQK-j_5oWcLSrsVAvjkDKUJOSeZbS6aqZQML9etYJLctRX7Q@mail.gmail.com>
Subject: Re: [PATCH v4, 00/10] soc: mediatek: mmsys: Use function call for
 setting the routing registers
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_231652_615370_7D3B7ACA 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 5, 2021 at 3:06 AM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> The following series are intended to prepare the mtk-mmsys driver to
> allow different DDP (Data Display Path) function call per SoC.
>
> base 5.11-rc1
>
> change since v3:
> - move register operation into mmsys path select function
>
> Yongqiang Niu (10):
>   soc: mediatek: mmsys: create mmsys folder
>   soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
>   soc: mediatek: mmsys: move register operation into mmsys path select
>     function
>   soc: mediatek: mmsys: Use function call for setting the routing
>     registers
>   soc: mediatek: mmsys: add mt8183 function call for setting the routing
>     registers

patch 01 ~ 05: I've tested on a mt8183 device, so

Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

>   soc: mediatek: mmsys: add component OVL_2L2
>   soc: mediatek: mmsys: add component POSTMASK
>   soc: mediatek: mmsys: add component RDMA4
>   soc: mediatek: mmsys: Use function call for setting mmsys ovl mout
>     register
>   soc: mediatek: mmsys: add mt8192 mmsys support
>
>  drivers/soc/mediatek/Makefile             |   2 +-
>  drivers/soc/mediatek/mmsys/Makefile       |   5 +
>  drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 254 ++++++++++++++++++++
>  drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 110 +++++++++
>  drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 149 ++++++++++++
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c    | 180 ++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c          | 373 ------------------------------
>  include/linux/soc/mediatek/mtk-mmsys.h    |  25 ++
>  8 files changed, 724 insertions(+), 374 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
>  create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
>  create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c
>  create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c
>  create mode 100644 drivers/soc/mediatek/mmsys/mtk-mmsys.c
>  delete mode 100644 drivers/soc/mediatek/mtk-mmsys.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
