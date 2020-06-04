Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E52C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 15:06:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB0B4207DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 15:06:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q3iuP+n1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB0B4207DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dwXOs1PtjJ6il3zRZt9JX//gEtFezNJgsP3sVxRqNE=; b=Q3iuP+n1rcagf+
	LzHVVzgNtXp0rNIW08vaxZq3Es67+FT5SjiN69AJxaGJ9dWqb4KHJnlHxshs1ezY7C/Yl8d1vbsH6
	/BDcu4LkJwJq8Y1+c8Ygg+m8Igfj1kCSAUIDYw9dQIazOJsBxwlfskJzbsyo+UKU8evAWef/GHS1c
	GkPMTX1sq58Me6hooacQiutN7Zy+v5TC00BY/2htPt1DZ8P1jmyKAoxLtrsXvWOvNsMUZd7CNBI0W
	tytH7opa8FTUIjBz/irFPucpQ+8u8Qh9d+GVoJpzacs583egOVSE0RqqJscQ+eqpCTDXnj6BKLM/7
	Vcg3KuimQQeiQ68rJRag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgrS9-0008C2-O9; Thu, 04 Jun 2020 15:06:45 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jgrS7-0008Be-4R; Thu, 04 Jun 2020 15:06:43 +0000
Date: Thu, 4 Jun 2020 08:06:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] iommu/mediatek: Use totalram_pages to setup enable_4GB
Message-ID: <20200604150643.GA29193@infradead.org>
References: <20200604080120.2628-1-miles.chen@mediatek.com>
 <55820901-430b-14c4-9426-7a4991ca0eed@redhat.com>
 <1591264174.12661.17.camel@mtkswgap22>
 <f02c8c9d-ed75-6513-f8a9-a2fdbb11b750@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f02c8c9d-ed75-6513-f8a9-a2fdbb11b750@redhat.com>
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
Cc: wsd_upstream@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 04, 2020 at 01:32:40PM +0200, David Hildenbrand wrote:
> Just a thought: If memory hotplug is applicable as well, you might
> either want to always assume data->enable_4GB, or handle memory hotplug
> events from the memory notifier, when new memory gets onlined (not sure
> how tricky that is).

We probably want a highest_pfn_possible() or similar API instead of
having drivers poking into random VM internals.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
