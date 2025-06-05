Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49E4C5AE59
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jun 2025 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXP3dNqPGQQsfKgK51gP7p8UAzBomnIrsXoU67ZMfks=; b=U9fQUTqqpbEdB4vIzzQ5f0OrdR
	BY4izlDYaeZ4mvdpD8TdMNIRFst85LLixlBakmcuJ8MBtuHkukOqZf2oA28kerKUJ7L5Kp+5miBeV
	Yneev3Tbn31a52jXJ//sPgGp5a+qKGscMofzLBzrgxWt6GX/RcxFwKGoJc1G9GZccKGPd57j3rdO3
	WcQUV0YTY6kay3WQyueFXaZ6OdevgcjF/MSjIA9wXDkEUsyqlrsW3lFME6u8WZO2HjYyoBqS2SMZd
	daJpoXY3w0JSxHZez/0h6lPrsnhIEczUJfIPkSERs6vdQiX/i+c+2/Q2z3wfg5q9WOQvdFVnUMdpC
	MCZh3XuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNJg0-0000000Gloi-2OfW;
	Thu, 05 Jun 2025 23:07:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNJfy-0000000GloM-3Trh
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jun 2025 23:07:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E758B5C5115
	for <linux-mediatek@lists.infradead.org>; Thu,  5 Jun 2025 23:04:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F49C4CEEE
	for <linux-mediatek@lists.infradead.org>; Thu,  5 Jun 2025 23:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749164829;
	bh=UjLXllv38/ayKRtbAWXghoX9UubiwAPwtQ/5ByY7WO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gTyDyg82GjLyXm/+Xxw/6fn8ww+WbctvOE+3TX+ie5+J62OvLYMs1tBwFQZykqjve
	 rhNH2xxgyxgWSXTrphrAvhG2GaHD7i+/qARTw8MbWoUCOed6Z0+DcveLnEun0e93al
	 9TJzalzM+0cjUMNFeVKLO2ddXsVabHyI3a/s2Dw6V4mnTVSkL90Z+1ctB6v5Pcv78w
	 WQAK55Gf0j1ASW/k/RksJstuTiRfFjveOZf2LP7fc9fg3dqr0FEMyW09qjnjWPg7RN
	 26j0ovNuOEOBkjbQfi1ycHcBBa9XEI8CPrIH/cn378tJFBgnSUN6IDwqJYqn2bWIrP
	 meZpQgD67+19g==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-addfe17ec0bso432510466b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jun 2025 16:07:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7yz62dYAbCELYTolecTQL4iVtBSk7gWT0zc9ydBPZg/YR7LVcnyJzrdBdCqLw1tBx15UH71tRsbOSApihBg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxpu9Ey8gHPTn9NN3t4/TyO6z8LuqicofTyIDwtTju1+utV6HEL
	fk8QR3+XtJhDy50N308HlSPSK0y9MlCXAXIRaeWKV2nQkiBTLnY/hBZOjQeItK9kt5e8OT0O7Nm
	gaXk7mjpLxgxYcQHJDNCQ2PrEWNNNJOA=
X-Google-Smtp-Source: AGHT+IFIM5DEQ+EkB7ri9jbdCbyDdUJyhKpoLC7kSNlWUiKgDPJdKpTqwabqWJxyxg7eaYnsk2EL7BA/44mVHgFfQqY=
X-Received: by 2002:a17:907:7204:b0:ad5:4cde:fb97 with SMTP id
 a640c23a62f3a-ade078b8726mr489091766b.29.1749164827849; Thu, 05 Jun 2025
 16:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250605095300.22989-1-ot_zhangchao.zhang@mediatek.com>
In-Reply-To: <20250605095300.22989-1-ot_zhangchao.zhang@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 5 Jun 2025 18:06:55 -0500
X-Gmail-Original-Message-ID: <CAGp9LzqkcH6KQq+TcaTGgK-4oK6XU8pzPB4j35en+df3beAhzQ@mail.gmail.com>
X-Gm-Features: AX0GCFtUAdwu3cwpHEFg1KUpSQ7ERv8IK0VFNhN73qLZQD_L6lIAxORQHnGsedE
Message-ID: <CAGp9LzqkcH6KQq+TcaTGgK-4oK6XU8pzPB4j35en+df3beAhzQ@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: BT Driver: mediatek: add gpio pin to reset bt
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Chris Lu <chris.lu@mediatek.com>, Hao Qin <Hao.qin@mediatek.com>, 
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_160710_959166_5CE7ADC5 
X-CRM114-Status: GOOD (  33.95  )
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

Hi Zhangchao,

Thanks for your recent patch submission. Could you help address the
following points?

1) Add a revision history
each patch version should include a clear changelog under the --- line
to show what has changed since the previous version.

2) Remove the "BT driver" in the prefix
To stay consistent with the other patches we've already submitted, the
"BT driver" should be removed from this prefix.

3) Update the bt-bindings document
Please also add or update a corresponding entry to the bt-bindings
documentation in a separate patch  to describe the "reset-gpios"
property and "mediatek,usb-bluetooth" and how it is used.


