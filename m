Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93A59C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 12:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8grxBs+MO474/SLS4jrDNyGbdKM56PHpds9k+Nfz38k=; b=Yz6c/TuajohUihvJZqVeZKFtsA
	6xCkIzpiC+67HN1LrGBPrd690hVQMA9kZ+/9UjFl2qfwVOX5Kcd0D7b+/p9zHp5kKCCPunJXORpAW
	ld7p/rd7SHC3PT0B88SguEGJdoPj3wkbwPyLd0p3CsHLYkH/yf7eRq19YRIrKVUTDU4oOQGCQnRAW
	6gNcxaVROxmK3pIMe/nCuTN2elM4Ri5yQQuIIuKE8QziPNbKhqARgD5G5NGeWG3nXEL67psmDZ9vT
	GeQ5/0g51809qRRpQYn8YSbWwk85RlpR4rVSB5P/uTx9vpsoTLWEOJkVm/9QfxMak+0dvQsHANFAg
	lP9Jy5Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebK9-00CNA6-1h;
	Tue, 21 Mar 2023 12:42:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pebK4-00CN8n-0h;
	Tue, 21 Mar 2023 12:42:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B785AB81674;
	Tue, 21 Mar 2023 12:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F83C433A1;
	Tue, 21 Mar 2023 12:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679402557;
	bh=J20LlY5TbVnPM0z5FlTNCPp5ZAh4UVG6euTTWc5LkUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FdVixEWY/0QvALciIzaXMuyjtTuctDu5uQnZAkKUVwbR8UBXJtwUnyxQtT/p/30ic
	 zpl55Nm+hUpZq5XJiO53LWzTvqQltae2LMbqInH9aGehkHNAgTJ164pX4YQxll3KMy
	 TD2ug+AYx3+44yAUcXSFocaJgG/jig0Jy18j4H5xsbdoMjB9gU+8MwEJ0DkP5ks6eT
	 KCLNhOoO34XSRvOPyEnyvii8NdivuEDpea1bCdkez29ZJqdilkcKgnBSN/Qfu6vbBe
	 soG30ERWWcrojAZnMfrIwsqxFHO8VOzwjVm6uKlK0AbKWOD4M/k7pMnLwbWFhV/Dwd
	 V04BWarn/LWkw==
Received: by mail-yb1-f174.google.com with SMTP id p204so5756522ybc.12;
        Tue, 21 Mar 2023 05:42:36 -0700 (PDT)
X-Gm-Message-State: AAQBX9dlGt5QgTmsW6Z7JnW4ghzIHuaDDNHulWN5vkFNqUmGvft4pJMF
	A0l02fr/ICu5VCK9ctbLy19Fx/+IpdZM27g5ow==
X-Google-Smtp-Source: AKy350ZhCPEnnrwloI2VYkVonvOVRbKLguR0+fCqDHc7mDqtOx67pDwKgadHRUXyovXV1023X8BMqxVSAgSWqc8/Yn8=
X-Received: by 2002:a05:6902:150c:b0:b6c:f26c:e5b0 with SMTP id
 q12-20020a056902150c00b00b6cf26ce5b0mr1453538ybu.1.1679402556021; Tue, 21 Mar
 2023 05:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230320233904.2920197-1-robh@kernel.org> <ZBlTJbdAmh5H3PD0@kroah.com>
In-Reply-To: <ZBlTJbdAmh5H3PD0@kroah.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 Mar 2023 07:42:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL9LYOpk88RCBJcsX5DnroOUdvXXtpwDPoabt3A1S7SVQ@mail.gmail.com>
Message-ID: <CAL_JsqL9LYOpk88RCBJcsX5DnroOUdvXXtpwDPoabt3A1S7SVQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: Drop unneeded quotes
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Justin Chen <justinpopo6@gmail.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_054240_400459_2C39F436 
X-CRM114-Status: GOOD (  12.71  )
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

On Tue, Mar 21, 2023 at 1:48=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Mar 20, 2023 at 06:39:02PM -0500, Rob Herring wrote:
> > Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> > checking for this can be enabled in yamllint.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> Or do you want me to take this through the USB tree?  if so, just let me
> know.

You can take it.

Rob

