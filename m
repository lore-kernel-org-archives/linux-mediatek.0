Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF87F606A32F
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 20:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tybWFiBT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OLhcE1N1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KKiKSlRn1CU7D8BEs2u/rf46yHaLNGj8ZGPqKJfIU74=; b=tybWFiBTtoMpW6
	wffOvYQdu9hx9IYoFgvzORxDc3XiuHFPUGKEsita6QgwI3kEKRjIOQl8+C2KJ5MNvMWuKFjfmcmsL
	MZIGbmInDjWJ+9B89RE6ZRx9PgE7VAHnqpq36QnOGCHzFsJXzPmckK58ng/dLiYNxLS9fSeDHQdmT
	3FuQoXCMp53qWsVxolm3b+FzLgMoqXQcIf2wgG7pEmfsbVJt7+onlAS22rdc6Ltvrud3UuMvQ9hk0
	P6NJmmn+UxFZl2iQBsWv5ZPOj+Xl+fadnzxZFCcWLcgwsoM1OmD1YnsWCypNtO6OV8Pej43eIpfn1
	mr4Zjgi7fwiMqpYVzR5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgRh-0000000EW9a-2iNY;
	Thu, 26 Nov 2026 20:51:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgRg-0000000EW9D-3h7K;
	Thu, 26 Nov 2026 20:51:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 603624093B;
	Thu, 26 Nov 2026 20:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C897D1F000C1;
	Thu, 26 Nov 2026 20:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726315;
	bh=KKiKSlRn1CU7D8BEs2u/rf46yHaLNGj8ZGPqKJfIU74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OLhcE1N1RgeWA4OTzqUAP7J1YyEASOA9RiMC9OEhRUGtodDF/N4mQyBT6AoyzHuLL
	 FplKTLpI9vzhrtynjOW9xxK7YmuOy+vF8HquYkaDzNnxEQKDNdCHOWbX2sprVlXsky
	 VvWLFHow0135Nw3TUzZTvPtvJAMBCU9Oo/b4MB5cYR/yDtEQ2GkVkbW+Rc0AHKvii8
	 Xv4svOWn7uTdUFTHbwxPhpU8gwoADN956HcaX78PHvdWkY8XpBGlLRVs3IpmOzAFPn
	 hpd17q4PGuoZG1NiZm5H9JLbLwUg1CDioa3elf61LpkvdUFFFgMHkwa3a5dv3Ki/S5
	 tsTxi1FyXukdw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 llvm@lists.linux.dev, Christian Marangi <ansuelsmth@gmail.com>
Cc: kernel test robot <lkp@intel.com>
In-Reply-To: <20261124231245.271869-1-ansuelsmth@gmail.com>
References: <20261124231245.271869-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH] ASoC: airoha: fix objtool warning with memif probe
 loop
Message-Id: <179571856562.838304.2203550575744012531.b4-ty@b4>
Date: Thu, 26 Nov 2026 18:42:45 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1133; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3JMk+PWdk5sr2Qtcs5FeE7WS0AzMKSIzn5yM4hGxNww=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5Zj+bsH+igWQy93avXdLH3wReeLXrcGbX3SmaYXPMm
 DIOpvb/6yhlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBExD8xMqwtKdz1YInQRO41
 /2Qb2352eu4OnM0ZUXFn66vf+9L+n5vM8L8y8IfQk6V+lyUOdeZI+bWFX9RMNVJtUM24diI73Un
 iCz8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 25 Nov 2026 00:12:43 +0100, Christian Marangi wrote:
> ASoC: airoha: fix objtool warning with memif probe loop

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.5

Thanks!

[1/1] ASoC: airoha: fix objtool warning with memif probe loop
      https://git.kernel.org/broonie/sound/c/61914cb2002a

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


