Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DAEC30653
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jul 2024 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o37moTC+5VU1Fr6qsrcOG49psStRpz07mCbTVh78s7U=; b=HQWzq7jUrIL6TxK+T0XVRYfjib
	rBCbG/T+431wRdHvZCvcQD6jx62H/t/zy1kF7Zq40XcBGm4Q7TyMPfuRpU40IAS2F31VUsFkCtmiz
	dfTgVRMtKjXCpD0hrtGjQj1tKLeEyTJSKhiV+QYvoW8vCX/tHO4jb8jNYZNURWqbn5Gje1lAaNBN0
	hDPOzeXIeGHpaQBxDw1iIhsSW1c0k3FdvlyR75c/xi2Wxo8OSA/evDLkJhQbv8VSv/Mm+SmLd6zfY
	Mz1LfQQBAj1CIa31GehACbOOnvGODofTKV+VqV4Ulq5OkVZdVr28sFwZK+TXg4F9HxBSR53UQy+YU
	zR9DOexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sONy6-00000004okI-1LZp;
	Mon, 01 Jul 2024 20:49:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sONxu-00000004ogo-16Tp;
	Mon, 01 Jul 2024 20:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 987AF617A8;
	Mon,  1 Jul 2024 20:49:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38276C32781;
	Mon,  1 Jul 2024 20:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719866972;
	bh=o37moTC+5VU1Fr6qsrcOG49psStRpz07mCbTVh78s7U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dlXoM50ET/DFPIP98MA4aGem9DZ33eTUGGpgQCjjqavEEEu2Ro6OrQFAmT4lqTD50
	 cF8pPcsyihN7QN/ynIulJMOCoBGFV4l2eCCEXShkCHYVO4KxkUJg5K5B4vEifAZr7C
	 ryG4aQGCvuKqU2awr2d8VW/pRDN2oflo7DBhQ6s6E0auDAjY4kpxgkEJZpSW1CzzZH
	 JMO1qdD8jWOkHjbnKffN2/9naEEpQTYz/OQKViAahPG6afRRPaEMciyTmQarHU23/4
	 mnnG9YbmIswv8s/ACvCSFZS6UYzpuSnsSqazmbVPE/7dj7ip7HM9B0Qea6dSxvh85E
	 rQ3rmAjMHzbwQ==
Message-ID: <d3d91a26f205925c4d0197fbd977a6d3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240613120357.1043342-1-treapking@chromium.org>
References: <20240613120357.1043342-1-treapking@chromium.org>
Subject: Re: [PATCH] clk: mediatek: mt8183: Only enable runtime PM on mt8183-mfgcfg
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, Pin-yen Lin <treapking@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Pin-yen Lin <treapking@chromium.org>
Date: Mon, 01 Jul 2024 13:49:30 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_134934_362096_FBDA4D11 
X-CRM114-Status: GOOD (  11.98  )
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

Quoting Pin-yen Lin (2024-06-13 05:02:28)
> Commit 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers
> during probe") enabled runtime PM for all mediatek clock controllers,
> but this introduced an issue on the resume path.
>=20
> If a device resumes earlier than the clock controller and calls
> clk_prepare() when runtime PM is enabled on the controller, it will end
> up calling clk_pm_runtime_get(). But the subsequent
> pm_runtime_resume_and_get() call will fail because the runtime PM is
> temporarily disabled during suspend.
>=20
> To workaround this, introduce a need_runtime_pm flag and only enable it
> on mt8183-mfgcfg, which is the driver that observed deadlock previously.
> Hopefully mt8183-cfgcfg won't run into the issue at the resume stage
> because the GPU should have stopped rendering before the system calls
> suspend.
>=20
> Fixes: 2f7b1d8b5505 ("clk: mediatek: Do a runtime PM get on controllers d=
uring probe")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>=20
> ---

Applied to clk-fixes

