Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8787C64E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 16:56:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3540320825
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 16:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jhYQt5Sw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWlBhoks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3540320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YOHi0pwuTjzyIu5Nb261Im4EDuvNqs5gccBaIpyihQk=; b=jhYQt5SwD+N0a3KJwG5q6yNm4
	+I33gW6GTNuVG12t9Xgi0hGaijNggTiKBhyIlSbGe7fGOEYxZnNMtZ519jd2L2w/CdOhU+ousG2dl
	ow23A0IMzbBg4pT7X9aJ7ocxHX1uYv1/vrx014zKGOnniE7Q2YyvHYqa31eOdx9L0CHlXqnv8bUXx
	mQwnZ1eNFxbsohPpHgBiqq5/i7cVbhquxQHc8m28lsD/Gs2zSgO+Ptm8G/5weUfPIZe6y8CnnXpP1
	MxJNmekuhbhu08gBAi864OAVKHoTrf6RSfLWiiNu4HcIIlZGcdyKXYagDJF91pUiwztTEEPB/Q9dQ
	a8nE+x3TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjmT5-0006Ck-Qh; Mon, 30 Nov 2020 16:56:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjmT2-0006C4-IW
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 16:56:01 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C9492076B;
 Mon, 30 Nov 2020 16:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606755359;
 bh=7Vk28EpWuHZuMnrQqTFNVfiCs4UlJCZKrdZFJcP3amk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PWlBhokstXIrt3HShF+u0MtDphfvLTvqH/VUpu4q1S5g7N1fbQjHvJ9uzeb6VVqLM
 YaHrWqeAEvSiw4KWEXyYy+byh161jIrXzbHhv9Tis+sOfIJCXnPM7wpoXSEVFo1vR9
 rDSAMxpKEY+xOzmDG8uqQ+QEdF0pS0Z4GRLLYx88=
Date: Mon, 30 Nov 2020 16:55:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Lumi Lee <Lumi.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1606705875-1940-1-git-send-email-Lumi.Lee@mediatek.com>
References: <1606705875-1940-1-git-send-email-Lumi.Lee@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: btcvsd fix tx stream assign
Message-Id: <160675530955.30326.8266521477804403197.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_115600_717843_BD266F6F 
X-CRM114-Status: GOOD (  11.61  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 wsd_upstream@mediatek.com, Lumi Lee <lumi.lee@mediatek.com>,
 jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org, Shane.Chien@mediatek.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 30 Nov 2020 11:11:15 +0800, Lumi Lee wrote:
> Fix tx/rx stream assign in write.
> Write should use tx instead of rx.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: btcvsd fix tx stream assign
      commit: bbe1f69dce94089943cc407a88325ae7e851d49c

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
