Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EB4C64E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 10:34:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C8E2207BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 10:34:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MQkjbJ39";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL41pa0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C8E2207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ezUAG4NCVmOd+dd3hNWbQyMnCh4b+PRWBVA3u5li1Bk=; b=MQkjbJ39BMOUOgvSIKRIKhM0c
	yaPfLSS5xCGYrC7sazY+q67eGhfZQ2iRl11UQMXTWGYH+pG2TYt7gIu2/TJrlPR+7yyniSzitlcOk
	76svg1SJt0widjkD9m9E15x3LpIJ/arFFBqDlBt10pI5DQ9ownrKzaCzgfj7CeX5PX6p654oRywTk
	RaQaF4TLjNGWvfCFKpfiFDdkmIM8h9Zh5Gj7/kvnbxEgcE6jS9ASD0tsQ6RX+C6VGWC2PcbSl0KRP
	CKWdqtGGNyuSJfX8wuJf5pwueoyqCBiPSRybkkxlAT+RnBJNVVRbLrg6G6JxUN+p38wnJh6yaqg8C
	Ad9t1CfQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjgVq-0006Oz-3d; Mon, 30 Nov 2020 10:34:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjgVn-0006OY-C0
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 10:34:28 +0000
Received: from localhost (unknown [122.171.214.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C1B320708;
 Mon, 30 Nov 2020 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606732466;
 bh=cd7xzSNXU4GZ6Gqay09NnkHkMf3Per69FTphsUamKNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gL41pa0T8tfuA6jEkcmcf5863usEzbgjoNyoy4QCfSPq8IlTI1eLuYGWBunii+YN7
 CX+JJOiUPFp8h9TrFoo5HvK4bebXJz86csJ9pzAMgRAOXRcFz0u0T5M9NH3j2jUmhJ
 DxnGMXjGqekR98uLejLgbmBsdaNspMLdATJYPgIs=
Date: Mon, 30 Nov 2020 16:04:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [RESEND PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver
 into drivers/phy/mediatek folder
Message-ID: <20201130103411.GN8403@vkoul-mobl>
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
 <20201116231407.94-3-chunkuang.hu@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116231407.94-3-chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_053427_549248_17CF0519 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17-11-20, 07:14, Chun-Kuang Hu wrote:
> mtk_mipi_dsi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_mipi_dsi_phy driver into phy driver folder.

Acked-By: Vinod Koul <vkoul@kernel.org>

I am thinking this would go thru drm-tree, if not let me know I would
apply this

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
