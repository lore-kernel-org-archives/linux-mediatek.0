Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563E0EB64DD
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 20:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s70gQ0p4s2qzcV/Ayy30mLAMppe9wZRLcW8gZS36XQ4=; b=TbWlCsZ6IxM+0qAhch65Wj0PUr
	SvgePbLP6oNoGLvamNuNnrx0cOu8FVeEkMnFg8ZMQhlG5mXuE1fNjfKUhhgExVb0pK0Mwju6lQI7/
	4Hi0cwwKJC/742Q6uOGRnTiL19QfhRyd18lWNi633+cyRV9JX+xVEUDv9Jhn9GaksXf4gYqJEvKK9
	xClfnSXru/Z1fVe3Azbw/HoJrByyt3PkG4mdylmLJU8uvCAAtRinfDXHVIiVP9gDimlc5iZO0ieO0
	tfdK8shpuWOWyUDqHOIKuy0FydExrUWS9TNvxjEPNJ3X0rCjA/1zjbBshFmJPNW16zGtf0di/AG60
	g6wfxNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJgTO-001B6B-0n;
	Wed, 12 Jul 2023 20:30:06 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJgTK-001B5F-2Z
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 20:30:04 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b74fa5e7d7so2190021fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jul 2023 13:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689193800; x=1691785800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s70gQ0p4s2qzcV/Ayy30mLAMppe9wZRLcW8gZS36XQ4=;
        b=VGyrHSG2b6tsuaeeeX3cEkZDJjwhWJ79ynnf7/uO9xh85WreVk2ZLFUbn61p2Esnaj
         GwWXQHA7TBJcJ3VZK7WXnMJKgFiL9gxAnLxFAlPyuCkDORGoBETsRHrPsSgNq9BxVMHZ
         kfO5zYVlbC+BsQRmPTwkMnUup5iSGgm5ic8agWPBozbzg4deB4GlZ0+rRlp+0wyb7D/y
         Vm1zckpAHA8Nxz50P9//W5BAY0IWE4RqR6Xdplywxy7uIaZx0v7Fok6wGm0Jb+AEOkdS
         IKB7+BjXAzYk4G0o2nhTX43SZD7ZdFgbPtB8Xurbz//bTNE/HYDD9eSJY3ovxD0kkGBQ
         dFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689193800; x=1691785800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s70gQ0p4s2qzcV/Ayy30mLAMppe9wZRLcW8gZS36XQ4=;
        b=XlBd7DurvLdi+HsAxe7gaoCF4oBPgq75H+8GWY3TuU8WXh5hmgoqvoEIK9s1pbpjdP
         53xwbUMyqp9o4IuV6Yex4dM/LeUVNTKF6zW84v97nMnDJM5YS9D0lc5NlDoyJxVKQh3r
         WNyRt5XxdbgnPkqwXpUnvqtxc2YIGv4xShuza3hGm51Lw753RewYDJs5qwesFUDRPJxP
         z/9XUMTGamn9rrBcOztINXhgzCfdxnPoO3fvja7yFcF2ScVte0bMB6iJs1aeFMUcCeEb
         YeopsiMWSKtSLIyF20hsnZqLIcy6gn8bNtuwXDT6y9sLfuk78E6VICn41ZlBlqVoh+4e
         6SLg==
X-Gm-Message-State: ABy/qLbnkx8v/lAGsAjB6278jcbGuOJRMfFCmk1riVTnEcs+4sZ9ouKX
	hycC+CtHnc3iiBytt2kjnhmA1cq7NFTlFCLeXbk=
X-Google-Smtp-Source: APBJJlFYkpPdO34bvP5tNhj7U8Ffuy0IpHxP0w2CAJJ8BbRYn1IKHjOg+YHDbZpWvTYoJumFrusISnmM8jxqNNSqGtA=
X-Received: by 2002:a2e:7a0e:0:b0:2b6:d631:a1a0 with SMTP id
 v14-20020a2e7a0e000000b002b6d631a1a0mr17564926ljc.12.1689193799496; Wed, 12
 Jul 2023 13:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230712130218.376-1-chris.lu@mediatek.com>
In-Reply-To: <20230712130218.376-1-chris.lu@mediatek.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 12 Jul 2023 13:29:47 -0700
Message-ID: <CABBYNZLoJtUpAR-yKpq9a1NCTjhdgWMNSdwGd7f9jtFR0LuEAA@mail.gmail.com>
Subject: Re: [PATCH v4] Bluetooth: btmtk: Fix null pointer when processing coredump
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, 
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth <linux-bluetooth@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_133002_854879_90C6BACA 
X-CRM114-Status: GOOD (  18.14  )
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

On Wed, Jul 12, 2023 at 6:03=E2=80=AFAM Chris Lu <chris.lu@mediatek.com> wr=
ote:
>
> There may be a potential null pointer risk if offset value is
> less than 0 when doing memcmp in btmtk_process_coredump().
> Check offset is valid before doing memcmp.
>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

You should probably include the Fixes tag of the patch that introduced
the problem.

> ---
> v2: fix typo
> v3: fix bot checking error
> v4: reduce variable 'offset' declaration in v3
> ---
>  drivers/bluetooth/btmtk.c | 12 ++++++------
>  drivers/bluetooth/btmtk.h |  1 +
>  2 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 786f775196ae..9cc789272ab7 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -395,12 +395,12 @@ int btmtk_process_coredump(struct hci_dev *hdev, st=
ruct sk_buff *skb)
>
>                 /* Mediatek coredump data would be more than MTK_COREDUMP=
_NUM */
>                 if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
> -                   skb->len > sizeof(MTK_COREDUMP_END) &&
> -                   !memcmp((char *)&skb->data[skb->len - sizeof(MTK_CORE=
DUMP_END)],
> -                           MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - =
1)) {
> -                       bt_dev_info(hdev, "Mediatek coredump end");
> -                       hci_devcd_complete(hdev);
> -               }
> +                   skb->len > MTK_COREDUMP_END_LEN)
> +                       if (!memcmp((char *)&skb->data[skb->len - MTK_COR=
EDUMP_END_LEN],
> +                           MTK_COREDUMP_END, MTK_COREDUMP_END_LEN - 1)) =
{
> +                               bt_dev_info(hdev, "Mediatek coredump end"=
);
> +                               hci_devcd_complete(hdev);
> +                       }
>
>                 break;
>         }
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index 68309dfe076a..56f5502baadf 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -24,6 +24,7 @@
>
>  #define MTK_COREDUMP_SIZE              (1024 * 1000)
>  #define MTK_COREDUMP_END               "coredump end"
> +#define MTK_COREDUMP_END_LEN           (sizeof(MTK_COREDUMP_END))
>  #define MTK_COREDUMP_NUM               255
>
>  enum {
> --
> 2.18.0
>


--=20
Luiz Augusto von Dentz

