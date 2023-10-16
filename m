Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79993CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 10:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSOsW3lqyVDGEO7YV9jDSsXKfAhrZdV4NxhIXBreaCc=; b=kWsJQWi87hxbE78GcbWLHSgY3j
	UYqYv9OTy9pYasaR29ExtD4Z+Hip+ZD0cCm+tiPc5aezZ4lG7RDBeuL6E246212tJ42TBIpYFcwMk
	pu34fxQoBWpH3wwMZAO/Ljm4nicuMJDQvTfpPgVQ9AgT0PG8832nArheZBkhXNk83KVT8qH2M08xd
	pkIMPD0oDYUysQjOtaiPnTg6e7w2uO+hUQqfMJgTl0Gt3X7DW1csq8FX49tskrW+4GiVEjK9BH1At
	Lur2Dce4O2Xo6822OoOaq8movJx3qYzGSWdjI1Dld6C77liQcRIBxD2dbsfbYhldH3rr3HkbQn69d
	ooRbNI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL8C-009OEy-1H;
	Mon, 16 Oct 2023 10:47:28 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsL85-009OAx-0z
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Oct 2023 10:47:23 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9b6559cbd74so762722766b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Oct 2023 03:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1697453238; x=1698058038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSOsW3lqyVDGEO7YV9jDSsXKfAhrZdV4NxhIXBreaCc=;
        b=aZDCY7BgeC7MFwGeSE1+UMVLX8JDtG0kOL93GbBYUn4o3KjaaTBiNZfd9bo7Edj7Nm
         uUxK5OMlRsiK1JpjSMfnZclb65rZfGKfLc6JBpnaVAJqZ65bHxsNoYwkBMWM/Uumua/f
         pQjU3qKt3S6BXXdsK7MtJvWp0vWoUzpZfFihYp8GbUH7sZVoO8hiK40cH+H2L3JE2RxB
         fT+7Sb3A97LZHdjp11ZJ3UI65eNGd8kWCKWTizpi5NwXtTkQrQ3Yusa8fDa1yUvptBpd
         g0a34v4nZf+SREQu6gjRVTzhq0DrAYOIo+pn9z6t9BCOw/NlDrj1p96VONZh1hXg+QW3
         iJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697453238; x=1698058038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSOsW3lqyVDGEO7YV9jDSsXKfAhrZdV4NxhIXBreaCc=;
        b=Equ7Xhft6dSmrKJpos/zug+Z+9WCZgMs081TG6fuE+ZDt3cyY4eK7pcSqPTDJN/AjD
         1/oQ6dHR5726zWgE9yehAx5wVLxLiUhRSbRnri7Zsqa6SJakkf2Wg2qiPBnIenW5A03t
         F31d9IWvsUspavzhpYyHfeFKybSwTmWsHGcNOYp+h5f5uDw2LUX27sWtknrQtv0tgnf6
         CXDuWOppn89POM2khJbkDhpVE+Z+xmYWsDQR+H0w6NhiO8qucfQtetY1amHysVJ+6Blk
         TyyKi681i0cn5fUMPNCuZeMCqLaLOjJ/UWz1YFNe+YfB8omhnltmf6tTbkdfWEep/9C3
         OMzA==
X-Gm-Message-State: AOJu0Yx7tqy36JWl2MKhwo4xaYVLEC6526Mpt3gEQFCOI5a2U1P5blxB
	Qf58EEAtbVF0ync9YMhg2o0M0jtqSDgpgVMa6hX13g==
X-Google-Smtp-Source: AGHT+IE4rTDIFGCtxkHDTxmHZHJipHKSAGuGG/X+qZH0l607g2QnU10hsXIs4iTRUVFldU+NJUeLfr6IQgVhXcx+8ds=
X-Received: by 2002:a17:907:2cef:b0:9ba:1d08:ad43 with SMTP id
 hz15-20020a1709072cef00b009ba1d08ad43mr19381711ejc.70.1697453237825; Mon, 16
 Oct 2023 03:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
 <20231006073831.10402-5-shawn.sung@mediatek.com> <CAPj87rMUbP12uwzyhV=94wR7LkQK4JfTB4kEMGADq2YJOk8Vrw@mail.gmail.com>
 <c3fff5bcc3a7cfeffcd86d6e2c199963a720871a.camel@mediatek.com>
In-Reply-To: <c3fff5bcc3a7cfeffcd86d6e2c199963a720871a.camel@mediatek.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 16 Oct 2023 12:47:05 +0200
Message-ID: <CAPj87rMc=3tX8Fbk4LjXmqgPfp=YX3GS64V4Sb5y84xwf3wDBw@mail.gmail.com>
Subject: Re: [PATCH v7 04/23] dt-bindings: display: mediatek: padding: Add MT8188
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	=?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	"mchehab@kernel.org" <mchehab@kernel.org>, =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_034721_559741_2415D14E 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Shawn,

On Mon, 16 Oct 2023 at 06:23, Shawn Sung (=E5=AE=8B=E5=AD=9D=E8=AC=99) <Sha=
wn.Sung@mediatek.com> wrote:
> On Fri, 2023-10-13 at 17:26 +0100, Daniel Stone wrote:
> > If I understand the driver correctly, padding is automatically
> > applied
> > to compensate for unaligned dimensions. The first/last rows/columns
> > of
> > the overlay area will be filled with a specified colour (black?) to
> > preserve the area. This is unfortunately not OK to do transparently.
> > Userspace must be aware of this policy decision and specifically
> > request it. If not, the atomic request check should fail and tell
> > userspace that the requested configuration is not possible to
> > achieve.
>
> Yes, Padding works as you described, users can assign background colors
> for the filled area in 10bit RGB format, however, the rows and columns
> that are filled by Padding will be cropped by the hardware components
> after it to avoid situations as you mentioned, so users should not
> notice any difference.

Thanks for the explanation, I hadn't realised that the added padding
later gets cropped.

Cheers,
Daniel

