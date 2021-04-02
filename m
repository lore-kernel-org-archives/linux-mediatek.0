Return-Path: <SRS0=/k7X=I7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E922C43470
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Apr 2021 09:17:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA20361106
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Apr 2021 09:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA20361106
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rrYUbeZMd1MW03sogs6CE11Re418YBGvul9ntWIgtY8=; b=NDt+NVt5XC2Raj6W9mtqTdZJX
	v2VqEzpQVJUdeaxu1ySGM7W4nl+ruHSDe0i/7xjCDufOq4v12sEaEx0ar60XT74+ikkvBC9tUBX+h
	gRMaPMrzfqp4CRQS1mKRf3ntuRvnKmLxhOW5fbc+vFCNxQDZxMFMR1rBs83UdThRsygCTJFgkWMyv
	QqRd/WggOYzZH1ereVhWu/PMGFBrHw2BvHDNVSkB3pBW/cRD8jclthJPQJLVsalN+EPUzHNlavwCa
	4H4+7ic709i+YABaPHQDHxsXAlgR3mSzZv6masGsQ6okVtbBxuUSTA5K4lueOFSerUj1Z2qQWcTUG
	MZfcxdkbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSFvo-00CVpI-LU; Fri, 02 Apr 2021 09:17:32 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lSFvk-00CVkb-IA
 for linux-mediatek@lists.infradead.org; Fri, 02 Apr 2021 09:17:30 +0000
Received: from marcel-macbook.holtmann.net (p5b3d2269.dip0.t-ipconnect.de
 [91.61.34.105])
 by mail.holtmann.org (Postfix) with ESMTPSA id 2D334CED23;
 Fri,  2 Apr 2021 11:25:07 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/1] Bluetooth: btusb: Enable quirk boolean flag for
 Mediatek Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210328171833.14572-1-mark-yw.chen@mediatek.com>
Date: Fri, 2 Apr 2021 11:17:25 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <C6EB6170-6141-487B-ADC9-BA1FDA9818E5@holtmann.org>
References: <20210328171833.14572-1-mark-yw.chen@mediatek.com>
To: Mark-YW.Chen@mediatek.com
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_101728_675403_FB196E6F 
X-CRM114-Status: UNSURE (   9.27  )
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

Hi Mark,

> Adding support LE scatternet and WBS for Mediatek Chip
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
