Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBD0C48BF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 04:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rjrUjwhsSCmh0RJibzoaF4JJV18xHOBdy6qFbX+vbM=; b=LL+tRr5GMpNlmCx2Z4UQoBcsh3
	13ap/ND1AuPVfGQtW2uNxE1UCZGVscegM7eaoW7TWiLgNJ0YxOQdZQCCVW1nFEBbgI3meOs0FBt/i
	C3UIGWXzlcNi4UHo1DVkHMz5Pue8TBJSO4nfjh8Sl4TKzs4Ax60x/6s2kIYs6Ersp7E6k0MkNLh7J
	L+nRrqVIG4bc7ttmPE90YjzBov2inQAWsCu9zNx4FiimyoNbC63iL+m8lLHVfdZb40EuHIxl8SgXA
	iF85MJW1+Fqi0JhOieJKk/YPv9bLcG3xMcIuVrV3X1+BvVCHBIXbfXOqvLXza1SRjOeyy+xeDDaeH
	mD+TextQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd147-00000003W0n-2aMn;
	Thu, 22 Feb 2024 04:52:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd144-00000003Vzd-3Rr0;
	Thu, 22 Feb 2024 04:52:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EB9CDCE20FA;
	Thu, 22 Feb 2024 04:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E4BAC433C7;
	Thu, 22 Feb 2024 04:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708577526;
	bh=3rjrUjwhsSCmh0RJibzoaF4JJV18xHOBdy6qFbX+vbM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q4KEjPM0AfWmpL0qKK2Uk86RAnIqaI55UmqGSw3s8AKJGsNCg4RP4WMPTqDrr8FyX
	 515DOgYFoWs1wIDqmqt2aPPpXJksI+L5Rh/x57IdgBmPeeXtyQBhLladlh/WNS8/nN
	 NKRmr06cY/+WjMLly2Cc7VXRxizXlHkH6CJl0aorcZJ8VXKb2RBudoD28jwYhbySeC
	 CS+tPC/dU4Ospsp0VTtNxKPiFLSpq64Cir0GKoi+I5YwBxuvCVP5naXWgx35mWij4N
	 cFyupe8IVBCkBkuGChsGbaND3a7tss645ijw+5IyVwoQ6XQiUZniGa99zVPPKhoqz5
	 6lz4s29rHQ1Pw==
Message-ID: <050cb3a63e606d40d32da0a1d4c3a61d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2c553c2a5077757e4f7af0bb895acc43881cf62c.1704616152.git.christophe.jaillet@wanadoo.fr>
References: <2c553c2a5077757e4f7af0bb895acc43881cf62c.1704616152.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: mediatek: mt7622-apmixedsys: Fix an error handling path in clk_mt8135_apmixed_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 21 Feb 2024 20:52:04 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_205209_076617_C80C23DA 
X-CRM114-Status: UNSURE (   7.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Christophe JAILLET (2024-01-07 00:29:28)
> 'clk_data' is allocated with mtk_devm_alloc_clk_data(). So calling
> mtk_free_clk_data() explicitly in the remove function would lead to a
> double-free.
>=20
> Remove the redundant call.
>=20
> Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() cal=
lback for module build")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next

