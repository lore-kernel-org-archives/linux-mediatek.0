Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB62C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKN5jxG+e3trMMCMnDB+oU3EUmRjJHV1wPYNwQutpYQ=; b=ZOTdey0Y10M5lm
	DP1x3sCfyQI2CgNC3vazmZvqlO6m4aCn7EZxNwnktgh8iDj6NTvrGKNQX2geDsnDgBvpEHhnwxheQ
	7oUW6CvooA2A55pu650E9Kv6AOQt0ucxnL0eFx36+Zbz7gbIw7z5ZKYZV9TtjqGxNcPhuzYeQnF4T
	ou4mvNdIzyCY9NAA7pOIIc9LGtaaJ94jnwKzztz4ZZrD1Susy+QHLsbKV4xG3cI+tNqE5nE/cKLfj
	5iJLcNDm4hwMXEDm/mOVvOYhOXCHM8Jq0gLbWgPHHPsKblsnPvmwcPb/RDhgaDnSu7iaCIeIcS0F4
	5ayxMWchxB1WcssmZ0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nluo8-006b3O-Nq; Tue, 03 May 2022 15:51:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nluo6-006b2J-AL
 for linux-mediatek@lists.infradead.org; Tue, 03 May 2022 15:51:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9441B81F52;
 Tue,  3 May 2022 15:51:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A422C385A9;
 Tue,  3 May 2022 15:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651593077;
 bh=iTiarTkByZ5RFQ9pQrV9iuj93cpQAxWxhkeao7MmLRY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=oQLRr72ENUz0DJtAhTaDsSR5JQg0UUhqNY1z+mBh/J9QSVRMHq3PRd4+R0Uf0ZRYR
 wvYXr7t4DqXElh0fWn+cV3KGPdz1EhPUvX42E0g5ScW0L03HtsHVTzQrBdTUM8Dl+I
 slMVp9SF2zkRjLaubne8yTvOS7I9BEj1BHJiJdODXmgdP7TJNiHF7shbrJ+3tvSFTV
 PO7dl2Qxu/tOu5b6RHspmYJ/i1ueBI4JQCN3H9qUqmoHHzW8hqQ5Yhz8X0/ReKrXDb
 TSh5EkMwWPY5R+tMx/k2d1MrAbhfred1l7jiWM+KfwRKQ1V5OfB0W+1+1VP8Jg6obu
 uOUJMjfGzjwAw==
From: Mark Brown <broonie@kernel.org>
To: dan.carpenter@oracle.com, gch981213@gmail.com
Cc: linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org,
 gch981213@gmail.com
In-Reply-To: <YmwjUcTKyQNrrn2g@kili>
References: <YmwjUcTKyQNrrn2g@kili>
Subject: Re: [PATCH] spi: mtk-snfi: preserve dma_mapping_error() error codes
Message-Id: <165159307628.184303.16325175750153523597.b4-ty@kernel.org>
Date: Tue, 03 May 2022 16:51:16 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_085122_532923_0B2BE1B9 
X-CRM114-Status: GOOD (  10.85  )
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

On Fri, 29 Apr 2022 20:41:37 +0300, Dan Carpenter wrote:
> Return -ENOMEM of there is a dma mapping error.  Do not return success.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mtk-snfi: preserve dma_mapping_error() error codes
      commit: 73c1a5153ec8c53100b13bccafbb29cd502ee086

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
