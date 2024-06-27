Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F35CC3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 06:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WrO/44CBqAi2HP/7O1C/WMYbI858ZG7/zXzzdOIbHc=; b=sd5VjRkMAzONVWdAuB6bHRJkoa
	yjc8bHNuGG/WImXzzE7axuLBaU7v/x2TPOCe8IEqdp7cYZfsLcDxhPnob4ydwu0bzljGpvPgmnpmm
	AWDh+hSHQB9N7n9Iwp2YPtLLEwvfmtYEhNEv/WRg3k7RZM//1U7utxryBQfu1704ooWeAdarKyNaJ
	yciSmoKl6UfpwpOe92mYNXm4OM51pkafb2G+9j2Bv9Bu0DMRdy2KTioF8t0Oe2nLnC/bMceVF4mhI
	p3IOYB7DNE0wStu2u3PfhFfqH0qLR1vsW0ocud13tc9uENuj5a4YDjlXdxOHZpAquyGgW1nZPj5no
	vfUJ6FRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMiUX-00000009MsQ-0VfK;
	Thu, 27 Jun 2024 06:20:21 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMiUN-00000009MqV-2TOe
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 06:20:12 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5c21f1bb810so859141eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 23:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719469210; x=1720074010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WrO/44CBqAi2HP/7O1C/WMYbI858ZG7/zXzzdOIbHc=;
        b=kTSV56ZjcqE4i5NlLB1VbsKxiBJEK2uDzbfqNmUdnGw4z7VXGQKz+4A3/DqyHtpcHY
         N2aBn+hz3QqUtLD47C88HS6QWZNLs3tpCQVjbANPerhl1RcobDJctAgclUEB/AV3Z1th
         l+5HNMxEGLOooxSMSyficuV7SrlHZcJ1gYQLCfpfpUn0vlzTAtooSvfvafkFGlBft3an
         TDCoUD+flUqqhNGHsSpiXjrVjHS6FGUsBrSNHMu9eEuGdnaA/lucstgmwyS8pM1WAUfa
         xyCMeL3uIcfbbitS4PJtjdmnNVhgWl1LqYSkHBZxw1+T5xL52uSw+N3CougohZqCXROJ
         e6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719469210; x=1720074010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WrO/44CBqAi2HP/7O1C/WMYbI858ZG7/zXzzdOIbHc=;
        b=ebLT0dr/L4TM5b2F4Au5qh8lKDIY8Ft/AfV6rMxB0JEJZXTyDpjOMFOF17KaC8S0Ye
         pErRX5HN4GyO2woYRkNY/GZY4ZSQ7EyijQG7dqBtvzc92sE25O8grZbQQ9BeYIpNyJwd
         hfGn7Kew1vuAl7k59WMYaafeNhmuDZusOiHLvYU8XMpceBymU1kseXwoqPwj/r5dma2e
         gAWc0K9u4P9yAMQ3LfjJJbmBEBTLph5NznVuJUi2sJyoaUFs6tVQX9CgaAlJboSrU0cl
         9JghwNyD7Hp1/8fhVBVzcAhxo/1ntiOLhcojkYMp53JXMiximSk8ZJ5TEgNthlCwFnqk
         ctqw==
X-Forwarded-Encrypted: i=1; AJvYcCWEGgAoBFRWoG6b8eZZAUIDS+dlm8pKRMtBug2enUXArcXRBscvHYArGEud46Nf9QtoT108lmN7kxZytLljf8husC7MhMkl0H+U6OqFZg4k+kV/
X-Gm-Message-State: AOJu0YxYTPxOmc7l+gZMaHIFTwsNfdTYB6WJNGTJGfMMQUFLWOEtfPVu
	FioijWLDwcsM6N3zwrN+byvcgtLIJbJr5URefW367hSPNSRjdv5KqE61mC0t9uU00JzsPOODBxV
	jt9xPN0XetXiW1bfNIu6kRBPTWIhgAQDhonVprQ==