On Thu, Jun 5, 2025 at 4:54=E2=80=AFAM Zhangchao Zhang
<ot_zhangchao.zhang@mediatek.com> wrote:
>
> This patch provides two methods btmtk_reset_by_gpio,
> btmtk_reset_by_gpio_work for mediatek controller,
> it has been tested locally many times and can reset normally.
>
> The pin is configured in dts files, bluetooth is reset by pulling
> the pin, when exception or coredump occurs, the above methods will
> be used to reset the bluetooth, if the pin is not found, it also can
> reset bluetooth successfully by software reset.
>
> Co-develop-by Hao Qin <hao.qin@mediatek.com>
> Co-develop-by Chris LU <chris.lu@mediatek.com>
> Co-develop-by Jiande Lu <jiande.lu@mediatek.com>
> Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
> ---
>  drivers/bluetooth/btmtk.c | 60 +++++++++++++++++++++++++++++++++++++++
>  drivers/bluetooth/btmtk.h |  5 ++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 4390fd571dbd..88e588f1b95b 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -6,6 +6,8 @@
>  #include <linux/firmware.h>
>  #include <linux/usb.h>
>  #include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
>  #include <linux/unaligned.h>
>
>  #include <net/bluetooth/bluetooth.h>
> @@ -109,6 +111,60 @@ static void btmtk_coredump_notify(struct hci_dev *hd=
ev, int state)
>         }
>  }
>
> +static void btmtk_reset_by_gpio_work(struct work_struct *work)
> +{
> +       struct btmtk_reset_gpio *reset_gpio_data =3D
> +                       container_of(work, struct btmtk_reset_gpio, reset=
_work.work);
> +
> +       gpio_direction_output(reset_gpio_data->gpio_number, 1);
> +       kfree(reset_gpio_data);
> +}
> +
> +static int btmtk_reset_by_gpio(struct hci_dev *hdev)
> +{
> +       struct btmtk_data *data =3D hci_get_priv(hdev);
> +       struct btmtk_reset_gpio *reset_gpio_data;
> +       struct device_node *node;
> +       int reset_gpio_number;
> +
> +       node =3D of_find_compatible_node(NULL, NULL, "mediatek,usb-blueto=
oth");
> +       if (node) {
> +               reset_gpio_number =3D of_get_named_gpio(node, "reset-gpio=
s", 0);
> +               if (!gpio_is_valid(reset_gpio_number)) {
> +                       bt_dev_warn(hdev, "invalid reset GPIO, use softwa=
re reset");
> +                       return -EINVAL;
> +               }
> +       } else {
> +               bt_dev_warn(hdev, "no reset GPIO, use software reset");
> +               return -ENODEV;
> +       }
> +
> +       /* Toggle the hard reset line. The Mediatek device is going to
> +        * yank itself off the USB and then replug. The cleanup is handle=
d
> +        * correctly on the way out (standard USB disconnect), and the ne=
w
> +        * device is detected cleanly and bound to the driver again like
> +        * it should be.
> +        */
> +
> +       if (test_and_set_bit(BTMTK_HW_RESET_ACTIVE, &data->flags)) {
> +               bt_dev_err(hdev, "last reset failed? Not resetting again"=
);
> +               return 0;
> +       }
> +
> +       reset_gpio_data =3D kzalloc(sizeof(*reset_gpio_data), GFP_KERNEL)=
;
> +       if (!reset_gpio_data)
> +               return -ENOMEM;
> +
> +       INIT_DELAYED_WORK(&reset_gpio_data->reset_work, btmtk_reset_by_gp=
io_work);
> +       reset_gpio_data->gpio_number =3D reset_gpio_number;
> +
> +       gpio_direction_output(reset_gpio_number, 0);
> +
> +       /* it requires 200ms for mtk bt chip to do reset */
> +       schedule_delayed_work(&reset_gpio_data->reset_work, msecs_to_jiff=
ies(200));

4) Just to clarify  since schedule_delayed_work() is asynchronous, is
there a risk that the reset may not complete before subsequent logic
(like firmware loading or hci setup) begins? Would it be safer to wait
for the GPIO reset to complete explicitly?

> +       return 0;
> +}
> +
>  void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ve=
r,
>                            u32 fw_flavor)
>  {
> @@ -364,6 +420,10 @@ void btmtk_reset_sync(struct hci_dev *hdev)
>         struct btmtk_data *reset_work =3D hci_get_priv(hdev);
>         int err;
>
> +       /*Toggle reset gpio if the platform provieds one*/
> +       err =3D btmtk_reset_by_gpio(hdev);
> +       if (!err)
> +               return;

5) We need this fallback to ensure that even if reset-gpios or
mediatek,usb-bluetooth aren't defined in the device tree, the platform
can still boot and operate normally. This helps maintain compatibility
with existing or older deployments.

                 Sean

>         hci_dev_lock(hdev);
>
>         err =3D hci_cmd_sync_queue(hdev, reset_work->reset_sync, NULL, NU=
LL);
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index 5df7c3296624..8a265ce367d1 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -179,6 +179,11 @@ struct btmtk_data {
>         spinlock_t isorxlock;
>  };
>
> +struct btmtk_reset_gpio {
> +       struct delayed_work reset_work;
> +       int gpio_number;
> +};
> +
>  typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
>                                    struct btmtk_hci_wmt_params *);
>
> --
> 2.46.0
>
>

