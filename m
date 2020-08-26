Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606A0C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 19:18:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2322B2078A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 19:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xIZ9W2ML";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GI9cwYFg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2322B2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/y5MMqu3C08jwRNSIk3rCCK389AonUY/pFyeKf8ubR4=; b=xIZ9W2ML5Y9jyYEudfyVkMdsEX
	AP5NxEREdoPgPNU3IGzOw4DTeiOeSTHv0o8cL8+SMC2nuIcBd1Fe+P7OCCB8PRkTMbXeQdNZdcTAY
	a5WdeYFDP/rZg7fIpJMb/S6zkDxncl19n83DLl3Uld1lpfdsUQL5+Z9GARdSyw+sM2bvze50V83Wj
	/3nUZ2sCQjQfDuTqe/m62g3PMAN19EhBt+OL6M7e7hIV6Ppn1OvDVJl20ql4/pffSoAXi1cAQjwwV
	F6Yav8HJQMJoUI2ztWVSRjorVHetpRifj4UVLPzqL2o8AVJlkIjEgCEHj6ZFvVviR4vigU685iWug
	Wd97CDKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB0vk-0001hZ-Ev; Wed, 26 Aug 2020 19:17:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB0vg-0001ge-5h; Wed, 26 Aug 2020 19:17:52 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF3A92078A;
 Wed, 26 Aug 2020 19:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598469471;
 bh=Msg94sVnxgYZ5tSLUPVzIC5igpCZ5D0lrYqNmAZsJcA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GI9cwYFg4+VacryxRyhDAMm+YB4HnfU4u0sj3WwZygN1bT12wVmIPZF3GE95KfUPu
 5UcT0iiN4WvcHMq43eFULl07EScoxqm4OxutgKo92rgfKxcMt6cpQIi/e2wh2i8E4/
 G1XMmMgMCyATAfz8Ub5IxTSuD0zaUzrTdhJa6EaM=
Date: Wed, 26 Aug 2020 20:17:14 +0100
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20200826085450.508556-1-ikjn@chromium.org>
References: <20200820052827.2642164-1-ikjn@chromium.org>
 <20200826085450.508556-1-ikjn@chromium.org>
Subject: Re: [PATCH v2] dt-bindings: spi: Convert spi-mtk-nor to json-schema
Message-Id: <159846942993.39994.12565318588814253714.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_151752_277788_6AAD9984 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: linux-mediatek@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 26 Aug 2020 16:54:50 +0800, Ikjoon Jang wrote:
> Convert Mediatek ARM SOC's serial NOR flash controller binding
> to json-schema format.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] dt-bindings: spi: Convert spi-mtk-nor to json-schema
      commit: 043ebcf3204ca1a0ce0d03cb7dc6e0d63d2cf512

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
