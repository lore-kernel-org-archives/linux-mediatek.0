Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF436F5A8C6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 20:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPMesXK6zWWUdv1z0+n4FdWvrPSk0fKkgxZCyXQ+qGI=; b=QQnsef6aB/EFWIKavl4kvG34jE
	LqqEYZm4/hCeD0KMZO+ko7f4tYJrSAE14orNXm6eCfpofQCu1DWRmkQzAyRcB0u1pEhx8IQdDBNmx
	FTAZKSSoZivjVLIRKEutO3TEkfK6voXFwQCs1nXCZ2am+Xyq89sPCaPVpQxzA41EiJA30k3IdOYgD
	u9VHmUh47Cnxa3wOuKYD8C63UjmnoMT9cRPWJwBgkhdcOlYMZ8KXZutsiKhGFRPNMxU88jClE6uU3
	JoZT1k/00Vt8fYgVRtld+hcn6aInYRB8mGt0W2yfcOaLrzHf3ZNW4UrP/IUKCdSYW6/uOmtetPDsp
	Rdn8ZsRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvRY-00000007dY0-2iMW;
	Mon, 20 Apr 2026 20:42:08 +0000
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEvRV-00000007dXc-21By
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 20:42:06 +0000
Received: by mail-yx1-xb134.google.com with SMTP id 956f58d0204a3-65006c99d38so3330690d50.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Apr 2026 13:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776717724; cv=none;
        d=google.com; s=arc-20240605;
        b=iex0PUw2xrw32yixDck0ApxiykYNci/DF6+4acANeTGM8gY8a4WE3rGnhubZ8IGeeH
         Jn9Bobm/mI9TkrfpJngDwzPYz08UiLIwlOZa7d9QL1n1fRyyJN1YwULJBOt1++n7x4Xu
         v16veLzdpdgbJYjY9/CpHKd7XWaxLfCLxpRYR/lYp2cfQxWsE+lkK4HUUBVz83p7BUlf
         O0upA40B40Cc6YktZUcUB6hm4MN91eamIZlBVK3u+ZUwZ88YPi/eYURha35gtvNmOR6r
         qHr8jpFeUc+imrAUMT5eT5wzc8wsicgi/qi8g9fhgxZEnLamdRyCQQwKjgDWcf5eoGbG
         0naA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YPMesXK6zWWUdv1z0+n4FdWvrPSk0fKkgxZCyXQ+qGI=;
        fh=0nEpECICOFHwZcJcUj/+vCgCBXCONNbUf7JscK2a7Mw=;
        b=KyOem8Yh/9SRykHS3hbcBudGbxpHgGFJjiwB+o22+4MVW+3WEeW/MZkhoRaH1xKyME
         ip9RkmJaKPqCeGOJ/l2D5PsVjSL1CXfVx2DMN/gvIDPgEBnYHOhha551KxxJreT3b6Yn
         EnNa4BRXoHGejtslGTjJ5JsWM2Dotz/sUSBJOc1n/PHnB/laAWo2Y4cSdhXWdeQ+2aZq
         DechqQCgAWyyx9jZIj5LfG2l7KIvNn4zsZrj81pJF5y5me5cx7GaCUP2Qn2M2odFFHdY
         m2WiPrCMLp+kQKRMk86ZIlzbi18KKT2l2d+ePnPi3tg7pBSnZN9RpD1ZqEp7sn2kcMx2
         V1tw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776717724; x=1777322524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPMesXK6zWWUdv1z0+n4FdWvrPSk0fKkgxZCyXQ+qGI=;
        b=AP4BNAbOyqS0qKr4DZifNsTI3XvGDfnaA3GjtlOjVfIQiGBQTAtwryWgZAygHAaP5Y
         6bKLjh1rg0H8Gj8ox6EACvYegtUV9TAxuqzUgclQAikc881OK/o9Uvdq4vyEPBXzkmtO
         O17Xn52KvPcNaulSNpc2NB/U8O0yLD3uiFv5520/hzeI0fkAYIFZeWc5I8jb4SI4+Rke
         qbi8qmdda7JCP4faG92Gliv02Jk4tKR0ZWpS2kvBkJRFh1QtR5Pn1n5GQ0tyAc4ccynp
         N6rgWJDinhLsUen2pVbhdb1JhHLEh7bSmdhJ4OYXr9lrTLqj4LRBa8L7B0UaOwpriafI
         nGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776717724; x=1777322524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPMesXK6zWWUdv1z0+n4FdWvrPSk0fKkgxZCyXQ+qGI=;
        b=OMyFzO+EZeT9Mz9cbGHAXFXxDJX6ZfuZo5t9kcwHe9HGVjdTdPj0INJsRvhLi13kDR
         bFTSblImZWTtPlxl4yxnEO6K55g2dSDOpGqBhF5m0jtkEnWabvC/lYm9ZwlqWZXlmYlr
         OFZF952a0uVVeDh63cp18t7Hpu7DK0VQXjfXS+OHz/uSXn5iA+PSCkayQP3k8Chn9NOB
         e7kQRavBnqwj2e2THoUztqDbGW1f52ClSpPyLzG6X+AMzr6N/+o5ye3mBCWBmOGT9gk5
         eCwLB49cRd5DBJeLqh1LDqPFfBs2wdD2vqM4FK4BXqrd6DtFILY6YKNo72yInQUzwzkq
         63rQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sBcMQEULT7GGhjyX9uYD2taZn7qM+3sPHVpoSSNu+vM/cr6NYWQzII7XDDxykXNAoeZ+koExEJTIWS/omfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVR1QZv1yRIyP7rSTPjgECPN5lsLexSRymZIKF36xLbJ9FqGgF
	7LDbw96m0c/SItIVUxdYmBTuRSuECiareglPFsbp9zTGA2V3w0Um1+WfgBcwcfVSv4VX9+hJ5cO
	WUnwjnrawAS1iRzMRUZ3CCYRIyzNZY7Y=
