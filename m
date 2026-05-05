Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0227FF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CfViDip7Gkbu50Utp0GnZWdaNtFs4dmmEPEdkaZdKs=; b=4PKI6J+RjgLBy3e3XNEABKwFv6
	Fhs2oCyMN6oSjvxhMGUZZYmUuNwfwblUnmNIyIyhmWkrS3Aq0nI9Q32+uv5lJTltCPrdKTslCiM9I
	14Frk8YGt+8fRdxUp8VF/aMMaLkgc30+7XspT+ILpBW9GaBDPD+Q+P4rs6SEGPj4sNq1IMc/ZLbNZ
	Uifn9nOesa9HAX8BkTG0yT8mvOelRJaQV/9quD34DJ4YyD2Xy0nxhgFeepwmfJg6ixfpe+Kp1yBYx
	r7FUtpUzmTq8Jj1+Oqs/lVv3uKS0EwbUiakNreIXvYvJr+XbzRecKXq2HYwUium/tR/Xp1qI+DJd5
	fVlNhPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEYK-0000000G8GH-3GAC;
	Tue, 05 May 2026 12:07:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEYJ-0000000G8FO-1UGa;
	Tue, 05 May 2026 12:07:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C758860142;
	Tue,  5 May 2026 12:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15784C2BCF4;
	Tue,  5 May 2026 12:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982822;
	bh=xaD9mbizQd1b6UqDfyrysExa3VOOq9v3PcrVXzeeul4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=U48m3PA6GhCmK9QmAkHRB04UFQDeWZH+YaIV9bUO88lu3iNzhTDxlZCqNWzhcIrjd
	 8MPgpI8u9ft0B/C+bufe7g14mIbjhPKbW2wcHmugDMDmhfBeAkXNRAlQtoMEuhpRmA
	 sk99JeQhs2OC4W8sZyQ1VD5z8WxjsHiTQ4psuy5qAn6qclbC2ow9ZahGqG8FOuZP2v
	 254wvNs91FOLb4EuD+WtWyhDV+wIAV3u9HNe4KHpM5LmPWygdJKizpJAXDi+kaylrL
	 t70AOlKqWzIIiANuRRPylok8Phdjw1vOs5XOn5qvAmLklBPuePPPVdXM99dpnV+3NG
	 K5Ol018WjZfeg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <cover.1776998727.git.daniel@makrotopia.org>
References: <cover.1776998727.git.daniel@makrotopia.org>
Subject: Re: (subset) [PATCH v3 0/9] ASoC: mediatek: mt2701: HDMI audio
 support
Message-Id: <177794593956.568329.18111274443169699452.b4-ty@b4>
Date: Tue, 05 May 2026 10:52:19 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xaD9mbizQd1b6UqDfyrysExa3VOOq9v3PcrVXzeeul4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp+d1hHL6mYRoSKxSPphBNCkaAAarrd9i61MRPa
 HBnnvBeGLuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafndYQAKCRAk1otyXVSH
 0GFDB/4oqRY8K8wC62idbdEwnO83AmEZxnDqPm561JFi65FHoufaBB98cTehbxvmX+CEy9wuXtk
 jV9DZIgZizHs5QxRGB577AHYXOFsfCnGPjqeCtXrb0D8mWyx9BWWcGRWAnZx7d7bawLwmzIyhD/
 xmtQuSw5i0+DZqh7mhyS4jVROuW5GYVaEYEpDtKxoxZFj8bzoKzTZlFRrX4ujwPdeWzzqNCO1NS
 HA6jNpnAi27ZInoG0x5b+lFZhSNm2Fd/USi8YDDpUBHolJjbnno/g9t7bvfC7/k12CtL/6CYQbS
 wAV9gLK1d8vHH0Whih4Ejm35HyUrdG8LULyduxmmPCdFzlZQ
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

On Fri, 24 Apr 2026 03:48:29 +0100, Daniel Golle wrote:
> ASoC: mediatek: mt2701: HDMI audio support
> 
> This series wires up on-chip HDMI audio on MT2701 and MT7623N, from the
> DRM bridge down through the AFE into a small machine driver that binds
> the AFE HDMI BE to the HDMI TX codec already exposed by the
> mediatek-drm-hdmi driver. Bindings, DT and a BananaPi R2 board node
> are included.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/9] ASoC: dt-bindings: mt2701-afe-pcm: add HDMI audio path clocks
      https://git.kernel.org/broonie/sound/c/7139d75a1ac1
[2/9] ASoC: dt-bindings: mediatek,mt2701-hdmi-audio: add MT2701 HDMI audio
      https://git.kernel.org/broonie/sound/c/069ac057ddaf
[3/9] ASoC: mediatek: mt2701: add AFE HDMI register definitions
      https://git.kernel.org/broonie/sound/c/3401cff9a9ef
[4/9] ASoC: mediatek: mt2701: add optional HDMI audio path clocks
      https://git.kernel.org/broonie/sound/c/06efb5f1b777
[5/9] ASoC: mediatek: mt2701: add HDMI audio memif, FE and BE DAIs
      https://git.kernel.org/broonie/sound/c/0e2f1d39c2bf
[6/9] ASoC: mediatek: mt2701: add machine driver for on-chip HDMI codec
      https://git.kernel.org/broonie/sound/c/4d9c6bbfed7d

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


