Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 18:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfTcYlz/sGuahm/Tcj5WMMXaA/LV+J3dd70ZRLM6GEo=; b=bO89Dwplz1QWDV
	0TMxgn41AcFtAzQTg8upgTypuQfz34sFgvoOEhAEnz/OKFgnC1UApmD2vBb2ejfXP3pbTLpbN0oIh
	yYETXLonBZtiWwAHKeMTfCAC7q5hQbhc3LQSohVdxBTVyVHyt7Wj8ByqpW+ZWfSVMv0HesR5cAPS1
	fhIzrvWzZMinY8UmlLH1vzSjURTJdAbh2gR+ydtaCt6Jor+aWLoxM5qSpRZMzM95PeHHUnbR7fOLo
	QmDIt6W1IDk3r7yR0+4FX9NAgBoB9Af1HtXkXmLttSnDW4KE9Vrmn/n2TUoYLYhEFkxtqgN88uPiM
	loj4Wa3W1GPUTNZq9nIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzjaX-009Oom-PV; Fri, 10 Jun 2022 18:42:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzjaM-009Oks-Sa; Fri, 10 Jun 2022 18:42:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7069C6220F;
	Fri, 10 Jun 2022 18:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE96AC34114;
	Fri, 10 Jun 2022 18:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654886537;
	bh=PJBR6bKb3Ylt/8DyDdQwk5imWJG0lzjWUnMRvGHHesE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bi4mAHAcf2fgQoDLYAunF0CMvF+EqEcOGK1JshkXVnrIa6ig8IJPbyKqqzr1fz45Y
	 G/SPsoq/l31XgT/FUMq4A1plS6YNt5Pf2zMVP1Z0uXnQ/zA0t3C4829OJj1RJ5LTF1
	 70UNuYrXPXFw3r2mc2qVDEkLEF4Kz68uIT//qft0cGKDozMWC35E83x0bN7oBpcMsX
	 TrQEYTHRgNoP/nMYlkT6+2jZ6kwUgYlNVws+e2MjcAvVrwNq2TINy2ZKpr2kyksrow
	 0odJG4t5S3UQWpyNOk7iY0yV8piZCTrTC3VfPDqwZU4ePiXN6vimqM8tXA5bXLt061
	 6aEwYPE34OXWg==
MIME-Version: 1.0
In-Reply-To: <20220523102339.21927-3-matthias.bgg@kernel.org>
References: <20220523102339.21927-1-matthias.bgg@kernel.org> <20220523102339.21927-3-matthias.bgg@kernel.org>
Subject: Re: [PATCH v3 2/2] clk: mediatek: Delete MT8192 msdc gate
From: Stephen Boyd <sboyd@kernel.org>
Cc: allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com, chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org, ikjn@chromium.org, miles.chen@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>
To: matthias.bgg@kernel.org, mturquette@baylibre.com
Date: Fri, 10 Jun 2022 11:42:15 -0700
User-Agent: alot/0.10
Message-Id: <20220610184217.BE96AC34114@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_114219_000895_EDA545CC 
X-CRM114-Status: UNSURE (   7.85  )
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

Quoting matthias.bgg@kernel.org (2022-05-23 03:23:39)
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> The msdc gate is part of the MMC driver. Delete the not used code.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> 
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
