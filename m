Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD21CC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 10:14:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FB79207ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 10:14:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZEGFwUMG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YjluWWse"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FB79207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OyuFw4wFsApvku3TNqRC3snOXMVRhGjFcTCA1wigd0c=; b=ZEGFwUMGTCi5Jh
	u/UyVx2zc0w1h+rlyrxMTLWTpnWFgVkgzbbawnpATmR0dgIWYyRPf1BcBQ4eLbZkkAgw1Wd1sutz1
	eFdboYT5DKHn35848ykh1l/03x+TL98ozglaSOBWDWS0JnScQMTqphVLKNd7bH8zi4jeWyesDAEt7
	O6N6wGNuacu9vcEmXQZ4Y92dTZWHGA4Lzx51K8xPHwOixobU1tAKw/ldJxStveT13sO8I+nPaBGSV
	p6NdIwZBYCBPSpYLbBP+/D/eRoyAmdCZoymRxAFIVq8c4Xuq4T5IU5NKEgA0lBCKKNJfrRJ3QTEcW
	e2aKPIy+O9I4nFx5X1sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbLk3-00067P-D4; Wed, 20 May 2020 10:14:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbLjc-0005fD-3i; Wed, 20 May 2020 10:14:01 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8CC04207ED;
 Wed, 20 May 2020 10:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589969639;
 bh=bzscWCamTKP633DohUL18ThPT4Suxkr+K04/JWo2SbE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=YjluWWsene3/m6vsco3Mtv4PIkw1xscptzGe0ymdkIHpGzOZCtRisn6YyccYIBqpH
 Lry9Djww0v4KqCk+PtbadD9Rh8o6rP8AC4K+wbmJXRsKL49n9XP6QktCIxOXjdFeq4
 Ee8+x2QxlAvfJ+SVUuza/QEyZfgOTUEAElhasP4A=
MIME-Version: 1.0
In-Reply-To: <20200401201736.2980433-3-enric.balletbo@collabora.com>
References: <20200401201736.2980433-1-enric.balletbo@collabora.com>
 <20200401201736.2980433-3-enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 3/4] clk / soc: mediatek: Bind clock and gpu driver for
 mt2701
From: Stephen Boyd <sboyd@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, ck.hu@mediatek.com,
 mark.rutland@arm.com, ulrich.hecht+renesas@gmail.com
Date: Wed, 20 May 2020 03:13:58 -0700
Message-ID: <158996963892.215346.7498020261398211458@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_031400_183516_085504C1 
X-CRM114-Status: UNSURE (   7.72  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, drinkcat@chromium.org,
 Michael Turquette <mturquette@baylibre.com>, matthias.bgg@kernel.org,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 Allison Randal <allison@lohutok.net>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Thomas Gleixner <tglx@linutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Enric Balletbo i Serra (2020-04-01 13:17:35)
> Now that the mmsys driver is the top-level entry point for the
> multimedia subsystem, we could bind the clock and the gpu driver on
> those devices that is expected to work, so the drm driver is
> intantiated by the mmsys driver and display, hopefully, working again.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
