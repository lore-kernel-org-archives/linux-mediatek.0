Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B541DC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 16:23:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4439A64F72
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 16:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4439A64F72
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qIoUYlWYiFRNjDNO2vC7/ReDdy2SX/YvSf/kNaZv38I=; b=T7HQ5rmgIlui4mfpHQRPGSXhH
	AOajPHRxj2zc40FTz6+WpuEgnqa8HVIYCyfbbUBS3qFCMdfVSjKWqKNrzy2bkzf5jjnFp9Rh13WZk
	MvizVCvPn7DHpo0i/B+x/YjYIyd/DrSC3RGBMkUb8WHn5DEgsGMS20rdTRDWQopN3F+mpSrFBAWpw
	CGq3tWdJIuWOZMvHpiZArAm1kMZ4p+7rd/Text9ue8J4FoUV+VRC0rA0BbZrZ2ZGxF1hdjlmPSQ6F
	6Oe2jI7kM7l8V18UGkFQ8b9Nr6Y6Gnd08WXAlXRrI3Crm1MerLJ6b3u8rd4yppziWaBph42lL065K
	A/sd0BJoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ySG-0004Mm-9L; Tue, 02 Feb 2021 16:23:04 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ySD-0004Lm-UI
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 16:23:02 +0000
Received: from marcel-macbook.holtmann.net (p4fefcdd8.dip0.t-ipconnect.de
 [79.239.205.216])
 by mail.holtmann.org (Postfix) with ESMTPSA id 3631DCECDE;
 Tue,  2 Feb 2021 17:30:19 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH v4 0/2] Bluetooth: btusb: Add protocol for MediaTek
 bluetooth devices
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210202102618.27640-1-mark-yw.chen@mediatek.com>
Date: Tue, 2 Feb 2021 17:22:52 +0100
Message-Id: <F933AA60-A9AA-48FC-8F59-4338891C50B6@holtmann.org>
References: <20210202102618.27640-1-mark-yw.chen@mediatek.com>
To: Mark-YW.Chen@mediatek.com
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_112302_145722_7B3B7BD6 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Eric.liang@mediatek.com,
 Sean.Wang@mediatek.com, LKML <linux-kernel@vger.kernel.org>,
 Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, robin.chiu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mark,

> v4:
> 1. add read chip info. from MediaTek bluetooth devices.
> 2. support download firmware for MT7921U.
> 
> mark-yw.chen (2):
>  Bluetooth: btusb: Fine-tune mt7663 mechanism.
>  Bluetooth: btusb: Add protocol support for MediaTek MT7921U USB
>    devices
> 
> drivers/bluetooth/btusb.c | 211 +++++++++++++++++++++++++++++++++++++-
> 1 file changed, 206 insertions(+), 5 deletions(-)

both patches have been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
