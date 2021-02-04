Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E1BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 08:08:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7744464F5C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 08:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7744464F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zva6DGpMXfTpBS6QTdPgcgHk3E04LHDiETOioZMEeGA=; b=IqUIJ8C79cV65VHqgcJecWCKZ
	Ocy89lBoiQsVaDbIUBP2kFnLDUS2Hyp2nPtBK58XXnSaoOnRKDaIqe1BNHR6rWMjU1EtMmL3WVlA5
	XZTU1pHxO+opOcX6q6WMZjQykEpxy5dkZ5OScq9/Z9RHMOznRUYRx5nspQ9FKWCIWN0QM3Jl1JID8
	QZYZpV/lPdZucFkWlOKZ6VuAIy06eGoldJEtCvoECpxP/Qu11RG++rFm/jT/mddJn/GixnoMDJX8a
	Wi6n0/WrNeituWFmRjupOqXiB2WHnL1Ja5ZJpjrfNhZM/hTu5llaCQBJ11svXXJdMMaWuKfz1F+UN
	vKVSUHBwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Zgc-0001oR-GY; Thu, 04 Feb 2021 08:08:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7ZgY-0001nB-As; Thu, 04 Feb 2021 08:08:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E88C64E31;
 Thu,  4 Feb 2021 08:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612426096;
 bh=DSGc+cN3pkKMpvffVQy2duWfgDyA4dJ72Yyh5aV+ZmY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iA3HRQpiZlRZI3UoewYuBcvSKIXBbIkc2GCrtw5KQ6or7oxrpPAuCyX3rrhWCghZx
 7swPR9FPU+zM2FTTnTTqK41pPCLqeMooWDq7C20XVEEzw4wVF2LxIHqwfvAum0Yfll
 Ou+xYWTlNVdF0+c11GIgcvWDknzkEuqYoUsyI9HjYTsTbMiAFQOvyOYVx/dZ0Un2DE
 cEMBYCKLJLDl4+DXb3wfChvi7TW7WWbk3rqs1/0SelDVh4f0J1XxZZh5g47u8Iaop+
 yvj0999T2+Ye5SNa+HZIaz5uENYt//0mL76rn00tLHajTYW4z8sMYzrrJYyT3Zhtzr
 iW5mRrVC3pi/w==
Date: Thu, 4 Feb 2021 13:38:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] phy: mediatek: Add missing MODULE_DEVICE_TABLE()
Message-ID: <20210204080812.GO3079@vkoul-mobl.Dlink>
References: <20210203110631.686003-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203110631.686003-1-enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_030818_470656_8A2D2E2B 
X-CRM114-Status: UNSURE (   7.20  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 03-02-21, 12:06, Enric Balletbo i Serra wrote:
> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> This patch adds the missing MODULE_DEVICE_TABLE definitions on different
> Mediatek phy drivers which generates correct modalias for automatic loading
> when these drivers are compiled as an external module.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
