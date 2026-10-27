Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829D0606A31D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IeQAVc9t;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aRVxZp1k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=; b=IeQAVc9trLcq5A
	xwioAJM3eZYMC84LVsuVR0assSbZ7TUoVkOq6c5e7JDDuGA6mMaOUDD5WSiJUmMP/3UBorNo6E+Lb
	16M8VtUqg27ZCQW1SVISqAz1EDHpkKAjMKnGhQ+VUpTKHBKAyRB3tqniA/uWStftNX76YW98gsxdH
	sZL+eEbs81hXpO8NKn1oLi1xiDH1vmwKHmPfxp6O2TY9rcSUgDvP0JXowlWvaCJErB1UXqwpJul/+
	h3l+sE+1fi6KA2lidmLKekjMqWEyZQ8Kj26FPKZOGrB52ZOt4MbXwO/wFrC+WYMQi/j69w8FpiEy7
	rKSKS6nH/N43Q9iwlLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhdZ-00000004xYe-06Wd;
	Tue, 27 Oct 2026 13:54:49 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhdW-00000004xX6-3icd
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Oct 2026 13:54:48 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c434376dbebso183388666b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2026 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109285; x=1793714085; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=;
        b=aRVxZp1kO2fJU6L9BRbkKKDOO8G5M9enU1AKhd3wjfikPW+YlvYl+x548EdMWAGbZn
         7X1wEY/DVKkfM9N9DR36qqpgQSGcxrNI6FP/KL2A4WH5hvv7YFMn/KKPME81RyzLm9/H
         x+GqbFSyNzJekjDTBeG9Our79Qd7uVTjJMauWsFfVMr/LCTjQUXHMv/QWjBRSXHOH4U+
         euHUy0mxqX3f3sTYfVVIeCUjCAS16/0Kdn+imnVBdT0rgISe/7bnqjcvh6m4SFZLCfS7
         6mpiqnBr61BT31tZZAA6CfyOazwZe0ws7HH0Pj45hCuFtXMNkxIzAbImvf03dMFIcDCi
         K8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109285; x=1793714085;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4z9ZlSdwg17sm44uHSAYAhxQN3qoO9h/AHW0OnMDTE=;
        b=GuAiYnKFXhAKYwyV4ZmoH0SFmM1EBNh32wnll4KgPIcKom1yAyFq5taDlPJh++uSBn
         vpaaA25ARgfPmSMetyQRc6/a/B/SE8XM4OZ1UFDqeFdm1qMy42SiU7N7BWx7QHGWQc9i
         qFiTA5tTJ8mDnTv4mb5v4fioVLfe6rAHVpSlqByhlPgyMpC0WYT1QnwzFaTyGhAEBYGS
         YGXqyVHm+MQDpPOK6pI4k5EjJo5wwuFg9NWImc3wOr4zCfe6nFnYBt8C/sQpeB9oTpqx
         vo1H+H05FNfBiI+6xcDe/cx5qkKADjY02Hw4n8SSRARORrq+eCP/m1uv/XM9vDC3LuHD
         V2wQ==
X-Forwarded-Encrypted: i=1; AKwUvByhIYkMyKZvaXZnBLRmd9OQMxk7TbEii3anv6yjkccL2CK/QTidHLdnTLue4UcnTYuKyr/3cRdlxCr60xeh0w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6uFxnCOSHv9isyZVWeCy0yQsvuaoAxIpmbJiMZBQWpOmhI4aM
	9Gjg1R6cn8x5ZaX7Qo56ZUdVSYPMgdQut/Zl65zdcZxKSdsuvUqHukFn
