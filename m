Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331C8C433F2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 13:45:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECE6920684
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 13:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D09UEGFY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqxGkFwj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECE6920684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8P0XUo/MBxnj5E5gzjxHwT911iLiEwMYjv0QcGlOg1o=; b=D09UEGFYO8mwezW9WAws3IcViA
	KT1hzWuR1OsuUcU29WaJmBWGsgRD99cJYpwJSwN/sWkqIRcsePf0C5UD2m/cuAYmbflwlcUYOW+le
	yoRY7SOTIeWmbIAUONHfa+RLy9yxgzX+hIYpy5NOZgN/AW4AlgXRt23jIfVYpisrZyBT+HXYkKCeD
	WXChbeEDeHGYOpXkTuOMKvRFEVePhTqt69PYA+d+UkPYZDVpnwyQX6RlsPmllRGMEu0MuWzlI+5uc
	4a/yoca3cvN7BBhi5VRbBs2VVT9qcs5RHmIowZ2wp5pJYh/pQzaRn3KSTcLm+zPyb9tfMLY2O2xpc
	Tuk1kIIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyF3u-0007TO-Tf; Wed, 22 Jul 2020 13:45:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyF3h-0007O1-2S; Wed, 22 Jul 2020 13:45:22 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBDBA2064C;
 Wed, 22 Jul 2020 13:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595425520;
 bh=bhU2SrpxL6HK/PGcmY+z+DbNbJ/eMlUdGESTC5DRoYs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=XqxGkFwjP4lDM6IyHBP02oBHIiEOzqliPZDN7yWLCZXeYg0ifhJa6kBA/f32DgLlI
 5nhB36jBo54jbTyLC0j21o0EsPGmSclCU84rluHtps2CVnNirULxctzCvkTEyDjKBS
 fojUfgiTnN7FbAE9NQJSJBc931uqTGSEjfTNsxbw=
Date: Wed, 22 Jul 2020 14:45:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
In-Reply-To: <20200721122436.31544-1-leilk.liu@mediatek.com>
References: <20200721122436.31544-1-leilk.liu@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: update bindings for MT8192 SoC
Message-Id: <159542550175.19884.9018022901634412745.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_094521_196832_DD03E1E5 
X-CRM114-Status: UNSURE (   9.44  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jul 2020 20:24:35 +0800, Leilk Liu wrote:
> Add a DT binding documentation for the MT8192 soc.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: update bindings for MT8192 SoC
      commit: 30962fe33ab5ed4bbd78c12f4b9e25a85c3e8d0b
[2/2] spi: mediatek: add spi support for mt8192 IC
      commit: 8cf125c403f4e0c7c7b78f34bbf9d7a7c55c1ff8

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
