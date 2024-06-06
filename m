Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97639C27C52
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 20:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MqoEdi+5Li7qCxgZnJ0d4rFJMsPiflzcBA1WO++S0A4=; b=P8u7fxt2bI0a5rN/ptqgr3qsU6
	jZKdK2LrfSeWQGLwh/sl9PboiQfb/YbcXnGLZE3MbiyHy3slRgOtSxQMCFsG4R4nqN/e80elC4wRk
	ZBKb0F+PiNQIWZouB8JNFncvjRz9TwpDGIUPz7Nrn8PNAYSnJizsoKfZUF4SecX6s10HtP49uy1p8
	KM1JdQ+qv/Jpr342hTzS3Cey0KfEVV4Pmr0d8yR3u+RF+QazhA7of0xRRCC7Otm1m88gRofpE7/LD
	bEV2m41zHG9V9tAxqmdcbm8qLx2IWLOswWO0xESl++fIMIV/BINmVelflYnJ/FaYmLGtDLTKEfHno
	eJXJR1sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFK7R-0000000BJZB-2TSh;
	Thu, 06 Jun 2024 20:53:57 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFK7O-0000000BJYi-2JF1
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 20:53:55 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so15522741fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Jun 2024 13:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717707231; x=1718312031; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqoEdi+5Li7qCxgZnJ0d4rFJMsPiflzcBA1WO++S0A4=;
        b=QwbVKrejANPlCT+E2K1of1WS8zesJn9kUHPn7iLd8hlQmMA8E05tMEepQ3uwZu/sTt
         EytU6IlV8xZt9q5yFdT/Phqo5tjLsETYBy+/tOm110/+IsxStd9vyzqdlTyvU622K9PG
         +1Zg+w+RWpzU3usUZr8RYnK4pga2ohVFykewgtvCuLlWhLfKNXTd9nJdBIecuoKcoyuC
         i4Bv7M+woCkhb4muHyQ+QS8WbLqx2vNxzPGNXPdFTy7x6cU1jWRl7EgDaA46DRxPRNa7
         8GtqRSWkygTEamG3fhkI1dRNC1Lj2KUgcHTK/27HauJpegF+VI0gNiMUJqIoGqspvNtN
         dqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717707231; x=1718312031;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqoEdi+5Li7qCxgZnJ0d4rFJMsPiflzcBA1WO++S0A4=;
        b=kJ6R9cKo9c7abcCCIA1QFAOYE/vo/9bXTW9cJb1Ra1jbvH88aIQb+ydIhLJYaIvMDw
         RqrQxK5+j9Dsuwqyjkl2k1T0CrAtMAU4QcFReim8gAl2lOW81Sd4VPqS6jlJr6Tbsu5c
         mjKauV7dXg/Bw7yIjh7H0BI9GwTdkTHlX28R25sP7uHAKS+iiD6FDmAfz+QYlb+F7Swt
         nDixD7xLpFsvrIe9XqF89kHYbqOZ1z2tcvGATgq5fv2bywyhYwat09Hgb5ISfrhlGvfZ
         VPVMJCSCwKzK0YzbDr8QBWaTeUojxoOBH4NEQD+qc66nZf/AnUUx/XyziaZCPJppPwtk
         Dqug==
X-Forwarded-Encrypted: i=1; AJvYcCUuqinAkcG12I8XaZRUYav7yG9TnJZoNBRKHD91fGrVYOi3p0fUEapkUKTxa/E4ye1oqAc/M07APPl0PR5bPUNoL+SWzKRH2jKuYDCPo1vQpvg+
X-Gm-Message-State: AOJu0YyPmsfka06tsnO8lMRGfu2C8YrN0/o9JXgjbIi57OIpAWQSYNq0
	TtBT3w/wIgPoTxO9QM0m9iz5OWmoEQ+QXhwgThm32Ve30XCe27a4knFQkqnwtEidrNlZlz0kj1y
	IrCbQaIHgl11cAIGgBTmXW7b2ACQ=
X-Google-Smtp-Source: AGHT+IGe+E8yRR+CT71Fsvaer0y2RqxtMLRAiJ6nUZRps3iY7/5o5Z2BUQ/38UuLanYuW7ZWdPOf501mR5Ez+VzmzyI=
X-Received: by 2002:a2e:8191:0:b0:2ea:83d1:47fe with SMTP id
 38308e7fff4ca-2eadce36253mr4325701fa.20.1717707230856; Thu, 06 Jun 2024
 13:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240606114321.30515-1-chris.lu@mediatek.com> <20240606114321.30515-3-chris.lu@mediatek.com>
In-Reply-To: <20240606114321.30515-3-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 6 Jun 2024 16:53:38 -0400
Message-ID: <CABBYNZLRWpxfrYDk7JbozC-2mZk2r3BAOkCSEfhR48AH25RkZw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] Bluetooth: btusb: add callback function in btusb suspend/resume
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>, 
	Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_135354_688056_DF6DA717 
X-CRM114-Status: GOOD (  15.42  )
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

On Thu, Jun 6, 2024 at 7:43=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wro=
te:
>
> Add new function: dev_suspend/dev_resume in btusb_data which are reserved
> for vendor specific usage during suspend/resume. dev_suspend will be
> added before stop traffic in btusb_suspend and dev_resume will be
> added after resubmit urb in btusb_resuem.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/bluetooth/btusb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 79aefdb3324d..83765c0c14b4 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -891,6 +891,9 @@ struct btusb_data {
>
>         int (*setup_on_usb)(struct hci_dev *hdev);
>
> +       int (*dev_suspend)(struct hci_dev *hdev);
> +       int (*dev_resume)(struct hci_dev *hdev);

I'd name these suspend, resume respectively.

>         int oob_wake_irq;   /* irq for out-of-band wake-on-bt */
>         unsigned cmd_timeout_cnt;
>
> @@ -4715,6 +4718,9 @@ static int btusb_suspend(struct usb_interface *intf=
, pm_message_t message)
>
>         cancel_work_sync(&data->work);
>
> +       if (data->dev_suspend)
> +               data->dev_suspend(data->hdev);
> +
>         btusb_stop_traffic(data);
>         usb_kill_anchored_urbs(&data->tx_anchor);
>
> @@ -4818,6 +4824,9 @@ static int btusb_resume(struct usb_interface *intf)
>                         btusb_submit_isoc_urb(hdev, GFP_NOIO);
>         }
>
> +       if (data->dev_resume)
> +               data->dev_resume(hdev);
> +
>         spin_lock_irq(&data->txlock);
>         play_deferred(data);
>         clear_bit(BTUSB_SUSPENDING, &data->flags);
> --
> 2.18.0
>


--=20
Luiz Augusto von Dentz

