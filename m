Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95A9C3DA45
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvQpnoDjoDpI50LV+48+mtvnut3O6+hbvKZt5JaS7n4=; b=nhRHXgIax7gjCClicSEl1g8Feo
	L/JWbJd+r/8FfRS1Q6Tq13+O/Y7YBrO1Yi51dsZMLmRISegcbLCC7WZXI5r2jCqRvdbwc7CvUWmNN
	HokaBbOis+o/VkoYh6dJZGXUcgENpTabd+HgU/5GURvxnlqm0r14Prf1PojAlhaNHXcea+2rK+1Y1
	glLDjcARbxe0InPxAK/agr8LhdONdGqqyyjryC1P7o7ntdP4u/XoG9B8mr0ipaFMAX/j28bOePb1v
	72XX8nVYM3tRLqgk4zgcISlpJj+rE0HdqMXRDTZ2fI4G16urKsWzgtR2lmSgeJ32dowfc5uE2ew7N
	2JJAB4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWJI-0000000ATT1-0qF3;
	Wed, 10 Jul 2024 12:20:36 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWJF-0000000ATSb-1GQP
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jul 2024 12:20:34 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-77d3f00778cso1562949a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jul 2024 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720614032; x=1721218832; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvQpnoDjoDpI50LV+48+mtvnut3O6+hbvKZt5JaS7n4=;
        b=UnwsgCfoHfU7hZoYWLelGE1depmeZ/YcuZ8x6yCXEJJ7/ZenfNRuf+MOygek4jyXqv
         Ty4nRBT82RXJ1fBpwgWvmSRsgMocijF385SzxXGEp49Ml5q/hITkPEK9evWyJTQ0rWNT
         HMAKl2zTaXoIrRmSnzpcTH1h+xoZwHI+xxf1UwLB4PTOVC6RP7ZNDmmaLV7EVJx38Vvh
         Nk5TOC4pP9Lx3ndNbnj7hKBlPPMWfItCq8H5QpuVJFC8ULJa/kLAb5XQXJeOtRme2+4T
         YzGpnawU917iTDSTo53Yf0pX63ds91ynV05jersffnNFlSxhRhJqTf3iba67wzmwLOIC
         5W2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720614032; x=1721218832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvQpnoDjoDpI50LV+48+mtvnut3O6+hbvKZt5JaS7n4=;
        b=eICcRWehtflMvKMPEQ2LQfemRIkeW9hQ9Q5CvNXORLn1AHLBzkC78k82w3BUydXbRU
         9nSuDrsCtBJYgwVcQOuI0CKWDgfsECc75bSRE2h7DTksPSF8eRG0vbii5MZ1OAxg0LUh
         W8AFKt6+Fk1y2zWqj07ZrBNL7Md/FRjgOJQUCxD6UTlNP4nwKvNmzbezXd1aOoBZEcvQ
         wcKw+BOW3Lg5pk88ijiLTqnL2p65DHT4JMlhOe1/puLFRffAqcRBlpJ+HXfCeBQBs181
         xOIpIEba0tKVMnRBKpVldMqrTlWYxnW3Sh+QQOAU1IVdBdoJPwOpVi2E7b63cMVvGhxs
         D5TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJZsEvxIAquRGGn5ALbA2c0aytrY0hlCOsfkk3D+IWX647KC6sybvJdKYbE/5QGpAfI0Sy7O4bnVSlHC6FlgnfgxT4BVxl7OKzh113ouIDsQbJ
X-Gm-Message-State: AOJu0Yyi4zK50MUL4lrNG+9M7AtijWbwJRenNqGX/RBDu0hXclbG5ZUM
	1x1272oSZozoIaNHsZfQDTShXKtrdxBR/XibV1GN2nMAY1hpYFGC6ZZOn7gsfBRU60Vg2P+kSan
	ZraNKP6xLK9rsQkQssvaYqXQDUUY=
X-Google-Smtp-Source: AGHT+IFGd8/NaTt8bBK3q51jUrH0J0reuzi+z80yAos5DxqdigxYXohUYHVvXxa+g72Kmjli7ngIw45bHloBrJGAaPc=
X-Received: by 2002:a05:6a20:7fa4:b0:1c0:dd3d:ef3a with SMTP id
 adf61e73a8af0-1c29824acaemr6326902637.29.1720614031912; Wed, 10 Jul 2024
 05:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240710073832.4381-1-chris.lu@mediatek.com>
In-Reply-To: <20240710073832.4381-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 10 Jul 2024 08:20:17 -0400
Message-ID: <CABBYNZLOn4pAnx70afymGWR=XRzeO4WshaX2Swew9GGp6CRnvw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtk: Fix btmtk.c undefined reference build error
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_052033_363582_B4D7A7C0 
X-CRM114-Status: GOOD (  18.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chris,

On Wed, Jul 10, 2024 at 3:38=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> MediaTek move some usb interface related function to btmtk.c which
> may cause build failed if BT USB Kconfig wasn't enabled.
> Fix undefined reference by adding config check.
>
> Fixes: 39a9e1c69e74 Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmt=
k.c
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407091928.AH0aGZnx-lkp@i=
ntel.com/
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>  drivers/bluetooth/btmtk.c | 2 ++
>  drivers/bluetooth/btmtk.h | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index b7c348687a77..9789296ad4f6 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -437,6 +437,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, stru=
ct sk_buff *skb)
>  }
>  EXPORT_SYMBOL_GPL(btmtk_process_coredump);
>
> +#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
>  static void btmtk_usb_wmt_recv(struct urb *urb)
>  {
>         struct hci_dev *hdev =3D urb->context;
> @@ -1487,6 +1488,7 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
> +#endif
>
>  MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
>  MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index 453ed5131a37..890dbe9beff8 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -165,6 +165,7 @@ struct btmtk_data {
>         btmtk_reset_sync_func_t reset_sync;
>         struct btmtk_coredump_info cd_info;
>
> +#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
>         struct usb_device *udev;
>         struct usb_interface *intf;
>         struct usb_anchor *ctrl_anchor;
> @@ -177,6 +178,7 @@ struct btmtk_data {
>
>         /* spinlock for ISO data transmission */
>         spinlock_t isorxlock;
> +#endif

If I recall this correctly it is not a good practice to use #if inside
structs as it would change its overall size, memory layout, etc, and
it also makes it difficult to use if (IS_DEFINED) and let the compiler
eliminate dead code instead of using the preprocessor like you doing.

>  };
>
>  typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
> @@ -202,6 +204,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, stru=
ct sk_buff *skb);
>  void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ve=
r,
>                            u32 fw_flavor);
>
> +#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
>  int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id);
>
>  int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
> @@ -216,6 +219,7 @@ int btmtk_usb_suspend(struct hci_dev *hdev);
>  int btmtk_usb_setup(struct hci_dev *hdev);
>
>  int btmtk_usb_shutdown(struct hci_dev *hdev);
> +#endif
>  #else
>
>  static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
> --
> 2.18.0
>


--=20
Luiz Augusto von Dentz

