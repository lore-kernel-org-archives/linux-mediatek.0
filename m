Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88568FA375E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lv+4IsocrOjFMIZaS9h9WDlmQOSAmmvI4M3bsPHaujs=; b=QDs5NPvlqN0sNaB4O55I4Rj9ty
	ed9tDf7SjW/nAwVYikE9zYD6e6VUPE1jcKmuFRVQOEn6v+SfcmfLQZNCtqdYLD8TFdRyE0xeYHLj+
	J7UM/xulXdhZjO19KjNZ1ZPml+veQQjGJhewCVcb6LrWgohskssOnaJ3bGqoTi0vT9o/QVPTiT692
	TB5sUTH8zZTBxPLlPegTegEpX2C6xQLwFpZCz9jNdI+5MBsD5YV0kBttAt+IxA/0CBWPXJ9UCESga
	r1rJQ56+fkLxAzNn5zyslAXZvMbHVmbdhflukzFsQ2aDg9SHZFvfBxJwVpV9oqoZdAa2WDnX/1s3b
	5HUK1HCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sp8uv-0000000GWQ0-0H1G;
	Fri, 13 Sep 2024 16:13:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sp8tp-0000000GWGx-0mmD;
	Fri, 13 Sep 2024 16:11:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D07805C59BE;
	Fri, 13 Sep 2024 16:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF506C4CEC5;
	Fri, 13 Sep 2024 16:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726243916;
	bh=jdzxRMKd10hz0CycLMLXK8JpPArhP0NbkFeexl+6qUQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tq9tG5HPoD4FMiTGhwiRgWdiqHJhFr1TzGcKQxuVTnECCnxdkeEHTVk5yqPe1GUvY
	 FD8MjZmeBDwPuYP4l12NwyBd9HPWO78n3tn/pVF2tk3qdd91uLCBwmuNBE7/4rDrdB
	 874Fo5WFHF70886PXH9rqJ6EkkEvGc+XF4YhojdouO31IplQABkuJCutd7kLDu94oI
	 iOGUAYuQMK2sV+c4mdRcXNf9EsO8cvSFpRkFoh5YQWpPsxkaeAzxDABK/p9RaDIPsH
	 dG/JJRGPy94SpNGxDnro4tkmE+QXCwenMchIi8gXje86J+eXsfe3BipJ/knXoUEv+m
	 ozAxbmBOZJBkw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240913-regulator-typos-v1-1-92781c93f638@linaro.org>
References: <20240913-regulator-typos-v1-1-92781c93f638@linaro.org>
Subject: Re: [PATCH] regulator: update some comments ([gs]et_voltage_vsel
 vs [gs]et_voltage_sel)
Message-Id: <172624391451.49323.15305955333400059916.b4-ty@kernel.org>
Date: Fri, 13 Sep 2024 17:11:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_091157_317032_88FCC22A 
X-CRM114-Status: GOOD (  11.54  )
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

On Fri, 13 Sep 2024 12:43:58 +0100, André Draszik wrote:
> Some comments here are referring to a non-existent
> regulator_ops::get_voltage_vsel() where ::get_voltage_sel() is meant,
> and similar for ::set_voltage_vsel() / ::set_voltage_sel().
> 
> Update the comments.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: update some comments ([gs]et_voltage_vsel vs [gs]et_voltage_sel)
      commit: fb9ce84a01582c9d67dc51d5330136ea684172ef

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


