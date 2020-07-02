Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894DAC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 15:47:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D2520885
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 15:47:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qR3uIjQG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/n8Worf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D2520885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Hk5tM4B09ISTiyVxT20fGISOc7Kj6Lifd/oMi6cwGo=; b=qR3uIjQG30gtT+LJkUojgb9uVw
	s01/lNBDJOPdpZwj2QdSQijCfcOQU9Ef9D8bsYHDXTy2RmHEvwIVNLsn5aHOiLPD9SwKzXwZ7tCBf
	WXLxMzgVGsp4CzKqmPopvEPH/KpZuG0cGnZwv0AwQFazalf4OJIBH6Bh2bxNrtq3yN7WDknK0iEOX
	3m9VfIb1H10Jzpt4C/TLUJ3knucX2rWYaGHSSMDmTNRsbYP03hcA93Gg9j1YmvTqGYfOBesvn+IXF
	Pznu2WCUbSdgdcRBhc9qBsGodnkFjmM4fNZknM0rS0mJ4dwW+HGqpXWWTyNCc1sNKOzRpuEt8E85/
	f2auftpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr1Qd-0001mE-7S; Thu, 02 Jul 2020 15:47:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr1QS-0001fc-4B; Thu, 02 Jul 2020 15:47:01 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDF0C20885;
 Thu,  2 Jul 2020 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593704819;
 bh=GlMtWaaBQ7ayJajZsemgytwD68eNWl0Zn8s3Dn5PCck=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=O/n8Worf/Aj21RCMin17umiYx/dtg6ZVsfLiUX8IjPr9N2aTWMyLxByg0LqTUxehL
 UTR+gpezmReiPiXffDRibiWE11Nzl/qd23ijLq0DEA65Xj0LJ1BDlpjsuZbfmIo4Ux
 R/9D9UU6KoaNVs9gKyIXf1tWXSzXtpl0it6wKW0I=
Date: Thu, 02 Jul 2020 16:46:57 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, Anand K Mistry <amistry@google.com>
In-Reply-To: <20200702062320.2903147-1-amistry@google.com>
References: <20200702062320.2903147-1-amistry@google.com>
Subject: Re: [PATCH v2 0/4] regulator: mt6397: Implement of_map_mode
 regulator_desc function
Message-Id: <159370481231.5599.8673864657809351284.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_114700_285470_A4D456F4 
X-CRM114-Status: GOOD (  13.75  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsin-hsiung.wang@mediatek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jul 2020 16:23:16 +1000, Anand K Mistry wrote:
> This patchset adds support for being able to change regulator modes for
> the mt6397 regulator. This is needed to allow the voltage scaling
> support in the MT8173 SoC to be used on the elm (Acer Chromebook R13)
> and hana (several Lenovo Chromebooks) devices.
> 
> Without a of_map_mode implementation, the regulator-allowed-modes
> devicetree field is skipped, and attempting to change the regulator mode
> results in an error:
> [    1.439165] vpca15: mode operation not allowed
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: mt6397: Move buck modes into header file
      commit: 1c537b2d729698717f01fcea13721818be5adde7
[2/3] regulator: mt6397: Document valid modes
      commit: 347f12d573412cb7ba4781b58f42f0ca7eecde6d
[3/3] regulator: mt6397: Implement of_map_mode
      commit: 8096236db4349c43a2b19b8ceb11b0b997354223

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
