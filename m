Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4808CC43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:59:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C850C221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:59:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0FryzJuW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C850C221EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LofxogCeEZn8XYuKFgDyVOt8zaqokJpQkhnJ/rgTC+g=; b=0FryzJuWYFuFRZtjEsF6838/r
	bWpihx61LJMHKkpGl13L9yrJWMygEM4T4LZxnBI4e8onsdmm5wVt+4rppztiG7OU4LI0le2O+Kev8
	NpyXyxEtC+ubRzjh4syIOHvgX2l1xTuKX091S78pf8AGVzSTPkRXaJ+re/nzZTlm3yXlNZB/HU9mD
	xXa5nH2omJ5ZE4fr9WuNMh3Ol5Uwpe/k/SrzvUS42y9QurxBHq6N9o0+zOwpv8v79sgBkaXqUUy5W
	vUAf/4ee09acfYuXexjbApsoFE4AIjKEZM9B6lfxeAb2xKIM5lE0JJVnIdHAf4Gi32ka/V0id3CxY
	QRh9S0vYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGd1P-0001Hn-0c; Fri, 11 Sep 2020 06:58:59 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGd1K-0001Fj-Fc; Fri, 11 Sep 2020 06:58:55 +0000
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de
 [79.249.244.48])
 by mail.holtmann.org (Postfix) with ESMTPSA id EF163CED1A;
 Fri, 11 Sep 2020 09:05:32 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH -next] Bluetooth: btmtksdio: use NULL instead of zero
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200905121549.32936-1-yuehaibing@huawei.com>
Date: Fri, 11 Sep 2020 08:58:37 +0200
Message-Id: <6B0D45D0-7390-4DCF-B85B-8DD0C6EAC8A2@holtmann.org>
References: <20200905121549.32936-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_025854_627470_279636AD 
X-CRM114-Status: GOOD (  10.55  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yue,

> Fix sparse warnings:
> 
> drivers/bluetooth/btmtksdio.c:499:57: warning: Using plain integer as NULL pointer
> drivers/bluetooth/btmtksdio.c:533:57: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> drivers/bluetooth/btmtksdio.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
