Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D6CCCA47F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYPZv9eFBeSuoZutN1DXb3rC4vs1yC7kxzMt0rxs6HE=; b=BR11bZ/lc2IXTm
	SF/nNPdb2ek8VZnlEOSwOhr/eBm18g5tMkNjKch/7JTOAL9ACXR6VYGzcY2amrKOcel2CqlsfMIT5
	v23oSgB0q7XcAVwQLGxJrxFLA8Nb/3tmF8Embx4YYP5/VB1TvrupL5JT64Ng7pnROb6I7r9l7cDOc
	wie6ExYP/+kQmVPh1ti0rBOCBN8pv+wctOHKFuHZgt+tGDTCQlJ0V5FYJZ/1Dg+YK9o6PjDx0S7kQ
	F8Kyb3kvmS9NW0WpIrUBU/WiDqb8DyMX0A6rLXKEbOBw2AVirVVZEIWy0RIL8OBfVlTqsIpPB38sL
	g0gUwvGFDLgnreUxpDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWlH-006oKf-AZ; Tue, 07 Jun 2022 10:48:35 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyWj0-006myy-6A; Tue, 07 Jun 2022 10:46:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C6DC1B81F0B;
	Tue,  7 Jun 2022 10:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC6BC34115;
	Tue,  7 Jun 2022 10:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654598771;
	bh=7hyUoDD8U/8SSRsc3zmtGqzvEKN++qYD6+Qv3iS5Xhc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SuY6LaVu/gau0DpI7Q8R6xBJsfAfYKiB2tzYXBqpju6IK2algZNMjsISeFm2c5mcf
	 04kJDOvZtD20nCeo/ySGr9a6ZtiXymq42zEVVheBgn4ryHMKDJep4rde4QyOwQPaK/
	 NjP/fFnu5XCKAaeJIHiCFKUb8wPcrHx9e7BOwjeYfYeRZv7donfF1xSYEjnM2ZRPSf
	 JEydpVrI9LTVF3VRtRKSx1E4UvCFRCMdkJ9y+7te4dD2193R/TC6duY+LwF07ajZQ3
	 imwWFFORep06HVYBmlSmUi9cMwF8HkcsmycD8ELFEYi5cuHkoxQB2BvE4UbxEPBZQL
	 PlxPo9YHEPBHQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linmq006@gmail.com, Liam Girdwood <lgirdwood@gmail.com>, tzungbi@google.com, Takashi Iwai <tiwai@suse.com>, linux-mediatek@lists.infradead.org, jiaxin.yu@mediatek.com, koro.chen@mediatek.com, akihiko.odaki@gmail.com, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20220602034144.60159-1-linmq006@gmail.com>
References: <20220602034144.60159-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
Message-Id: <165459876882.301808.14719420011203139333.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:08 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_034614_419187_991CDB4C 
X-CRM114-Status: GOOD (  13.62  )
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

On Thu, 2 Jun 2022 07:41:42 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Fix missing of_node_put() in error paths.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8173: Fix refcount leak in mt8173_rt5650_rt5676_dev_probe
      commit: ae4f11c1ed2d67192fdf3d89db719ee439827c11

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
