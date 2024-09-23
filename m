Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45B5CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0Ef2pUJCIL3aYIls9LM/0/HuZV6sRLvGWfXRnJJRsg=; b=tFIhJQ9sV4jGxaz8dAUx7n3BAN
	rp9Z+x0RbeTigtmWNRyKLaaSOw03OVjVZ7kIAYnmp25ev/WhnIvhVOaNuiiVKlcjiq2/uf/k1kX6h
	ivN39r6iw+cR4T62uvnSDtVs08SK2KtcMzFpUZ4w+MNb0o2cS8JITVHm0FPAkWKTmUYUt9yezhuOR
	CsANPvbxBaeeOzIt9XktMGwqQdUtQ3HcvJQHuwxY8Dbg6ZxjnLxe2Dko8g8nSVU7JqDz+UmrD07Au
	u74cmj+ecpG8MVU7D3wDYBMklW/ObeWNRjE6EyAnoG/TVzy8X6ACQHyGPr4XSAq36g55spgLUkeVe
	yuRQrV6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssf4e-0000000GmGy-3VBg;
	Mon, 23 Sep 2024 09:09:40 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssf3O-0000000Glpb-0ruO
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 09:08:23 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-846c588fa63so874907241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 02:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727082500; x=1727687300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0Ef2pUJCIL3aYIls9LM/0/HuZV6sRLvGWfXRnJJRsg=;
        b=mBzdo6GA4MWnmgq2KVGdWKJukWN65Wf4RV1qEuSZUgm84WvWRY1E+B/ny0QD3jMXeZ
         gfKWayvn5zWiVcf1zjatPTgu1kcRll6K4W+XTA1wa4byAVJbhg77NNNX3ruFyNLhq2vz
         pzC+dE8hMqeGItQHvL/ZnT8f+QOe93zoN3jnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727082500; x=1727687300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0Ef2pUJCIL3aYIls9LM/0/HuZV6sRLvGWfXRnJJRsg=;
        b=I+764adVrUnE6aGXFCx7DpL4drfaFPIj3dt2dq5afkP2YSB0OaNwJL8bSdY4AR94Iv
         3MQxK2KkOfbJ6RwgphGBx1/PqfIgScqKTVaPSaxnoKRfzQaY5HWaqn269gyGkmJS2AKa
         jcmvlQa0CA87r+hV7PuVQbToyMrZKKsed0ZmylzWKPBbfRtk0CQqL8yuRhLwYQQCAQRE
         3FhqT8QdMMi37ufzErERlBHdBtAcQn0GXJBjJPkvuBhyazJXUT5nVcgKIvF9YxauArur
         3M7X0BzHaskMaabaD6E6Ckg/VhceLo0ZS+OqboTWtOwWSlPDUNF+Jc1TpWzQho6XFgMu
         IfTA==
X-Forwarded-Encrypted: i=1; AJvYcCVHdW28gBySz4YxU0fL+ucxdt8RE4muOSlVhFJAGo0oBqcWoPyXMGWlAWvV/FQwv599n+ew5fZljkKmX4jiOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweGhAtiG37F2LuvzFRO7Xg1sLA85+yQC1znkTKQsiifVa9t+yi
	ZlZwDaZ5MUmzVR2zCPXdTiqMnQwtszuhtM9dQt4sa6DdtHh8mLYlTnb+Wkih0BHbmPwRbjPaTEI
	=
X-Google-Smtp-Source: AGHT+IGcWbXOaKMtpqLdLZ89YMkYmIX7fGwV5BrUkYxvVNxehpEXqbRICJ4DCew74E5911++0dte8w==
X-Received: by 2002:a05:6102:304d:b0:49b:ccfc:6b5 with SMTP id ada2fe7eead31-49fc7547155mr6890849137.9.1727082500227;
        Mon, 23 Sep 2024 02:08:20 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-49e6b4403e9sm3375372137.23.2024.09.23.02.08.18
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 02:08:19 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-49d385e7549so1536405137.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 02:08:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqi7G3Nl2ZAC8aX8uqH3za4vTw+v4iD1QA1O/hBbrDTQdFODC5AyoSQSvqDgoYs9R9C4vjwaGwWcZtmxMlGg==@lists.infradead.org
X-Received: by 2002:a05:6102:5088:b0:49b:a93d:3d0 with SMTP id
 ada2fe7eead31-49fc7511684mr6579342137.1.1727082497908; Mon, 23 Sep 2024
 02:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240831055328.22482-1-zhi.mao@mediatek.com>
In-Reply-To: <20240831055328.22482-1-zhi.mao@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 23 Sep 2024 17:07:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh76iKhMV4roBe4mLTrq-eHqz-3-fYWzNcWAETvj-JETA@mail.gmail.com>
Message-ID: <CAC=S1nh76iKhMV4roBe4mLTrq-eHqz-3-fYWzNcWAETvj-JETA@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: improve suspend/resume switch performance for
 GT9769 VCM driver
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com, 
	yaya.chang@mediatek.com, teddy.chen@mediatek.com, yunkec@chromium.org, 
	10572168@qq.com, ot_xiaofeiw.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_020822_256600_5EBFD030 
X-CRM114-Status: GOOD (  20.15  )
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

Hi Zhi,

On Sat, Aug 31, 2024 at 1:54=E2=80=AFPM Zhi Mao <zhi.mao@mediatek.com> wrot=
e:

Suggestion for the new patch title:
  media: i2c: dw9768: Use runtime PM autosuspend

to better describe "what" this patch does to the DW9768 driver, not "why".
Also there's nothing to do with GT9769 in this patch.

>
> Chromebook camera AP can switch between video and photo mode,
> the behavior corresponding to VCM is suspend and resume,
> it will cause camera preview is not smooth during switching operation.
> We use autosuspend function can fix this issue.
>
> Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> ---
>  drivers/media/i2c/dw9768.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> index 18ef2b35c9aa..7449d29df901 100644
> --- a/drivers/media/i2c/dw9768.c
> +++ b/drivers/media/i2c/dw9768.c
> @@ -374,7 +374,7 @@ static int dw9768_open(struct v4l2_subdev *sd, struct=
 v4l2_subdev_fh *fh)
>
>  static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *f=
h)
>  {
> -       pm_runtime_put(sd->dev);

Call pm_runtime_mark_last_busy() to update the power.last_busy field
for autosuspend to work properly.

> +       pm_runtime_put_sync_autosuspend(sd->dev);

Use pm_runtime_put_autosuspend().
Don't switch to the synchronized variant without reasons.

>
>         return 0;
>  }
> @@ -490,6 +490,7 @@ static int dw9768_probe(struct i2c_client *client)
>                 goto err_power_off;
>         }
>
> +       pm_runtime_use_autosuspend(dev);

Add pm_runtime_set_autosuspend_delay() before calling
pm_runtime_use_autosuspend() to avoid rapid power state bouncing.

Regards,
Fei



>         pm_runtime_idle(dev);
>
>         return 0;
> --
> 2.46.0
>
>

