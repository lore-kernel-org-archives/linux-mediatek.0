Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A426C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 15:23:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B59860FC0
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 15:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B59860FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjZ1H3BQFUG3xqet9WNSU9eK/m6lrQkDOiPNJBO1CrY=; b=eRtMEoMv5auLD7
	n/NDfezd/e4pQ+ROMybElJX46MZhDIJJauu9Zd8aTP9ZLeqpC1gNB4DsU/o2C8Px8jjUQ2rpkT5EA
	eIHyqOmS6ISfIxnQiR4n3g/o5ZMNH7mtqkayvWu02Nu4w+sOhVYARTdklTZ7bM6KRaQiDZpObOzBv
	MVd992tmlqUHdwdYxZZZUV5V4FqKzwgPjWD3j/ovBW4uXxd5fEyd3ALWdQRIJnZXMD5MkcnM7HY1F
	utWsJFx2un+5t0NzAhv8JxBrUQpuZPXkD2PamYRYSJ6zIjLBlEJ3Fuh63AYQfkmBKHZJmZ6j235S5
	593bjP8sjQTcnr3JPqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQWkP-009OtU-Kt; Wed, 15 Sep 2021 15:22:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQWkB-009Oqo-W1; Wed, 15 Sep 2021 15:22:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E12F660698;
 Wed, 15 Sep 2021 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719359;
 bh=Iq2sTH/qaofQ6nEZPTBwlq8y5cvB7EpizEHayA1L/JY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PTwW6egGz/krolNSjeCL+AgsNjdoBFmMRI+WQ8GmJtH74J72fj1fmYOo6mSD627UR
 nyYIL7CdMwRnym8fr22qINBSlyUA+KkJPZT2mJU3WygeFvyDRx/g2ZNwRloJNXA9cW
 G1eBZ/TwOKEyLxFuAFF+SUr76xEZ3+cg7BmTchohgbh7c3guN7dlQKrkuQnYVQeuTm
 KmxKbdfWX4ytnwS1ewyGXBeRG0mTNqOKlYwt/A0fCvguNpNXH04PnddbO+pjUKEITQ
 spSYwmlxzc9JwzPpOEGqBuKrOe7pR9nhK7NN2Wrtcf0I8vW91NswKocU25+fvRWtaX
 vz35CvADgDDVw==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bixuan Cui <cuibixuan@huawei.com>, linux-mediatek@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, trevor.wu@mediatek.com,
 lgirdwood@gmail.com, perex@perex.cz
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Add missing of_node_put()
Date: Wed, 15 Sep 2021 16:21:44 +0100
Message-Id: <163171901942.9674.2137516879503383986.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210911081246.33867-1-cuibixuan@huawei.com>
References: <20210911081246.33867-1-cuibixuan@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_082240_099854_AA3447D2 
X-CRM114-Status: GOOD (  11.40  )
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

On Sat, 11 Sep 2021 16:12:46 +0800, Bixuan Cui wrote:
> The platform_node is returned by of_parse_phandle() should have
> of_node_put() before return.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Add missing of_node_put()
      commit: b2fc2c92d2fd34d93268f677e514936f50dd6b5c

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
