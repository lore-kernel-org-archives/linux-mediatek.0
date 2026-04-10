Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003B5F459F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2026 16:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djz8Fg9XnT6VVYbCR0fwt3rZU8ifS6ZwQGEz+FJ7IBI=; b=YRj/rK/aGocf+lIAFYd0RgvpXN
	TvLIG/BFXPb7AYMLHURLYLmTWZFIHXAcPA/1ROwUxp3nKO5V1Lsj7C/Zcj6XSzsIvGgr/C2opDEhd
	/YlgTJ0ZfiRr3mNJMnbutdZgN3rROGhTR2Q3JTR3CTtInjVjszcy/RF7sej9p9syTnLzetSSc2CVT
	DAceTuue3gYfBXmRH30rWlg7lN7grlQVeuL+YW0KSY2q5fHz1EzIqD+ogcPwdlVvge6l3bpvNsCsz
	/FnrO/aozG5kE2NoESbx/y4XnEGOJDKTistAgAzT6uluYjsi1mk8MnDvH2SPw52fWJxkWYEq6OBgA
	f4UNUgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEiq-0000000CXjC-3nQB;
	Fri, 10 Apr 2026 16:28:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBEio-0000000CXib-2pqr;
	Fri, 10 Apr 2026 16:28:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 959AE60126;
	Fri, 10 Apr 2026 16:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD729C19421;
	Fri, 10 Apr 2026 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775838521;
	bh=osnLMVmDFnwHE+le2JetnpP1rDIKNK8VoMDGuRUbSkQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SBSKGPyPzmGKQV/LPkTTrX4Wzsb/pXU3HGU5yRXBVHjmEQOeIdBpFtwfCUctVP/+n
	 I6q3Iqvpw0u/RR2FW0TjkmFWABT/+NJoZitoLyGeHDovSxoio1o28JGKuJUuHNCf7A
	 JJmGz/nfc4/F+CRJzJ0Weu2tAqUx6Fi5s3X68IwxG1ohEWMqr82C5JG81vAsocKum5
	 f3Iz3mlVW3MfBZfkIKqbu8en+ncQKZS8AldyP/rkAYMZw6dccC0THYz9MFrH7Cf+wH
	 7AzS4xz39CuT7UMi4bQOUybx7ibVCY4QCF03+PEGOvq9fFInNdOwmpIBnGx6u7VDj6
	 mEwnGcADPUqNg==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <20263f885f1a9c9d559f95275298cd6de4b11ed5.1775546401.git.xiaopei01@kylinos.cn>
References: <20263f885f1a9c9d559f95275298cd6de4b11ed5.1775546401.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH V2] spi: mtk-snfi: unregister ECC engine on probe
 failure and remove() callback
Message-Id: <177582518300.1175120.4251320554598514411.b4-ty@b4>
Date: Fri, 10 Apr 2026 13:46:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=osnLMVmDFnwHE+le2JetnpP1rDIKNK8VoMDGuRUbSkQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2SU2RitBbmkr8ekYufID3Vy04zsNcEbuqOtOz
 +A98eHez3eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadklNgAKCRAk1otyXVSH
 0A34B/4vClavqfgu41Z3rhEFRB53rXHsRwu4oH0nExrZ3ppSyOO7D81I5wYge7HBJ7ew14LxO3D
 D7zQ2c6ujCwAo/Z7ALYVtrQJAlXrebXMEGwCBPWphtEoOv/3Rapazu3KqoXDupzQRXU+e41ZpKq
 Ru1LAi3tRel7/VvAwqeWdLwJ67yTmjO/lkRmbYs2VuWhTX9tIrmQHEXgEvky23G/pKPwrcW/46y
 K/Sh2hapWlAN3OZ6wDBdMLmQypCA8buxp6mEOULQIVYY5LUQPQuzjPSUUZaxsP3UW6Hiw/m+R2d
 RXp0785TpsfiKldsT36xgClIFNtcy2lDHtK7lBYGloMztQyA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Tue, 07 Apr 2026 15:26:59 +0800, Pei Xiao wrote:
> spi: mtk-snfi: unregister ECC engine on probe failure and remove() callback

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-7.1

Thanks!

[1/1] spi: mtk-snfi: unregister ECC engine on probe failure and remove() callback
      https://git.kernel.org/broonie/spi/c/ab00febad191

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


