Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32D5C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 15:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26EF02074B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 15:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1Io4eVRO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="STeXlcSm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26EF02074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7YhH5YAjRx4FSh0m/xstS1v4ih6Qwmzzpodtu7ZPv8s=; b=1Io4eVROPrE3dVSc9HV2inyPu
	U9FvhXEp6bUlVjvBwoQqqbRAHwwsxtGJ4VECVAOHJaEY8VTlbH+If5vj1YjwHwBXHUQ0lYokXeevo
	jVb1M0HPBvOBNzykhVxkIjuxqYZfFrVfdKwSLIF0L0m9hE3/2xJy6rSnL7guWxFO9uWDiquGuUhKQ
	4oD/MpuHiawTBTVveAlbbzQ2m/ENrEDZqSbgoKujeo4Fbae91r2BQXSe3uMjh8fsNpVM+vEth2P1i
	6ayZVixR6FOrvd54cmoWPsrN1OYGLxgyMkCPWnMwok90T4K+jLO1oGVq89X7ZIBx4FfLHEfY1i9Jt
	Fn32nG7uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcsLK-0007lB-TA; Wed, 11 Nov 2020 15:47:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcsLJ-0007kY-KB
 for linux-mediatek@lists.infradead.org; Wed, 11 Nov 2020 15:47:30 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D8A92072C;
 Wed, 11 Nov 2020 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605109647;
 bh=m1RD4uBreG/nk+7WyTBCXLAvl3XYethrGPLEyqQk6SQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=STeXlcSm0ejPuQEanT1pBulB1iXwiCbiEAvdaGUbYvt7eyllglcKJOKaKuw6LuB22
 01zLtXZE7Q3fHb2JUS17ngT3pw9Be4GjV4eieyhgk9lHGIsbid1WT9DyTzl8eDMO25
 GXpchpOOghwjZgPUyUQieuYirwPkWHmCBjkzadpo=
Date: Wed, 11 Nov 2020 15:47:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shane Chien <shane.chien@mediatek.com>
In-Reply-To: <1605068096-12587-1-git-send-email-shane.chien@mediatek.com>
References: <1605068096-12587-1-git-send-email-shane.chien@mediatek.com>
Subject: Re: [PATCH] ASoC: Remove mt6359_platform_driver_remove
Message-Id: <160510963229.12073.13028752584402276909.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_104729_750349_BF797B28 
X-CRM114-Status: GOOD (  10.91  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 chipeng.chang@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 12:14:56 +0800, Shane Chien wrote:
> remove mt6359_platform_driver_remove due to it is
> useless.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Remove mt6359_platform_driver_remove
      commit: 6b0e12a5c668c6b77c3e6d6c55c3ae7ed8bf5bd5

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
