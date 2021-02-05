Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E39DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 16:45:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF5D64EE1
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 16:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF5D64EE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=34xHZNMXNkg2mSpA5bb/nuxZbN2ei1Nd3EcZ16Gao1Y=; b=RjsDipq8Re7dVOAsL1zMvR4Sb
	iBD93yGWiAV9ze6uhKPnZmXeSKahtQ5YyiQPtKqYxFvHB4eUkPOD5nDrJ2mBPLhJtbxqI2ALD0kxw
	4k17KwZnNJnGY7lZZUZuKDh3CQgVCnGMu643VLowsqam/SbVMvGsM23aY382Ves5lLpEjh4WT9f5E
	WqTWAYBEcBQpMbbzXH8rD/LEG05BvyYPqNTDR8kA4RLduRKkc7631lC95YzDRd0QqWDwIhxFyhjq4
	zVg+ow31gsFJ+qFAJKDJNeXCL1t/DqZzeyyGbmd/RizxmFRg1NKGWQM3Wa+QRUx6+uDa68Zjrsb3x
	krzdABMpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l84EA-0007cK-9g; Fri, 05 Feb 2021 16:45:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l84E5-0007au-DP; Fri, 05 Feb 2021 16:44:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F98064EE4;
 Fri,  5 Feb 2021 16:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612543496;
 bh=o3h3fYmeEdvgWp7HmTFWFie1v+V6mM1T5BeFAVLkmok=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=egd2wtrWuGXbz4EhfdPFspKlVwK7DP3eOxmu3CYdZmZ1ZtaiHNBqi9QbOGkee+9ys
 U4NBZ1p22vxevM15NuzNIwHsdHju0eCqeq5JzCLGcyJvrbur15lgHoHFqHDM2fayJp
 cvqE3cybiM9fXkCFRs3KojclCOXUBfJ6YlI6mG/YXZkJ0Kgg/B7W0iAQOTAPfY5FVC
 hCAAkQ61SOSrM1RABOTTc3dPtFXugKs9Bi4KNBg+CsLU101ncgs3b7iNXyVnP0bMVl
 Ng451/kdG6pRWehZ3G85IN55qu6CrV1hdZL/iSsWDMPOcpI5FPhK1AED+NQwtzBnM3
 PbAI0xjITLv0Q==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
In-Reply-To: <1612513012-27688-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1612513012-27688-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183-mt6358: set playback and capture
 constraints
Message-Id: <161254344059.9495.1560731100918324010.b4-ty@kernel.org>
Date: Fri, 05 Feb 2021 16:44:00 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_114457_548459_3052FC11 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 5 Feb 2021 16:16:52 +0800, Jiaxin Yu wrote:
> Sets playback and capture constraints to S16_LE, stereo, 48kHz.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183-mt6358: set playback and capture constraints
      commit: 19657a609b68f37afede259a762765b77914557f

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
