Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E969C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 09:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEqsgsE38eCXYXY7O8duufhtCqHfv4vqpHwODdP2KJw=; b=DXzLxrGQE1TT5jn5b87S5NG+6I
	QPnuOXqAnJwXwaRZAh1LfJww7QqTPGFxrYesGp1v22PLfcdRLx3eo9SpBoCZ98lpOVAsUAyDGqw2K
	udSLx7nbJbS+pCPIdmCsm4FOJ16LHucFgmjrf8MNESMvw1NVAcA/LPLJVmbHtJCOA8qmV1KOUKZpQ
	FCDtsTz3KBCVNoa05Vx7EhkQBdKCsQ2TKXAmM847mambeQOUVIqH1+JmlKl27yMtavkXTFW/kvfc2
	0JbHVDVy/fzJQoVaad6GUDg0ZVtg20b5LeB2Is3HHbvcVq8aCn4gJKxM0J7yG6IZgcRae20IR/wwI
	t2Gf96bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ex3-002mob-0v;
	Thu, 01 Jun 2023 09:50:37 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ewz-002mnR-2y;
	Thu, 01 Jun 2023 09:50:35 +0000
Received: from 8bytes.org (p200300c2773e310086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:773e:3100:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 05203224BC8;
	Thu,  1 Jun 2023 11:50:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1685613028;
	bh=xEqsgsE38eCXYXY7O8duufhtCqHfv4vqpHwODdP2KJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cCQzkY1L+2Lg8fvEY/wUofVUMctdZx5EHEXrBfGBEA4CI05S0yxu7W0ahzwFkZ7zO
	 xh0k2gFU7WMFEmTzLRxGtxgsMGYsA1h+Ucmy9mqKCXJVafdae+l7RPzAXJ8bAIpK8b
	 f4T2cgClLkgbasqy+ExBb8M2MDHHM+Q1ohbkeE/QoNRrz1zqfYTWEX0KzVfJ81Vxu1
	 X4NSExFiyVJbOOLorK8mO0/tVcfeB7jfE3TOIexjVWz1FHGvs2XWP8PZwDa3Kn0Z+J
	 272fF0BHA15yKEgQhQudew9874ZmZ4dlFFHBjbOgC7B/Rkx1MtU7ae6cfZITl3CQsd
	 PGgKli2e29NGQ==
Date: Thu, 1 Jun 2023 11:50:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] iommu/mediatek: Flush IOTLB completely only if
 domain has been attached
Message-ID: <ZHhp4mZZkQbBoGWg@8bytes.org>
References: <20230526085402.394239-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526085402.394239-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_025034_128695_56103466 
X-CRM114-Status: UNSURE (   6.30  )
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

On Fri, May 26, 2023 at 04:53:59PM +0800, Chen-Yu Tsai wrote:
> Fixes: 08500c43d4f7 ("iommu/mediatek: Adjust the structure")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Applied for 6.4, thanks.