X-Gm-Gg: AeBDieswjysl1cdrVWoMvvMMeToQ1bZKu0E5XLvEhqL//F2CGlAooQeIU7CkuLtQSEE
	eF2cqzCTDxnLFrtThgSpHQEKH3gLtfzFV90+GtW5w7m62weRAJikmWErWU/J3/AkgGVz/L5jwg9
	QKtH23eRbwIqIesVrUxTlKD5hbhOUu9w8cQp/4Q3EuLkkXuL1pmRaj32pOEA4iiMT/U2FfOOEk3
	FygAgdahuwkKcAHPzeZ/zZmZ6GOXSxuYpxyu2mkJ22ky5caGjXHp9qTfDACENGGbNPOX+FgOgLq
	qrEeXLn48DtJdngXLhf91+Ws6WGkvcMRxBye2LVSNnz9oK4sEAG2FQx2bHAXG6iVAB8yb9EkGy6
	68ZYF
X-Received: by 2002:a05:690e:1688:b0:643:1a5f:aaec with SMTP id
 956f58d0204a3-65310a71a75mr14572943d50.47.1776717723702; Mon, 20 Apr 2026
 13:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260417102919.2549352-1-tristmd@gmail.com>
In-Reply-To: <20260417102919.2549352-1-tristmd@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 20 Apr 2026 16:41:52 -0400
X-Gm-Features: AQROBzD_GQxwoxVdlYB8b6d_zTcStlFgzMZlZcqFbSiUktCCzUOkh_n5AZI2Cjs
Message-ID: <CABBYNZK5dsj7oTpXAgJ1mOBYBvN+haDK0okR7ed33QC=Td18JQ@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: btmtk: validate WMT event SKB length before
 struct access
To: Tristan Madani <tristmd@gmail.com>
Cc: linux-bluetooth@vger.kernel.org, marcel@holtmann.org, 
	sean.wang@mediatek.com, mark-yw.chen@mediatek.com, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_134205_531259_FF04577C 
X-CRM114-Status: GOOD (  16.60  )
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

Hi Tristan,

On Fri, Apr 17, 2026 at 6:29=E2=80=AFAM Tristan Madani <tristmd@gmail.com> =
wrote:
>
> From: Tristan Madani <tristan@talencesecurity.com>
>
> btmtk_usb_hci_wmt_sync() casts the WMT event response SKB data to
> struct btmtk_hci_wmt_evt (7 bytes) and struct btmtk_hci_wmt_evt_funcc
> (9 bytes) without first checking that the SKB contains enough data.
> A short firmware response causes out-of-bounds reads from SKB tailroom.
>
> Add length validation before each struct access to prevent OOB reads
> from malformed WMT event responses.
>
> Fixes: d019930b0049 ("Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to bt=
mtk.c")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>  drivers/bluetooth/btmtk.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 6fb6ca274..b1a96ebae 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -695,6 +695,12 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hd=
ev,
>         if (data->evt_skb =3D=3D NULL)
>                 goto err_free_wc;
>
> +       /* Validate SKB length before accessing WMT event structs */
> +       if (data->evt_skb->len < sizeof(*wmt_evt)) {
> +               err =3D -EINVAL;
> +               goto err_free_skb;
> +       }

Can't we just use skb_pull_data instead?

> +
>         /* Parse and handle the return WMT event */
>         wmt_evt =3D (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
>         if (wmt_evt->whdr.op !=3D hdr->op) {
> @@ -712,6 +718,10 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hd=
ev,
>                         status =3D BTMTK_WMT_PATCH_DONE;
>                 break;
>         case BTMTK_WMT_FUNC_CTRL:
> +               if (data->evt_skb->len < sizeof(*wmt_evt_funcc)) {
> +                       err =3D -EINVAL;
> +                       goto err_free_skb;
> +               }

Ditto.

>                 wmt_evt_funcc =3D (struct btmtk_hci_wmt_evt_funcc *)wmt_e=
vt;
>                 if (be16_to_cpu(wmt_evt_funcc->status) =3D=3D 0x404)
>                         status =3D BTMTK_WMT_ON_DONE;
> --
> 2.47.3
>

https://sashiko.dev/#/patchset/20260417102919.2549352-1-tristmd%40gmail.com

We should probably check if the comments above are valid and have them fixe=
d.

--=20
Luiz Augusto von Dentz

