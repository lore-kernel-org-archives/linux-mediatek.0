Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9B4C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 07:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfbJWUJGHH8nwSfPSekGj2SZwrexl9k35Jou//imJw0=; b=NN/0EWJt5eEFX6lHFFflHrxxE+
	9ogxBv/vES81IeKExDuZYf5tfYhcIgWe+blmlHBul9nKqWeMTlHy8JtLn4nixVwhM+pwnvijePHcq
	6E/wVs/vz2nKCDx/L1OyFVluODwMN1o7tI3Kl3YRoOr6iQYwSu1QdN6ly3V+N7Ei0YmGRqkJsJlBu
	h2YDG/j+AKlXi2llKKySHwaZ9Tnc5WDZqsbrlcuHVXoGMlB7+b1IOqJAAlNQ73CfGAaf97w6d+AEH
	dFHTTOIR7d4XkjGIky9a/JfixiMPRefL8i26tmd4vsW3/xnVy8l8ik1jqDaqZpAEnWYFIMcPYzck8
	Ur2O87/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paAYR-008DFV-EL; Thu, 09 Mar 2023 07:19:11 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paAYH-008DDP-EL; Thu, 09 Mar 2023 07:19:02 +0000
Received: by mail-pf1-x436.google.com with SMTP id y10so885853pfi.8;
        Wed, 08 Mar 2023 23:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678346339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfbJWUJGHH8nwSfPSekGj2SZwrexl9k35Jou//imJw0=;
        b=SRZq3YHPj7/9HEc5G/hdmOiAH/cKObd8ba0wfRV07PEPjCoUEUxJUHeBohmZbHAvv7
         r5ZigLdDFmjuKch3qWx86Y1QVVbigO95zw1uRzfUJ1AqGh0Sggu9a6HEkmLheAtE1/5N
         bUXhmMGToE1NeGe6GJwh7I0QkD/c1BynyUFvBY7+NDmKVUwyinHY37ZztWmfPg9tGb5D
         gDeBwBvBwv8mfMbe4aFtjdOR+V8cqdWKsGJJIyFYI80vz0/KM8PIAApY/sYAphhEbT4k
         9Ei7DTpGftHhyfolQ/08Akg1Ocbec7C8nuxPZnWAt/0v9o13EGlMu8Pg6WnSWsk5tqr/
         fIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678346339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QfbJWUJGHH8nwSfPSekGj2SZwrexl9k35Jou//imJw0=;
        b=AR/nO4JBVWUAtZQtnNl615EVR31oaPibf9sP5n9+de1onbvHtcMaSdOyZ2UZgi9AAr
         +jQVhq3bX4i2xGTiNhkT2m/BAK7MSHFkNVUFJzT73vWw8XOlqXk3j5gNOIGiN1y3zWez
         9/VQi+SNhp0mJa+t7D6hgT2FOBAEy5dSrVn1m6bkg+OyVvVTcNXznfZ3IyEeLNpZI+2h
         IWJHwnbYw4izT+ZqKbL3hjm0sJvpXuysLYP/QHzeydYSE6TapXzSy67/QwR6W/SDp4Ke
         ZEQtIgrCER4dBTd3d+v7TxjxT1vr6yVbSqLZkMrFupbadsf4miZqelz+wCoUOHmAy/g2
         /4Kw==
X-Gm-Message-State: AO0yUKV+awbw4LCz4jqnT7l2MmVT7GwrhvVV5M0Rcl+8GbLNwuh/Y9Sc
	BzkIwoEBZtx8s7MDDoSHUHB0vVKmS/zKcfmDp2M=
X-Google-Smtp-Source: AK7set/YWz7gZWkSMgyWc4wK6u9AzoqdFmwidNxJTC2APdBlFoKugVHoojpe26sybxvLybjN3eFc6dIyeU9+EBx9Q8w=
X-Received: by 2002:a62:824b:0:b0:61d:d277:e077 with SMTP id
 w72-20020a62824b000000b0061dd277e077mr1678177pfd.0.1678346339043; Wed, 08 Mar
 2023 23:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20230302093715.811758-1-zyytlz.wz@163.com> <d27127a1-2572-4ad4-b69c-8a6f53384009@roeck-us.net>
 <CAJedcCxYQYmORfnqcdudFKwy9hhU=mZh_d9MM7x+37ies2S-MA@mail.gmail.com> <e03134f9-9433-ab6b-170a-8ce752fccdeb@roeck-us.net>
In-Reply-To: <e03134f9-9433-ab6b-170a-8ce752fccdeb@roeck-us.net>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Thu, 9 Mar 2023 15:18:45 +0800
Message-ID: <CAJedcCy_cXh1jH4HT0hzG1NnQR5Gz9fTodAT_2trRRd=BWp57w@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-jpeg: Fix use after free bug due to uncanceled work
To: Guenter Roeck <linux@roeck-us.net>
Cc: Zheng Wang <zyytlz.wz@163.com>, mchehab@kernel.org, bin.liu@mediatek.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	1395428693sheep@gmail.com, alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_231901_496648_B18651E2 
X-CRM114-Status: GOOD (  18.67  )
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

Guenter Roeck <linux@roeck-us.net> =E4=BA=8E2023=E5=B9=B43=E6=9C=889=E6=97=
=A5=E5=91=A8=E5=9B=9B 13:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On 3/8/23 19:58, Zheng Hacker wrote:
> > Hi,
> >
> > Thanks for your reply. I think you're right. I don't know if there is
> > other method to stop new work from enqueing. Could you please give me
> > some advice about the fix?
> >
>
> Top-posting is discouraged.
>

Sorry I forgot that. Thanks for the kind reminder.

> Anyway -
> I don't know the code well enough to suggest a solution.
> It all depends on the driver architecture. The maintainers might
> have a better idea.
>

Yes, some related developers have reached out to me and discussed fixes wit=
h me.

> A worse problem appears to be that the worker is also canceled
> from mtk_jpeg_enc_irq() and mtk_jpeg_dec_irq(). Those are non-threaded
> interrupt handlers which, as far as I know, must not sleep and thus
> can not call cancel_delayed_work_sync(). I have no idea how to solve
> that problem either.
>

I'd be glad to pass along your thoughts and recommendations to the
relevant parties.

Best regards,
Zheng

