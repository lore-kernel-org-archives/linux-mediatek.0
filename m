Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F83ACA0EED
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Aug 2025 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMfFJAwU0DnS1iBcSbnX8FJ6onnBSlL8pj8G5ywWAUI=; b=lYsPwIC8e6rRuX5MGgSte2lhuL
	QHWg+uUX+QaokN16v6UM0HMELcfE+tHZ/TTHypH8O1MKXK980XULveu//66/MXq7uRQoK5IV5NNZb
	slAOH4ymunpBsGHwtD4sQ9pWkdreQL+df8sePg8Av6k3P37ny9AWy9qjJemMbK2/KLGkwKzVw7rKD
	qEqV5BpcieooskLMxnyGRkwK2OFVnfdOOUHbd+aTvuPNuB0e8OMVxNDiFeS9HtkfhXqlEckml3v3E
	lLhw+ln3U9AhkM1BQbU23NyHKsfcTcj66FX5V5gZi/YW1CVvoJzB08Nsvq1Wkys4EQqxrBzGJ20Ju
	+YuIcQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgQ4-00000002Vav-1ot7;
	Thu, 28 Aug 2025 17:28:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdaP-00000001uhq-1mtj
	for linux-mediatek@lists.infradead.org;
	Thu, 28 Aug 2025 14:26:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FB7A4085E;
	Thu, 28 Aug 2025 14:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F6AC4CEED;
	Thu, 28 Aug 2025 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756391205;
	bh=OgX2g1VbwOW3A/1+b5scV4T2jr/8zC7Zzky6etYrcv4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aHrNGTMaTGob9tj9cRYan5PlGmiK7c94wZV665v4S6Iftfjt3+XWdaYcJmN6OIfoL
	 OIOw+9FouyrcEVNVPjRt2H4tZTs4B/DllMrkQ9x1XwYGN1cslg+511hgE/GwvZ0wrf
	 iqBDxrwtgreuOJB9XybZzvXjemhOl7JILve2tMco8BR5UxfppxrZHy53IHlpAc5Ukh
	 Dt4IMYIAsXWE3noY5UWAUe9CEq4Ez8MopM4DeRxc34OO77F6rf+0WEC93PzP8S0LAs
	 Cg9V/k2K4WfI0CD+z3BZwKZ7Y5xt4QhKiSsZ8GrnU1VTi2JY4Es+Q3Z05kBkjtF1Or
	 xz3G0AmYNTRug==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250825151111.3696404-1-wenst@chromium.org>
References: <20250825151111.3696404-1-wenst@chromium.org>
Subject: Re: [PATCH v2] ASoC: mediatek: common: Switch to
 for_each_available_child_of_node_scoped()
Message-Id: <175639120317.325624.3705402613246984996.b4-ty@kernel.org>
Date: Thu, 28 Aug 2025 16:26:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-a9b2a
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_072645_493589_37664D0D 
X-CRM114-Status: GOOD (  12.25  )
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

On Mon, 25 Aug 2025 23:11:09 +0800, Chen-Yu Tsai wrote:
> Using for_each_available_child_of_node_scoped() allows us to get rid of
> of_node_put() calls from early returns or breaks in the loop. It also
> fixes issues with missing of_node_put() calls.
> 
> Switch to for_each_available_child_of_node_scoped() in parse_dai_link_info().
> Also drop the braces around if blocks now that the inner block is just
> one statement.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: common: Switch to for_each_available_child_of_node_scoped()
      commit: b088b6189a4066b97cef459afd312fd168a76dea

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


