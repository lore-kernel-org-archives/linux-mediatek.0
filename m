Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108EAC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fvw4trRlmFgD9OWBM4KAg0Vm8Q0E9AfpDMG8EfcTqG4=; b=Z9bm8bQIqbqYEP5iZDlHhAbsDR
	a4ZMeZOjPr94jipVh1Scb1ZdbHRNq1hFSBGolVN0++t+bFipxUISwEKT9+vPUlLf6oLl83ZDeGRdy
	44jyIBiqcRe1x+p99MeWLy4HXwHovL/G0OCbMQ7PPWV4drw2W1KL/uhBEMpVvZ0CsvQw9BoYc1DOU
	WOEFk/fOyyeSSi8qeO2o3mh4/5NOlytsQnQ4jSj8FSebmqU4JDdr2O9D9pi8X9wcjGSGIL7JMUS1N
	OeV8dwFcW7aXkQQ8bpjFx2BaIn/2LwDfltQx9rO5c2gCk8EMnnBC0UeME64a5sNbC0zHjFkDSC3qm
	W4lRh9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeLB-00G7ij-0E;
	Fri, 08 Dec 2023 17:08:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBeL7-00G7hQ-1S;
	Fri, 08 Dec 2023 17:08:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B2058B82BC0;
	Fri,  8 Dec 2023 17:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0966AC433C8;
	Fri,  8 Dec 2023 17:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702055315;
	bh=HUSkycKQqdvCwDWPRR3SQZhNrNjKB7XwUDzkxrLiRAQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=IQeoKGdO2IjGdLDLwstlNRatIRxtFVG/GFlPRnq0oOVTi6NG+rOKE3Qymo2xPBxnb
	 P9deDtyZTu3WmO4vbaEFxCIB2E9wcVtvtHqKC7Omdm9NvXtWVcwpx2s4s3TkPwSO4w
	 iG0gazrUWQQwu/Q+B5sF4dFnRHkvuE13njfGh8H4xV43AG4Vw/7CbWVMppaXpaEjRF
	 +CYiSPUTDCq6JMNVi65Y5I1n1JyhZDu00lWTwPpYZo4rZASNojZ4bFL9z/bGkjNuzo
	 yBzT1OYLrrfnmyPz9Q0lHh3mB/3yPBpW997M7oAzcf4xwDNrDIh+xsYEVYFjZ5fX9E
	 LCGTrHneastaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EB725DD4F1E;
	Fri,  8 Dec 2023 17:08:34 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <90aa3b5f-a0d4-4609-85c2-e3d4cc944102@app.fastmail.com>
References: <90aa3b5f-a0d4-4609-85c2-e3d4cc944102@app.fastmail.com>
X-PR-Tracked-List-Id: Upstream kernel work for Rockchip platforms <linux-rockchip.lists.infradead.org>
X-PR-Tracked-Message-Id: <90aa3b5f-a0d4-4609-85c2-e3d4cc944102@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-1
X-PR-Tracked-Commit-Id: fd1e5745f87a9e06974d2f42d22b3e1682c99105
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a6adef898741eb07526aaf9d8b982d3dff4a9e67
Message-Id: <170205531495.9242.2736142793084399675.pr-tracker-bot@kernel.org>
Date: Fri, 08 Dec 2023 17:08:34 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_090837_656731_EAA746B1 
X-CRM114-Status: UNSURE (   3.35  )
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

The pull request you sent on Fri, 08 Dec 2023 14:59:56 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a6adef898741eb07526aaf9d8b982d3dff4a9e67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

