Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849BDC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 10:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gr6+eKCnMM2RYIFGWj7TcykZbaiZpzX0vB+ppc2D1w=; b=s8G8XvLV77cK5o
	ps6PsKL+GAZsheE8eMed3aj5su951ScaGbd2nh8d9ZTzE1VYFlMNdSxZ8wqvi9layQ9JFhNz+z6wj
	NmGWxTW7LCjrSmjOLOMrZR/5yBH0RtxGVvN6nxkE2vMhkF59cLFJ0/xJp1wMZAz4D77ZZTf55vD/X
	+DgF6COXH0ANC76aIQpoGk2ywsrBGTkwq4aHEPdCQt4rEjkK6879A7iokOJ8ZEwgXu5sonNrze3eg
	nmDoCcfR7TCBmZ6pN+s2GAHX3Uj8sVJA9gV9+e4EA2H1EmG7lpz6w7aaLu8xOWmUfdyaOaUTJXwrx
	L2dEzhnKIvcFU2NsulpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWk3-006nbC-QR; Tue, 07 Jun 2022 10:47:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWia-006mlM-EZ; Tue, 07 Jun 2022 10:45:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FDBA6156E;
	Tue,  7 Jun 2022 10:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 429D9C34119;
	Tue,  7 Jun 2022 10:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598747;
	bh=7KeROakQhh0RozS317QXHC+LfNUD+I20gakesbMfS+4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=OASkSWPBwmPdUP8MgbOJ5BFcCe2vA45UG1zIKgvn93P58gfD34zijkQm+mmSX2Pf9
	 DC+e01U7scfAaEU4Wlk4GV1nAUyaCJwIuVtkAbFh4qkCT0NuqDb7VBWK8a1rMRp/25
	 Dt7E71WfKSe1Whgik5G/2KEf7BxkdsXKPHwWTE0FxFfMpBiik+dWZW2Lg9nlzD9+U5
	 cJQQQVgXlT6Zd9He+1Cut9FRuGD0aGTVicwhYtB1ZZnHC2kgoA/yByiiHvlnaN8tg3
	 M0Vgqy+X5wFcsKdurOZu3Q5iZqZh3ewULDwJitzaY4yY1RqFQkhOk3LNK4Djz9Phxz
	 pYCPbVaW2FLIg==
From: Mark Brown <broonie@kernel.org>
To: linmq006@gmail.com, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220603083417.9011-1-linmq006@gmail.com>
References: <20220603083417.9011-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
Message-Id: <165459874498.301808.15369617374937965221.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:44 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_034548_577622_2C7C0D2B 
X-CRM114-Status: GOOD (  13.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 3 Jun 2022 12:34:15 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt6797-mt6351: Fix refcount leak in mt6797_mt6351_dev_probe
      commit: 7472eb8d7dd12b6b9b1a4f4527719cc9c7f5965f

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
