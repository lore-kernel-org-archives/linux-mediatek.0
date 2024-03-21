Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C207C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 15:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8B1tZNcVMTrBIWI3xZGkMffag1oDFtb8qZhP89e8KWQ=; b=ixmfsvljdz+JXNNXGfTU6I1tkP
	7BGi9YHct3oAAiDABaT4/wA4rnEmLesqbIjQXkyjcrWsxehX472rQCPyCwQivKQSH/6idT9pgMr86
	cT0U0ozMk74n3VmuZy2JXzQfgu4XHhEomtTgoSRH028AJ61H7EMO7T1z/FOpaOaZETU9jQzH41M0c
	aGXEZpOgPTs23TtiK3XbTiBBeImvPyI1+tazjtcffFaDc0T1lpSHhNVt/DAtCo1Gcd5+73CUDlpzB
	MBze1p7kZ0utE7UBRBDYJPQHg+qFuP52EqT7LO6inxfDP+C2/0KmQb5u9hFq1SV3VBLwArY5fFYZL
	vlQkfd2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJvh-00000003O58-2iWg;
	Thu, 21 Mar 2024 15:02:05 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJve-00000003O3j-2Lmh;
	Thu, 21 Mar 2024 15:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 17B9ACE138A;
	Thu, 21 Mar 2024 15:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA1CC433F1;
	Thu, 21 Mar 2024 15:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711033319;
	bh=kmMw7UrxyYm+FrW2p/kXhJw0xpkOp6iNmX0mZMs6h10=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rBS3hh6a7XnbPCyETgHuyP4Gzi5T8ulrzuCZY+NwYdZDihY0vZO3F5Mjz7RHz3+fT
	 LMjOby+wmiv4ooIDcbTGjMopnVv9ktbF7vA0sbV5mymIByAjdI0VH45ZIxILykinyn
	 Vwjmre3d4jdgMUY7Zwj/otTwNTOB9/TJrDCgDcOjye4EiEDXn6l+yvfj3bXa1gshLG
	 Jwxv9UHOk60VLQatPPF3B93u2lR+AWnYxCfx8I9qirKVjQ3iRsSHR1cHg/isw8jZ6g
	 RDYqlvFNBoUj50Au2d5INpAkMPtMcqDpp7kbDDw+6Tu1N9f9ziHSejrBzjSTrVSUZU
	 rWnd+1I9UpKlA==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Fei Shao <fshao@chromium.org>
Cc: Daniel Kurtz <djkurtz@chromium.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
In-Reply-To: <20240321070942.1587146-1-fshao@chromium.org>
References: <20240321070942.1587146-1-fshao@chromium.org>
Subject: Re: [PATCH v2 0/2] Fixes NULL pointer access in spi-mt65xx.c
Message-Id: <171103331749.114773.10634941088175436463.b4-ty@kernel.org>
Date: Thu, 21 Mar 2024 15:01:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_080202_817345_8525C194 
X-CRM114-Status: GOOD (  13.84  )
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

On Thu, 21 Mar 2024 15:08:56 +0800, Fei Shao wrote:
> This series contains two patches for spi-mt65xx.c, both focusing on its
> interrupt handler mtk_spi_interrupt().
> 
> The first patch is to fix a NULL pointer access in the interrupt
> handler, which is first found on a MT8186 Chromebook device when the
> system tries to establish host communication with its embedded
> controller.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
      commit: a20ad45008a7c82f1184dc6dee280096009ece55
[2/2] spi: spi-mt65xx: Rename a variable in interrupt handler
      (no commit info)

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


