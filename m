Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0909C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 22:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OAJqj6i4ySYXcALnYv7+950Itc/ZWwwukTdOAZZGJTs=; b=rO91DoDIx4HUyO
	AEO5tAdrOFdGnYNNMSZ3RGLflV2cJSuhYNBvrP2WD9pJGLYM+7jj9Lag/ApRKoWEwI+HufWjcRVWq
	+m2bNBXLzb8UikzfjqWIZYAQgQHshipCEOqAKTzz4xBx6CTqQKus2kufs94rA7mcsV+idOow5uScA
	GyIzaiH2ZajT383ZESMAKNxrM1HhlqjR4RTrCtTdFuZ95ZomvAO1WDFY2aFGIT72tr+fyXjKJGYxx
	8aQHcScnVYKpb9pBP1/8KSCVGvPibc7z65f2JftRJFsBcIGirYgE5Enw5QQo+z2aRWPOsHHlakIG0
	cIzi9lDU/IGcIUU7pWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8VU4-00AM21-Sh; Fri, 14 Jan 2022 22:55:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8VTs-00ALzK-LX; Fri, 14 Jan 2022 22:55:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 51B25CE24B0;
 Fri, 14 Jan 2022 22:55:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0C6DC36AEA;
 Fri, 14 Jan 2022 22:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642200932;
 bh=M532S7NuMc5guV+TrEqveWTIocIumpQzI6P1DHrrZQU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=QyvA0f0qY8QqYZAbFV5Wq3fsZiJDeU8KPnsow24DmPU8jvx14aHeNQg0j43ajNB1p
 1YONEyYEnDapqSU03zz0pTXoGuAzazVB43mPssU0R1YMRJAFXQ2TrolvckB3m93tUL
 xdmf7oosQeSw+6r1S1OR+P/gHkZrK/RqCHVeOZMAOOmi0DIIK9WqcgsG37sOefnbri
 FudkYswGSXsBWn1gGnyxeh4NT2s2WPusa14xJXrePX6zrKrEwIiI0LDaZ6MtFeS+6W
 lWaU7H3iw28P4FlAwNNjsnhxF5mH6CehCndbXcz+lmNWHFx5rUSkOik9aZ4hNjPeRW
 RPt44RAJSd2Mg==
MIME-Version: 1.0
In-Reply-To: <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
 <eb6d11af-ff48-a366-d428-77bcaa250a8a@arm.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Nick Fan <Nick.Fan@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-mediatek@lists.infradead.org
Date: Fri, 14 Jan 2022 14:55:30 -0800
User-Agent: alot/0.10
Message-Id: <20220114225532.B0C6DC36AEA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_145536_907801_DA7749FF 
X-CRM114-Status: GOOD (  23.50  )
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

Quoting Robin Murphy (2022-01-14 05:23:51)
> On 2022-01-10 18:13, Alyssa Rosenzweig wrote:
> > Set a mysterious chicken bit in the MT8192 clock driver (!) to get the
> > Mali GPU on MT8192 to work. This workaround is from the downstream Mali
> > driver shipped in ChromeOS. The change there is unsuitable for mainline
> > but good as a reference for the hardware behaviour:
> > 
> > https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2781271/5
> > 
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
> Does this really have anything to do with clocks? My (uninformed) 
> impression is that the infracfg blocks are general amalgamations of 
> configuration registers that simply happen to contain clock and reset 
> controls among other functionality. In particular, "ACP" usually refers 
> to the Accelerator Coherency Port of a CPU cluster or DSU, and given the 
> stated symptom of the issue affected by it, my first guess would be that 
> this bit might indeed control routing of GPU traffic either to the ACP 
> or the (presumably non-coherent) main interconnect.
> 
> If that is the case, I think this would logically belong as a 
> SoC-specific quirk in panfrost, where we'd need to retrieve the syscon 
> regmap for ourselves (see around line 800 of drivers/iommu/mtk_iommu.c 
> for a similar example).

What's the benefit of putting this into the GPU driver? Is it going to
be runtime managed? It seems most logically related to the SoC or
interconnect, for which there isn't any device driver but there could
be.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
