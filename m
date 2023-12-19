Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9BFC41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 18:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1ZwhJRZ+N/d+fVkkOSiSnflGiueYMOvsJ8Gh3pY+IU=; b=eujA80HbmDDZVy5F860sLHYvQd
	nYNwbjvEfCciJjZ7loIO/ghdi/lEpD9Qa1+i/XA89zKpySZWXdCr9Qh9BmCS5S+JL3YGtnOTOdgOg
	YgH8ROI4tJFmZAaGpbLpLXLM0gbJWvbCulU/0yv/K+Ha/kPldOpWsj3L9/sJfKS/KHjvbk6Xr0u8r
	Z16xouIV3qTu9W36wCA+yQ/CGSNEGOIdE4s48BPhGwdTaNeqROeJNIcLE/10ta0CyXR8QBpwdaqlt
	iuyCTGYRwiMFfvn7LDJvxqWs9bKhW0iDw9GFyzi05BbnX4k+0mCWW+6XqmdvSHwGvJ1CJJ6jIhv4m
	bWhoVmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeUu-00F8AE-04;
	Tue, 19 Dec 2023 18:07:16 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFeUr-00F885-01;
	Tue, 19 Dec 2023 18:07:14 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2cc7b9281d1so23133021fa.1;
        Tue, 19 Dec 2023 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703009230; x=1703614030; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1ZwhJRZ+N/d+fVkkOSiSnflGiueYMOvsJ8Gh3pY+IU=;
        b=Co91GCJzV1Zy3/Ek3ybXh5vPCB18K3+Dm+9voN91X0pHqKvfgNTTz4ny5/LAsVNmsk
         iqz3WqWv4LLD1KWMX8mVNI3bpvnz7RJ9kr3FkR8VSur/03ddVnTgukUKK1qzzO314LTJ
         cmykDp317nZ8uV06gQ2kxR7pXkKZj0XYihykBy9AKo6BF6RwEoVFUtuhj9DyY/MS+2LN
         dnS59v5jBtKqmrKrOExjvd6LYd2BpJvKVgogmdxa4FFrJH1hXxWOB3IwSuPZTzROodJO
         4pOpaKF7jLMcf4NsyqhLgMOTy7MdetfHDB051QWYhYT5K/HIwrmzSnnXlmPxBLmX2hso
         A1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703009230; x=1703614030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1ZwhJRZ+N/d+fVkkOSiSnflGiueYMOvsJ8Gh3pY+IU=;
        b=WrIAY27R+qXE0WjPJ1XSYauBAlSr4AY+FAWCoqkIib5/obkonWrChSUKzMBRoyisns
         d/n2FxNOhCi1NZxGw7IE+TUkjDpFr52jBdlqyO+thoV7PnsgMAy03PAmkgnwy6fxhUhx
         kNX6uUZ58vWQuC/9IdEErVAggfFWftpdaElh4g+8255X9e40tVOyv8YBOoanGWF+MmNG
         ay3QiR04qQMwOEqrELHvTfPedUzsNlwHW7yT9VofSuYHMjKobJFc01yTIyA5wzUv4CTL
         jPEqyxrp/crtLF51mIPiFvCGjMbbwwzZVjf5STpmSDtwCq9JB8++9tBvr1FihqzpP6Vp
         fVbQ==
X-Gm-Message-State: AOJu0YxjK1XhsSOhxV4+/7tc2KH32mCUggrsIPNU/yqVx5DctdKHpQYd
	9xnT0UYO8gM+X7RkmK59wKQsIqfuwTP1pwbAdJ8=
X-Google-Smtp-Source: AGHT+IHgrHf2vtd9/nC2WuK81Zvn8uEeNd7HMPJmvdMP//OocIojGSo3xSvxYEcEm60tX4XNcioe2quihSJ1O8WT8pA=
X-Received: by 2002:a2e:b606:0:b0:2cc:87b4:3f9f with SMTP id
 r6-20020a2eb606000000b002cc87b43f9fmr498039ljn.22.1703009229969; Tue, 19 Dec
 2023 10:07:09 -0800 (PST)
