Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC65C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 15:17:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4618161BFE
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 15:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4618161BFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uAuxDqgfhw1FqG3bH/byFHo8/Hg9ElbBrZNNTcQ9Sdk=; b=uwN8NKqgDUN+Hq
	vkmbOwsUWWoc2dga+hSpoG9Kw1lR88IHksXeOK7AO61173XxH71hWLZfYFDtT2M33JVOToTbXkvUT
	ptnrnfpR4Lihoj9+iaV1xCgr4DeVGCAF95GEWZgF/4yK6XAGrcxE3lCzScZl41Kv9hUcWJvc3pJ6W
	Z4vtIs3ky9IPRjkir2NQpSQWeL/w7fwd3mYg7Vdtmt6ArqxbGP8d7pl/+Bl9VW/yvgrANk/zMvmTv
	1dhC98k3v3jDP7TSEQGtsPH+JfjVKpBS7XP4Gz/QSrhqcrFEQ5Tetoh90cP3ktsArr6R8ml8UW78P
	aHeEHNMxzjdwvRXzvMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn0Ct-0027g0-Oo; Tue, 16 Nov 2021 15:17:11 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn0Cq-0027eh-6H
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 15:17:09 +0000
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
 by mail.holtmann.org (Postfix) with ESMTPSA id 799E9CECD8;
 Tue, 16 Nov 2021 16:17:01 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH] Bluetooth: btusb: enable Mediatek to support AOSP
 extension
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211104182605.30433-1-mark-yw.chen@mediatek.com>
Date: Tue, 16 Nov 2021 16:17:00 +0100
Cc: Johan Hedberg <johan.hedberg@gmail.com>, josephsih@google.com,
 will-cy.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <9C2ED95F-2515-444E-911A-6FD49EBF4B2A@holtmann.org>
References: <20211104182605.30433-1-mark-yw.chen@mediatek.com>
To: mark-yw.chen@mediatek.com
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_071708_412969_9AA22BBF 
X-CRM114-Status: UNSURE (   8.55  )
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

> This patch enables AOSP extension for Mediatek Chip (MT7921 & MT7922).
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
