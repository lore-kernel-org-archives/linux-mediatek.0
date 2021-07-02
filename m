Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D87C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 09:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE41613EA
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 09:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DE41613EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8ebYmt5nHbiKUogA7Pl91Hu7ozl0mzd0TbFB/9mh2Y=; b=1zGmTrVtoK71zC
	Rj5YQDboxONItRDH9DaZfAmbNCubG+lWRdrmpPdz4ZysglFIegoZ1PO0bjL5bWo1zY76j7sELeeBy
	DWTBURmOPLrcgU7u/RAYocCDzdTx129FkFtw6mMnUK6gjWYwpMlHmE2EAMIu+38MmkKN1Ps4LTqMQ
	NSiJACg20E/r0NdAwgAx7pA1eB4WNFuAOkGeM5EpfrP+b6swupNb+oN22/+Q0unWPyqQAaAWMNGJe
	W1xKxPo78v1lJKX9xlyYPLSt1rfJQCKJKEnu0SxrcGQFUeqvVnTMFtjH/Np/2h+Xxf5kFkLZO2Ddm
	jIiRIfFiZYSsLOUbgRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzFcU-002fB5-Bz; Fri, 02 Jul 2021 09:37:58 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzFcF-002f6X-Pi
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 09:37:45 +0000
Received: by mail-wr1-x42c.google.com with SMTP id m18so11706685wrv.2
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 02:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zmw3iGewZOSDs+c1/yw4f6lr9XV4A3V9IcDrAGu7EUY=;
 b=seJWsMXt7a9DQs5DTguOn4v7czLJozx50c2KMxvJ4ChgjdtfcJyFCrU/niutcOA+17
 6X6qQ+SHlKgbMtZkwaOwkt6RLhr9yuf9/tsn0WWkDbQaxS+ki4At8iFVOqMCU5a19yCe
 tm69GcfqmEfa8fMZdN8F6lEiHga/q9OMHvemh8fDmy/MS2BX3A6lrVZV7dm0VphoYvy7
 LEYAh/Y1/GZSaqOlINaCz/lyXL10VRCFUnLYhH7fkrYSsNOI+ZSemuqX9QPy13tNcqwd
 zhMMfns1XnzlKyfTOnGCPyXQcIn8JrwxNCXGEBWdW/JHoevLDs1QDlIB2D/Y3mbA1SX4
 AJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zmw3iGewZOSDs+c1/yw4f6lr9XV4A3V9IcDrAGu7EUY=;
 b=ROJWBIAiMcNetUarEAg7egDHjUCVah0M5z/4v6nb0BqjtA3aKhOwewIo1HiTl/bjGk
 GzA6LQkbA8OorwL16Rb/T7FKG7xCMEntkz1yk/tcvChIZjcOSvsNZa7fb0tGCuxz8eJW
 l6SOIgszTG+I3mJ6qL2IXfUpdV5H039QIrsKdJWGJ+qrMGsvOLIeNAD12ep6uXv0TTJW
 GCUA/dBqlmMNHRMOwe79K3iDGdUAFw9QVk/nfWkR6OkgMmB9pHRaXS+LiGBPBaNYeOVS
 BGU+C/4YcECrRU3g40NH7rwi2kQnFyyHqMibKXTENXQQFYvhiwesRCloFYzzugcgz11l
 UgoQ==
X-Gm-Message-State: AOAM530Ijmm4NOnawZLv/jt839xu5Oc3mZNnSocQaSMoHZMJY1lLmlob
 i8b9k/ZchW1LIrHv05u8VikceA==
X-Google-Smtp-Source: ABdhPJwVYrqppuZ9dDMO5GSgWooXxasPLeNPUlx9D0W1HifuqLwAmdYA1yAtMT4Xr+2+B5Xz11IQIQ==
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr4769198wri.252.1625218662074; 
 Fri, 02 Jul 2021 02:37:42 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:212e:6681:cd1c:caef])
 by smtp.gmail.com with ESMTPSA id n18sm6583605wms.3.2021.07.02.02.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:37:41 -0700 (PDT)
Date: Fri, 2 Jul 2021 11:37:34 +0200
From: Marco Elver <elver@google.com>
To: yee.lee@mediatek.com
Cc: andreyknvl@gmail.com, wsd_upstream@mediatek.com,
 nicholas.Tang@mediatek.com, Kuan-Ying.lee@mediatek.com,
 chinwen.chang@mediatek.com, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 2/2] kasan: Add memzero int for unaligned size at DEBUG
Message-ID: <YN7eXr30zVH7nLhQ@elver.google.com>
References: <20210702085422.10092-1-yee.lee@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702085422.10092-1-yee.lee@mediatek.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_023743_965080_98395FBF 
X-CRM114-Status: GOOD (  18.81  )
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

On Fri, Jul 02, 2021 at 04:54PM +0800, yee.lee@mediatek.com wrote:
> From: Yee Lee <yee.lee@mediatek.com>
> 
> Issue: when SLUB debug is on, hwtag kasan_unpoison() would overwrite
> the redzone of object with unaligned size.
> 
> An additional memzero_explicit() path is added to replacing init by
> hwtag instruction for those unaligned size at SLUB debug mode.
> 
> The penalty is acceptable since they are only enabled in debug mode,
> not production builds. A block of comment is added for explanation.
> 
> ---
>  v4:
>  - Add "slab.h" header
>  - Use slub_debug_enabled_unlikely() to replace IS_ENABLED
>  - Refine the comment block

^^ this changelog ...
 
> ---

^^  this '---' is wrong unfortunately.

> Signed-off-by: Yee Lee <yee.lee@mediatek.com>
> Suggested-by: Marco Elver <elver@google.com>
> Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> Cc: Alexander Potapenko <glider@google.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>


... should come after the tags.


git am removes anything between the first '---' and the actual patch
from the commit message.

The typical convention is to place the changelog after a '---' _after_
the tags, so that it is removed from the final commit message.

I think the code looks fine now, so please go ahead and send v5.

Thanks,
-- Marco

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