MIME-Version: 1.0
References: <20231208130705.kernel.v1.1.Ic5024b3da99b11e39c247a5b8ba44876c18880a0@changeid>
In-Reply-To: <20231208130705.kernel.v1.1.Ic5024b3da99b11e39c247a5b8ba44876c18880a0@changeid>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 19 Dec 2023 13:06:57 -0500
Message-ID: <CABBYNZKOKOCzLkggM1PRXuFjsaU9-0=6WmdTxaF-s3v7WSzvhg@mail.gmail.com>
Subject: Re: [kernel PATCH v1] Bluetooth: btmtksdio: clear BTMTKSDIO_BT_WAKE_ENABLED
 after resume
To: Zhengping Jiang <jiangzp@google.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	chromeos-bluetooth-upstreaming@chromium.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_100713_062959_340A09B5 
X-CRM114-Status: GOOD (  21.23  )
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

Hi Zhengping,

On Fri, Dec 8, 2023 at 4:07=E2=80=AFPM Zhengping Jiang <jiangzp@google.com>=
 wrote:
>
> Always clear BTMTKSDIO_BT_WAKE_ENABLED bit after resume. When Bluetooth
> does not generate interrupts, the bit will not be cleared and causes
> premature wakeup.
>
> Fixes: 4ed924fc122f ("Bluetooth: btmtksdio: enable bluetooth wakeup in sy=
stem suspend")
> Signed-off-by: Zhengping Jiang <jiangzp@google.com>
> ---
>
> Changes in v1:
> - Clear BTMTKSDIO_BT_WAKE_ENABLED flag on resume
>
>  drivers/bluetooth/btmtksdio.c    | 10 ++++++++++
>  include/net/bluetooth/hci_core.h |  1 +
>  net/bluetooth/hci_sync.c         |  2 ++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.=
c
> index ff4868c83cd8..8f00b71573c8 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -1296,6 +1296,15 @@ static bool btmtksdio_sdio_inband_wakeup(struct hc=
i_dev *hdev)
>         return device_may_wakeup(bdev->dev);
>  }
>
> +static void btmtksdio_disable_bt_wakeup(struct hci_dev *hdev)
> +{
> +       struct btmtksdio_dev *bdev =3D hci_get_drvdata(hdev);
> +
> +       if (!bdev)
> +               return;
> +       clear_bit(BTMTKSDIO_BT_WAKE_ENABLED, &bdev->tx_state);
> +}
> +
>  static bool btmtksdio_sdio_wakeup(struct hci_dev *hdev)
>  {
>         struct btmtksdio_dev *bdev =3D hci_get_drvdata(hdev);
> @@ -1363,6 +1372,7 @@ static int btmtksdio_probe(struct sdio_func *func,
>         hdev->shutdown =3D btmtksdio_shutdown;
>         hdev->send     =3D btmtksdio_send_frame;
>         hdev->wakeup   =3D btmtksdio_sdio_wakeup;
> +       hdev->clear_wakeup =3D btmtksdio_disable_bt_wakeup;
>         /*
>          * If SDIO controller supports wake on Bluetooth, sending a wakeo=
n
>          * command is not necessary.
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index 0c1754f416bd..4bbd55335269 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -672,6 +672,7 @@ struct hci_dev {
>         int (*get_codec_config_data)(struct hci_dev *hdev, __u8 type,
>                                      struct bt_codec *codec, __u8 *vnd_le=
n,
>                                      __u8 **vnd_data);
> +       void (*clear_wakeup)(struct hci_dev *hdev);

I wonder if it wouldn't be a better idea to add something like suspend
and resume callbacks to notify the about these hdev states, that way
we can synchronize the states better and avoid having to clear the
wakeup state when it shouldn't be active to begin with since the hdev
is not suspended.

>  };
>
>  #define HCI_PHY_HANDLE(handle) (handle & 0xff)
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 3563a90ed2ac..6c4d5ce40524 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -5947,6 +5947,8 @@ int hci_resume_sync(struct hci_dev *hdev)
>                 return 0;
>
>         hdev->suspended =3D false;
> +       if (hdev->clear_wakeup)
> +               hdev->clear_wakeup(hdev);
>
>         /* Restore event mask */
>         hci_set_event_mask_sync(hdev);
> --
> 2.43.0.472.g3155946c3a-goog
>


--=20
Luiz Augusto von Dentz

