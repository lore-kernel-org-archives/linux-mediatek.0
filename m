Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F288CF258E
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLf9Ev/wQgipDcZlw83jwm5kLXK/zBmwzvq/PiQYMQI=; b=QkKoj+PBlklSqlISm4Oq0HwdPf
	jYdlahkQb+80TDdLRfLp70pZeBdbjfSBgWi8tSZ9RinYw2gEXzszV76bc+kpwXBdho+p+QPe/pin9
	v40VPkJrzyLhf0a9LSfAX5Ay6dRZNpqDOdOYnv0tk1obMGE4afKbvAImkRe+X57eNowSdNV6BMFXl
	UDbiEUPs1FVk9pxDMF/KHGfRK9V2P2Mn1XDhDk57T5wntmZxPTtVaQJfXZw6+9aM31BMxdjDZ7OeU
	hmr/nr1IwEaA5HyEN+t38QbpujdAqY2oxIdYHS20D7lSZIHdZ1XCQo+O5GcviR/DiyFr4tqrvIctr
	yPh+/ROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t05kj-00000003EKe-2B4Z;
	Sun, 13 Oct 2024 21:03:49 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t05kf-00000003EJx-488r
	for linux-mediatek@lists.infradead.org;
	Sun, 13 Oct 2024 21:03:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539e59dadebso1772912e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Oct 2024 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728853423; x=1729458223; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLf9Ev/wQgipDcZlw83jwm5kLXK/zBmwzvq/PiQYMQI=;
        b=XMuP4tzP4P0c1iNAcbGSg+zX2iXl7olam3qWHECsnQnzO2h1IAO+qaHWTsD3D9tSA3
         9RK0kP/vS46h0kxefKjdTyfhANfpVuQh9k5hlCxTCe+cy5wDIZPkw1UEJ2BsI89zrkAs
         Iz+AgvQR6/l38LbT0KH7rE3yGUsloP5hylLayANon80mu4BTCeFd/fm3L6ZdBDy/q8rV
         yfjwF6Jv5HzgJDLB3ees82sMGQHatNG25TzmNzUVfrU6figtjVQ7BaxaUOwwe3hQVE4t
         2Dir34aDUcawyGZsuYuAfvkv9byGKyFF/W8rBy5pUmeoy7jMzFlBQnQbCiLcQmJ2hXnu
         PJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728853423; x=1729458223;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLf9Ev/wQgipDcZlw83jwm5kLXK/zBmwzvq/PiQYMQI=;
        b=Eb01qJRsrGDO0pFc+8UXcOoS1BOOAe6bM7YYLJl2KqX1M8ROrekaPEbgffo2g5aecH
         OE+pnvKDbvxFr0RcWsjbIMKRfehJYQXAxx16BAcQHQ9nBig1mJ2uhRpQxnr7LDW+uRlc
         Qj6OLsmKIKs1pFJ1nia8CNNstSbHZ94kZ6AFeYSgYZ7gL2qwXCV3cJopVkLHh6kg70TL
         8ArhIBifIow2Ll+1SGUfrrSRW/sk8L2K4N/OmKZqyhSZpR1W4gzAvPffniDydjirX1e9
         rtQCdlVSuzWtAlMNIZgKXvDedvGWVeK/+TdDWwVZL2EP4mEv/6mIlBSyDtX5wqafnvgu
         jibA==
X-Forwarded-Encrypted: i=1; AJvYcCWedQMlg5RjkTtVGT2zfU1MdSzR/GDnkLDOMLr6n3TOFLVrXogVZpQO5F83p79KPV+xOwLkYyOyOZNRlXAukg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv45F22Yi/SLz727R93suHr6awE1uiJKsqvhVeWIsS0j5Q93ia
	iOaKeQKEWXc8oIGKvLzWVqTJK6S0kT53hU4J0CcRveAIdn3yOhNai25RYOEW52Zr3nUKb2memtI
	1WR6R1RETpuVX4BtdLfQL35bkLde6+Ic+2wfRYQ==
X-Google-Smtp-Source: AGHT+IFa3Un5SUZOY+WLd4u8uuT8jEO8T34DA1v0bhROVGdMNVLjn6uobn3EByZ64OPzccOgb3Fhg81/qWo8P87tPkk=
X-Received: by 2002:a05:6512:1193:b0:539:e65a:8a7c with SMTP id
 2adb3069b0e04-539e65a8b8emr1533379e87.58.1728853422775; Sun, 13 Oct 2024
 14:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241013-en7581-pinctrl-v6-0-2048e2d099c2@kernel.org> <20241013-en7581-pinctrl-v6-4-2048e2d099c2@kernel.org>
In-Reply-To: <20241013-en7581-pinctrl-v6-4-2048e2d099c2@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 13 Oct 2024 23:03:31 +0200
Message-ID: <CACRpkdbCBJVQsSwYJPBpjbpNvxUportnxxKObb-cYjqcSTpOFg@mail.gmail.com>
Subject: Re: [PATCH v6 4/6] dt-bindings: mfd: Add support for Airoha EN7581
 GPIO System Controller
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_140346_029345_DEAA4207 
X-CRM114-Status: UNSURE (   8.61  )
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

On Sun, Oct 13, 2024 at 12:08=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:

> From: Christian Marangi <ansuelsmth@gmail.com>
>
> Add support for Airoha EN7581 GPIO System Controller which provide a
> register map for controlling the GPIO, pinctrl and PWM of the SoC via
> dedicated pinctrl and pwm child nodes.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

LGTM!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

