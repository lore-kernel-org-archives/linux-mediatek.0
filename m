Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C06C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 13:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TX1OGyUNt7X4LjpV+/OmzOe5dZq3Clq9S4xg5J3bs2w=; b=CefXeFnPMKhDpL
	BWCevKxx4es8hD8P9FOc2FG5gha3pAs2U/DI7gNXFLzcMVy5vSsu+3VRl4w3wqMAUTnM/ecz+Sn8h
	WIXXIukDcqxgo3Nymv75DgDZJzeSpVI4XYQ67GbqfE1akYeGQo4I/wRBbI+eoQNSZmGUDP/UsNpqq
	+vBsfj1XTFcz+4R4YjgnLJ5ABl5ahCjyhcVZW/LhgVXWurM4koei7BY05+CWxvleGDV1PnKU3SHQt
	S2uU86z2HJY5bvUsn8qKEkHQySjxf/IMuO3mF2Q0GN2Dw1Pglb2X7Lw1LO3p9FHbrFGPnhdlrwJ2V
	DIhDfKjq1mRzehMS8hig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc5ik-006HhC-3D; Wed, 06 Apr 2022 13:29:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc5iL-006HXv-Hy; Wed, 06 Apr 2022 13:28:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF39E60B86;
 Wed,  6 Apr 2022 13:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32C00C385A3;
 Wed,  6 Apr 2022 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649251728;
 bh=l3divZWw+E9A2Yng2WHTTF7Ibc8GkDmAmP9AmSHkIaA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=igR6KWLHQZ2sB82z8sva1vGQ9Rhoj+O/eAap7EEG6bra0gFhrrmoJint3XuTZKfca
 XkwTf7BnoE/Ona40Y8ZUYAK2aKbbgQiFEd07ySFZl/TUwyne/i0YmNZsavmI0ZbOpQ
 mI4m/h9IacwI/GJ272sdj/YVcPr+LiD0NTQbgfXw7xGRocrG1o+e3ldH4QgZVSSA4Y
 jTWS441ZPh7O16YKEp07332UhHHI88kL6eqjmJtOnQLs6sEFTQNBMbh9DuMaYWcVBw
 WStCOuLC/mtyBFdRFQUoaoSo7bdb/43728TNve3YPOqv810EiZEIQm1IvixtbZ8YLY
 4ICQTxx9+j0Tw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tiwai@suse.com, linux-mediatek@lists.infradead.org, linmq006@gmail.com,
 ryder.lee@mediatek.com, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 perex@perex.cz, alsa-devel@alsa-project.org, rikard.falkeborn@gmail.com
In-Reply-To: <20220404093526.30004-1-linmq006@gmail.com>
References: <20220404093526.30004-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: Fix missing of_node_put in
 mt2701_wm8960_machine_probe
Message-Id: <164925172592.83821.12895758301254596551.b4-ty@kernel.org>
Date: Wed, 06 Apr 2022 14:28:45 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_062849_679192_8052ED8E 
X-CRM114-Status: GOOD (  11.89  )
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

On Mon, 4 Apr 2022 09:35:25 +0000, Miaoqian Lin wrote:
> This node pointer is returned by of_parse_phandle() with
> refcount incremented in this function.
> Calling of_node_put() to avoid the refcount leak.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: Fix missing of_node_put in mt2701_wm8960_machine_probe
      commit: 05654431a18fe24e5e46a375d98904134628a102

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
