Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B7E5C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 08:35:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6B061246
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 08:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6B061246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i45wNfy1yNuVruTOh8S5c3FLH07RKjK6OuvCB7NMwc8=; b=blNx1V3qXbeFwlEgifTd3OcIj
	hHJ3rwVKC3lS7DcGS0pnbyy5n2fHcPH92vyefnZZwAzauYh78ESqnr5l+Uv02TUiWuqEro1ElWurp
	N+pYdv9qCR6xYjWs5tqO5DQ2xNirdE2btxbqCssMcl6IXsqBVI5l2QuVawN/Ji/RL1s9BNIktWUkD
	IG2KtvlRgm7iaWpVF3DI9r4ec3FMoS5JQqU5Hci8jGTf3yIZsgbe9iL4s5iweRBUZb0q6i2Lz9k0D
	uu/XMw5TIo3tGVOvauZ3U9bPgbmbhzIxRsN3Ar0yvltZfpv1WLlHgFIQPcCfslQZHBvnOXT/T++Ac
	dboIHwXsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU3e7-004VSS-QG; Wed, 07 Apr 2021 08:34:44 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU3dw-004VJb-G7; Wed, 07 Apr 2021 08:34:34 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9C5AE2A6; Wed,  7 Apr 2021 10:34:31 +0200 (CEST)
Date: Wed, 7 Apr 2021 10:34:30 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 Krzysztof Kozlowski <krzk@kernel.org>, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com
Subject: Re: [PATCH v2 1/2] iommu/mediatek-v1: Allow building as module
Message-ID: <YG1ulkL15n2MiE7E@8bytes.org>
References: <20210326032337.24578-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326032337.24578-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_093432_779816_5D6D8E2C 
X-CRM114-Status: GOOD (  10.50  )
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

On Fri, Mar 26, 2021 at 11:23:36AM +0800, Yong Wu wrote:
> This patch only adds support for building the IOMMU-v1 driver as module.
> Correspondingly switch the config to tristate and update the iommu_ops's
> owner to THIS_MODULE.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Applied both, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
