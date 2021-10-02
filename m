Return-Path: <SRS0=6vjs=OW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A5BC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 00:17:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0383261B1D
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 00:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0383261B1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kE0GtJ1VmfVzEeig5SzwymcNq+UZiBu06awsmT6ZKZ4=; b=iZRHCdu/ibXddS
	qH98tVwrowI781+/pwvbGodlF6yBlCcg4V+q9nMlMCh9CTHSs3Knme51UNBShDvMgY9Y2DZQEOtBv
	xL7K8qpNtjOe7w00JcRF7R0AfPmFqHmtbwfTAhJ7ziF6rApil75qs/FeP4kGP9HlAhw4RyYJRaNn5
	ryxA2YaPRrLabo578WtAqewwzwz2+mIfVg2ARrm45qdpY2EYznbVt8j5kL9Dlsvu6NytDsbHYC5EN
	QNhJPSMOjloaiNlGx7n8jQMZDObwDXTmOqTV1GZOnTQRx8q336cR6UtGpem2jSw0a6QmLANjxza9K
	+7ROOfEp/FxoN41G5tYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWShw-001WSC-7Q; Sat, 02 Oct 2021 00:16:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWShh-001WMZ-RF; Sat, 02 Oct 2021 00:16:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA724610EA;
 Sat,  2 Oct 2021 00:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133797;
 bh=XoESlOgXD7gA/gwzvFCnOXxEc6BCvHDmyfV8dM0b4gU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X+BkYXCngJnrbXJitP5/gxGS8OAWgM9qQJh/xim8ynlqJhnXLacYzRu0d5j22SlNG
 KxHJ2z3nv1bdodRgH9Z/e8Z5J5G3ymU2QcUe7hAjqcFwSW5sca67sKnPg6GBPZX+kk
 6p6ccH9jMe2uJhCnbzdSjAo6RJCjY7jZFLFCP81zhGmL0TV0SrtopTCqsjgZeQHu/K
 Owq6V3MRwqfPxu7Pm/7R4HwYdXcQdCsj0w/sfZU1U3o2AHkUyuwGcVRNqUwjqXR/2C
 6DpRRXCwzw1FNy9JL5kFy7PUsHUOiXIaoxlBkTjJxqwnt0GI1sJEA7sDTvRua08BvQ
 VnG9TGNmNkT9g==
From: Mark Brown <broonie@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, dafna3@gmail.com,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 enric.balletbo@collabora.com, Mason Zhang <Mason.Zhang@mediatek.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] spi: mediatek: skip delays if they are 0
Date: Sat,  2 Oct 2021 01:16:22 +0100
Message-Id: <163313375302.13893.4068868673523917902.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001152153.4604-1-dafna.hirschfeld@collabora.com>
References: <20211001152153.4604-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_171637_919749_EC6946D3 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, 1 Oct 2021 17:21:53 +0200, Dafna Hirschfeld wrote:
> In the function 'mtk_spi_set_hw_cs_timing'
> the 'setup', 'hold' and 'inactive' delays are configured.
> In case those values are 0 it causes errors on mt8173:
> 
> cros-ec-i2c-tunnel 1100a000.spi:ec@0:i2c-tunnel0:
> 	Error transferring EC i2c message -71
> cros-ec-spi spi0.0: EC failed to respond in time.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: skip delays if they are 0
      commit: 3672bb820f3292b6f035469f863c020317a3dd28

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
