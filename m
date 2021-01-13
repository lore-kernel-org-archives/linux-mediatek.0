Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79937C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 14:14:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13190233F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 14:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13190233F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5pdsLzjnhNDxerxw6atoanMd7X3SERg/KOzJdLflhtQ=; b=jTT+hhpCsAKBvCWIXQXx/ZaBL
	CH29Va5cr6H7b3mMpKS4esG/cyBPXbe/LUDQdTChTtQfmQWxd/60LU3y6EEM2KufZMmHhZR9jGL40
	Q2B21yvHNluJCeVqfura6vE5p7Bz7VZS4ZZ6es6Vua1i8MFYSG/Q5RJye1S3+6lhPkGDY2ept57Qn
	qERQp9Ewq3p996YwJhclBjH6tbf5sknnZOi/dx+K7wPalPmgAnMmQ0yNMFfQr9QYUjBuneAymMz7a
	JntKxFvzS+7PlNINPk5CpeaQ8mJgqi/ThL/A9dWntc2GFl0tsYGjb653nL2hOo+Q+tQQXRRqRh2Nc
	jQH5EScLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzgup-0004zr-RP; Wed, 13 Jan 2021 14:14:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzgum-0004yk-A9; Wed, 13 Jan 2021 14:14:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F52423382;
 Wed, 13 Jan 2021 14:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610547263;
 bh=KinOGg4lYC7JiS+C8xi7VLcYNovCNiAnNVUNQ8Co1JI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z80Gr+ndh4rI8ubn9528SocoZhPoAfJStmr8+b2cuvc8anVEIc8GqbmgQPGcuqmrW
 1nX7EoUMNWhgw0hvsbowht0bL7qUHhBSLcnU0z7azltPvmTUc0AengD64bzQS1SiNq
 erHb3rmDHiaXC3f7CCba0zX8NygU7LcmR29SYH90YAF4NO2gmswABhvlsfziQabkh5
 YvKwLs7pN7Xcsdw+vIOI+2N5CEPbAqXRiJWJLHBU9FOvlr7d8BwluA08kyOX5msKTG
 TtktOXp4o6CMts3QF0Pm2QtGfEW4Fg43rDTWIAaNzbwHFdQu9A6ygl7JtDvZR3Mj4o
 aTXFFrw+MZmPw==
Date: Wed, 13 Jan 2021 19:44:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zou Wei <zou_wei@huawei.com>
Subject: Re: [PATCH -next] phy: mediatek: Mark mtk_mipi_tx_driver with static
 keyword
Message-ID: <20210113141417.GR2771@vkoul-mobl>
References: <1610415484-92497-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610415484-92497-1-git-send-email-zou_wei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_091424_439679_7EB16FDF 
X-CRM114-Status: UNSURE (   5.95  )
X-CRM114-Notice: Please train this message.
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 12-01-21, 09:38, Zou Wei wrote:
> Fix the following sparse warning:
> 
> drivers/phy/mediatek/phy-mtk-mipi-dsi.c:237:24: warning: symbol 'mtk_mipi_tx_driver' was not declared. Should it be static?

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
