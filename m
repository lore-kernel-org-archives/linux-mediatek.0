Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08381CD4853
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyYmH3dIXBG7Drk4vz/tgZbiOztRpi/+4i/u3DWRHUQ=; b=VCBlhB87SXLGnfQeAvgNMXBGqP
	cM8klxBPKM6n1fRyNYAapLtyqurOSmf/xXK9gZ2Yb0wojzqfKNTVWfDpYk2uD1k2vUn9rH/jhTlYJ
	UxnuDDRQ5qpGoVczwPHeERYUoG/Fw8AjtOp81TKAclcD+gr8jY9RbGxcvS64XP8gjG1kPombb1yI6
	kv45K589MdB6fyB9+VmR8QCpVTB5Y61CFMzC+molugjoYp8SBHIbvPpxsjqjJAeE/sch8ff0FN2p9
	4YD5kEtswvoXnNQAhLK9KjqHoTzmi7OFWji9OIe1F88Vms0yOL8jPSPuZpiGjkMPRYZTuFghUTAdM
	RwQ9PU6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltgU-00000005R36-1OWI;
	Wed, 04 Sep 2024 17:20:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltfW-00000005Qoh-3v3B;
	Wed, 04 Sep 2024 17:19:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BDDE95C5820;
	Wed,  4 Sep 2024 17:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9C5C4CEC2;
	Wed,  4 Sep 2024 17:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725470385;
	bh=7nt55skf5MkG+zn3hZ1jtUoFubnt7KYqSZXWSb3JOBA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=vCcOIJJ4KxgpPQAZGfnIzSSSWzE5M5l45tKNYeGP02oYvr5QSyk7ynT74CPgrJXN8
	 VHt5yWMgLdnNCjnFKfNeXitJqjdsBUxD4r3TLo0gDk4JC0asko3RJbtJLtJ7ATulMJ
	 cIJVYZFYdtWgswn6/GxmHkNYUxvDyAaSnUR8wq1knAw8shughKHPVjgnGuJD671PXM
	 n9WmSiYlUWdR/nhOLgGR4TyWzUM9BGBr18sUJGrvkrLMhhur/WvOf7uX51Dmctsqrg
	 reUMJ/cB4bWNGlaYhjwhFzD3o+wgwMdxGey/yEvDxOwCdNtzBPgW27bmMyS5KKvDlt
	 wRShNRiUxwlVQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-i2c@vger.kernel.org
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v6 00/12] platform/chrome: Introduce DT
 hardware prober
Message-Id: <172547038191.87336.8695106953397068225.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 18:19:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_101947_063759_EA9D95B2 
X-CRM114-Status: GOOD (  12.54  )
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

On Wed, 04 Sep 2024 17:00:02 +0800, Chen-Yu Tsai wrote:
> This is v6 of my "of: Introduce hardware prober driver" [1] series.
> v6 mainly addresses comments from Andy.
> 
> v2 continued Doug's "of: device: Support 2nd sources of probeable but
> undiscoverable devices" [2] series, but follows the scheme suggested by
> Rob, marking all second source component device nodes as "fail-needs-probe",
> and having a hardware prober driver enable the one of them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[03/12] regulator: Move OF-specific regulator lookup code to of_regulator.c
        commit: b8c3255457147162cd713a319a8e2274335449b9

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


