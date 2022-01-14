Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D444C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 13:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oauUGkZM4kwUF1ftqYysPvjQqKxKSjSm9CtGqUnshjw=; b=3AhFut/WzqgU0D
	Q/ez/0BGpoqL4FUukc9CibYM9PS+WqnBFEKCFGzvWQhi0rwkcRIkNSu2TqSoI0IDlkwAtBb6ZsjMf
	QDg+urtFI4I5kh5PLxS+l7YWtuLGqEkXYo4SXgP/5hbqZbF782VZxJdBzfZM5AW5pDotgpFcwnge8
	s+2HwQnWbkC6AOF87l5awL12rrZfvVtqsrl+QrfUyqIQcbfWLO/59l1k2CUoP9ez5i8JgGe08L9sw
	ABnOn6Vf3Np/CY8A54UJiXGyhzZ9OckWNHYWf5XedqiJCyBTfRUUqbjiemt6vchRBbqs/Oh3dkjMk
	jmlbv3UDADFwntTJafhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Mw8-009FZW-BF; Fri, 14 Jan 2022 13:48:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Mvu-009FX9-CG; Fri, 14 Jan 2022 13:48:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 870631F469D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642168074;
 bh=mPZukNT2prSJfKzrqXnhU1Wq/pLiKiBo5wzaQ4Cxjrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jw1sK7HFZJ3M7Q21H7avJs9Bw2IwAY3ZxCrpoXlhn4iB6+daUb0UauvXwDDQmyqh9
 5jaTw34G3FoOAwtb9eYmS/u9CcKxznoTEmeWdCXmuANwlgs5NueCWCU7s40RRKjklR
 CSPY09G7TP2W15Uo/L6qvMjSkyAvr29k3Xl2GzW/yCmWL+6TipNSxLC1BG7xMjWoFP
 FCKTGkLkVt0w92yHmKEDEVI4mhQfyGUp7ardEB4PqD3dbQ7XuKR50/pYv6RWM2odXs
 oPa4fxj5mDqEvyRirVigsyYCLAnS8GROYQgzJGNegYuLJ6SjnLGvPxOCFFNrlPJbYw
 uDEQ5xDbkcLrw==
Date: Fri, 14 Jan 2022 08:47:45 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Fan <Nick.Fan@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
Message-ID: <YeF/AYZ0DuKGwLLk@maud>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_054758_601500_62E9199E 
X-CRM114-Status: GOOD (  16.86  )
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

> > That links to an internal Google issue tracker which I assume has more
> > information on the bug. I would appreciate if someone from Google or
> > MediaTek could explain what this change actually does and why it's
> > necessary on MT8192.
> > 
> > At any rate, this register logically belongs to the MT8192 "infra" clock
> > device, so it makes sense to set it there too. This avoids adding any
> > platform-specific hacks to the 3D driver, either mainline (Panfrost) or
> > legacy (kbase).
> 
> Does this really have anything to do with clocks?

I have no idea. MediaTek, Google, please explain.

> In particular, "ACP" usually refers to the Accelerator Coherency Port
> of a CPU cluster or DSU, and given the stated symptom of the issue
> affected by it, my first guess would be that this bit might indeed
> control routing of GPU traffic either to the ACP or the (presumably
> non-coherent) main interconnect.

I'd easily believe that.

> If that is the case, I think this would logically belong as a SoC-specific
> quirk in panfrost, where we'd need to retrieve the syscon regmap for
> ourselves (see around line 800 of drivers/iommu/mtk_iommu.c for a similar
> example).

Alright. Doing this in panfrost seems ugly but if that's the right place
for it, that's the right place for it.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
