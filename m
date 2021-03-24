Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404D8C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 23:40:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B02DD619F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 23:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B02DD619F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VxYrs/oXbedOvkNxb1MuVsK6jG3rQNoJr5PR4RZ6Nig=; b=jlqQr4IjkW1HVRvWRpxoT0JuC
	CaBIldfjuGDk91jqK661N3DXKFIOCPspBrY3+GQziPZfjbg7jOxqbDkBkbgw31YWLb1QAcADgOXMK
	oJjwwSnK7AH0woXoEsq+I/Bj+1jwjQ0ciNUDOx02g17awGmVYckt5oI0Agirya0KWCUBkTjF0nyfE
	H+wYI995KiTugZunr44A8uy3vJJTA3E46t7Bo4009psUmDoijv1rnD8eAreXnt+EWQQHwrRhRCcrg
	co8cKokZbIYfPyfGQlZsUwXlfp+XSF/6/oneznsbSq2RpLhLwA+orsJRr94dwgfsLoa2YJ1ohTWVH
	jpj9neVAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPD6o-000M5W-MI; Wed, 24 Mar 2021 23:40:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPD6R-000M2e-Uu; Wed, 24 Mar 2021 23:39:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9144761A1E;
 Wed, 24 Mar 2021 23:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616629193;
 bh=9lwrwwc9qJrB0wTRE+czgDoYiVYuRYxt5dOIbqbFoSQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kRn9ALkDuR8tUvyUPZN/iR3wI4Ajh49CzxoCYqplQHhqRxNue8foyow+8f2XSgyKM
 naL4FrjqqOVybVbnXYFg3L6UOhMo/mRVVbCCt6RphuJOayoj9aYiIzGOPOnVHi+S1h
 pe0w3N+kLcqb8JJafCdLTVnGzfu3ZTGfu+W0TN9SWqKPdvrwlbYf38M4Ns90Zem5Oz
 j8sbNeMdg82fLgV00i8joZDi2T/0m/stAKjKWSs07fWC0vdCVXu7zzlt8wBFcsHuG6
 EIvxGZpE07J+hqG94e3XU2+qn0F1i2RmJK7nqI2TxRBcowBvKoMs1Sa8p+CJvcG96L
 f5fa15HHIrwDQ==
From: Mark Brown <broonie@kernel.org>
To: Jian Dong <dj0227@163.com>,
	matthias.bgg@gmail.com
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 Jian Dong <dongjian@yulong.com>, linux-arm-kernel@lists.infradead.org,
 huyue2@yulong.com, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: mt6360: remove redundant error print
Date: Wed, 24 Mar 2021 23:39:35 +0000
Message-Id: <161662879863.51682.14978085151752352194.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616502161-125407-1-git-send-email-dj0227@163.com>
References: <1616502161-125407-1-git-send-email-dj0227@163.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_233956_185054_6858EA42 
X-CRM114-Status: GOOD (  10.59  )
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

On Tue, 23 Mar 2021 20:22:41 +0800, Jian Dong wrote:
> fixes coccicheck warning:
> 
> drivers/regulator/mt6360-regulator.c:384:3-10: line 384 is
> redundant because platform_get_irq() already prints an error
> 
> in fact, it is not platform_get_irq but platform_get_irq_byname print error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: mt6360: remove redundant error print
      commit: f56f2b953bccabb9bd283a734c7e35a1bb1c1ff8

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
