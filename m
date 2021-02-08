Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5543BC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 18:40:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F306D64E60
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 18:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F306D64E60
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rA0P5AthPK1GrDGfRJM1J1bslAl7Ug7TqrkyNJuDkjw=; b=HFxURH1w+hARpWkq+uTopRSzt
	ZrpPSH93PBsHDIY6m/2mPUcLy4ABOJa3kktkbhKWMpbQdsnSe1SV/pbXjZdWjXyUBPpjjsRG+rjM1
	1TR4hEsi8ON3n9d89NnxL9VaJvvkzVKKjX0Bi+IiawSTpllqnxmTYM7RWiW2t/90htflHrMyZ+5b9
	9BTFeXCIzsGSMTXZvRoJtUJGQr83xYj4rdi7qcGN2XqCCnbMiGLQU4SD0Qvt9TjoigXUTOtvEa8N8
	HWAvuPv31M95ob0nVhrIlr0ZmFduDdQx0Spw7X37a+T7O5HQ9cqtPr7cxtSEQ9se1oIivMtgyDOfb
	iNrsbSkwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9BSj-0007Rt-JG; Mon, 08 Feb 2021 18:40:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9BSe-0007Qb-TU; Mon, 08 Feb 2021 18:40:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1F2F64E6F;
 Mon,  8 Feb 2021 18:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809635;
 bh=7ALs6mqpwEmsTP800ZCsUHPGdJfs/sIf4APkcqdnOxw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AgbQiKd/TXtpeuqqQeXJTMbG2BcWztR5Lz+nbm5VE/ohurr8g3laR2xPMm7ui9EHn
 vM8LcwSS29oGzQa0PLVIGfb+GHhZS5RwNG9W+TK1ihAekdtQ0YsY16Yq24nHir19kq
 A4jnSoIxHLEU7FI558re9r5KMGkr80j3FNCN5lzbwf/izRLHKjGikaIpVoIzGRf0n6
 lTdUIEBqE506kcLYvzCUvdnZl23vpXJqTgT4U5kVd1dc+6u+2bdFhJUCgqbdl8ZpcL
 NKZG064snD0sbNu5kfYT3ICGw9sD7c96q6g8CYjT2FEuIp98zuBY4r+uAGl0iXZai4
 7JeJdhCXwhzUQ==
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, drinkcat@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <1612678457-11548-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1612678457-11548-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Subject: Re: (subset) [PATCH v4 0/3] Add support for MT6315 regulator
Message-Id: <161280958330.10970.11171389385513802451.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:39:43 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_134037_060538_61183B87 
X-CRM114-Status: GOOD (  15.02  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 7 Feb 2021 14:14:14 +0800, Hsin-Hsiung Wang wrote:
> This patch series adds support for MediaTek PMIC MT6315 regulator driver,
> which adds MT6315 related buck voltage data to the driver.
> This series is based on below patch[1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=429385
> 
> changes since v3:
> - fix the error of binding document.
> - refine the mt6315 regulator for better code quality.
> - update mt6315 regulator node in the mt8192-evb.dts.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/3] dt-bindings: regulator: document binding for MT6315 regulator
      commit: 977fb5b58469c1367aa075e7e913c03cba7d466f
[2/3] regulator: mt6315: Add support for MT6315 regulator
      commit: 7aa382cfe714f61b0c29f02c31d389c506b4e2ae

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
