Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963F9C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:21:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C53523134
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:21:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="spQq89Uw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HDQuZ1K8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C53523134
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2hWTDEHdfrzjACHYRjJcH0s7osWc1Ny+EKqscLTNQD4=; b=spQq89Uwc4Sec6vTOvC83DC80
	x4j/VvXmqkBdME5VntUOQmapKpNA+DTKI4HRYri2MWLDcm9GQc01bDG9Gk4M2E4bUA7N/6zKR2616
	t1SEMExW7pUhbm1GKjBop/bOq6T/XRrH7BRCyJ1x0rcxJ/0fujyz/O+ne8jITYAixQVTQ6E1ak+Sb
	MtzfndCmh/VQg333CiTiAKJreCaOq+zC0bLKv8P/h4JBUhgPj1okJYCFGv0BC6z4TAwIXjOzhxWRV
	qrYaJD2ggi0nIS6chW5iLdl9sP+pqcFGJGoX7PlgWrfv70caMeGTNmrYz9GvDuZTioDcSQnb11msO
	d7sOID97g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpn9z-0006lm-FZ; Mon, 29 Jun 2020 06:20:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpn8p-00066Z-0o; Mon, 29 Jun 2020 06:19:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=To:References:Message-Id:
 Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
 Content-Type:Sender:Reply-To:Content-ID:Content-Description;
 bh=aofFy0q1OQ5PXooDQtzumK5Fyy5jjbDWyCPLiS0JxGk=; b=HDQuZ1K8SkxRo7YE7ZIoX3ZYVM
 1KpfbpmBdxJ+3PPIyR3Vov0QuYojdmNIwpQKjwtt4kQG7wDzPJ4siH3cOrnhk/fLRD3AShJII18Sb
 kHJfiYIBuD+rEqNhkbGznrXDZELmRUza8kjmRE640eY+aS88qC5Kf/zB/N3oh3t8MuHVPSYsNlj/D
 ggv8LJMtOqOzc5QO7fOSaLp7K53Q5kDaOEUCmsjQ+Ghnq658vv7rGZf716Kg4sB5tD4RS/V3bJ75s
 n30xs8jzI2zHtJ5/EG+4Iv9ZQeEFm40tInou5enK76NMKZMuTy2Or2Hf9xSrkPthEMEFiTSDsLo+v
 G5ifQkSg==;
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by casper.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpn8j-0002lc-U8; Mon, 29 Jun 2020 06:19:40 +0000
Received: from marcel-macpro.fritz.box (p5b3d2638.dip0.t-ipconnect.de
 [91.61.38.56])
 by mail.holtmann.org (Postfix) with ESMTPSA id 806F1CECCA;
 Mon, 29 Jun 2020 08:29:16 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Bluetooth: btusb: WBS support USB alternate setting 1
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200629060338.10705-1-hildawu@realtek.com>
Date: Mon, 29 Jun 2020 08:19:21 +0200
Message-Id: <FBDECDBA-A76F-4276-91E0-685DC828EF87@holtmann.org>
References: <20200629060338.10705-1-hildawu@realtek.com>
To: hildawu@realtek.com
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200629_071938_443192_CA079975 
X-CRM114-Status: GOOD (  21.10  )
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
Cc: max.chou@realtek.com, Johan Hedberg <johan.hedberg@gmail.com>,
 kidman@realtek.com, kernel list <linux-kernel@vger.kernel.org>,
 BlueZ <linux-bluetooth@vger.kernel.org>, alex_lu@realsil.com.cn,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hilda,

> For WBS support, btusb driver could be set to alternate setting 1.

please be more descriptive since this is special for Realtek devices.

> 
> Signed-off-by: Hilda Wu <hildawu@realtek.com>
> ---
> drivers/bluetooth/btusb.c | 16 +++++++++++-----
> 1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index c7cc8e594166..7942f9314fd7 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -453,6 +453,7 @@ static const struct dmi_system_id btusb_needs_reset_resume_table[] = {
> #define BTUSB_HW_RESET_ACTIVE	12
> #define BTUSB_TX_WAIT_VND_EVT	13
> #define BTUSB_WAKEUP_DISABLE	14
> +#define BTUSB_WBS_ALT1		15

Use BTUSB_USE_ALT1_FOR_WBS as a more descriptive name.

> 
> struct btusb_data {
> 	struct hci_dev       *hdev;
> @@ -1666,14 +1667,18 @@ static void btusb_work(struct work_struct *work)
> 				new_alts = data->sco_num;
> 			}
> 		} else if (data->air_mode == HCI_NOTIFY_ENABLE_SCO_TRANSP) {
> -
> -			data->usb_alt6_packet_flow = true;
> -
> 			/* Check if Alt 6 is supported for Transparent audio */
> -			if (btusb_find_altsetting(data, 6))
> +			if (btusb_find_altsetting(data, 6)) {
> +				data->usb_alt6_packet_flow = true;
> 				new_alts = 6;
> -			else
> +			} else if (test_bit(BTUSB_WBS_ALT1, &data->flags)) {
> +				if (btusb_find_altsetting(data, 1))
> +					new_alts = 1;
> +				else
> +					bt_dev_err(hdev, "Device does not support ALT setting 1");

Scrap this check and error and move it into the probe() function if you actually have Realtek hardware that does not support alternate setting 1.

> +			} else {
> 				bt_dev_err(hdev, "Device does not support ALT setting 6");
> +			}
> 		}
> 
> 		if (btusb_switch_alt_setting(hdev, new_alts) < 0)
> @@ -3965,6 +3970,7 @@ static int btusb_probe(struct usb_interface *intf,
> 		 * (DEVICE_REMOTE_WAKEUP)
> 		 */
> 		set_bit(BTUSB_WAKEUP_DISABLE, &data->flags);
> +		set_bit(BTUSB_WBS_ALT1, &data->flags);
> 
> 		err = usb_autopm_get_interface(intf);
> 		if (err < 0)

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
