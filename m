Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74F6C072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 20:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMCXFclGcLK2XWRhjGnvFkwVtcm+D581tPNKMzDFIwY=; b=NEKVa5paih0+nx7srQWyk2NCgq
	02kmMaGr2NhLQDEMiujSl8X5AXWPKamXvvaHzFm82cW3k/HrZjpeLE5J/NEYNo2jKev/Paf+O8dgB
	H/vW90rGpTlEqoXkR9MjQN4BnbxaCapjhHzAaXFoUPSKZyuqhksI1bH9m139W88YlFR86192ZE0HB
	IzKreeC7/XHA6CfpBT808/6ClgIvAn9A8nd4DoQ9+7zBRHZpp6Xpb63wAu8ixtxoitaZQt9W98Ir8
	Ng7XLf1IT90x96qSB/A/yMoM+g3nnCFGk+s5eEdYURuj9GesFmSJJfadQKeAcUEmPMhww0wRrwjHS
	b7pXyD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ml4-001h72-0n;
	Wed, 15 Nov 2023 20:45:10 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ml0-001h62-2E
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 20:45:08 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9dd6dc9c00cso14703666b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 12:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1700081102; x=1700685902; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMCXFclGcLK2XWRhjGnvFkwVtcm+D581tPNKMzDFIwY=;
        b=GPzyrcvuCbCWxEhAys28wceiC5xv0AEw9nAf+WpQvSTbKix5asz+FP2GZg40/+J7ai
         nzNtNGrnK0757LYlyviiedhY78tn9LYyb2FRGAVwJFkpArm8mks8+dT+CH1y1PzcyyC7
         LlsPkS8rTiYU1mJDVsL5Dm79gpBPHaXjfUvaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700081102; x=1700685902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMCXFclGcLK2XWRhjGnvFkwVtcm+D581tPNKMzDFIwY=;
        b=tgLDovPkHdVbjpKavzpLiVUvR+8INnDjjUA0kGs3PexU8pyj444R5eeInptRymNlo+
         FD8/sTD6eIGQmRpCWbYUvxtALzmclXf2sqdcEXye/lNGX97/+q7XdOLcb7Z7xyMDWpOT
         9XHQeruJufQwjR+u/tHsHLKaUL5q4nj4CxylNwXTM4JBDzIK8EWC1cuLurHeClkuQ+f7
         Xo8vckPPJX96YFDFUhndH1qYAPYpwLc/EBSIcAQjBz6Xmwj3EtMQeTOqdnB8IEC6DOJ9
         OTlsmugE6+CJiQlvDkl48tcxIR2CKGNTnyVVT1yhKdTBbynB6CI3O3OvlyKk2AqRzS75
         /sxw==
X-Gm-Message-State: AOJu0YwnAVTkmgwQzS9E1JswPn5NazzPSfcSe28gB+tv8YgKBoMPwMPw
	HYdhqQqprS4r2lTAXvI3UJM73aJWiNuIZKpioMD1cj0f
X-Google-Smtp-Source: AGHT+IErk0YUGvSWSqlL5Fnz+RcOW5sQrN68iz4/3KCRFxnjG6uCDYJTM9xy9wIdLF0gvS6UzQcVHQ==
X-Received: by 2002:a17:907:3e96:b0:9da:f372:4f6c with SMTP id hs22-20020a1709073e9600b009daf3724f6cmr386008ejc.32.1700081102090;
        Wed, 15 Nov 2023 12:45:02 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id r26-20020a1709067fda00b00992b2c55c67sm7514227ejs.156.2023.11.15.12.45.02
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Nov 2023 12:45:02 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53eeb28e8e5so3047a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 12:45:02 -0800 (PST)
X-Received: by 2002:a05:600c:3b23:b0:408:3727:92c5 with SMTP id
 m35-20020a05600c3b2300b00408372792c5mr11547wms.2.1700081081263; Wed, 15 Nov
 2023 12:44:41 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
 <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com> <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+puq20EWkQg1RTs2zfmh4DGbqz1krp+19c=wPXnLT5dA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Nov 2023 12:44:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com>
Message-ID: <CAD=FV=X-17COQ2-tycV1bSuCrGy7MJ88Un8nA-a-ODexvgi9TQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] of: Introduce hardware prober driver
To: Rob Herring <robh+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, andriy.shevchenko@linux.intel.com, 
	Jiri Kosina <jikos@kernel.org>, linus.walleij@linaro.org, broonie@kernel.org, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, james.clark@arm.com, 
	james@equiv.tech, keescook@chromium.org, petr.tesarik.ext@huawei.com, 
	rafael@kernel.org, tglx@linutronix.de, Jeff LaBundy <jeff@labundy.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_124506_760039_4A58551C 
X-CRM114-Status: GOOD (  20.34  )
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

On Wed, Nov 15, 2023 at 2:28=E2=80=AFPM Rob Herring <robh+dt@kernel.org> wr=
ote:
>
> > So if we're searching the whole device tree for "failed-needs-probe"
> > then we need to figure out which devices are related to each other. If
> > a given board has second sources for MIPI panels, touchscreens, and
> > trackpads then we need to know which of the "failed-needs-probe"
> > devices are trackpads, which are touchscreens, and which are MIPI
> > panels. Do you have any suggestions for how we should do that? Maybe
> > it was in some other thread that I missed? I guess we could have a
> > board-specific table mapping (compatible + node name + reg) to a
> > class, but that feels awkward.
>
> Node name is supposed to correspond to device class, so why not use
> that (no path or unit-address.) and nothing else (well, besides
> "status")?

One problem is that I could imagine having two second source trackpads
that both have the same i2c address. That would give them the same
name, right? I guess you could maybe come up with some sort of suffix
rule? Like

trackpad-1@10 {
  compatible =3D "elan,blah";
  ret =3D <0x10>;
  status =3D "failed-needs-probe";
  ...
}
trackpad-2@10 {
  compatible =3D "goodix,gt7375p";
  ret =3D <0x10>;
  status =3D "failed-needs-probe";
  ...
}

Then I guess the class would be "trackpad"?


-Doug

