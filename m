Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01CDC4332D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 10:25:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71C2B206D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 10:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S9IJzaoy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71C2B206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5tcoS2sK0Tl/TNfGavYZQpMEkLW0J0fNpOEJirR/hw=; b=S9IJzaoyAHZA1y
	bRmUwLucGaGCUm6f8HAckF3Ng96GG8QCf6FJYiiKMRfpWI2eHzmFNkfhAVc7HQLQL6WkPnLPkRGxd
	kIOtN56inTj5LcVnrRueBQMSgTYPG5w4kzKOED2bO7PuSAkKaGy/grn+l6cqnER0pugpYqaKPBvqq
	0LgpyenGsYZCNnrUawT+LEgMp11DQxdtxhH2sTBM5ULzmRL58CmE5Ie2WcPOKKC3mBgyEk37IZX/1
	upOBestKKpS+7SUrMK4IzOKPxnJCSotzRPHfF3FSeZEQ49sat6X+gmaN30EsrKSA6edNNEup3Tqjn
	JHdShl+ZtpALP/J1+2hA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEsMr-0006SJ-My; Thu, 19 Mar 2020 10:25:37 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jEsMq-0006S7-2X; Thu, 19 Mar 2020 10:25:36 +0000
Date: Thu, 19 Mar 2020 03:25:36 -0700
From: Christoph Hellwig <hch@infradead.org>
To: light.hsieh@mediatek.com
Subject: Re: [PATCH v1 3/3] block: set partition read/write policy according
 to write-protection status
Message-ID: <20200319102536.GA16757@infradead.org>
References: <1583290274-5525-1-git-send-email-light.hsieh@mediatek.com>
 <1583290274-5525-4-git-send-email-light.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583290274-5525-4-git-send-email-light.hsieh@mediatek.com>
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
Cc: axboe@kernel.dk, ulf.hansson@linaro.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-mediatek@lists.infradead.org, stanley.chu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 04, 2020 at 10:51:14AM +0800, light.hsieh@mediatek.com wrote:
> From: Light Hsieh <light.hsieh@mediatek.com>
> 
> For storage device with write-protection support, e.g. eMMC, register
> check_disk_range_wp() in struct block_device_operations for checking
> write-protection status. When creating block device for a partition, set
> read/write policy according to result of check_disk_range_wp() operation
> (if registered).
> 
> Without this patch, ro attribute is not set for created block device of
> write-protected partition. User perform asynchronous buffered write to
> such partition won't get immediate error and therefore he won't be awared
> that write is not actually performed.
> With this patch, ro attribute is set for created block device of
> write-protected partition. User perform asynchronous buffered write to
> such partition will get immediate error and therefore he will be awared.

NAK.  This is complete BS.  Partitions are a complete software concepts
and idiotic features like a range read only should not interact with it
at all (and I urge all Linux users to never make use of such broken
features, so the less support we have for them, the better).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
