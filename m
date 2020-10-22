Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E43EC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 01:13:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D69B622206
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 01:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="esFa+DeA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pT4iXXRK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D69B622206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+8V0l6hxX6pnDYIQHxgAeNVSZK9KWOjxvi1tFT9QcKQ=; b=esFa+DeAXy2paJbwmIxKG9frx
	Z0oHDcZ6J3Amx/CM6FvrJqcuw9+7GcBOTEyLzj1th6vZTPWpJzpTTx8bGarSVleFuS9nfQfzNV//C
	ujhbO2jq9YPR2H9QSeONxxMgBXapislcf7SaiUErpaDLgFjzRxi+Hafn5RHuyM1ssUM5r3Pzq4D/Y
	amBP5XnjlwPGwGyp6FK1Ew0jteV/PKbcGhfNba8Z3iZI+P9TMK/sgvmkMRV6+q1Rzlqs+mRst9UCc
	eCUIw9cqGim558wqgOX40RAqC5t1m7KAi4ruGBPvspUTfj4Xppv2UzL51vvbUYNd/T0Nxj9BGLi6s
	U+UUyE7jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVPAR-0005kU-Cr; Thu, 22 Oct 2020 01:13:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVPAN-0005jh-Tv; Thu, 22 Oct 2020 01:13:21 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com
 (c-67-180-217-166.hsd1.ca.comcast.net [67.180.217.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E10222206;
 Thu, 22 Oct 2020 01:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603329198;
 bh=hRSK5jgPP6SQkhADwi5D+5wcZXb/oB5ihs9bdluPud8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pT4iXXRK0wWPsL/2GD4C2/kT6vtSr9y6ITMg9VGLRB6f2KvkFteJWVUrkztiZEjdW
 tIlNOSKvpFhK3PHeJ4se4VRAsauQOgKAoUrxNdRJTQRmpVDC3nJJajv0d/kzGn0wO7
 UA0vktFp65M0llBp2/FhZk1xJwg8LDtprE2FCS5Y=
Date: Wed, 21 Oct 2020 18:13:16 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] net: ethernet: mtk-star-emac: select REGMAP_MMIO
Message-ID: <20201021181316.78bc9700@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201020073515.22769-1-brgl@bgdev.pl>
References: <20201020073515.22769-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_211320_056932_CD680679 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, "David S .
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 20 Oct 2020 09:35:15 +0200 Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> The driver depends on mmio regmap API but doesn't select the appropriate
> Kconfig option. This fixes it.
> 
> Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
> Cc: <stable@vger.kernel.org>

No need, we queue all fixes from the networking tree to stable, anyway.

> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
