Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC8F10F286F
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2026 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P59po+zcNHqp6F38IGU/rUVnu/S5vmd3b4MgWm/V9SA=; b=puCw8eK7fHz3dM58iciNS6QBBM
	1iQWNdg4AYWNFzf7rjF+XGoU64GnpJBTw3C8rIGPPXnkwjwOYZygNsiyC2/6GPK2Yxs/ZYYZIbjn3
	6isN7QrPZvaCJtj1Y81c9TY6wKC7OTTf51iLLQnNJ+B+1tyRzn0rfeTennmvSTsfOWXceToAaUJ4w
	EImBAwYBbxvqmIXQS3kt4IAvpZ4EOWJymRF1r9kcB/4py7XUD9ejKvLdM9Atq9jnkY0pcq9P4d8Tw
	falPn+Jf6j6uUfMuJySl21kdmFF9eqozh4kyhFoycvqYuDMxA8f1al9kOsPH3CcPJLlxLSq6Y6zS0
	gFRtryHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6DzG-00000008BSj-2HIo;
	Fri, 27 Mar 2026 20:40:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6DzD-00000008BSS-2vFm;
	Fri, 27 Mar 2026 20:40:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD88660103;
	Fri, 27 Mar 2026 20:40:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D77BC19423;
	Fri, 27 Mar 2026 20:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774644054;
	bh=/ezLVy3GZhWlSKa9nvaADKtZcRVrgEC0HxqJGqIEYPI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AH/aPUBoSJkiBjQqZR1M6QyALe0uK7mtVJbkfe5WbAc8tLRZeZszZGkw5GyORtBu/
	 aCp3LTusO3OWa6o+DuMd0x8Ho/5QEP8HtcytdEyXWAHIdkcQcZb8W0o6AHkBHA8z/l
	 8QhNFi+2AXcsL+Qy+HRXq/aWh8+OgG1vCaDSE6cXFDpSC2mDKKJv2l4QVg9Nr1jgtM
	 NELrstPWDB+mNeAW3d0ors/S1PVCF2d6P/XkUTs2Z9uIZyrTjWgI47GQ+fQpz/U84O
	 1TyUWOafJ1jj4ZSURVgQJsaZwa7o3pTAkAdY0+uW6KFzjMr/442jGvewl0mp5qwjx8
	 OJG/yIwqS8CNQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Khushal Chitturi <khushalchitturi@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 koro.chen@mediatek.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260327134649.31376-1-khushalchitturi@gmail.com>
References: <20260327134649.31376-1-khushalchitturi@gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514:
 convert to DT schema
Message-Id: <177463208948.777262.1614314585663974285.b4-ty@b4>
Date: Fri, 27 Mar 2026 17:21:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-ad80c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1162; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/ezLVy3GZhWlSKa9nvaADKtZcRVrgEC0HxqJGqIEYPI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpxutS/ovJb6SR3kEuiSgzP/pmOBz6pkYdq+zg9
 iprs81yeHyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCacbrUgAKCRAk1otyXVSH
 0GfPB/4noaJ7sEbVurq/yn/pmLXMIIFv71dC4eCXNY0lKVQ4/RrySFl9c5SlyzNWkXnFhwJS78n
 9YSaNciI+oAulSjz3X4l+xphTRs5Z8C3KZX4YYVtuAKF3Y5zz3VaD0iFLRQ6PuLG/CH2HFU37EE
 keIL+HHQhapJQiPZbP+5DRLuMgSFc6nrUvf8HXPFteCG12wGQX4Az9e1OWj1wS7JeK0wrrrVIp5
 FQ+e5TsNXP5ZMR2qe7SviG2gyy7OTH7YYI5khdn2qk9X2ZkojV8I1LTVqB9TWG7FPsrgy/wJ1a1
 zxS/56xv3po9EB4VD4PASwcqiNypZIdjrEyEpR8CC+wsVumr
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

On Fri, 27 Mar 2026 19:16:49 +0530, Khushal Chitturi wrote:
> ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema
      https://git.kernel.org/broonie/sound/c/472d77bdc511

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


