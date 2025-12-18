Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18CFD68BDD
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Dec 2025 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i0XdV0XDF7OLHUMFar1cT8gRmf1zx64s1arniy/pehY=; b=Ye0FEgaB5hJ/5opNsyjK4X3XpZ
	vpuuGkwFWhfYLSA7xNH9tI+SJtJg9ZG7Xz1uoIFQLdBA26Ol2Jk4bO02X0pZpqYp7oReJZhC5y6U+
	bKJGJCG20BVhWOUSibWtSr8xQijkJDFry6TCU2ezUpf4DXHHTzF6eX0FAMADV+/TH4FxqqlZmQm+d
	OFbhbNwGm0wh0OK3DWsD1073Izmw3fDZpX59oTiybFlmsQD/mEm4Eyau9YdvF6OO9FowYTxNxkboV
	krXxKv9HjdwTeuV/dfBMt48aAmBnKNwZm2Zwhstvm3uFuPIu1qUezzHRQ4Wjoo/JmFMBQ+bTkQ7+R
	hqfRN+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8Z9-00000007xyF-0Els;
	Thu, 18 Dec 2025 07:36:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8Z7-00000007xxr-0Xfc;
	Thu, 18 Dec 2025 07:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B14960121;
	Thu, 18 Dec 2025 07:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A679CC4CEFB;
	Thu, 18 Dec 2025 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766043408;
	bh=Myo3pfKSHU9k4vKcvA+AYZGJnvyzp12VBtwF9l+GFXg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kcN6a30L1eSbVADy9jTxh1uGcZHWlRsfo0CYxfijipH4wEsGsUdBZ4qF2kDb2FFAQ
	 TkMbzRN8oQYHLeGs88LPRK9ZlKBfyTuFRRxTsWchnnYJMXbEz4qzP+3IEMX+kvRQwX
	 QwnfEjN+XAkpMU1nq0QnEU/xAVul3myq7N+40PTrCwlazQCwiwLlke664q7ZkCZtkt
	 64rXxusgg6ykN2sMQnnAToRLNiYJZBuUqnSCm70ppe/A0y+EVNhIRTuDxFsRMbqu+x
	 oOXipKL1/YXSIGhHEv8RjGacr1Wo0aFuVuyopQCgQLUs7OQCf43Y+rg4aPDiDleddF
	 Q1U7jW5SgfwAQ==
From: Mark Brown <broonie@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org
In-Reply-To: <20251217101131.1975131-1-fshao@chromium.org>
References: <20251217101131.1975131-1-fshao@chromium.org>
Subject: Re: [PATCH] spi: mt65xx: Use IRQF_ONESHOT with threaded IRQ
Message-Id: <176604340641.24947.388406077684218935.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 07:36:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773
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

On Wed, 17 Dec 2025 18:10:47 +0800, Fei Shao wrote:
> This driver is migrated to use threaded IRQ since commit 5972eb05ca32
> ("spi: spi-mt65xx: Use threaded interrupt for non-SPIMEM transfer"), and
> we almost always want to disable the interrupt line to avoid excess
> interrupts while the threaded handler is processing SPI transfer.
> Use IRQF_ONESHOT for that purpose.
> 
> In practice, we see MediaTek devices show SPI transfer timeout errors
> when communicating with ChromeOS EC in certain scenarios, and with
> IRQF_ONESHOT, the issue goes away.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mt65xx: Use IRQF_ONESHOT with threaded IRQ
      commit: 8c04b77f87e6e321ae6acd28ce1de5553916153f

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


