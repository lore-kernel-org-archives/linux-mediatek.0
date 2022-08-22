Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C54C28D13
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 14:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xC+pL9qff0EHn5PjTMHA8oJaSkA0yDeDRbuJDm7WLEI=; b=yJLl86D5dpAa0A5yicLTLePi3p
	6c6wBEm8EFIj2YcHw8/84OvEVIhytAWKpRMuv+PbdVfJKkWQiBnKL7LcBNwfkN36DVXLx7wehw84+
	OrYmBjgOf4+QQU3v3PpGa6XqZ6KGoONYrfDAn2/4xuqoAt73EQX+thH0wTq4EXwtCfmFQQ2klo9ze
	5dCVD1LIZbcx6+SgMXYyUox0KzuF8uMPZOemCPUCv3NRsNwb6+ETC0oXRgQwKthvY9l/mtDC3l/A7
	FMOL00+eHRjt/q6xpfYllH24Fo9GlXRn43jsFP54ZrMnE8OUTFS97xSm/HBmF1kkTF9Et4Ejl/KY8
	yjSU95EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8Mq-00B6R6-B1; Mon, 22 Aug 2022 14:25:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ8MM-00B5v5-MF; Mon, 22 Aug 2022 14:25:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6E1D611B4;
	Mon, 22 Aug 2022 14:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76526C433C1;
	Mon, 22 Aug 2022 14:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661178296;
	bh=PiktLoy2IS2EfJ927VEsYS/q/dcy6NlvZDENwVBGB5w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QrLNpaspeL5WMdkHA6jOAuKWgVw6AhxGf7tvw7BFaQKSi5e39Y64Djfshm6Hd7R6V
	 qjMKDcayPGV/zSVRoM0ycZEgEMlnq3oxrz2B2uo2IhOQRCnBD4dCg+03+YEO9BCVTC
	 S1TF4oSRjiix1IBqYBB2lYLIpgvQN7gful9RrCpxu3LO/euPnX7ESoRyRWagLU0/Os
	 w0rRFOOwuegGf6D2GvTuTLATG29byW+WMjKLMGi+EtPGzc4LDEp3WdCq51sNbMSy4N
	 J7nJcovexmOE21p4iydqe3JWbvGvT4xrZHI9fYbPC0n667UQn1A5e6t9Rd06Ip6ngB
	 T+vcq5dDUmLVw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, chunxu.li@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220820071925.13557-1-jiaxin.yu@mediatek.com>
References: <20220820071925.13557-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: fix DMIC record noise
Message-Id: <166117829418.94797.5869443265207499782.b4-ty@kernel.org>
Date: Mon, 22 Aug 2022 15:24:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_072458_807270_1599B6FA 
X-CRM114-Status: GOOD (  12.75  )
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

On Sat, 20 Aug 2022 15:19:25 +0800, Jiaxin Yu wrote:
> When the first DMIC recording is power down, mtkaif_dmic will be reset.
> This will cause configuration error in the second DMIC recording. So do
> not reset mtkaif_dmic except in "MTKAIF_DMIC Switch" kcontrol.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: fix DMIC record noise
      commit: 221ab1f0bf46236cf1a3fef5298ff5894acfb0c5

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

