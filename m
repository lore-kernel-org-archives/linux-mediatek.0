Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E5BC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2CykTjmm7r3sahhI260p/6w2uA7V4sOftOr/1tge5W8=; b=fML8DRA637rYwq+3yM/MLU6z7P
	P9tv5NEO8UR2wD6UKXS2XXuTIT1Kt3zmZ6jfxTUGk6UnoyWM73iRFDxrkQ75vWzYDv/FCOEkHLDIj
	h06fGPANcGIqiSVUuiBA7R5nSMviy7zfYUgVScNkInydft8O2QS6Gu4/h+yWmpoLxl20b1LrXRYDi
	+JNzpvX5sUHdxlhzYXILo6nRI/wNvbaf10DGJGEdPBN3pEi+rvWmT3qiE9aKikiEPLsM7OGnafjEg
	GGGIqTRZh3cSYh4WryMrfNXpbhyUPca1Yt9s0VOiZ3HcQNaHixpw0uJS0xsuBfoTEMF1iOwROj29n
	xEmjMrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9e0-00Eqdj-2i;
	Mon, 18 Sep 2023 08:30:12 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9dw-00Eqcg-1A;
	Mon, 18 Sep 2023 08:30:12 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-575f45e255dso2418811eaf.2;
        Mon, 18 Sep 2023 01:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695025805; x=1695630605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2CykTjmm7r3sahhI260p/6w2uA7V4sOftOr/1tge5W8=;
        b=kikXYNRBtDQCg5Ao1k7WFI5Q/JJQCaLsJ6DV8ZmrmiTY9/Pca+acbAtS8UwmKe+dHV
         RmOxsHvWxyMH3Wz4bzPbCKWyPyskDCgD1joXuToeXm9zqIV7TVAxzV/PjZS+vwxExzQ0
         gQ+MLRhpvZBRauJPyzhvBmqg78+6y3scfCerquZbbQFYLGsFdgzkTCZhTUF2n6ZXzku6
         pxrsmSjwlu9vnE4n4k4IpNPF4MKBQCrrZff0tA2pNVjm2UMoFgVbq4Db2WJ/gZzwmLgy
         qzswYQ3nDRwltaHyT/pngHnSafpiC+q/o4GDVBhPpE8Jaynj8IqaZJOmV4o0tIIPkKlL
         0USg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695025805; x=1695630605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CykTjmm7r3sahhI260p/6w2uA7V4sOftOr/1tge5W8=;
        b=xItwD2ZtMFfvAoAbv2Av2WBse9APYrNN7rUCaubvphDw+oTuaC7Q3mF8Ka1lCq0WJa
         VYx7srucpnUz0J6RWMUpSXgfQb7wrNqsPJ4NgBdksbCDft572mgCko5wW3vmbql/5Poa
         36z6iI/2e3aLJEbsr8KASqGlyvHqzmrjk2qsx6iDTIn0hiRIAPbOnJvsvZlau4dt/FbK
         PnXNWKL72sbqPi/Qn+6ll/iBFhj/r5Bsfb2xX4UwFQTsmL3N6Ymw4darizlDiHI7CzVK
         akokp0DgIbXHeVssYV5puWUsThEtPr/WzgRDxidNaeiHZxV2Z8+ydVdZw5O6GVbWgiFj
         WH5A==
X-Gm-Message-State: AOJu0YzXScfDvb7fV+psbcBujK71MmefHpitmLUp2ITSj9j/A0DAs6ch
	fbcQPYUvEAr9EiFzaPIYGFH4BVVu928m9u1IEt0=
X-Google-Smtp-Source: AGHT+IHd3O6UWBhTfjMpeyY7l/jNxI1rxA5vGGYYhuI3QEm+rbwzZV3V7t2xnSEqW2T43g98zxSn8zCrKLmuUgWJnko=
X-Received: by 2002:a05:6870:3906:b0:1d5:f814:567b with SMTP id
 b6-20020a056870390600b001d5f814567bmr9383856oap.5.1695025805604; Mon, 18 Sep
 2023 01:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230917162837.277405-1-arinc.unal@arinc9.com>
In-Reply-To: <20230917162837.277405-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 18 Sep 2023 10:29:54 +0200
Message-ID: <CAMhs-H99_O5jt7j6kHhKYfO3yQDXHKqzb=Gi8GDzJDxCs=JYuw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mtmips: add deprecated ralink,rt2880-pinmux
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mithat.guner@xeront.com, 
	erkin.bozoglu@xeront.com, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_013008_406145_85AEC19B 
X-CRM114-Status: GOOD (  10.89  )
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

On Sun, Sep 17, 2023 at 6:29=E2=80=AFPM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.un=
al@arinc9.com> wrote:
>
> The "ralink,rt2880-pinmux" compatible string applies to all MediaTek MTMI=
PS
> SoC pin controllers. Add it as a deprecated compatible string.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml | 5 ++++-
>  .../devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml | 5 ++++-
>  .../devicetree/bindings/pinctrl/mediatek,mt76x8-pinctrl.yaml | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml   | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml   | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt3352-pinctrl.yaml   | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml   | 5 ++++-
>  .../devicetree/bindings/pinctrl/ralink,rt5350-pinctrl.yaml   | 5 ++++-
>  8 files changed, 32 insertions(+), 8 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

