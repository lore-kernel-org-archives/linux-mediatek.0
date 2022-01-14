Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA47C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 02:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=et+4huSJtKQBL0Tm6zHGzH03ifQPeiBOjFiugvu8Fuo=; b=IMWuaYaCUApT1C
	beQYHf55Bd15Vif9Jr25VyVEvBCorPVeZ0zrHuTCsvVJWJbnUejbX+gGpmGqTB6sn25AQS6K6O6dF
	OBLMDBRRZ9aq/4XhGeHuXsUBvGiHsaGWzoBJHnrq3mLktWOQA10ansLRVHnSVdv+M1lVN/CKSq4OY
	coNIz7HKXlSppwTeLmBwhi3o/Do5kcPqUiaVWU8CsaxhBdRJYKxsqfXEOHbPhH7GkUjN/G224CI0k
	M0HH3hdtGhHr5QxAevJpcnrUg58+3dWb7hhgkm+XbmHwIdb6C5Jxz5y58pxxiTheh/VcSfbGz6KMl
	D5UT41VmLFmk0a76FVuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8C1F-007Sau-RM; Fri, 14 Jan 2022 02:08:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8C0x-007SYX-Vp; Fri, 14 Jan 2022 02:08:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AF0E9B82358;
 Fri, 14 Jan 2022 02:08:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5064DC36AEA;
 Fri, 14 Jan 2022 02:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642126105;
 bh=+7yXkCfraCxTAYR8m2m3+Hus0q7MEXhgJhVhZLdnybs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=DuOVTwoqHpZi380inIuXMD/NQ7lSTT1262hsi3ARptVZvkG4J1jLanxfQhTOjOK0h
 QiDcZFXGRzQ6DhTcRAKyfsJZZcu40r0FPhMG+wgOkZ/YjfHkMJ4P7jeCJhqcZ5/ESR
 cIrO5Rk1fqiKa2lJ0l17nJBMRTKTVFIOqaDdDJBaBcZytQGuRtnIBQXWhGScqAZiA9
 a6W1Om6O5YCoVhtsQKwdGxBzMNCjrELzjAPs2hvf9zt6qGyQ/VjtHTbdBKKXoGQ9rY
 9ovK9MSyMO7Z/LcV/lcAyxOIyjWS+255Uiewr2PBWSOrLF/a5amnj/h+BNarldqyaX
 93u7lBEUBf4Og==
MIME-Version: 1.0
In-Reply-To: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
References: <20220110181330.3224-1-alyssa.rosenzweig@collabora.com>
Subject: Re: [PATCH] clk: mediatek: Disable ACP to fix 3D on MT8192
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Nick Fan <Nick.Fan@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-mediatek@lists.infradead.org
Date: Thu, 13 Jan 2022 18:08:23 -0800
User-Agent: alot/0.9.1
Message-Id: <20220114020825.5064DC36AEA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_180828_195600_482EA7F6 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

Quoting Alyssa Rosenzweig (2022-01-10 10:13:30)
> @@ -1238,6 +1265,10 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
>         if (r)
>                 return r;
>  
> +       r = clk_mt8192_infra_disable_mfg2acp(pdev);
> +       if (r)
> +               return r;

If this fails it leaves a bunch of allocations around that never get
freed. It's a problem before this patch so it's mostly just making me
grumpy that proper cleanup isn't already here. Can this be the first
thing done in probe instead?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
