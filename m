Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75989C4727E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 22:48:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BB882074B
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 22:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjmxptM1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oc0Awc8+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BB882074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qtrTIEMF0fr9EbFlhaJo+r1gsr7v1TsGr6jtN3J29Q4=; b=jjmxptM1iaYJqyq3lOL0ytUhv
	fdGOXBcJ02SNGxIZwgMmc9ZADST/YX1UcsDa8IX2npTV8CFGmLapr5YLtOw56wjaj7L8HDaC/5hVs
	hyTIOUXZ4FgMQ5yYbrcRHOtqJ/y4Imnq6bbgQb93MKsmXU49yUyRqPVhZ6pza6IQ/rhb2YhUMPwE/
	hWIC20W63NZT+3uLxwxWM7jz3eCNpgNJM6n5ZQxqncIOGiXgQqPJ+GvHoTPE7kLiOcmEZgA9n/xhy
	ff7kAkWZtt9+wmte0cinQsu/m9/QD/+bYuxYXJ1wauk80jJSNID1ELRHpycFDcid53B0QQCSPxMr4
	dxOWyLhew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO7NN-000820-3M; Thu, 01 Oct 2020 22:48:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO7NI-00080s-NT; Thu, 01 Oct 2020 22:48:33 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66EB92074B;
 Thu,  1 Oct 2020 22:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601592511;
 bh=HJAceHjNmI0w6jMzcsSCsQTUfL3f+tHLLMztyFqbahc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Oc0Awc8+MAzul9ThDS2GbMegypRn64C7XB+TNrsS5cArO7/OERV0fqRZgnL/pVZKU
 iEJeY2g2XH/TeZwpbEdhqoSXIPDa18TTWDVyH8vRXI8vsMPFrrcfu3/g2oyDf8w1BE
 sAFvN1DcKQtCdmrzF35Tuvjaw7Wmj0sfWEx6ujZo=
Date: Thu, 01 Oct 2020 23:47:32 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
In-Reply-To: <20200924152730.733243-1-gch981213@gmail.com>
References: <20200924152730.733243-1-gch981213@gmail.com>
Subject: Re: [PATCH 0/3] spi: spi-mtk-nor: make use of full capability of
 program mode
Message-Id: <160159244787.45030.10393633428346828071.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_184832_816611_0EF94E0B 
X-CRM114-Status: GOOD (  16.23  )
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
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 24 Sep 2020 23:27:27 +0800, Chuanhong Guo wrote:
> "program" mode on this controller can trigger up to 56 bits of data
> shifting. During the operation, data in PRGDATA[0-5] will be
> shifted out from MOSI, and data from MISO will be continuously filling
> SHREG[0-9].
> Currently this mode is used to implement transfer_one_message for 6-byte
> full-duplex transfer, but it can execute a transfer for up-to 7 bytes
> as long as the last byte is read only.
> transfer_one_message is expected to perform full-duplex transfer,
> instead of transfer with specific format. mtk_nor_spi_mem_prg is
> added here to use this extra byte.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: spi-mtk-nor: make use of full capability of prg mode
      commit: e7edd2cf4c7d06c6ef3e2030f66eeefa5150f0ff
[2/3] spi: spi-mtk-nor: add helper for checking prg mode ops
      commit: fd806575921ab78c8f0ee7f4dd3d4bb7c16206c8
[3/3] spi: spi-mtk-nor: fix op checks in supports_op
      commit: 81f13f2116cd93910d958c58052ef7dc22f1e577

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
