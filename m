Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF117C47089
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 17:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQ+9wQ+ddiYqZPc9LEAZFirRP3ug//KuYxdlwJLVZNk=; b=KmbJ+6xA1503mzhjsjROkiksEu
	hszoCDghwB8J5Yh3YXsrg+kqXACSLcrx/GCgmAkBld19unTtTcfUupuy61lvxz/eaz4+WQf3nd/Dj
	k7FHvE+X2xjG8zLs21Q0Pfp6s1pF4T4o0J++HXnY/tpsPQTbLHVDk1PTevXXih5yhnrQMQcCGdgxa
	KQSB3UnEdPsKwl3H0yExW0uzfjWn1N3RjAoWteaEIzmlxuR0rRNalDQKdSUInBTcHBQ5rEt+ZRkiI
	gm4EfLxBQPa1b7mwZwrPkTxiiDn2UVWOQyLacm57RxpBZsUlJ0j00ushsJjsgva1gJd5hiARlGD4a
	V8TSfXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yMt-007Uyd-7s; Wed, 07 Dec 2022 17:38:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2yMZ-007Uaf-Hs; Wed, 07 Dec 2022 17:37:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0004D61B45;
	Wed,  7 Dec 2022 17:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59532C433C1;
	Wed,  7 Dec 2022 17:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670434662;
	bh=ln8UbPMcYS/65vm5+MnMPgt6R+k41vnkbbKxMxHspAg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fVY8eGIz+EmmQCXMu5c/K9Rs+wsOoATgVdZm5jCSCo3mI9s/boRz79OC7TMDQvtfl
	 yEOrX/8ZXFJwBVoeMhHZPTJ9gDjHlo80J+IJacOqiv+occTtb7vKNSF3db4Ktp9u0q
	 3LXchymIY4sa/zZK3DYZlOyPjNOO/pBO1ZlCLIZtDxqpiCr7HTPEUCcOX6E55kq1lg
	 zdtfW6Ao1Kh/Vvq4u8oA4G6S9HwfITVwBUbtBJy0ov7WGVMYhTRyDMSQ7gdJz2LKw8
	 8c64qtRhVWPZWAJI9yc+HYPtHAJAcZdapEn1pmTzTuAKgLKeVoaULLGg6CYRsVDH3u
	 Yr04EloZtLGRw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, Wang Yufen <wangyufen@huawei.com>
Cc: alsa-devel@alsa-project.org, garlic.tseng@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <1670234664-24246-1-git-send-email-wangyufen@huawei.com>
References: <1670234664-24246-1-git-send-email-wangyufen@huawei.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak
 in mt8173_rt5650_rt5514_dev_probe()
Message-Id: <167043465894.393374.8060472153388836896.b4-ty@kernel.org>
Date: Wed, 07 Dec 2022 17:37:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.0-dev-b77ec
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_093743_666106_40D3CC53 
X-CRM114-Status: GOOD (  13.12  )
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

On Mon, 05 Dec 2022 18:04:24 +0800, Wang Yufen wrote:
> The node returned by of_parse_phandle() with refcount incremented,
> of_node_put() needs be called when finish using it. So add it in the
> error path in mt8173_rt5650_rt5514_dev_probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak in mt8173_rt5650_rt5514_dev_probe()
      commit: 3327d721114c109ba0575f86f8fda3b525404054

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

