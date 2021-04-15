Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CC4C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:35:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00ED461249
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 13:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00ED461249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4kYB8wsCXDC65jUE4UGU0kVIDs9dUuFJTadIQj03C0w=; b=cXTub30GJ5VhQK7/XNAUO0gaz
	TBTJUhmB5obbQSge45x5YcnIbZsDACMKSwnriBR3ftNLjLpjgEtPViwNhniI764mVYVWb64D2AbBR
	4Rb8ri1W4vpp0NttDEgi+09bOPTJ0gBDhUd5RhF2GdrRsq7D2BWnbuve/+hcvCIAT73HuDNwZ7hVP
	HyyfpMBtXqRi9xu0fRPmqhUkfjCN+UELvkoaSPS17NW3flYwkbie/Dt5z39vL9EW4ASAMEuNcbA2s
	pTDnVHjUrL3oJ8QrObM0N9b6IAQTGEWulDaS2Lt1ErwPcOQ8kP+EOZHk9780fwQQtsArtsKXJgNo4
	q96FAkA8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX28x-00GGwK-M1; Thu, 15 Apr 2021 13:34:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX28k-00GGuO-W1; Thu, 15 Apr 2021 13:34:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=9LpI5csO+UCLsdhrXwAi+v1PpquEFB6u83ShlOgAV0M=; b=JAhH0Wg1KVFtRRtFCeTox37/L8
 zHf7RlwJ++whhXo9S+z0x80GoPETLARMh3lOnc8fS8MNI/qsT98t+H17xSDV7AZXYjEkTWqMiaenm
 kZMmGyoz+sjJ2iZ5+EQebjxE2FxdLTVvGmqgQrfptRiOUJ19ARrxqiDsc0vr42hbyApdMHPDb/JLm
 sEBxk8+ScSPvGzfkOBDjswj8+OLfH8JNqXlb1kIzHWqGz9cMiEz3U+GeFFIp9+58/QOcyp20/Yaoh
 vRrBhWcUkntlU26WqJolt5+CKR8h98/IErLJyHsZ9JDg0aJItd/yA/bA4S0+1C5pDZz5BxuVCZ42T
 vRIzIqpA==;
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX28i-008bo2-7T; Thu, 15 Apr 2021 13:34:37 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 30B46387; Thu, 15 Apr 2021 15:34:30 +0200 (CEST)
Date: Thu, 15 Apr 2021 15:34:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, will@kernel.org, yong.wu@mediatek.com,
 kernel@collabora.com, dafna3@gmail.com, enric.balletbo@collabora.com
Subject: Re: [PATCH] iommu/mediatek: always enable the clk on resume
Message-ID: <YHhA4u7zat3vtJfD@8bytes.org>
References: <20210408122842.29009-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408122842.29009-1-dafna.hirschfeld@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_063436_463418_BE3352BE 
X-CRM114-Status: UNSURE (   7.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Apr 08, 2021 at 02:28:42PM +0200, Dafna Hirschfeld wrote:
>  drivers/iommu/mtk_iommu.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
