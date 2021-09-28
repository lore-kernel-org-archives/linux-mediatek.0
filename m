Return-Path: <SRS0=GLpI=OS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221E2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 01:32:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B17D761181
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Sep 2021 01:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B17D761181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUAl5/09i+uJ8G06T4zWdCA9oPs4NwiXUtSbBOc9dk8=; b=1GMJITn6ppAKr8
	Ir+lRtLpZ1ox5Im/sd0nCbih3h9ZuV3kNf9tTSH4iJQpn5HzVyRhYm465LL1mXO8NAPGuBfI9qKo5
	alIz7bsuB6P/Xgf81GI2Xtx9m1X/T+Vohhv9oqQl0j1F5yWybhYuhS3Ep7Z0Q7ewQhQQTkjJ32Ueo
	ScilcUmN9YTACZMk3Spt+qQrNUGbDMviF6Wz0YVYR8tX8PukiM7zyK+7XbQCmXp+HkOe/nlGyUkxK
	D1YktOAGmE8EnvkY+CVBkLtkE1+r+aiTanau23be42pC/ylqHgC4Ge6pkmf4jwnpRCHsTA694NRiF
	wfSZcrfDYbUj4fu7r8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mV1yS-0054si-6T; Tue, 28 Sep 2021 01:32:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mV1yF-0054rz-E6; Tue, 28 Sep 2021 01:31:49 +0000
X-UUID: 3cdd7b028fdd41cc915ec8644885e9e4-20210927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BLlymuonkhKMUQNrGodsUw+v+u1VEea3dRqmgRuo/6A=; 
 b=KqCpE05gqIMdITiXPB1H5ldbGkevRQKnEVJZOMntiY0KjZUnxFaN+sbedKBxOFUyQvVvOf4Pra8kYwXpbicZE6VNtnSLdvZhq334tk+VwoxpzV6dxiWKpuqf9KT9yUDqNJLWywstt+Ns7OxW2gYBLunYWjfBoid+AoJzYySE9h4=;
X-UUID: 3cdd7b028fdd41cc915ec8644885e9e4-20210927
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 658783127; Mon, 27 Sep 2021 18:31:42 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 18:21:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 09:21:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Sep 2021 09:21:38 +0800
Message-ID: <d7db3e4c3c4a40843d60fe92666d7f9e90df8801.camel@mediatek.com>
Subject: Re: [PATCH] iommu/mediatek: fix out-of-range warning with clang
From: Yong Wu <yong.wu@mediatek.com>
To: Arnd Bergmann <arnd@kernel.org>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>, Tomasz Figa
 <tfiga@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 <iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
Date: Tue, 28 Sep 2021 09:21:41 +0800
In-Reply-To: <20210927121857.941160-1-arnd@kernel.org>
References: <20210927121857.941160-1-arnd@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_183147_506623_1163E274 
X-CRM114-Status: GOOD (  12.33  )
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

On Mon, 2021-09-27 at 14:18 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-14 notices that a comparison is never true when
> CONFIG_PHYS_ADDR_T_64BIT is disabled:
> 
> drivers/iommu/mtk_iommu.c:553:34: error: result of comparison of
> constant 5368709120 with expression of type 'phys_addr_t' (aka
> 'unsigned int') is always false [-Werror,-Wtautological-constant-out-
> of-range-compare]
>         if (dom->data->enable_4GB && pa >=
> MTK_IOMMU_4GB_MODE_REMAP_BASE)
>                                      ~~
> ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add an explicit check for the type of the variable to skip the check
> and the warning in that case.
> 
> Fixes: b4dad40e4f35 ("iommu/mediatek: Adjust the PA for the 4GB
> Mode")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
