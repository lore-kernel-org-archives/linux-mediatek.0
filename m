Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEA2C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 06:55:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686282072C
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 06:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C0lTYWA1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kgNj5eFk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686282072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XflYGcucG/zhWaIFvR/Ls+yp74/YZZ99pnUZKU7uFj8=; b=C0lTYWA1e912yQ
	/eTYnoe+AVtEFSGVrcacnfS2UvWAbJ1MbnDqnbDU5Cuj/lJaEgCf+dB7FAEUDM9L8qQDq3eWlUaH4
	9oON3on+yJNtRnHfmCycC3M79yh+MfSfPXgLzO4+u6thPgK+GQsQQvAkXnbmeRElnjDFXlUUv96SO
	A9bQ54BtI6zWQLjEi5ByA3ceQOCnKPO9QSqHpdRqB+mZUaHx2O8qVSg7wfY1+FVygQ5lvoajPqg2o
	yrXCE/vVjskk3/4TQzeEvQWHkrIL/lrVzLXvdmms5n1GjzRmOgTlq+kJGv6a+9lO0+eI/s0c+K4pK
	Qngg+vPgsgTS1Th2yU7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbIdB-0001b2-9d; Wed, 20 May 2020 06:55:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbId7-0000gk-TO; Wed, 20 May 2020 06:55:07 +0000
X-UUID: eb52538a63c547959b194ce3a3e60208-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5Lcz411vQymr8LOv9ZOMpOR7TAY9qOG8MgWx5t4pG8Q=; 
 b=kgNj5eFkW9mPa012Eif0MwO65NhHJv+kf3LAKjxzjF1JFTBJQtjE1QRHXVstaJqZ/PjloQMeqEOTLcV/u8sWiFpKGsIYMh1uWT1JownyyL4XLnw2zn69E2s2nlGFLJxE3JGdUNSMY5Es1LB3ZR+oX0ATl3WaUkXeRVeCHDWmiEI=;
X-UUID: eb52538a63c547959b194ce3a3e60208-20200519
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2133675788; Tue, 19 May 2020 22:55:03 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 23:55:00 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 May 2020 14:54:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 14:54:54 +0800
Message-ID: <1589957603.13912.2.camel@mhfsdcap03>
Subject: Re: [PATCH] iommu: Don't call .probe_finalize() under group->mutex
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Date: Wed, 20 May 2020 14:53:23 +0800
In-Reply-To: <20200519132824.15163-1-joro@8bytes.org>
References: <20200519132824.15163-1-joro@8bytes.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 255D14E269C30CBAC837F7C42790D730FB5613A0BD2417CC0B32DAEB4E59CBDF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_235505_965596_4504F68D 
X-CRM114-Status: UNSURE (   9.13  )
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
Cc: Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-05-19 at 15:28 +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The .probe_finalize() call-back of some IOMMU drivers calls into
> arm_iommu_attach_device(). This function will call back into the
> IOMMU core code, where it tries to take group->mutex again, resulting
> in a deadlock.
> 
> As there is no reason why .probe_finalize() needs to be called under
> that mutex, move it after the lock has been released to fix the
> deadlock.
> 
> Cc: Yong Wu <yong.wu@mediatek.com>
> Reported-by: Yong Wu <yong.wu@mediatek.com>
> Fixes: deac0b3bed26 ("iommu: Split off default domain allocation from group assignment")
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Tested-by: Yong Wu <yong.wu@mediatek.com>

Tested on MediaTek-v1 mt2701 evb board.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
