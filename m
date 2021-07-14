Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D08C07E9C
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 15:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42D1613C8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 15:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D42D1613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D24tSwbFxNxCUBk1DUBb5pjDUvcqcscnDCJ8Aer6Yis=; b=3fcb/GmH7OoTm4
	1dnYQ90PmDBAwjlNDKLRurz4i/NBLXeFVL1D1vvMTiiI2YLNVR5j4BOWH71lrqFBOqQm1+mgsie0f
	/niFql//F7DZLfFfdRwNm5xWX5mY+TJ9uc7ccH3dF8EemuNvGp+O+/L8fPUePzQ12vMgpL4aVcOep
	NBhqrnoJKI8HvtPqA5428vPel0bgNgIHdaK7/H399uZaKWenggfKshEKCuH012duhAnKYcnKSnOVT
	8L6JTEu1lYA0m+Fj3P8HhOIcrOfxLHKTuRGRwLouYCpZZF+KyMNN2DeTuaD3WMXUTyikib970mATq
	L9E2p6ZHTcm4vIAd3jgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3hFL-00E140-7a; Wed, 14 Jul 2021 15:56:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3hEy-00E0zn-QN; Wed, 14 Jul 2021 15:56:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CA86613D1;
 Wed, 14 Jul 2021 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626278164;
 bh=T3tWRNqEl5egHYoESD+A3uK6ll8OfKGi/QN+AIQONqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NBQkOP/8GgDQylBlHJAoHmsvdYeXOkIQU4cZeXubhCrS4EJOGIZHdxaGmwubo2RiF
 VNhl+UzvYhR3el1ojxDcjPqxsDNOFT+wwR+slq09lhfx8PmPa8qoiGDI/ppEEA0W3r
 M2AId0td0ov/ib7QuQy/bUR1UyCg80IelM4YDYTysDSpBT6I+JydRqaC2VzLRXAtPP
 Pg/CuJlSGddho+JnDXtcxIB3vDsoiqPRZK9rPDsqNAl+8pS005SldE3gny3xyMs91N
 PbNBHVTI3bZjHMPiXESnSKhE7sktAMNVFOj8FR2dUNRZbonYaRho2Zvudgr0xXBJoT
 AtuzOZci3KzbA==
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, wsd_upstream@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 leilk.liu@mediatek.com, Mason Zhang <Mason.Zhang@mediatek.com>,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] spi: mediatek: add tick_delay support
Date: Wed, 14 Jul 2021 16:55:15 +0100
Message-Id: <162627784665.55213.15880844679522922656.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713114048.29509-1-mason.zhang@mediatek.com>
References: <20210713114048.29509-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_085604_913095_A40A0FCB 
X-CRM114-Status: GOOD (  11.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 13 Jul 2021 19:40:49 +0800, Mason Zhang wrote:
> This patch support tick_delay setting, some users need use
> high-speed spi speed, which can use tick_delay to tuning spi clk timing.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: mediatek: add tick_delay support
      commit: f84d866ab43fcc27b417c86357d6534f157a3d89

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
