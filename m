Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED26AC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 18:41:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B54964E50
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 18:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B54964E50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hc2/cwQj5Ip3sTTjx9LJR1NOUfmMC45yHspdr/CRuks=; b=I/arv73ccdWnnZQwwvrBVaMTr
	YQWgQxbXQf2P492P8jt2nk5dRe2pBzWqIiFcf6NmSPEG9yB1CgDb8xW/WMkTtG5sjVtT+Zc01zTWW
	5mIhNsrxZtqEjqrqRBZpEYe2lvcm2QYCBeJTR3tnzTHmvzN6v8p3KQQzaNJskk1jVKpK5wiC8nQX7
	kIiGAPa9vsJavGyEvAfYqScnbN8ebdR/2dv19LJM2tIEXsfpkV1dI3tMyoMvk5sVeRvWpEGarFRiq
	ahJRTByQBGEXiShHhROthTNOYdvKqSzwqhhTiPO3VuR9Y9tkMxLGeNjVJ9GREcZVPHpUhsu2W9SgS
	gfWgNjXEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9BTA-0007b2-Mh; Mon, 08 Feb 2021 18:41:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9BT5-0007Ym-8V; Mon, 08 Feb 2021 18:41:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DF4664E60;
 Mon,  8 Feb 2021 18:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612809662;
 bh=zMU5Txxi6EftYM78NHHqsb4/587gsoUlvcEIxX2ebVQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ff/3TkeJI6WjlF4lDY0FDRb0CEGuN/LV9lw9qbdpg+VodoutBZxLBaaQmKpMMDrOf
 Rql0W4ieu+3RNTjcfEiC+Y4cuQceEh+fnlVJS0i6dC2jAfL+Q/SykjE3jYKYe5pU/C
 o56UkSDJYo66lLuL3/AaSX1oIF8JE34R8udt0MwH9RRi4KIjJd0nAkLSlSp8Q3juJH
 kTrqCk6GGIce9YnNJqMx7JVrBIbUXcQzDEZtz5WANisGeJ7OGV6ydaOwIKUJH+GRuo
 2f4ennxV90SzmAaMhtup+KKzHNL7pq1IcijqNRvhTLq49xt1DYZ37MAyFwt6bvkdbI
 NK+z8OEBYHjUw==
From: Mark Brown <broonie@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
In-Reply-To: <20210207030953.9297-1-leilk.liu@mediatek.com>
References: <20210207030953.9297-1-leilk.liu@mediatek.com>
Subject: Re: [PATCH 0/3] spi: add set_cs_timing support for HW/SW CS mode
Message-Id: <161280960941.11009.17680678012347479205.b4-ty@kernel.org>
Date: Mon, 08 Feb 2021 18:40:09 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_134103_399191_45480931 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 7 Feb 2021 11:09:50 +0800, Leilk Liu wrote:
> Some controllers only have one HW CS, if support multiple devices, other devices need
> to use SW CS.
> This patch adds the support of both HW and SW CS via cs_gpio.
> 
> leilk.liu (3):
>   spi: add power control when set_cs_timing
>   spi: support CS timing for HW & SW mode
>   spi: mediatek: add set_cs_timing support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: add power control when set_cs_timing
      commit: 4cea6b8cc34ee61358d681bd2009b8bac1736ffe
[2/3] spi: support CS timing for HW & SW mode
      commit: 0486d9f91d373e7f47276f30898ee0cb12656a70
[3/3] spi: mediatek: add set_cs_timing support
      commit: 9f6e7e8d432e39d4f3d5d3c80129aec7f383b2b4

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
