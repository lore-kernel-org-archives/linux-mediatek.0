Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98234D60CFA
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2024 22:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1MrAjucewY12Q379yzg+ry5RVZKlVViQuKVvFxefR8=; b=rE+7uyDZ/nQM2BxeTTUfMsBVzo
	NXozz2cZjHqn9IrO8kOR26MZLreKffipTZqXWKi0gtByCRQmWuislfzaE+57/12CQMw4viRaT3HHn
	gXGIcCd4UGSoDsKWwiBNc82psbnRBc6n6kDI30YcmFOsNcm4k2XhHsesFqk4nfi2q11gZ9Cklc+io
	fRRyZMuldvO61riLaZX1533yCxFTlvuXDBEY+zD9s92FO6fnUGZMABD5df010vFYELLt5bfmQQVTS
	6mMbuFZN5YVgUjbarMbr90IMbQH8bKUcMIOKPByF+WW3D2UZQoQhdUXJCkhgSAWpKDXZtopuRkS5z
	eVJaUr1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAhM-0000000Anpo-20uk;
	Mon, 18 Nov 2024 22:58:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAhK-0000000Anp2-0mAu
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Nov 2024 22:58:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fb49510250so33543841fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Nov 2024 14:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731970700; x=1732575500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1MrAjucewY12Q379yzg+ry5RVZKlVViQuKVvFxefR8=;
        b=bDU/r5I9Ed5LWytylSbdan5CrFrK39OYkn5cZ8k3jAgbuHb/hJthvr28Lu4AjYSyGG
         j6/L9y3true0U63s4rQRsP18nTCkWvCsmfhIeP7TTUUMkWp2KCFuAReGLZrnm68Gg4/e
         oA+HimVs9J41J5sbpwL4kDxfZ3z7WnjpIAjP7qTYtTH+jMQtsiJLpfiXzE6EAwM2GPbG
         FJvda4fU5mHbZg3d3PHN24bKe2nvFKfK3uoLHWXDe/lVtjONB7DTdDySRjfyomlPc/Vn
         jLla05Ycy3L0Ov+ulstF7KXQK8pntiu0rY12SiyRPEaTnYfWuAOGD5KTSmEAJGl18rw/
         ctPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970700; x=1732575500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1MrAjucewY12Q379yzg+ry5RVZKlVViQuKVvFxefR8=;
        b=eWwXbPaJeUje777iQaJt84NpusKruNIJNS+0rbR21hgBn7gwnHfTBy3n4oB5N+OZb5
         NDDXE4oDPYjqdz0HlGQSXzr68dwD9LBXLE2jAjAHCJRDRDc9EFBSa7M1n5GtMzOsbf6w
         n39+P1d5nP7zsIaYM8+MeS2zIjtvZe/rQnXVp2s/TPw5l6hxFKCkK3I9tcoo/uHqTxBL
         TkXumoLCGH5fQtFytUcwoJ/mvecSiZNJ7Z8fgLskkYfWSSxEhKDYxBUztxmGnd1K6T2F
         EXfWv2VDQM2ynU4ND8F0TAmA4j/M+wvwF2nqZLFpvzj4LzfelGy1uoU7xLGdVQ+/zJse
         Luhg==
X-Forwarded-Encrypted: i=1; AJvYcCVvKeMGMjye6jNSFhoXFK1oubIkHJrVfQd+0tIn6Jp0jOZeDiWHb/efOHcgTxDwHdZizoWx2lW0BgjTYJVIcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpEK3c5F5GErJeeHuVS3CKJcbe4TTDbuwkCCqWhfwF54cUIq4s
	xjNMOaAptNS2O1CiAEh0ySB48YgcLu++x5meKlkTxJlLBVErdZV4aJb6Qzs+0YBCOXO3XQeTqSc
	Z4TQ40gmU0G80KLfsJ5s1vo7juHBipkzWNX5Z7A==
X-Google-Smtp-Source: AGHT+IEFiYb4rFpuGVaBbq8epNGwPhP6IH9nm6hyP3jkslxVQLOCjV/16xaXHTQ8qSTvbVzxGCpcSv4sYGDo3Nb1YqM=
X-Received: by 2002:a05:651c:1b05:b0:2ff:4ce0:d268 with SMTP id
 38308e7fff4ca-2ff6064e25fmr63970731fa.2.1731970700292; Mon, 18 Nov 2024
 14:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20241117114534.work.292-kees@kernel.org>
In-Reply-To: <20241117114534.work.292-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2024 23:58:09 +0100
Message-ID: <CACRpkdaBErgRrFDWu2FSrnX9Hr=PnHvfccLgAzhOOwTdXuRjTg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Use unsigned long for bit search
To: Kees Cook <kees@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_145822_222605_04223385 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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

On Sun, Nov 17, 2024 at 12:45=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> Instead of risking alignment problems and causing (false positive) array
> bound warnings when casting a u32 to (64-bit) unsigned long, just use a
> native unsigned long for doing bit searches. Avoids warning with GCC 15's
> -Warray-bounds -fdiagnostics-details:
>
> In file included from ../include/linux/bitmap.h:11,
>                  from ../include/linux/cpumask.h:12,
>                  from ../arch/x86/include/asm/paravirt.h:21,
>                  from ../arch/x86/include/asm/irqflags.h:80,
>                  from ../include/linux/irqflags.h:18,
>                  from ../include/linux/spinlock.h:59,
>                  from ../include/linux/irq.h:14,
>                  from ../include/linux/irqchip/chained_irq.h:10,
>                  from ../include/linux/gpio/driver.h:8,
>                  from ../drivers/pinctrl/mediatek/pinctrl-airoha.c:11:
> In function 'find_next_bit',
>     inlined from 'airoha_irq_handler' at ../drivers/pinctrl/mediatek/pinc=
trl-airoha.c:2394:3:
> ../include/linux/find.h:65:23: error: array subscript 'long unsigned int[=
0]' is partly outside array bounds of 'u32[1]' {aka 'unsigned int[1]'} [-We=
rror=3Darray-bounds=3D]
>    65 |                 val =3D *addr & GENMASK(size - 1, offset);
>       |                       ^~~~~
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c: In function 'airoha_irq_han=
dler':
> ../drivers/pinctrl/mediatek/pinctrl-airoha.c:2387:21: note: object 'statu=
s' of size 4
>  2387 |                 u32 status;
>       |                     ^~~~~~
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Patch applied, thanks Kees!

Yours,
Linus Walleij

