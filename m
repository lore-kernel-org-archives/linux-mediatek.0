Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF83C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 17:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bebc+74yLsCmOa1eQiW0TrCpcTkWz6gf+4Z61gRXh3c=; b=znQuhe+rZ9JhjIqQ1pM/kz3P1J
	I5/N5kPHAX26qT1RZJbbO6VwV1P+Xg+qu1uAstHPUSh6uXg6bBXfwAO6Z4WWdnJYWoahgePQlW5UT
	91cnTyhzqRWZfMn45Q0utu9q07WLPtfDZmfhFOib2KV0Za58zID0HIMKv05AsKt9DRkS14f+YVKoW
	ard7aAEJal4MGVbA8APVkY+LTTe3vQHBoIeBLLKAFCsGjXxdJpqsxox5rphDF3/S12bFf5Y4mcqMI
	5aRaXnX/W0NPqDPTTdkbvV7Itw/UEoTelMFnxK73yjiwP82Zk887g7aXImY/HMcHzlEscEqU8erTF
	RF/37jEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYU0N-0000000CB4V-25Kq;
	Mon, 29 Jul 2024 17:17:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYTzv-0000000CAx2-25Iu;
	Mon, 29 Jul 2024 17:17:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D397461BBE;
	Mon, 29 Jul 2024 17:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE20EC4AF09;
	Mon, 29 Jul 2024 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273442;
	bh=PEY4N1SeOldJfpmYebIWBl67BwD9EmlTasjdOhxv4W8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E93kPSWixEDFqZLHZ8Xl2LZjTukyIwS7TrnNXwsJ6o4KG7chXU5Q1yZywA2xFzqX9
	 XtTEU2SA4kKPDeel0t9hX88+m3TOesea2fWk7glZKU3cAOswKTrB/te98vDv8H3T1b
	 qjX/son+O3HfadXwNS2TLpehXU/A9idvJAGs41D35MpkZbaYDMUg8eeAa6bjCD87do
	 fKJWjEL8TGHV/Q25697Dkl/Fr5jxQRxqlgfpXzxOxHCQBHLquYxA0EKaQvoGz7t1AV
	 xTp34zxmrGd0awXvLCfqRvhkBg/B4gfywT19g7AoOXOYL/erDQYhFvi+CLthLdtOEQ
	 D2u1tLBBjuybg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 amergnat@baylibre.com, kuninori.morimoto.gx@renesas.com, 
 jernej.skrabec@gmail.com, nfraprado@collabora.com, robh@kernel.org, 
 Chen Ni <nichen@iscas.ac.cn>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240709085131.1436128-1-nichen@iscas.ac.cn>
References: <20240709085131.1436128-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: mediatek: mt8192: remove redundant null pointer
 check before of_node_put
Message-Id: <172227343957.109775.6108322650659499357.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:19 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_101723_611908_54DB264F 
X-CRM114-Status: GOOD (  10.57  )
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

On Tue, 09 Jul 2024 16:51:31 +0800, Chen Ni wrote:
> of_node_put() has taken the null pointer check into account. So it is safe
> to remove the duplicated check before of_node_put().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: remove redundant null pointer check before of_node_put
      commit: 42eb47310f89eca3226e8e427bc9d571149dc866

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


