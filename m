Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB93FC63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 14:04:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 988026128C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 14:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 988026128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lqsBAVxQKYhfOeP8bXGIEt9VYQsvpVZ3ytnkkzRLceA=; b=gqbzHfWPBwzpyD
	MNmG5dT24FjuvHkDpjFS1tepZZFBc+wub1bJDORQmqYZStviIFhWum41Tp0v5Y3NhJWJz9hSYn9hj
	3iXHqj9zADYFEnzfzhZ51D1e+anyJmkoXOmZ2pPhSEJsyaQ7nZ7lsHgft9oCinL02cB/SPdmeM0cS
	jHp2Jl6m6oc88XKBWKQOqg64llsXv0hC8swOoDWVtbCe4tnp/qmpH2W+5TLtiUKHag5QJ4FXc0HHM
	e++NpiiB51ZjdUy/oOZ5PSP9NQIg84MrWKOKhZfwH4eHlp0p5tnoFbBHXSjcuaLhAXOVvS4a8kaYJ
	aZvg5qRgRzkcBQZAb0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ZIv-001ppl-Hk; Thu, 22 Jul 2021 14:04:01 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ZIq-001pmC-Sk
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 14:03:59 +0000
Received: from smtpclient.apple (p5b3d2eb8.dip0.t-ipconnect.de [91.61.46.184])
 by mail.holtmann.org (Postfix) with ESMTPSA id ACF84CECDC;
 Thu, 22 Jul 2021 16:03:48 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v4 2/2] Bluetooth: btusb: Support Bluetooth Reset for
 Mediatek Chip(MT7921)
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210701194243.5449-2-mark-yw.chen@mediatek.com>
Date: Thu, 22 Jul 2021 16:03:48 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, michaelfsun@google.com,
 shawnku@google.com, jemele@google.com, apusaka@google.com
Message-Id: <0FDB7895-4ABF-4975-AF61-FCFA86597254@holtmann.org>
References: <20210701194243.5449-1-mark-yw.chen@mediatek.com>
 <20210701194243.5449-2-mark-yw.chen@mediatek.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_070357_152956_B1A58EA0 
X-CRM114-Status: GOOD (  15.17  )
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
> ---
> drivers/bluetooth/btusb.c | 127 ++++++++++++++++++++++++++++++++++++++
> 1 file changed, 127 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index b1249b664981..122a928ebcb5 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3076,6 +3076,17 @@ static int btusb_shutdown_intel_new(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +/* UHW CR mapping */
> +#define BT_MISC			0x70002510
> +#define BT_SUBSYS_RST		0x70002610
> +#define UDMA_INT_STA_BT		0x74000024
> +#define UDMA_INT_STA_BT1	0x74000308
> +#define BT_WDT_STATUS		0x740003A0
> +#define EP_RST_OPT		0x74011890
> +#define EP_RST_IN_OUT_OPT	0x00010001
> +#define BT_RST_DONE		0x00000100
> +#define BT_RESET_WAIT_MS	100
> +#define BT_RESET_NUM_TRIES	10

you need to prefix these with MTK since otherwise we get confused.

And we need to work towards abstracting the vendor specific position out of btusb.c (and I include the Intel part here as well). The btusb.c is getting overloaded with vendor stuff.

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
