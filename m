Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1780C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 15:47:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6638620885
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 15:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WiYie/YN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANxgymD0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6638620885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X32WkQEpLjnThEIXnj2EOU/z7xvL9wcR4ya5uIqRfKE=; b=WiYie/YNsf8n1WEgvyfI+p8ohV
	QIMoQfSDhZ+Ho+fyVFeAbj0SA+1alie5VY/m+cV6NB13HDcV536fmkoCBojqzgqV+41fXuQWZItQM
	NA0moABcB9cbKUsryqKP6ospU3RiMv1lfT/XUSfr0mOexsnXfopc/CWvr5/sb9TIX0dCL4i8V9p3F
	vRV/zpLoqCIwm+L74khAInCeFVrh1c0xwOQ8AgjEEA6johvUz+LIWxUnkvPCG1VXMcByLlrlwh98D
	gu1vR/biCS6S9YUkg9Jy8W1x7KEzs31vm7NBuKEdWThZuRVENC7WcItGy8h3yphYQPD4LfYQ9aT9X
	sobp5MiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr1Qq-0001tr-ID; Thu, 02 Jul 2020 15:47:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr1QX-0001ia-4R; Thu, 02 Jul 2020 15:47:06 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01A4A208B8;
 Thu,  2 Jul 2020 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593704824;
 bh=Como7h4+Ry8kLsYZ1X9gi5byJb2qZgeCFlN/M2p5GG4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ANxgymD0xohZ9Dsk8fIzDT0PigtHeLmkNg4BPY1aoaF6VTMH28s31Wn8gTJzyrsO3
 enBOPXKmei5Qr3Tp+o+bb5gH0D9iv8lW6bz7b2/VLiPydaEIwW1klog8IAYsEk7aNa
 w7MqxMxVioYL6spbp0f+41bRuBYWP3JnR5Funud4=
Date: Thu, 02 Jul 2020 16:47:02 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-mediatek@lists.infradead.org, Anand K Mistry <amistry@google.com>
In-Reply-To: <20200702031525.2662441-1-amistry@google.com>
References: <20200702031525.2662441-1-amistry@google.com>
Subject: Re: [PATCH 0/4] regulator: da9211: support changing modes
Message-Id: <159370481231.5599.4888173320266148214.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_114705_370811_52B7418D 
X-CRM114-Status: GOOD (  12.98  )
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
 Support Opensource <support.opensource@diasemi.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jul 2020 13:15:21 +1000, Anand K Mistry wrote:
> This patchset adds support for being able to change regulator modes for
> the da9211 regulator. This is needed to allow the voltage scaling
> support in the MT8173 SoC to be used in the elm (Acer Chromebook R13)
> and hana (several Lenovo Chromebooks) devices.
> 
> 
> Anand K Mistry (4):
>   regulator: da9211: Move buck modes into header file
>   dt-bindings: regulator: da9211: Document allowed modes
>   regulator: da9211: Implement of_map_mode
>   arm64: dts: mediatek: Update allowed regulator modes for elm boards
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] regulator: da9211: Move buck modes into header file
      commit: 6c8b65950b1c75b9e41b5bf314f5d7b81df91272
[2/3] regulator: da9211: Document allowed modes
      commit: 650e5adae0197bb9ecaa48b98b8ada1cc6772fb0
[3/3] regulator: da9211: Implement of_map_mode
      commit: 6f1f1a8039e5f7a61e932d6a9a50708c56e21033

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
