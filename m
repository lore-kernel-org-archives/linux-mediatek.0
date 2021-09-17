Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AFEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 14:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA90060E08
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 14:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA90060E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GEuPtphURpsO7WRdRCN+vO8RuP3UeXUCOrdkZESWc0=; b=Em0yu3bsKrQPnf
	5cltTG67VlA5rhC26K1XHPSG07r566XFmwBGzldzv6AlNEPjrlxy1HpeDXyQRX+0K7kIFgD8cjI06
	7WOCAhWYducjIAglR6FCk40jLScSLIwX+oMUK6Xce9dqZ6HJVyoHRUU5qv+NCZPVp7lfxAg+9u0Cw
	W2c0Z1mjUYa+iib4/5ZEGSmxIyqrW9JoVxq/uq/tLeHDa+ozufIAQACA60i+WYE1kk0UidW0U3kd4
	DCy+W0norqh/f8Kw/XKQ2Zk069a77yfm0P6xyHxIOGPpcaW+6cN2CS0JQMN4B29N756J7Qz8Bmtul
	/DLniUptRbaS6k0sRI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRETz-00EOAi-Pb; Fri, 17 Sep 2021 14:04:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRETn-00EO8Y-6z; Fri, 17 Sep 2021 14:04:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D8E26103B;
 Fri, 17 Sep 2021 14:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631887478;
 bh=CoUVYEo7fgOBwEFTIbSZgJaRRDgozeRszombXxCWMOc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gUc41prob34WTGXolgchVNz23eEN8sbz/GWDGzoVA6tKHXQNHFhWihNRYBwR9ooGB
 /bHzwjgDJH/oNuBV2uCKzFVx6H9urHsFNYVrTm7d14lwsjYBH7uj1jPlKEau3B/5Fs
 VIlKsHjhyYimb4qtTj27d7hFYGVQuLsOdE7oVpWu69xg0dPJyTps0g6AJMGGiUARt+
 1wJYSj7jkLa7VqtZgK9TuqVNSFqcaNHn9DCxLLRSZ/ZuSNm1rdwl+vqjdqjCDjLKxa
 5Se3NXvnRmKObKxZU4Xb9nsZXrBq+FU5Hu4lyX11cdOgJyezWIvBuFaOtuFBVxVj0F
 IwkDX0bq6n4+g==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: remove wrong fixup assignment on
 HDMITX
Date: Fri, 17 Sep 2021 15:03:44 +0100
Message-Id: <163188719815.50326.5771604177613195769.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210917082805.30898-1-trevor.wu@mediatek.com>
References: <20210917082805.30898-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_070439_329259_8DADCBC4 
X-CRM114-Status: GOOD (  10.24  )
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

On Fri, 17 Sep 2021 16:28:05 +0800, Trevor Wu wrote:
> S24_LE params fixup is only required for DPTX.
> Remove fixup ops assignment for HDMITX.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: remove wrong fixup assignment on HDMITX
      commit: 3abe2eec87059260bf31033a8863c67c5d45b9d0

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
