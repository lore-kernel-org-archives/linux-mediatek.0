Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C777C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 15:23:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7C760698
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 15:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B7C760698
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Baf/S1GCpbOKjqVvc1mTeiew8m76LjesT9NFHitxI3g=; b=nG4Uds1g4pv2ee
	ZHpxlo/h81cs+5DvjcKv3bRDWtLAbeg6h8Ihu4COH4Ptjhfk7OLvYkcur3HzgCBfutXVekV0Ucsjh
	1poDYMo+05OX8sGU4K8pjWZ6S+o5j99DNneacWCiR4eZ8ymHv/pR+XtJCeVpNOmy8xK1PobIue3TE
	XOhWQLTpCJIBmAAf4O08KjMQCKHADFo6Y99v5ROPa6FwJrKzFhcXcvJBQaRnAZtPVCfKcEPGC92iF
	3kG/cGdL6JFrEst6syYE4hFM9tXiQ22USSmv5MFmcIHzucWM8gd55ErgbF3MSssLCKUbfqAZIn8H2
	bSlYQV79kK+JnecTQFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQWko-009P1b-I6; Wed, 15 Sep 2021 15:23:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQWkR-009Ou5-BS; Wed, 15 Sep 2021 15:22:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7458B60F5B;
 Wed, 15 Sep 2021 15:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719375;
 bh=CFcne7+7qHsHstFKZ8q27i5a1vH58yXKDRbZpKDT3Og=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fh5j1qiGe4lhnNE63fc22HRgRVHmcrVUV4F+dgUD/xmJIWo+wee3Z1YvAqYdPMn+O
 43DpfimIewbGTUOWTGWZSBdm/u1LQhzknpmgvLwr7BQWCORbN7Ll7fISiK1VFpdjkR
 khYfusxqh9SbOWWhu8mpPt98br62xOkNTF3zjBqxa6m5z41AI/akCFqAmb070LSX6J
 YAVlE+rVhG6ERzVGGZ9UlqAbwEsFbJirULhQNeHxRt0g5io7jT55Y4GINmWrIumZIW
 OYZoUNq+4ywDdjQzF1TarRoSX4uzA1PZ2QJHZd+5nS+8AxkhozNfRXUwdQCsP3/GSU
 +qAeubGItaN3Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Cc: Mark Brown <broonie@kernel.org>, tzungbi@google.com,
 alsa-devel@alsa-project.org, chipeng.chang@mediatek.com,
 linux-mediatek@lists.infradead.org, shane.chien@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com
Subject: Re: [PATCH] ASoC: mediatek: mt6359: Fix unexpected error in
 bind/unbind flow
Date: Wed, 15 Sep 2021 16:21:50 +0100
Message-Id: <163171901944.9674.15745923942801327979.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915034659.25044-1-trevor.wu@mediatek.com>
References: <20210915034659.25044-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_082255_462874_74C4B08F 
X-CRM114-Status: GOOD (  12.41  )
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

On Wed, 15 Sep 2021 11:46:59 +0800, Trevor Wu wrote:
> mt6359-sound is a MFD driver. Because its regmap is retrieved from its
> parent, it shouldn't be freed in mt6359-sound driver.
> 
> snd_soc_component_exit_regmap() will do regmap_exit(), this results in
> unexpected results if sound card unregister flow is invoked when users
> try to bind/unbind audio codec.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt6359: Fix unexpected error in bind/unbind flow
      commit: 6d66c5ccf5cb8af866fe2bb014098a3dd7bfa3cc

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
