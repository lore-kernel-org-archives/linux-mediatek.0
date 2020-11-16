Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73657C388F9
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 23:34:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 060A3221F8
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 23:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3fffDU6y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="u3PgcTbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 060A3221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Subject:References:
	In-Reply-To:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oMhkxcuVYV9yKNDpVepdJvOSwcW7MOxW85mn6zusSRA=; b=3fffDU6yLVz/ZRLBbbVpl7cBw
	tliB7Gw2l2bxXo0tnfaC7yAJnbaBHAsNoOEnm3vTTpEcD9tfTkx1rz+5YBk70npx36fdplHNz39P4
	znjALYyCelF9rWtyKyQAhQryhrCLH4IpITBXrwMMUhyR/+HKF0Cmk6e7SCTEp4PENDIayaACbTtPW
	KgH39ijdgJKSVjtVnN1cqg9eaTRymDRgXIcHAlSX8L2VgR2pBrCCBhsRUtlq5Gu7OJWqoaUZDcMEK
	Ri9UGODkcS+cby0bDlTOniXiJFPYUL10Ag+WutTLV995/XmXFDIB3fDKx7pqSHII5OIg9Paii2amT
	tQT6V3VVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keo0p-0005EF-48; Mon, 16 Nov 2020 23:34:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keo0l-0005DR-Ke; Mon, 16 Nov 2020 23:34:16 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 456092223C;
 Mon, 16 Nov 2020 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569654;
 bh=D7yocYpQlGBMGi8zfgT854t0AeFrG4e6Fg24oMC0B0c=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=u3PgcTbciaosLZxanZrxUsUof8Djtkam9pEtKY79hjSyzPci4++6v137b+BrX/+PJ
 sogy2ic+iQcIAT27OFhkDiST0FIU2OwXf6tINbhNovf7RDkeYy72/k+u+QEbaZxL0t
 T1Td0bNKXNFof4H9nALD0Qos4NUj/OjoLih/JHIU=
Date: Mon, 16 Nov 2020 23:33:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Bayi Cheng <bayi.cheng@mediatek.com>
In-Reply-To: <1605084902-13151-1-git-send-email-bayi.cheng@mediatek.com>
References: <1605084902-13151-1-git-send-email-bayi.cheng@mediatek.com>
Subject: Re: [PATCH v1] add axi clock control for MT8192 spi-nor
Message-Id: <160556963073.29969.12445750916599680297.b4-ty@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_183415_812821_4B617916 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 16:55:01 +0800, Bayi Cheng wrote:
> bayi cheng (1):
>   spi: spi-mtk-nor: add axi clock control for MT8192 spi-nor
> 
>  drivers/spi/spi-mtk-nor.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> --
> 1.9.1
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mtk-nor: add axi clock control for MT8192 spi-nor
      commit: f32cce8483f18a098ae50b524f926ef0f2bd2e12

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
