Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465E6C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:58:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B68022CB1
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 13:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BasaY0HK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6YI6Kgy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B68022CB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Subject:References:In-Reply-To:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0xb88Ojnihx7C3oiVfWAWb6ll03vWEjI8VWvGFa7Zk=; b=BasaY0HKVlBKzXBSaMIatuzTZP
	JS5vtnIN8bbWylD6gtSTR/IFpt7K7qdrtnAoiaznSXa3WlYaCcEbN+tj1yMd+YKaLYlEFJu3uFkN4
	PNOHQ30oIjFIB/d0B2aphUxmdkeWWmYj+9tMDWTN1Q9rxyfrV6E191fOnIbx/kLHS2rEeLTws1eWg
	RNzAjO4gwUAWL9mqWStZtFeCDEi6uq8LJVJFAk976AKf00v1AWOrk/agphQA1PiR3hFEaET7Cy+QR
	wDypVUeJ6a3j2HJ6tafL35vAjrLB5e4RH4O0ZHNarVIyGFAAYHpgtlCTnfqMe0RVq8q/ZKGjEuSCE
	1iTiaOJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBIPg-0006rb-U1; Thu, 27 Aug 2020 13:58:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBIPc-0006qp-LJ; Thu, 27 Aug 2020 13:57:57 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6318C22BF5;
 Thu, 27 Aug 2020 13:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598536674;
 bh=aF7rWnhp5gUP5XrpErbK4HkQ8c+qptsAiVedxz/Iudw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=a6YI6KgyR2y88a3nRqf6Nb/AuEcuXmAiFXmpL9HJVa2v7NprHFfusDs0DsYdJ85cL
 Lq4yItq4h5YvQ3n7wBJ6qlHAPwRUm9iDrJ8cdo9DBM5Vc5lQcaNWLVUCqCzz8jv5r0
 M8yT2dEvXm5iqqftsZnbXEs5ittx19IGCggp1xfw=
Date: Thu, 27 Aug 2020 14:57:18 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Piyush Goyal <piyushgoyaliit@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20200827133419.36151-1-piyushgoyaliit@gmail.com>
References: <20200827133419.36151-1-piyushgoyaliit@gmail.com>
Subject: Re: [PATCH][next] regulator: mt6360: fix spelling mistake:
 "regulaotr" -> "regulator"
Message-Id: <159853663810.29977.11973693705417715617.b4-ty@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_095756_785651_7FA81846 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 27 Aug 2020 19:04:19 +0530, Piyush Goyal wrote:
> There are some spelling mistakes in two dev_err messages. Fix these.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6360: fix spelling mistake: "regulaotr" -> "regulator"
      commit: 18ccf8b9f8645e82c65c8c9c9095f456a4eb56a3

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
