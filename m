Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A6AC3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 23:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzCurV82av03unBcoGcG74J4yRdeDooIgc+oa3Rp/6E=; b=MCu4uHlyIWO1i0fw6BmaVWePbc
	zWWJNlHUlc78vH72x730FZGoEzXCpqzcZyRQmAgLBvMge3awMN7lTtLmWAnSuptJr7ntwjYe7gXc2
	JVEjKSuEd/uvTxGq3AizYGPymyTtYfMrjvACphHR5AG++3GHvomtgnfw3EpoWhHayFin1wqozojM9
	r8fTa8Bo+lj4J0xyEW33adQpWV4dGKkwQOQIXby3DwgHQ+jCC7L73ojlusCIx2yVjQqq0578Zv3AW
	juYJ/AktMH8jz+rkVdGHvqMAK9P2uJpu5LKh8R+Zjhx22AxYD50mdSRp+HbZVJ1J3zd1JPoJ18Cxx
	JV1Uodpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYZNZ-0000000Cxy0-1Poz;
	Mon, 29 Jul 2024 23:02:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYZN6-0000000Cxtv-31si;
	Mon, 29 Jul 2024 23:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58C04CE0917;
	Mon, 29 Jul 2024 23:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9D5C32786;
	Mon, 29 Jul 2024 23:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722294097;
	bh=yzCurV82av03unBcoGcG74J4yRdeDooIgc+oa3Rp/6E=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GQe0VNE5g9ObKIB9IOMY41A6xtRZj967Ka7jdBOBClsfNIetnnHsndBKrgnqNvWKD
	 CgcfPxKm8VJ5WZMopnKqYQQNKL0Lky+yqRDTWekQkHU7ln47ANz/GxuWtBdLab4ugZ
	 w1EE/pNvN80QOdXeAgnV5Kk7M54s6ScmkgQfB/Y/iHX5aJ8oazglvkixXiGvN7Li3i
	 cRcD3/SCArnkpl9A5qMIXUJI7e6WFAzSueH3WJ+YZlvrHsI82vGIxxzo8USqmtZI5C
	 IuX3L4AnN58jh3X/bPJ6LlUcsDECdQQrFnpsWudlDvA6UXyrHub83VoMWnEryJOPRe
	 yqYmhFkB85Lpg==
Message-ID: <54decfcc0a311d4447122bb5f49bd491.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240717115919.975474-1-fshao@chromium.org>
References: <20240717115919.975474-1-fshao@chromium.org>
Subject: Re: [PATCH] clk: mediatek: reset: Return regmap's error code
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fei Shao <fshao@chromium.org>
Date: Mon, 29 Jul 2024 16:01:35 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_160140_955722_68A19482 
X-CRM114-Status: UNSURE (   6.68  )
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
Cc: Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Fei Shao (2024-07-17 04:58:52)
> device_node_to_regmap() can return different errors, and it's better
> practice to pass them to callers.
>=20
> Clean up the hardcoded -EINVAL and use PTR_ERR(regmap) instead.
>=20
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---

Applied to clk-next

