Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B36C433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 12:56:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3083020B1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 12:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RZgMquXs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CXQKVjF0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3083020B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOFtlS6UPfaH5tW7WgUd6IkLFZeiyREHr3W4y2X1Fd8=; b=RZgMquXsSIWcTQ5HKioX7dw9HK
	MiBK+KXuE9uC5z3zmaw2eUfD14/d7yO27KMelufETS6HgrnuLi6AW6ejP7PJk1zcc6Pem0hDtlhRR
	SuUJD97teZXtp3CVL1PI0edw2KBFyyCaR+cIWmIZtEN39MwgI9ZbW929EE0fXRoIlRgt2U8yWtstW
	sWh2P6semBXnn4qUe9zZWgTGA6+fhvfPGiCkHjYYnZLDn0k+dhhlDzvfnBQ01LOE0NxpKulvtZxor
	qxJJMxc3IItALQkzlDlP28QtgzNTefl1l2mNAT61nQfhruo10crgtJEdwTt3ke5/r8ZzOUBAb5oqn
	N3pxEcEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAuyi-0000Aj-21; Wed, 26 Aug 2020 12:56:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAuye-00009z-FI; Wed, 26 Aug 2020 12:56:33 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A0A6208E4;
 Wed, 26 Aug 2020 12:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598446591;
 bh=iyBrGKIuWDpQ96yGsm/xxl/JNJCgYnxw0uCgCZMcfC0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CXQKVjF0g0mpyijPuLzHX+j6jgFgwa5M/o3L1GFs4/Rjxe2l+Mw0sbsfgoPpJBG7c
 eiF9XZHyLemgXJxWxOPHMxz/7dibkFq1WgYaFF5o/NdA11hNUDRsVy5uiSPKVHn3lT
 2PFJpzP7uh6vXL6tuj1fBhg7tD+fox4JsDcP12hk=
Date: Wed, 26 Aug 2020 13:55:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org
In-Reply-To: <1598438958-26802-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1598438958-26802-1-git-send-email-gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 0/2] regulator: mt6360: Add support for MT6360 regulator
Message-Id: <159844655479.37260.3133336814672440468.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_085632_586159_E3B49B50 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 26 Aug 2020 18:49:16 +0800, Gene Chen wrote:
> This patch series add MT6360 regulator support contains driver and binding document
> 
> Gene Chen (2)
>   regulator: mt6360: Add support for MT6360 regulator
>   dt-bindings: regulator: mt6360: Add DT binding
> 
>  Documentation/devicetree/bindings/regulator/mt6360-regulator.yaml |  113 ++
>  drivers/regulator/Kconfig                                         |    9
>  drivers/regulator/Makefile                                        |    1
>  drivers/regulator/mt6360-regulator.c                              |  459 ++++++++++
>  include/dt-bindings/regulator/mediatek,mt6360-regulator.h         |   16
>  5 files changed, 598 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: mt6360: Add support for MT6360 regulator
      commit: d321571d5e4c2d5511b75e6cf1a910e0a0c2a2e9
[2/2] dt-bindings: regulator: mt6360: Add DT binding documentation
      commit: 9b1d3422e16ffcd4dad7729459717b216490540d

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
