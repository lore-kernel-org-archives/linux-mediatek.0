Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 387C3C3DA64
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Aug 2024 05:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCDSMY7BT7wntpsqPsFrSxhoevgzeOq2oCwZ5SgFJUo=; b=uEWs1p4S4aokX7D8TfhgUxmZxB
	s53dDY7vs3b0dt5qSkNGHxILs32qR60ScZN9vPY/mpnzja2L3USUj7uE/HFUaQmgsqVgLNLYQfBwv
	ULpwqRM8TE/Y8/t0lyWUxk9z/Sa5xSY1mmuDJsUdcZFXSACkJHD2b4H7gVmkFx33/ebgAeH65FP5p
	j6OV6kI1xy14gGSWEcSjkyjYyY18PPqS08vf8RgRaH2gF55W7yhzV2kBbmXivH39PZCpp0ly/zVcV
	VmNswb0jbaBsEpuYdlJeXhJTBDcFi8W4KdfG9+whMb8JQlKd3MlS7vheBsPHAHeUrm2YfbmhYZmbs
	2GOLIF8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbCQU-00000000Y17-3CML;
	Tue, 06 Aug 2024 05:08:02 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbCP0-00000000Xf8-2ls9
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Aug 2024 05:06:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52fc4388a64so178383e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Aug 2024 22:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722920787; x=1723525587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCDSMY7BT7wntpsqPsFrSxhoevgzeOq2oCwZ5SgFJUo=;
        b=TOBPwHp7lMdluCEjKoN8LssV2g/8fVrMV1wdSBx4cPw/1pV4zxLm1UxpEvMf3V9tu/
         vpJiNyLMSSy7X0Lz9r5nZdM6MrJauoDne85EI0TtIY2Huk56IuJHu0UAOm0Nor7BQN6T
         hBczk1+jy4b/rcOUVhc1jt0KeGIVeK1ZwTNjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722920787; x=1723525587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCDSMY7BT7wntpsqPsFrSxhoevgzeOq2oCwZ5SgFJUo=;
        b=QI6u9bSw66+xyyM8PDNHLonhPfy+eWyoVEvgy1v/pT1ewTcprRbAjW3UXf4Fn//Duy
         LZbs4j8Vje8v2pIM3AoSopsc4HLK/SKNW3lCkNmT/fEa+r/a2lfbtnZIqxdS80ODDjXR
         bAro1JsNVPa6WwDItyhXoR5ocR4s5YuH6S08XBh14BfACVCV3UTSm0eJcbMJ0/2zCZlD
         malzPWz2/fBNRzk2rlOnG+49BJma9ZpnOZ9ZjiiUxm+cRYvtXt/Z7X/QcFcf4CvNyELN
         +hn2muEnDcKEIM1Rg9dnvbVn9i6T9Y8CRb1P0nBVmKGbNok6Y1N0nwRF5+XdGFHykuQr
         IYVg==
X-Forwarded-Encrypted: i=1; AJvYcCXhIfs4vRYPZzXa9zVmSA/Bu90XtftVUMQW3TwNWub4HDT6RigMrqrXo73bPsUeGuY1l8kTpdHGnkWusVrURG+yFVS39HjBTM8d2v9LE+DsIxmI
X-Gm-Message-State: AOJu0Yz08ofEPYsQi2fONVnv7mrIXrt+gVDjC9h/PsDI9zpOmLAf9rXa
	K+agi8A1ywCvHd3uPckbRxPG+79UysjwBEOXrL4GzRwFJMfC8f53/km2baPDWPEovksza7m4fcc
	=
X-Google-Smtp-Source: AGHT+IGA1UVsMahv3VgFM0Zl7+IKxtd04HeWOhdOOjhZdanJpn1GyocoCj/kK491nk6MhuyWFlSTEQ==
X-Received: by 2002:a05:6512:b01:b0:52f:31:c2a3 with SMTP id 2adb3069b0e04-530bb36b73cmr10547581e87.12.1722920787021;
        Mon, 05 Aug 2024 22:06:27 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b83b82c210sm5563268a12.62.2024.08.05.22.06.26
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Aug 2024 22:06:26 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso5513666b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Aug 2024 22:06:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVA64I2TkC+Uug10WIbIP63oxWyRdouzrBnrg+vrrwyB1NHKnnjehIJ4xxbDYKnRSQpqYjc7xJxW/dg2GOPzRttov+KtvCRB2+iQWPwda71ScGu
X-Received: by 2002:a17:907:d29:b0:a7a:c812:36bb with SMTP id
 a640c23a62f3a-a7dc4da6efdmr1175852766b.8.1722920786049; Mon, 05 Aug 2024
 22:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240731-jacuzzi_dt-v3-0-1c4314e8962f@chromium.org> <172243932855.488108.1466847928167694223.b4-ty@collabora.com>
In-Reply-To: <172243932855.488108.1466847928167694223.b4-ty@collabora.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 6 Aug 2024 13:05:49 +0800
X-Gmail-Original-Message-ID: <CAHc4DNLwUAzrE-1-7oH2DHR6fvz4x9ZVaKbjUo6rOy3-kjUadQ@mail.gmail.com>
Message-ID: <CAHc4DNLwUAzrE-1-7oH2DHR6fvz4x9ZVaKbjUo6rOy3-kjUadQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add kukui-jacuzzi-cerise and kukui-jacuzzi-stern
 DT and dt-binding
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sean Wang <sean.wang@mediatek.com>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_220630_785019_5953C074 
X-CRM114-Status: GOOD (  13.91  )
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

On Wed, Jul 31, 2024 at 11:22=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Wed, 31 Jul 2024 10:47:24 +0000, Hsin-Te Yuan wrote:
> > Cerise is known as ASUS Chromebook CZ1.
> > Stern is known as ASUS Chromebook Flip CZ1.
> >
> > They are almost identical. The only difference is that Cerise is a
> > clamshell device without touchscreen and Stern is a convertible device.
> >
> >
> > [...]
>
> Applied to v6.11-next/dts64, thanks!
>
> [1/2] arm64: dts: mt8183: Add kukui-jacuzzi-cerise series boards
>       commit: 4ba6d1539fdd709ea8e8478c37b014e663cd6894
> [2/2] dt-bindings: arm64: mediatek: Add kukui-jacuzzi-cerise board
>       commit: ac90896833b52ff58c81727f57ed3cf9ffb9db86
>
> Cheers,
> Angelo
>
>
I'm sorry that I just found out these two devices will not be
launched. I sincerely apologize for any inconvenience this may cause
and for taking up your valuable time. I kindly request that you
consider dropping this patch series.

Sincerely,
Hsin-Te

