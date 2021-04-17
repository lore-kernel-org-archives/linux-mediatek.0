Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6659C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:08:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3211D610E6
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3211D610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=siol.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LkNK5/1J3i27mEnq+HB854l5FAt9EESKknvviEsnrL4=; b=i0HkYVhNLh60jUMEtEU48SaqR
	mTbjj3kbIeU0OJd9M54RXufS7iGd8m2eduG78s4PNwaiTBcmGfXdxGoC9L9w75pF0jMTwdnOdzmaU
	6DSSVVcWIJiXiykyEErqORiwUNot+nrNnc8e9aZIXC+HQ/UIBzgqwBq4YY57gbRSuVsao/JpB/NH3
	9h0ny+hYFM+A82b0PURXDbjk1VfrpFMx2EfGpAAbxEOXwM2SDNxzN7RJ0d0VkKeK1zi1CpEldZ+PG
	WjX4WA2c3N926FtL0kLjpuGoRIiwBBBQuXimhSGzkJEsRlumbtrwjspwXgcgxISjk5s86m3TEyb2L
	o7E7BFqNg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXe7a-004Uly-4L; Sat, 17 Apr 2021 06:07:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXe7K-004Ukp-30; Sat, 17 Apr 2021 06:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
 :Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=sYJ2yJnmkAg20NGDkvALl/X9SJQDfVKK2iZxh1+TIjY=; b=MjBWE8LMZ6FkB0Vcn6mdzyxGG0
 j5Q9AeyCS15egbwr4S+GaEJsrjD1z71teFEuGBigA5ERBF8KiJr72ev+rjd6yNeEj4S0Qvwm0D0Pj
 D6OzV7hdl5oXrVBD+yYFbZQlxlhiN9V1dLG/5LAY3laVIGtz34L+Trof8ifpwaZCEYEwPJNswB3G9
 IyaZi9uD3wAOi45U0bnefNE+SC8S7slqyJB+SHcu5QjW4E4RDNpnNWB0N4kdZjS4huhCQogS1llVm
 kbJFOB7cPVIexh+QLRCKiSCIVAZ+oSYf/gWUqgy7C5ctzGbIvTpWXegCaW0RoIv4kL7oOFh5GONVk
 4QLLqL5A==;
Received: from mailoutvs48.siol.net ([185.57.226.239] helo=mail.siol.net)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXe7E-009tHK-21; Sat, 17 Apr 2021 06:07:40 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id C3A8F523302;
 Sat, 17 Apr 2021 08:07:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id ujWJtRf9z93L; Sat, 17 Apr 2021 08:07:30 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 8284852334B;
 Sat, 17 Apr 2021 08:07:30 +0200 (CEST)
Received: from jernej-laptop.localnet (89-212-178-211.dynamic.t-2.net
 [89.212.178.211]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 59D425232B3;
 Sat, 17 Apr 2021 08:07:28 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Zhen Lei <thunder.leizhen@huawei.com>
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 4/8] iommu/sun50i: Fix spelling mistake "consits" ->
 "consists"
Date: Sat, 17 Apr 2021 08:07:28 +0200
Message-ID: <4000375.Ibcesr10vN@jernej-laptop>
In-Reply-To: <20210326062412.1262-5-thunder.leizhen@huawei.com>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
 <20210326062412.1262-5-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_230736_309640_FD2E73FA 
X-CRM114-Status: UNSURE (   7.60  )
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

Hi!

Dne petek, 26. marec 2021 ob 07:24:08 CEST je Zhen Lei napisal(a):
> There is a spelling mistake in a comment, fix it.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Jernej Skrabec <jernej.skrabec@siol.net>

Best regards,
Jernej



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