X-Google-Smtp-Source: AGHT+IHHmk74IE8scGgjW1MA4yxBJ9PwOjAQ6rxjvysJIcxEsIiPlTJBDKRwr/WfkqfnKAcJVpym/JYECv9QYftiqow=
X-Received: by 2002:a4a:1541:0:b0:5c4:8b9:2c7c with SMTP id
 006d021491bc7-5c408b92d79mr790641eaf.5.1719469208123; Wed, 26 Jun 2024
 23:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240627051125.24084-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20240627051125.24084-1-mark-pk.tsai@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 27 Jun 2024 08:19:56 +0200
Message-ID: <CAHUa44G0FRwMX5BYtiBvY4XFME=8uYbNoLRnAQCO34z0LgkJSQ@mail.gmail.com>
Subject: Re: [PATCH] tee: optee: ffa: Fix missing-field-initializers warning
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, yj.chiang@mediatek.com, 
	"ming-jen . chang" <ming-jen.chang@mediatek.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_232011_653742_010465F1 
X-CRM114-Status: GOOD (  17.79  )
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

Hi,

On Thu, Jun 27, 2024 at 7:11=E2=80=AFAM Mark-PK Tsai <mark-pk.tsai@mediatek=
.com> wrote:
>
> The 'missing-field-initializers' warning was reported
> when building with W=3D2.
> This patch ensures that the remaining fields of
> 'ffa_send_direct_data' are zero-initialized.
>
> Signed-off-by: ming-jen.chang <ming-jen.chang@mediatek.com>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/tee/optee/ffa_abi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index 3235e1c719e8..1aa995752682 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -660,7 +660,7 @@ static bool optee_ffa_api_is_compatbile(struct ffa_de=
vice *ffa_dev,
>                                         const struct ffa_ops *ops)
>  {
>         const struct ffa_msg_ops *msg_ops =3D ops->msg_ops;
> -       struct ffa_send_direct_data data =3D { OPTEE_FFA_GET_API_VERSION =
};
> +       struct ffa_send_direct_data data =3D { OPTEE_FFA_GET_API_VERSION,=
 0, 0, 0, 0 };

Please use designated initializers to avoid listing all the zeroes, so
this would become:
        struct ffa_send_direct_data data =3D {
                .data0 =3D OPTEE_FFA_GET_API_VERSION,
        };

The same for the other changes further down in this patch. There is an
example in for instance enable_async_notif().

>         int rc;
>
>         msg_ops->mode_32bit_set(ffa_dev);
> @@ -677,7 +677,7 @@ static bool optee_ffa_api_is_compatbile(struct ffa_de=
vice *ffa_dev,
>                 return false;
>         }
>
> -       data =3D (struct ffa_send_direct_data){ OPTEE_FFA_GET_OS_VERSION =
};
> +       data =3D (struct ffa_send_direct_data){ OPTEE_FFA_GET_OS_VERSION,=
 0, 0, 0, 0 };
>         rc =3D msg_ops->sync_send_receive(ffa_dev, &data);
>         if (rc) {
>                 pr_err("Unexpected error %d\n", rc);
> @@ -698,7 +698,7 @@ static bool optee_ffa_exchange_caps(struct ffa_device=
 *ffa_dev,
>                                     unsigned int *rpc_param_count,
>                                     unsigned int *max_notif_value)
>  {
> -       struct ffa_send_direct_data data =3D { OPTEE_FFA_EXCHANGE_CAPABIL=
ITIES };
> +       struct ffa_send_direct_data data =3D { OPTEE_FFA_EXCHANGE_CAPABIL=
ITIES, 0, 0, 0, 0 };
>         int rc;
>
>         rc =3D ops->msg_ops->sync_send_receive(ffa_dev, &data);
> --
> 2.18.0
>

Thanks,
Jens

