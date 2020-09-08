Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8E4C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 17:22:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF9F20768
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 17:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yl7EnY6l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFlnBsh7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDF9F20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8pCnMux9yY7ndA5jDoYCVBmJkz0q+UrYihaeRBYGd0=; b=yl7EnY6ljHXJEssYxR/SgRExgm
	9RKaRA+StWCO9XaRhUT3Kwfr1kk5r3NclbOnOuDQRhWZR/b84izUPbbS4zOD6JfdYGt9sFEbYU6ys
	bZQ48d4XedTVpb4SHgQXyIyrzCxhbhEM1VanREtKjVD2XPfFZdWgjAAVNbAPe5PmryJTtL5gD1JlB
	Xa6FV3FVDHxmI/2XVyiAbz8H2OB3pPE1iv7Xz9zYGOlO8rLgsJWO6XgOGDnqV2uUM6AVhWR2UcoYU
	daDNvCymDMwUCU4wFCh+L5/o0W08W5MZ+wJAjd3q2WyW+XIOnnWZ0d733KrDSJE0hGnGergwquYts
	DY7yby0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFhJd-00048D-7C; Tue, 08 Sep 2020 17:21:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFhJY-00046S-N0; Tue, 08 Sep 2020 17:21:53 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EB622087D;
 Tue,  8 Sep 2020 17:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599585712;
 bh=luI7DSIeuNgw2n7bHdR4GLN46L7NHNK8S2snlSCQbck=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dFlnBsh7xLTYLjXPmcTtF99utgCGYMRv8WlLIvMvkiLdI/wr5bH2/bE+bHAjpmBxr
 +4jrbwjwD6njveoL9Vb4CJANBgwqdQMcxn6oyhC+Z4+7goB4r8UcUT9aoXjAImUEvN
 CPIieMIpKZQy3aF+488qeOCkXgX50/wQwUyo5vnA=
Date: Tue, 08 Sep 2020 18:21:07 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-spi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20200826091852.519138-1-ikjn@chromium.org>
References: <20200826091852.519138-1-ikjn@chromium.org>
Subject: Re: [PATCH] spi: spi-mtk-nor: support standard spi properties
Message-Id: <159958565716.16771.18117309566354827719.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_132152_809265_65E8F73E 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: Chuanhong Guo <gch981213@gmail.com>, Bayi Cheng <bayi.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 26 Aug 2020 17:18:52 +0800, Ikjoon Jang wrote:
> Use default supports_op() to support spi-[rt]x-bus-width properties.
> And check dummy op's byte length instead of its bus width for output.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mtk-nor: support standard spi properties
      commit: a59b2c7c56bf795cc13139d2634e86a3da7a0314

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
