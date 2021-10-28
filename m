Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F024C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 05:55:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B924060E76
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 05:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B924060E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3l+E54a6b3efoLa6EY9y/3Z/AqsNL+JNxRoUwrD3zgE=; b=U5/WPgjEU9Nbhq
	uSB5Wj8h9Z43kgT+Wt/37gOBfc7bK+s8igkCcCxoVUn7fCF1+7ASikLFZKlDVFsUlfL1FP5y1S7m1
	M/iLzl8ovJY2cgsxqHi6JJatNp7vUl3qmzgxgjz2cCr0pnJB47KAt7amS6KwS39BzeVCM2Gwz6cK/
	gy2lBT1bxI0LQFtroGiS9UEipmQdcgeS5Okwzh/nN6DRgUxdMBDSHhadiISOk3YaYYIRIsy9X0DQe
	NCuxkNzf/ekSLlNrykFNBEvSSZ1BnWmNM9dgebUPJYUa9JEm6e9AXxFQcodQfzJf2EMdqA3ISUyex
	/Rtluo87lhjUs/Q03WaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfyNx-006wCr-LE; Thu, 28 Oct 2021 05:55:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfyNl-006w9o-II; Thu, 28 Oct 2021 05:55:22 +0000
X-UUID: 6633c9b1cea44da1847bf36d3824a1e5-20211027
X-UUID: 6633c9b1cea44da1847bf36d3824a1e5-20211027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1024224906; Wed, 27 Oct 2021 22:55:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 22:49:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Oct 2021 13:49:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 28 Oct 2021 13:49:46 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <hch@infradead.org>
CC: <agk@redhat.com>, <dm-devel@redhat.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <matthias.bgg@gmail.com>, <snitzer@redhat.com>, <tequila.huang@mediatek.com>, 
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH] dm: add module parameter bdev_wait
Date: Thu, 28 Oct 2021 13:49:46 +0800
Message-ID: <20211028054946.1524-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YXj37wXtN0wQqwZx@infradead.org>
References: <YXj37wXtN0wQqwZx@infradead.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_225521_632976_10E8EC13 
X-CRM114-Status: GOOD (  14.84  )
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

> > dm_early_create() fail if the target block device not found in
> > the late init stage.
> > The block device is created in mmc_rescan() which kernel do
> > it async by queue it into system_freezable_wq.
> > Add module param bdev_wait to support waiting the block device
> > ready before dm_early_create() like prepare_namespace() does.
>
> This adds a busy loop.  There is a reason why we usually set up
> stacking drivers from userspace, in that we have a working event
> system there.  So the answer is not to add further hacks to the
> in-kernel DM setup hack, but to stop using it.

Thanks for your kind reply.
But We want to use DM target as root device without adding an initramfs.
Is there any other way to do so?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
