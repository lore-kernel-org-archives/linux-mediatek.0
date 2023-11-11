Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 696C4C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Nov 2023 00:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdD5p4ZJ2xs0jbe3PMitwqM3ZIGCltDGGJH36M99UsU=; b=wMvIfsZTh75uJDrlzEMfzJOm4B
	vrAvsvGdG/skaMjm9fmQDVv0YiChJS0xgKdOv8lzJzwdayGxCindQ+D4KC6uRs6KqHMrsXC+BhH6m
	4pHGiNqr2s3Q2siNstlRfPk7+F0vt2HT5LGQ68sGpBy7GW4xc0H1iDfV1WiQ/W1AKaNqI8jUL/NUM
	nLDAlz0BaBBmPxo5KXK4nSa2E6YfPQfxf/dVavg3f+6BHyfgqvURZOz2Eunj706ULVEcew+XCHDtw
	Vj9fAJ2YcG2tKxix9pj7qOvl5jtoeIVVzhK8/aYWJCzieSWvEfrn4WKYJrDLGxlLehzbe92V8+LdL
	3GxdLWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1bcN-009hUq-2E;
	Sat, 11 Nov 2023 00:12:55 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1bcJ-009hTZ-2v
	for linux-mediatek@lists.infradead.org;
	Sat, 11 Nov 2023 00:12:53 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9d10f94f70bso416483866b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Nov 2023 16:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699661564; x=1700266364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdD5p4ZJ2xs0jbe3PMitwqM3ZIGCltDGGJH36M99UsU=;
        b=Ejnf/NjzJLjaF22U3LTLYJ0Vy+544+WMIbIaQNewq++XMyKHEGs5udJHtw9gUtEB2X
         X3fyPi98zN750hhXWN2XH8+T+ieY7L6tUWle7vean8iA9LZGCp1MwMVt0AUJK0CePZDF
         YYs349iGGqajfdHCfbjB/MRQDbLHlYGZW/UV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699661564; x=1700266364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdD5p4ZJ2xs0jbe3PMitwqM3ZIGCltDGGJH36M99UsU=;
        b=a0eEAOkeC2XMncjsE5MXrlwWhNhf2wHwH9+s3RZyf8LLrWp5C56VKLHd8LaXBaDt6v
         AdIeFVzF24Wborh7a5soDaM1PbFDaJicquDvCYwGsjNTSTYdgwDHtTgMUq7EdJCTYqtZ
         XP+xyw6jcTnLRt1aUXM5tLwDsdyllCw8P17CorxI4Zixf3JWWMNMSKQJ8X2+CStPo56j
         zbqnmsUCeO7kLQuQkvrcHzRM8NBHNoA3Be0ruFif4TXajmJvBD9q+WdSnwNxoY3xxvk5
         NTt6jtWKil+5sbia3LfnXQEXDArgWKzuSfbhcEe+jfxsc0ed6Dow6XJA97/2R4mSJ69e
         gf+A==
X-Gm-Message-State: AOJu0Yy3ICoZk3fHIk9fFMoqZEq2313kMujDI5zwiWX/k53l+J/2XJn1
	ti7NCVhUomCp30JCxICjyO3RhwNNPYupZi+iKxjeds6n
X-Google-Smtp-Source: AGHT+IH1Scol2eWLo7wsU3kmnJ8cfGbryAZguF0gEdVfd87w5mWmmYfhZsbvkh+ayYPCzQ0yppqkqw==
X-Received: by 2002:a17:907:76fb:b0:9a1:680e:8c54 with SMTP id kg27-20020a17090776fb00b009a1680e8c54mr327868ejc.71.1699661563889;
        Fri, 10 Nov 2023 16:12:43 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id w14-20020a17090652ce00b009ae3e6c342asm239600ejn.111.2023.11.10.16.12.43
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 16:12:43 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-54366bb1c02so2298a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Nov 2023 16:12:43 -0800 (PST)
X-Received: by 2002:a05:600c:1c11:b0:3f6:f4b:d4a6 with SMTP id
 j17-20020a05600c1c1100b003f60f4bd4a6mr5724wms.7.1699661542490; Fri, 10 Nov
 2023 16:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20231109100606.1245545-1-wenst@chromium.org> <859ac058-c50a-4eb8-99b6-3011ef4e7529@collabora.com>
 <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
In-Reply-To: <CAL_JsqK64w3+r_LJZoh50PzAUcsvH6ahSDCqgSiKrD3LBAXE9g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Nov 2023 16:12:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
Message-ID: <CAD=FV=VUZy9DaZgKafSpXXopD5k8ExGSR97BjAqC5tupPoxNfQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231110_161252_454386_B8938AAC 
X-CRM114-Status: GOOD (  20.69  )
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

On Thu, Nov 9, 2023 at 5:52=E2=80=AFAM Rob Herring <robh+dt@kernel.org> wro=
te:
>
> > > End of background from Doug's cover letter.
> >
> > I think that using "status" is not a good idea, I find that confusing.
>
> "status" is what defines a device's state in terms of enabled,
> present, available. That's exactly what we're expressing here.
>
> Now, I do not think we should be mixing the device class (e.g.
> touchscreen) into status. I said this on v1, but apparently that was
> not listened to.

Interesting. I must have missed the "don't mix device class into
status" part. Do you have a link to your post about that? Maybe
there's other stuff I missed... Having the device class stuck at the
end there was at least part of my last post [1] which gathered no
response.

I think one of the reasons that I felt we needed to mux the device
class into status was that it was going to make the code a lot less
fragile. Everything I've seen indicates that you don't want us to
create a "HW prober" node that could be used to provide relevant
phandles for different classes of devices, so the "HW prober" code
needs to either search through the whole device tree for a status of
"failed-needs-probe" or needs to contain per-board, hardcoded,
fully-qualified paths.

I don't think we want to include hardcoded, fully-qualified paths in
the code. That would mean that if someone changed a node name
somewhere in the path to one of the devices that we're dealing with
then it would break.

So if we're searching the whole device tree for "failed-needs-probe"
then we need to figure out which devices are related to each other. If
a given board has second sources for MIPI panels, touchscreens, and
trackpads then we need to know which of the "failed-needs-probe"
devices are trackpads, which are touchscreens, and which are MIPI
panels. Do you have any suggestions for how we should do that? Maybe
it was in some other thread that I missed? I guess we could have a
board-specific table mapping (compatible + node name + reg) to a
class, but that feels awkward.

[1] https://lore.kernel.org/r/CAD=3DFV=3DUjVAgT-febtj4=3DUZ2GQp01D-ern2Ff9+=
ODcHeQBOsdTQ@mail.gmail.com

