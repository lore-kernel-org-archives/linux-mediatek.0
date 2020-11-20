Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0685C56202
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 21:35:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBA62237B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 21:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v9kKBwnV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="STsrivqA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DBA62237B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6FSI0Tq0kPdOg2TxPBe6LmJ9yUKzsu1Xk67gw7w5uvs=; b=v9kKBwnVlcCxXBwRTd0kYyKOj
	YQe4s9iWNghaCgVlizeOwB2heX4DT6PO551lGjSmg7qigCIpqNv0DLzFxpLCVi/YoBfZxTOBH6f7u
	Tiv6go5jvL/nVtZ1ERDpSuqpvndcTIpXwvepQw5oimemyTAKgR2UeqOio5azHDSmX+7dTU9U9TxWA
	3adWhgpp5fMlh1oe04j/4KESIbTBOUAdqoWnG7ad/xiShIIfGH9fZWBM3aFvPwe7vyiSiLD6sloox
	ZnMxyxYyn7Qs4lqynoXU026C0pcloSCTes/d20Io3F8dXPuGHGF23f9iyRInikutDCZlO0tF8vntA
	XeUatYLdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgE4I-0000JV-1Y; Fri, 20 Nov 2020 21:35:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgE4E-0000FQ-Aq; Fri, 20 Nov 2020 21:35:43 +0000
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73AC12237B;
 Fri, 20 Nov 2020 21:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605908141;
 bh=EFiexHFZKW7N+/KrKxGNqn62prfsHu7FTDQCJmxMJts=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=STsrivqAhf90GKlMJGc4Ab5vZuotHcUl+J6aFoNmwlmhupWVdNrgTBwS9GuuPcSNJ
 WNejah8Hw1fnaL/6Jc+Cp1GqGBEw9AUacZZWUYFBS89eQiib9EQIxX6JPSL0QzenjK
 I4M6/forAw2zSQBvIRmre7dM/7zXseMQHnEGFJck=
Date: Fri, 20 Nov 2020 21:35:19 +0000
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Jiaxin Yu <jiaxin.yu@mediatek.com>, matthias.bgg@gmail.com,
 tzungbi@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 robh+dt@kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 0/2] ASoC: mt6359: Fix regulator_dev_lookup() fails for id
 "LDO_VAUD18"
Message-Id: <160590773742.47461.980400438580357576.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_163542_473455_64C08298 
X-CRM114-Status: GOOD (  14.17  )
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

On Fri, 20 Nov 2020 11:06:11 +0800, Jiaxin Yu wrote:
> This series fixed "LDO_VAUD18-supply" regulator register fail.
> We can see the error log "mt6359-sound supply LDO_VAUD18 not found, using
> dummy regulator" when register the DAPM widget "LDO_VAUD18"
> Otherwise, the power can not be turned on correctly when recording.
> 
> Jiaxin Yu (2):
>   ASoC: mediatek: mt6359: Fix regulator_dev_lookup() fails for id
>     "LDO_VAUD18"
>   dt-bindings: mediatek: mt6359: remove unused property for mt6359
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: mt6359: Fix regulator_dev_lookup() fails for id "LDO_VAUD18"
      commit: 9546c76c73a1ee8b662b09f7308bcb63d2cd0d51
[2/2] ASoC: mt6359: remove unused property for mt6359
      commit: 6e85530496a496616ece6c444df23522afc81520

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