X-Gm-Gg: AYBFou0+KKEaig4Oo+Vqe/gzv5Do7ZKFBiI/70SGvN9OQi5l+5OBdat8HXYrQc2bRJZ
	jANgW43uRRF5wEMFMkaOmDxLWzvOYx4LKqJsp6tQKfuoPFWSqCvdgYIJ5Gsz5eHUqaaJgYxt4Aj
	ukLGjroqYzyumtsVe0m7dhJgBon63/C12YOfhCnqq6E1dzU1dk6RpYaWO9qopAVyQn+DotZdx4Q
	vbGH1pmCGxf+abkrVCWgFN9rnaN5AkSDcldkdZXgyiLkE5pTY0apCNlt9DfXXcVGwRYWGR1e2Kd
	upESafHXbo7MX+pTNrGaDbKSGFjKNGe169j+xO8iJ+NYyA4h6vh1nwf7UWlGCJidD2I7uz3z2ls
	5/3HlPTJ7W4RzABROtncifo8yihnBf20f06hi1BNnhQmrnmwUmNWR/24t8Jw6sfanj387Dxceab
	xnnuvUXzhTbyGd0fqESyYnIlGZIOiCfmXrZRv/ILsrt/6CwIXyYPPk+nYegNxwWIE1C0YFTShd9
	A0dfr0/fVKjNslkJOWDaJbxuOEx6erJDiFrQPBP4G/kkDiFrznKQXqFkJ9k5OAao/6G/8295j0u
	E88GqQMu2DjWtvOl
X-Received: by 2002:a17:906:c111:b0:c26:1cfd:4244 with SMTP id a640c23a62f3a-c49a735d022mr244123466b.11.1793109284644;
        Tue, 27 Oct 2026 06:54:44 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b49640f1b9sm59352a12.19.2026.10.27.06.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:44 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:54:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stefan Roese <sr@denx.de>, Andi Shyti <andi.shyti@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel
 stack with reduced page_len
Message-ID: <20261027135443.575faff1@pumpkin>
In-Reply-To: <20261022193853.670625-1-ansuelsmth@gmail.com>
References: <20261022193853.670625-1-ansuelsmth@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_065446_949571_661C3C17 
X-CRM114-Status: GOOD (  19.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 22 Oct 2026 21:38:51 +0200
Christian Marangi <ansuelsmth@gmail.com> wrote:

> When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
> stack data is copied and written to REG_SM0D1_REG. Equally on the read
> part, an unnecessary read is done.
> 
> Guard these extra copy/write and read for the page_len to fix leaking
> uninitialized stack memory.
> 
> Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/i2c/busses/i2c-mt7621.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 0a288c998419..9ea5e3f9a763 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -144,7 +144,6 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  	u16 addr;
>  	int i, j, ret, len, page_len;
>  	u32 cmd;
> -	u32 data[2];
>  
>  	i2c = i2c_get_adapdata(adap);
>  
> @@ -186,6 +185,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  		/* transfer data */
>  		for (len = pmsg->len, j = 0; len > 0; len -= 8, j += 8) {
> +			u32 data[2] = { };
> +
>  			page_len = (len >= 8) ? 8 : len;
>  
>  			if (pmsg->flags & I2C_M_RD) {
> @@ -194,7 +195,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  			} else {
>  				memcpy(data, &pmsg->buf[j], page_len);
>  				iowrite32(data[0], i2c->base + REG_SM0D0_REG);
> -				iowrite32(data[1], i2c->base + REG_SM0D1_REG);
> +				if (page_len > 4)
> +					iowrite32(data[1], i2c->base + REG_SM0D1_REG);

1) Why is this using memcpy() rather then just get_unaligned_u32().
   (Yes, short transfers get tricky...)
2) Have you checked whether the hardware requires both registers be
   read/written for correct operation.

David

>  				cmd = SM0CTL1_WRITE;
>  			}
>  
> @@ -204,7 +206,8 @@ static int mtk_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
>  
>  			if (pmsg->flags & I2C_M_RD) {
>  				data[0] = ioread32(i2c->base + REG_SM0D0_REG);
> -				data[1] = ioread32(i2c->base + REG_SM0D1_REG);
> +				if (page_len > 4)
> +					data[1] = ioread32(i2c->base + REG_SM0D1_REG);
>  				memcpy(&pmsg->buf[j], data, page_len);
>  			} else {
>  				if (!(pmsg->flags & I2C_M_IGNORE_NAK)) {


