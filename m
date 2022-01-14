Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0715C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C5QO3JYO96gbtFFgLNiGZRPkbXs2ho71Y1kVgJWkxrE=; b=1SPGkjkCMdiRZM
	rE777QdtJTDG3u6nuBkiqNTZp/ihZKQotJkHCNy86voan96Vgjf5WygXp5HP9NuzU3jYfBNX0CTUk
	sphGUCFM6r7HW7wgQ5aLtTWeb4BapSbulOLr0VuUFFG69Wxorua8hgiRgh3Pp6DExto3ArfnlTh0d
	cx5Y6EsyBQ3CZChZc17cag1/sdpjeWFGkN4huZuwltgMfGubHJx+PCRCnz477qdmfFdaEIpNqLqd4
	zALzGzM/MpfrVXn5ma6lEgAgsWRzVmbXqLsEqmm92zVAzqWZ4EDzDVvV7Su4HpYswOCVpfKnpSAd+
	xpyeq//DFdbcDE7Cfpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8UvD-00AJnh-AT; Fri, 14 Jan 2022 22:19:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Uuz-00AJmg-IM; Fri, 14 Jan 2022 22:19:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8426B825F5;
 Fri, 14 Jan 2022 22:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660B5C36AE9;
 Fri, 14 Jan 2022 22:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642198770;
 bh=zWsLY3ky24QWmemKhcAlVIHzefIeXpr+gm+UbQH9Zj0=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=V6VondQqTNiZd9F9fU2EjAEbUMVRmQVCbtezr9MVQFnl4Mnp2uxgZYnoZcOUKKK2F
 6dzm5E+3rfNEoRqrue//pOwZF/+ZWN8roOhLfH9cBBEggjsztjWPrvRjsHZEqKFn/8
 JHyTkE/bmlBPL1ScCULbFBRiLpsegVMhLV6qvDUEsf+0O3+E/sh31DVkvGuXA87AQI
 yBpfZY6QhUcuvgT/VzxKpujFyAT/2y0XAM1IxHeUB1Emn5Vcq5L4yApkKFHptue+dt
 YpRdknoghrcNUJGXXsGT9oTSHKUksxTWpwDMghlLII1MU6Hi7YucpPj3K1hIn/L+QJ
 625XrLnUZcQ0A==
MIME-Version: 1.0
In-Reply-To: <20220114083511.18906-1-miles.chen@mediatek.com>
References: <20220114021131.1F7C9C36AEA@smtp.kernel.org>
 <20220114083511.18906-1-miles.chen@mediatek.com>
Subject: Re: [PATCH 3/3] clk: mediatek: support COMMON_CLK_MT8192 module build
From: Stephen Boyd <sboyd@kernel.org>
Cc: chun-jie.chen@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, miles.chen@mediatek.com,
 mturquette@baylibre.com, wenst@chromium.org
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Fri, 14 Jan 2022 14:19:28 -0800
User-Agent: alot/0.10
Message-Id: <20220114221930.660B5C36AE9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_141933_790572_6DAA694D 
X-CRM114-Status: GOOD (  13.63  )
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

Quoting Miles Chen (2022-01-14 00:35:10)
> Hi,
> 
> >Have you tried removing the modules? And then reloading them? I also see
> 
> Thanks for the comment.
> I did not try it because we do not unload our clk modules.
> After testing I understand that the clock driver does not unregister clks so 
> we cannot remove then unload it.
> 
> I think I have to add some unregister logic to these drivers.

Yes

> 
> >that mtk_clk_simple_probe() doesn't actually unregister anything, it
> >just frees some allocations. Please fix this before making these
> >modules.
> 
> You meant that mtk_clk_simple_probe() has no unregister logic in error path?
> 

Yes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
