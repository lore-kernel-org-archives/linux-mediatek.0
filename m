Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262DED1715D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 04:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtKhiSbi539gpYrHXAAkHxczz0yx9HoWEP1SfArti/I=; b=FVeN9KymSZiRH8
	yjDazYOYF8QVdojRoh8OkbA5LNwavsijQq2IaT0q37PpguK4BJ9ZB5/K6t07Zqe/MG3MbjamXkoCR
	Hui3IAjbngfYxuWeuEq85QHOE51BU+Z7tz9EMzf4Lm2kCzOeXvUB5MiS6hCePt4aRBaOFd7m2MYhm
	C5T7oPoUmguvzwr9kvdMsyoQu+O/rszRUQJ3OpZt+jw+LzNp+hxg0h4uba4czKIgcHaC9QwPvegNi
	Tkalw6rYOZUc6wIkszWB1RBno2yY9BxcYEhPRDkKRrRVdPDjmBDKkjBOv8X+M2CZ2HND2brq8qkCx
	LceAefKlJY2IQiX9TBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t36z3-00000009bdC-0DTK;
	Tue, 22 Oct 2024 04:59:05 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t36xX-00000009bVv-1AAF;
	Tue, 22 Oct 2024 04:57:32 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e63c8678so6231627e87.0;
        Mon, 21 Oct 2024 21:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729573047; x=1730177847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MtKhiSbi539gpYrHXAAkHxczz0yx9HoWEP1SfArti/I=;
        b=a4+t0S6X25hbbLaA+69sLau0JzhsN2XK9XBnNCPdhovyPykAP5RyR+whdewLp+p0cQ
         MYwn+26RMDM6mFq9YxwYTuTT/yCafrsknYbj26LkUY12LHS+8Nslzr6jRzKW3GRoO5eN
         FwfraiIcbKFUI3ehUHdWAt+ZrD2jMJoaF/6YNF9WNR46RNo8Fe6nvm2N+tYgu0yrPMov
         hlj9AbDtDnqB1C0Spl/S9Z2CTVzHzXuT/vp+r3ejbBRkogY39ls2V5tUY+c/CVmPsQKt
         obw9xu5RO7zK/R10z+RD1wXIPFKVHLNggn+JjCJGJNtoydOAu563LWTF0LEOZ2Mzhf3G
         WUfw==
X-Forwarded-Encrypted: i=1; AJvYcCW9iB7+JbSnSV2+GvLBjE5vA0K/h6HEbEmRhYZfvkTNeonLrStWh7nuLmG/BDoFwC/zheCx7k6fQ3NfNFjw9Xm+JQ==@lists.infradead.org, AJvYcCX3d+q9Ycyl2vqh/x/dSspystddWxgWo3HRbwnVGbl6yaKWGiFitF6IsuBL0VGyCHHmLtBzZYqgmOxvnrtlggaR@lists.infradead.org, AJvYcCXpPfeOqZJirDeu6eBwe0zRZFBY7TS7ZDIEy6HBnwRCSl+cZO4usr0aZVvTFZ1J60TpLZbqriwybPEK7QZEBd0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzI7kaNvvRKkLZYX31eBnBegEoYneyK+oh7fYOzpRyhleeHbWdz
	sGu3ubVPAp916kJRV1QHZHb73ty+Coit7k49LTnUMS/vZ5Z2TCNfW2RBFhxg
X-Google-Smtp-Source: AGHT+IFfUrTXrmAjaVqc13R/TD2Pf0G3pfk09FMcGf6ilCy54Hq+ZzAfwGkCADKMQ1hyuvDq4McxOQ==
X-Received: by 2002:a05:6512:b14:b0:52e:9b2f:c313 with SMTP id 2adb3069b0e04-53a15495a0cmr6888834e87.22.1729573047098;
        Mon, 21 Oct 2024 21:57:27 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a223e58aesm654114e87.28.2024.10.21.21.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 21:57:26 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so50559831fa.2;
        Mon, 21 Oct 2024 21:57:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUN9hWIQKzO9+oF9nOATvOpgEEC1PvS95HciYD2XdmdgilxxXZblYnZksB9RB2rlaPD9wICKCIizBBPP+eMTGG4VQ==@lists.infradead.org, AJvYcCVqtPY4YMDCW6dDcAA0YRTMz9f3QF3ioAexSrpDPyJWi42T5xEHvaTuB3B+MTuZT8Pjmgew8Agh29wNKx5miUyi@lists.infradead.org, AJvYcCXMi84k+1Kokdr9jr56nu+4NGfEf/VgJGDVPhpErCCpwC8D+HdDZim3P8hkrB6XBs5Z8PisFmic4qPLe47bvSY=@lists.infradead.org
X-Received: by 2002:a05:651c:551:b0:2fa:d4ef:f222 with SMTP id
 38308e7fff4ca-2fb8320b662mr54455541fa.38.1729573045773; Mon, 21 Oct 2024
 21:57:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241021-input_automate_of_node_put-v3-0-cc73f636e1bc@gmail.com> <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
In-Reply-To: <20241021-input_automate_of_node_put-v3-2-cc73f636e1bc@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 22 Oct 2024 12:57:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v66b60moJjOP9Fo6NRAC=WA3fTBd-EJ0JifTsgz2Kocq0A@mail.gmail.com>
Message-ID: <CAGb2v66b60moJjOP9Fo6NRAC=WA3fTBd-EJ0JifTsgz2Kocq0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] Input: sparcspkr - use cleanup facility for device_node
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hans de Goede <hdegoede@redhat.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_215731_341362_0E97922F 
X-CRM114-Status: GOOD (  17.97  )
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
Reply-To: wens@csie.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 22, 2024 at 4:28=E2=80=AFAM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Use the 'free(device_node)' macro to simplify the code by automatically
> freeing the device node, which removes the need for explicit calls to
> 'of_node_put()'.
>
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Not sure why I received this patch, but given my recent experience
with the cleanup stuff,

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/input/misc/sparcspkr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspk=
r.c
> index e484d79b5597..8d7303fc13bc 100644
> --- a/drivers/input/misc/sparcspkr.c
> +++ b/drivers/input/misc/sparcspkr.c
> @@ -182,7 +182,6 @@ static int bbc_beep_probe(struct platform_device *op)
>  {
>         struct sparcspkr_state *state;
>         struct bbc_beep_info *info;
> -       struct device_node *dp;
>         int err;
>
>         state =3D devm_kzalloc(&op->dev, sizeof(*state), GFP_KERNEL);
> @@ -193,13 +192,12 @@ static int bbc_beep_probe(struct platform_device *o=
p)
>         state->event =3D bbc_spkr_event;
>         spin_lock_init(&state->lock);
>
> -       dp =3D of_find_node_by_path("/");
> +       struct device_node *dp __free(device_node) =3D of_find_node_by_pa=
th("/");
>         if (!dp)
>                 return -ENODEV;
>
>         info =3D &state->u.bbc;
>         info->clock_freq =3D of_getintprop_default(dp, "clock-frequency",=
 0);
> -       of_node_put(dp);
>         if (!info->clock_freq)
>                 return -ENODEV;
>
>
> --
> 2.43.0
>

