Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923A4C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 19:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gnu/vAOVV94eKTBEwK8GW2L3VU3vZlV8hnAGoElklo4=; b=gHtV8UdDHPsuu5dX0QJ4V1JFUn
	OhThadpYF84ruyMCXFkJ0S2kt2Qr0RXI1OrCjYkP9noMRnzGslnlSe+52dUOYT+fUQUtAVsx6n6OR
	1NARpEzOULhETToqUJ+L1pM4vD4cU7Qxs9AOLXsTFhrshhTz492DFhgG/gIyEL0wGVZVOtsf/VXq4
	5o/ElKzjT/Q8X2FKdbmH/MGuAwDF7KxoWFC8pw2AZwJsOXiibEnlKWq+roJRb6gmLlvs10uwzIBoI
	QchnDDfZJt0EkKDF2prYYdJFsW4HZFs7DXaY8BMVxAmKZ1QKCYYWhUWFMnfJil6Su7FrVzD1EuwJU
	4soMFANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUpj-00FpGl-1S;
	Wed, 13 Dec 2023 19:23:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDUpf-00FpFa-1M;
	Wed, 13 Dec 2023 19:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB277CE211E;
	Wed, 13 Dec 2023 19:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD56C433C7;
	Wed, 13 Dec 2023 19:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702495423;
	bh=z+0td+atuCMZBsdE4LHxDWAVwopd34cSV4sCDtgxUk8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=f5BMFybzIoHt3p6Ht9nHZTJqWl7hZijHve4qJZ2SZhCoGFji2301nAh5JVVEzBN73
	 HQvFcOwfhAWuMAfsw9u7vdZlEwuHEdoy2uRmpE4k76BCqWBwmOHFX6YD3eTL8MZh3d
	 Ev/nl2/4YPwZfVe+3iIbfTwzsh40bANkNoYf6NsBgjZ9cdo2jnhg3o/n15karvZuVE
	 nphvtnev1uh/gRbzxgWqmO1Qz+SsP+vRLpqVzx9914fkMvQTXGHr87Iq8sQwxIklmm
	 wjEj/JedAIp9sbwXFqGP0bHkbY1OgnvF/NG9vbqQAw240gQxNqLYezqHY6M2X+x0Y5
	 TfZ8d4YQGFCVw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maso Huang <maso.huang@mediatek.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
In-Reply-To: <b941a404d97c01ef3e30c49925927b9a7dafeb19.1702422544.git.daniel@makrotopia.org>
References: <b941a404d97c01ef3e30c49925927b9a7dafeb19.1702422544.git.daniel@makrotopia.org>
Subject: Re: [PATCH v2] ASoC: mediatek: mt7986: silence error in case of
 -EPROBE_DEFER
Message-Id: <170249542061.33569.6338427444807634963.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 19:23:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_112347_710683_FE546770 
X-CRM114-Status: GOOD (  11.67  )
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

On Tue, 12 Dec 2023 23:10:07 +0000, Daniel Golle wrote:
> If probe is defered no error should be printed. Use dev_err_probe() to
> have it muted.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt7986: silence error in case of -EPROBE_DEFER
      commit: 6475b8e1821c9d14e60592a74c10d75431500c7c

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


