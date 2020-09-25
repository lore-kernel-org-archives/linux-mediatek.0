Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AF6C4727E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 20:43:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55AC52086A
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 20:43:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CV5caP3G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgoN8RG8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55AC52086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7t86loDIGM7/iOTDINfyvngF02KnJK9PdJIIEZ3GwEo=; b=CV5caP3Gss92JKZ5uLqWA0/dUt
	/+qj1kND9kxKHS3/c5xPjcl+kddnMnB1U4c3QJ3qEcRyLtmdt67ZwDkVI94VYzfvPVr+5QN0rXOX4
	X2mMWqufyQdOp7TMAeIskYEnska3nDvGMz2OOx9ulwJLsPU3oRQf93+iQIgzSFCF0e2IQduyXuSzg
	d1lvDojkPFW85otohKoRr8SjSKWPItBhsYt9u/k7yHR9R8fdwNtEIvuB9NV/mFSYZ0/12M9wJIrvf
	6t4y80o80akmSz8LH39R/1JM+1XRRoBiMJ4LtbnLds6JP1lbG6Fmb+oA7YcbtZf5x5MgWHg+OwGls
	VshPeWew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLuYm-0007Kx-MY; Fri, 25 Sep 2020 20:43:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLuYf-0007IC-FP; Fri, 25 Sep 2020 20:43:10 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 424C422211;
 Fri, 25 Sep 2020 20:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066588;
 bh=oPM6bYG0ziHYbXZRmN2AA5X5TBawJwfVerhBHqMHWC8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=GgoN8RG8c5RxNABR8KzFMBCLLjLOKIBuYN85cL4PmfrHH1O5F8Km417yw0Mu6CU1A
 s3A4QSgBi6Y40+2k/fdF7mJN+5eam0q5d5pOBSfQDBnPIQ1rDzEe2yfvBJlkvlcRbs
 Ithol4KnaXVp9JJukk8aOKpYK/7CtakiNqW7UFbk=
Date: Fri, 25 Sep 2020 21:42:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>, linux-spi@vger.kernel.org
In-Reply-To: <20200922114905.2942859-1-gch981213@gmail.com>
References: <20200922114905.2942859-1-gch981213@gmail.com>
Subject: Re: [PATCH v2] spi: spi-mtk-nor: fix timeout calculation overflow
Message-Id: <160106652820.3325.17678735137859743508.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_164309_615528_6064D6B1 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: linux-kernel@vger.kernel.org, bayi.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 22 Sep 2020 19:49:02 +0800, Chuanhong Guo wrote:
> CLK_TO_US macro is used to calculate potential transfer time for various
> timeout handling. However it overflows on transfer bigger than 512 bytes
> because it first did (len * 8 * 1000000).
> This controller typically operates at 45MHz. This patch did 2 things:
> 1. calculate clock / 1000000 first
> 2. add a 4M transfer size cap so that the final timeout in DMA reading
>    doesn't overflow

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mtk-nor: fix timeout calculation overflow
      commit: 4cafaddedb5fbef9531202ee547784409fd0de33

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
