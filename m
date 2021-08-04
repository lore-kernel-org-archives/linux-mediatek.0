Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21773C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:49:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7D0760F01
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 14:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7D0760F01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lY5Xt7kZX6wefvsM5omADmSuciyBxHZEJQMgug/8DI8=; b=Pz0yS0oZX2TPjh
	8aA9gl5sSdvZ6RfHKKEPq5TuoVeFpoHvrj5XhEJ+kieBoFE5wjzLALxPKjTrqyeNMq/dJZVXsvGzT
	Gr++VjOXGig6T/gSy/QBiKjJ1C3NfqWFPDPCb6+gC4SmDdWWJFR/tRCGpK/tXpWO6WQ0sNgKCVl+z
	a/xjZWsCL6WhIFC0iffUEMrcGbiLBHaE0RaP6Usm+IckOP7KtDNNqadudFVsj3JQKfGzqmp8jFZ6w
	mAXdhSsnm0+pQmyQ4qaneUPgFESB/rH2YN4Okb9/TAmLWy0k9sYhx+5PM97da5lFfggQy04vE2dIr
	/iARwXOxbNYM2C5PA0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBICr-006VCs-KB; Wed, 04 Aug 2021 14:49:17 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBICo-006VC3-MS
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 14:49:16 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id AB38CCECD6;
 Wed,  4 Aug 2021 16:49:13 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v5 2/2] Bluetooth: btusb: Support Bluetooth Reset for
 Mediatek Chip(MT7921)
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210804090316.12080-2-mark-yw.chen@mediatek.com>
Date: Wed, 4 Aug 2021 16:49:13 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, sean.wang@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, michaelfsun@google.com, shawnku@google.com,
 jemele@google.com, apusaka@google.com, mcchou@chromium.org
Message-Id: <F013475B-3F26-453F-A3C5-EFDD94703AEF@holtmann.org>
References: <20210804090316.12080-1-mark-yw.chen@mediatek.com>
 <20210804090316.12080-2-mark-yw.chen@mediatek.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_074914_929024_9067F079 
X-CRM114-Status: GOOD (  11.95  )
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

> When the firmware hang or command no response, driver can reset the
> bluetooth mcu via USB to recovery it. The reset steps as follows.
> 
> 1. Cancel USB transfer requests before reset.
> 2. It use speicific USB HW Register to reset Bluetooth MCU, at the
>   same time, the USB Endpoint0 still keep alive.
> 3. Poll the USB HW register until reset is completed by Endpoint0.
> 4. To recovery unexpected USB state and behavior during resetting the
>   Bluetooth MCU, the driver need to reset the USB device for MT7921.
> 5. After the reset is completed, the Bluetooth MCU need to re-setup,
>   such as download patch, power-on sequence and etc.
> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> Reviewed-by: Michael Sun <michaelfsun@google.com>
> Reviewed-by: Archie Pusaka <apusaka@chromium.org>
> ---
> drivers/bluetooth/btusb.c | 129 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 129 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
