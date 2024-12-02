Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7366D78307
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoO40zl/s7ZnqzqIb0x9bS2VWKzdum6rohqZrbmtpKY=; b=0PSC0SJ/PsRXcxKf8kIt0lQBbP
	aYOCsQGl2Ri1p5auDLm5bu0EfmObNddamAPUZRJku22YASNVTB3N5sT/K58zqmBzpJOWoH1dLaIe5
	i6L276b0f2MnPWbVt2wRNAnm/MOI3aBoC1QitshRi4dQxe5iz41ZIZ7A3sg/NytlqvjRSTm4J57cu
	BcQjLIFXHEGkEvLwvZaQY2oS1iUd3G2FNiCuJHcF4u7+jWF44sLpWMPX4umwKQ2fGvFNqsFB3axX4
	1DQzNXTTFkAdMoyoTnUiDSBxS/oQG7YLgE6xR6b2c44cHUmU0+Xl4r/jUX9rFuuD2R+g0DC305XdS
	bmxZD+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI41e-00000005mLX-3Kpl;
	Mon, 02 Dec 2024 10:51:34 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI40d-00000005mBz-2s42
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 10:50:33 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e3995f1fe30so1597199276.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Dec 2024 02:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733136630; x=1733741430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YoO40zl/s7ZnqzqIb0x9bS2VWKzdum6rohqZrbmtpKY=;
        b=H59waj9ZahXV6L8y37MYEpQ8bfInOgJFB2EiDjzDOe8FGhM5vZgaOZB/6AYrieSjjs
         NeNBhrsrz3e8dovt61LhnpwfsCRZ9s7I2ogY9BWP5WMBnL+SyyKU7MR/Fy3dzITQ19ix
         U6spC0XPSOyCqDupIRk5ewGAuTWzrow8MyLVser8G1ZtwL2doKJ+CVn2H38ojxJ2lhbV
         RfLAaoSAWiE4nXC7Ng+ajKMdrAtChtDydvkvI4Z/93alK9R+6Qyw5FT9qdWIE387CqoH
         26ELHsUBX5ciUmmMTud9gF8JDle6n1OyJiQPkKV36RGu1cEjWbf91GiY33SZE8I+WNeO
         8ALw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733136630; x=1733741430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YoO40zl/s7ZnqzqIb0x9bS2VWKzdum6rohqZrbmtpKY=;
        b=LMafQONd5wZ+edN7nQZ+Zk9pPTS1IULSVzujYacIQi/9UOctrU8J9QOHpmgaBkfIax
         TzHXEo6AjmTaV5pYOV2Vr+4j61Bmj1hSSvKE/tg1r83afj5WhwUCLhKbh47hPhRFWnmA
         5d2TOowT0CTYWLwP9LwFfkNbmhouqYeZ1ejdNZyF51I7x0zMTJ0cVTpj3D2P9/YlQqcN
         F8JaK9omvTQBt/Di1yxdKfQjhKLNqbpcShlEzc6noqRExzY14Z+tcT9/Ot7Q0vo9a293
         1qxkwYGSIxeiQuWRBOlWoJHy1Fh8yX56ydzKt2W/D6NMFzIvJAkmKvgXUklVUmV6LYNU
         zRew==
X-Forwarded-Encrypted: i=1; AJvYcCWbEvux5JseqpXvVL1HuBKJWOiHYDr9HOyBAMhURpIQHWulD2xJKCMDVQZhG897/PFKP7vxuZSVLr+gB7w9Eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVhf8yxbiUGALtG6Tvjm18NNbxgjpbgqATZFd8hQRBTMZloBnv
	JdheFffW8l4CwF4w5t/2JShLqs8D3YZ+niHr46xzg7SKYN0d+s/bX4zE1xdFsgtPdHOVrf1+daV
	J9DEMzaW3xa2V/YpN0PYKyHyTe6y2oYvYJ1csww==
X-Gm-Gg: ASbGncu+HeCH/oe+v2RKT2xOfUy21jGqqqsXjKtuL9GEJJQoGjR36pNBKxg/FacUlEA
	Y3B015TFdE9t7MlvMY+mBkhx4RtzOvUWZ
X-Google-Smtp-Source: AGHT+IExerCQ7sAUwgoXkBOkYbDVHSC68g+nFnlF4d2JadWUyhW3V21jeoCT4WtL5P/vbC1ORnld9fcul7IdcQprIzo=
X-Received: by 2002:a05:6902:c13:b0:e33:67d8:654e with SMTP id
 3f1490d57ef6-e395b9548f7mr22613536276.49.1733136630377; Mon, 02 Dec 2024
 02:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241112105030.93337-1-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 2 Dec 2024 11:50:19 +0100
Message-ID: <CAFGrd9qe5Q60zBEXyCokcLtFQVk+qa9yajO4_gHZR381i9cVOA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Initialize pointer in mtk_drm_of_ddp_path_build_one()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, sui.jingfeng@linux.dev, 
	ck.hu@mediatek.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_025031_722699_E88A5F90 
X-CRM114-Status: GOOD (  10.13  )
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

On Tue, Nov 12, 2024 at 11:50=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The struct device_node *next pointer is not initialized, and it is
> used in an error path in which it may have never been modified by
> function mtk_drm_of_get_ddp_ep_cid().
>
> Since the error path is relying on that pointer being NULL for the
> OVL Adaptor and/or invalid component check and since said pointer
> is being used in prints for %pOF, in the case that it points to a
> bogus address, the print may cause a KP.
>
> To resolve that, initialize the *next pointer to NULL before usage.
>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

