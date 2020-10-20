Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1EBC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 18:36:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F2DB21D7B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 18:36:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UQz47NX+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F2DB21D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d5sfH/a8UBH+hce9eIOy+ImLPv8QImQz8z161p5TUUo=; b=UQz47NX++vwr3GwT7r0hGqT2f
	XSQ2B6MZH5n4jBWHll4lsgTZoTE9UkT9wqzRxMtyuY+K+5GMSJAhZQvRmqwz4gB1j/qRVVORMOwFy
	4tdCPG+PydLq2AmJ0ekqzvoxCZTHxFel/xHIwgaRH+DA95CMmU/hhMzKec/uc6w5ECeaxYYmZhR9M
	XaONA4V0ERksrgPI2I02ZO1e54fV9/u1AcbHdanewYK4vpKFOg774xc5FL2D/WttM6EtqLu8ovhVX
	GLFK9Mao6vx+GcHrSrbx6yYuKozoS1YgigqpX+utQv5crSv6mWK9cPHQpc7AZKVxxEyGFbNaeF3Dd
	p/48T+xuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUwUJ-00045p-PD; Tue, 20 Oct 2020 18:35:59 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUwUH-000459-5F
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 18:35:58 +0000
Received: from marcel-macbook.fritz.box (p5b3d236a.dip0.t-ipconnect.de
 [91.61.35.106])
 by mail.holtmann.org (Postfix) with ESMTPSA id BABCCCED0F;
 Tue, 20 Oct 2020 20:42:56 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH] Bluetooth: btusb: Add support for LG LGSBWAC92/TWCM-K505D
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20201016030238.1033559-1-cyrozap@gmail.com>
Date: Tue, 20 Oct 2020 20:35:52 +0200
Message-Id: <EE190DCC-85ED-4370-81A7-C239EE193083@holtmann.org>
References: <20201016030238.1033559-1-cyrozap@gmail.com>
To: Forest Crossman <cyrozap@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_143557_302662_3B5D9FE5 
X-CRM114-Status: GOOD (  17.70  )
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
Cc: linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Forest,

> The LG LGSBWAC92/TWCM-K505D/EAT64454801/EAT64454802 (it goes by many
> names) is a combo WiFi/Bluetooth module that's used in several models of
> LG TVs. It uses the MediaTek MT7668AUN, which is already supported in
> btusb, but this device has a non-MediaTek USB VID so to get it to work
> we just need to add it to the list of devices to probe.
> 
> Signed-off-by: Forest Crossman <cyrozap@gmail.com>
> ---
> drivers/bluetooth/btusb.c | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 5f022e9cf667..58259b6a43c7 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -366,6 +366,7 @@ static const struct usb_device_id blacklist_table[] = {
> 	/* MediaTek Bluetooth devices */
> 	{ USB_VENDOR_AND_INTERFACE_INFO(0x0e8d, 0xe0, 0x01, 0x01),
> 	  .driver_info = BTUSB_MEDIATEK },
> +	{ USB_DEVICE(0x043e, 0x3109), .driver_info = BTUSB_MEDIATEK },
> 
> 	/* Additional Realtek 8723AE Bluetooth devices */
> 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },

please include the content of /sys/kernel/debug/usb/devices in the commit
message.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
