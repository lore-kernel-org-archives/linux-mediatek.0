Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BADC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 17:16:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 055A161A0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 17:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 055A161A0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iI0/YCpcNOaZwU/zltsa9CIanEqECRjzeKhcN1wUsAg=; b=kWAhvb4Z0qGJcvhO4J5BBjm5j
	ug1E90wuv/FNW34eNUVDuyuSegqgbT+4SNlQ15a1dAl9lcIFrKS5Rn1wc4SJ6ozRQtrpg3QiEU4XZ
	jAQvWeOiRWIEOtkYpCOMtbOs574ZtqxorQ+QPlD4xcrp3xpzYSYHW8BspcvU2Pj+1Uaih8drELfp5
	ah1V4IejaJZFV9bDI095ofRNVJLlVG4fQZidaYNZl/gt/RuSvsnsXoDg8E9Ijk9B9C7uC7vc4qsAx
	i5PA0TElJ0p+myKKcwnFKNZdcbidErSdnPvSTRoRRJJ3pQt16K2iR/mGbuu9iiC0dyUWwXwhX3pey
	ivn0MvSPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPTb7-001tNy-Un; Thu, 25 Mar 2021 17:16:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPTar-001tM1-JY; Thu, 25 Mar 2021 17:16:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0483561A16;
 Thu, 25 Mar 2021 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616692580;
 bh=phmny67lf++X1rkQVwR6baI2+MCDEs3wLD7iAm3xsOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E8VU9MDHPFOdaovt8n/9YdPSCpUyUpJaxNyRawPd3nCxPu/Vk7czI8/ZJWaoeeuTf
 2R7t9YGqqT/43VsL64M8tIUa4sP8SqicY5T75O78nf6c9waYFoto0mjNPEw3OJZS40
 eFElJ8FxMP5Cc2QPIYS1oEnsKLetLwI5kqj58e/Dcpq010+0kokWUrmdQxxi27C1l4
 0yboQp8QEF6PNrPe4ufEMHy19PVfjXOFF2pLq0Q6egatY2jaDG+COxaggbchnJh0mx
 zCuXAfWT4A5r5anmO/0tHnwfW7ulOWdETLsGuZmLoWMKzLg8Yn/UfHrjcj2SMRApos
 XxOBd/1Q+3mJQ==
Date: Thu, 25 Mar 2021 17:16:14 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 Krzysztof Kozlowski <krzk@kernel.org>, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com
Subject: Re: [PATCH 1/2] iommu/mediatek-v1: Alloc building as module
Message-ID: <20210325171614.GA15433@willie-the-truck>
References: <20210323055801.16885-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210323055801.16885-1-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_171625_946367_71029D16 
X-CRM114-Status: GOOD (  14.02  )
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

On Tue, Mar 23, 2021 at 01:58:00PM +0800, Yong Wu wrote:
> This patch only adds support for building the IOMMU-v1 driver as module.
> Correspondingly switch the config to tristate.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> rebase on v5.12-rc2.
> ---
>  drivers/iommu/Kconfig        | 2 +-
>  drivers/iommu/mtk_iommu_v1.c | 9 ++++-----
>  2 files changed, 5 insertions(+), 6 deletions(-)

Both of these patches look fine to me, but you probably need to check
the setting of MODULE_OWNER after:

https://lore.kernel.org/r/f4de29d8330981301c1935e667b507254a2691ae.1616157612.git.robin.murphy@arm.com

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
