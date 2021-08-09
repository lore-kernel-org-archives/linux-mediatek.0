Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD99C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 15:03:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F5860F8F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 15:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7F5860F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYl3pHu1phLGg78POK712a+ffGw7cgwnqYBy7gT7TE4=; b=PIrEz7HjG0wD//
	v8uDpJH56HwRPesvQppwM18QQ2WBaw5XtOGD9e09zrVep1QPGgOvAfPkIoq6gfwuYq858AzKanZDI
	8MBG+j29/Tfb2w+IEkHcwRL4D6L/Ul/6r/FunK+2xABUQ8/Pdu823YiBQPE0Y7gCwxddgnCnWRKt+
	GNkqZ0amb7QruN9GsWEeDV7X8UQVpuaIwPyfhNahV5/Mq5f0ggwQQ+rKGXlnob6njqarmuAs/6KnQ
	D4FswZNyIY6+XK2Tr2yRYb+RWQr8LY1IPRIkUENg6EvHXLY+VxH+cKprSgHe/gWHAdqpFbVUUgXpM
	LHQLTMvGXmi/xqcEZNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD6oM-0012qH-LC; Mon, 09 Aug 2021 15:03:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD6o5-0012ko-MN; Mon, 09 Aug 2021 15:03:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD66160EBB;
 Mon,  9 Aug 2021 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628521393;
 bh=OYFPvBpAz+gBYk1xqnpaZKlokxOeCKmDhJ5hGhXtecU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X1p5Bsf26lKmLIq26lrO/iZ9qZPIQzVB3m4Q/3F/kUUiKOQtV9YLB3uAU5unX8Lhk
 KXDjd98y4rh4kp/9Q/rqyOztNIlIbCDKzisj6pnf0IW1SdgBh3sRjLMnsL3WQvqn0A
 rv9Jq0j2IaChOT7f/FFrrc/oiSmUf41pC0H0EBqOzgCzMR8wCrKjimiUdhLEDycFdS
 FNvVp/tdwZB0/i99UYV/XJGRsmxKNR2cc9ZtSCW2OKLtZkAPq0yxhvpw92wf9Hempe
 bC+49TrLZwpSepdq+W0tMTxfijByb+nYbNuSw9e674K4JfmYI6SvHcpk+CozIhddPv
 SqCGePLjy1VbQ==
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <Mason.Zhang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] spi: mediatek: fix build warnning in set cs timing
Date: Mon,  9 Aug 2021 16:02:54 +0100
Message-Id: <162852121764.46095.11307268331804449714.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210809055911.17538-1-Mason.Zhang@mediatek.com>
References: <20210809055911.17538-1-Mason.Zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_080313_815958_05DD9A99 
X-CRM114-Status: GOOD (  11.64  )
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

On Mon, 9 Aug 2021 13:59:12 +0800, Mason Zhang wrote:
> this patch fixed the build warnning in set cs timing.
> 
> 
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: fix build warnning in set cs timing
      commit: 5c842e51ac63130a1344650b0a95bdc398666947

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
