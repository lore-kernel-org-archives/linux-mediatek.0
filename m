Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A412C55ABD
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 15:47:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F36A20756
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 15:47:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H3eCZqjl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="we78jZ9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F36A20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tx43XTJ3GPoSJTE0IvNkKWso45MxurDeszXedr26n0Q=; b=H3eCZqjliOgf7T48vubXsW6+c
	gPwuvOVfoLXs5MV884MbQaN7DNelReYID0KZhoCmUP+ncGgiG7aLbkIRE9a3EVtMMBqq76wlwnfUj
	hcjDonzOJRoKyY4xOP5efPZ0/Zvw23U30aHFx+Zhr++6rXWIdv553A40/Bn+9VD3Wy6TdkMm05tLn
	7E7yNCoKTGI5SoOXHR7V2u/MDYyEnoGE8fT0A8MYOgu8K39I4HOEGKBV0+jlO1l/0GQdyJ3zkGFtW
	FK627/PCkmL5msvTKL1DHzUNaG2NvmcYRGIEIRXMVUIKRtu1OZQ6pdt95ALzheek9yWKUNwH5Ykaw
	I4Rf8pjMA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcsLZ-0007nw-9j; Wed, 11 Nov 2020 15:47:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcsLU-0007mo-Pj; Wed, 11 Nov 2020 15:47:41 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3745520795;
 Wed, 11 Nov 2020 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605109659;
 bh=TTNoL6GBlWNK0Z3Z/H55ys2nW7UK0eo8aEagF6NmeZY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=we78jZ9omwC7/HZcSka80t8XOSOZaRySnn7Va6Kg0o1uRxXCDEvwmcJajgultKo+f
 R0diERYRDS6b2a9JBCQKbPnoDlv7oQxYfRGIfmuTMvgun8eOIFv48MPNoLb9QZJzA2
 5zFzXjnNmcRE9NKCIQq7p/xqt3LoFQ+LWwNg4MZw=
Date: Wed, 11 Nov 2020 15:47:24 +0000
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org
In-Reply-To: <1605062722-8711-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1605062722-8711-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v2] ASoC: mediatek: mt8192: skip first time data at the
 beginning of DMIC recording
Message-Id: <160510963229.12073.3065618911548119366.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_104740_938562_32B64991 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 10:45:22 +0800, Jiaxin Yu wrote:
> We can choose to drop away any length of data from the beginning according
> to project needs. Some projects don't want to throw away any data, because
> they want to use recorded data to do echo cancellation, so they have to
> make sure that they are aligned with the reference data as much as
> possible. Or there are other algorithms in the upper layer to eliminate
> this noise. Or some projects want to eliminate this noise form the kernel
> layer. However, the minimum recommended value is 50ms to skip pop noise.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8192: skip first time data at the beginning of DMIC recording
      commit: 2aff94e47da2e2006ceb53c00247218ea8a72770

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
