Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B55EC83F0C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2XDHJ0MeEQmXTlZkkvpVFiRAD3UEq3gNigfSYol0ps=; b=sA8/kC3Afkb4yZaYxVaL4va9OF
	wDkMOUCqZd+/5wQNfeyJWbpqWY3M/tPP6vOgYPi5ftl/UVzqxylZj5JYsVLODpgcqzwcpHW2mfoiA
	IDO+WMnU5HB1ZPo6y1XJbQk3W7Bsr3GDbLSfBxBfZByUGlBYycstulQ9YBLaZ+150FGbSxpP4UOc+
	1LVvyUBRg/Wzz+bUDIP4OrHLFHHvpmzSsUSZEwphdL262qKuuaL/Ke7j2gbKjo/tOSRuOHGRce+X2
	akB2dBFc1i/RpzV3+9g0nlF0DJ82dHSIHuxshOOY5zjwlszPSWi+SU6CfYc4jDhzP/bBU3G3F/U/J
	dmB4eycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeU9-0000000EBzA-2fts;
	Fri, 04 Jul 2025 11:21:41 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbr9-0000000DkdY-23jj;
	Fri, 04 Jul 2025 08:33:16 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id C85A94D68A;
	Fri,  4 Jul 2025 10:33:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751617990;
	bh=1Wb4ZmTEJsSifboKDjUkFOYzbSZxSp7Cj7bjm5Uh7PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNnwCTPpeQ3dIUBs3CEaEcBZC9ZSCczy9UgnBvT7RwXD1li0Fl8Ns8E8bRwMZ8hb1
	 aQVU10Jcq3V0vKhxLAUFoQ/yGL8ptcDaFIb/hDqL4JajHDN/IFDoi5rKadoCQLbTve
	 5yD2txFQ7Rj6wyMYHK60tT7rAsOkkrOg4a0bZ0yWrS2x/2rZnS8fqRG1daeQysxkNa
	 sA7BKstvqe0xAnCjwwsPwYDyOvyh35vX+heZDh0EsJcrm1lBRiJCc4HWcHEGxzz5x8
	 b+xhiH7C2xJu2YcPBLrbFndAWwFjAANtkqudWJB4wt42MxtqZjuB/cL2+mzE5olZKY
	 gC4UcxuJ7rqcg==
Date: Fri, 4 Jul 2025 10:33:09 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] iommu/mediatek-v1: Tidy up probe_finalize
Message-ID: <aGeRxYJrd48SIlJF@8bytes.org>
References: <7c78149504900bc6c98a9c48f4418934b72d89ac.1751036478.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c78149504900bc6c98a9c48f4418934b72d89ac.1751036478.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_013315_742590_BDB64F77 
X-CRM114-Status: UNSURE (   7.04  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 27, 2025 at 04:07:10PM +0100, Robin Murphy wrote:
>  drivers/iommu/mtk_iommu_v1.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Applied, thanks Robin.

