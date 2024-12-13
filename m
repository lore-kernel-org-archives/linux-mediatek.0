Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3477DE7717D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 05:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgQ1AfOgEV/WtM/A3+uz4rEIqiFfux5uHfmCT0tsGtI=; b=B30FNd8ETOTmtr7ZF0tJtUAIcM
	iAJJzWT45tWCLHqQDoCumddmHUlhywxfbFocfF5nvD7K7iki/W0fffT7f+jaiwV3BLCQKQBg2fSe1
	Lw5m5rTZbWL/T/TbU9CNRcZXHY/PdySs4ecL28WkT3B0DELdxcj0oc1o23FrZQScrc3wdxu8ArN2I
	/Mw4B3pQgHWNTICSN1DdULdr50nMXBeEB1KG31n0CDqjaDGRZ7/h5idQocyN9e8K3BeaeRnXbhUA5
	yJtesrjCiemgz2++hDKS7BZ9f5LysNRC7RKY5a3XjTPMgsADAxd7mLRcwyDnuh03jtnoeFYjNbdK9
	XwaXACbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyCk-00000002lUn-1Qgj;
	Fri, 13 Dec 2024 05:27:10 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLyCi-00000002lU8-3XTl
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 05:27:09 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5401e6efffcso1537407e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Dec 2024 21:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734067626; x=1734672426; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgQ1AfOgEV/WtM/A3+uz4rEIqiFfux5uHfmCT0tsGtI=;
        b=WxlgyHve1STPmyD3BfNrUkSpD3xhK3trZxC4D3cX+gUvCczI2QVoIqbi88VG1pyD3x
         Ki0g6xWJts+mzFIIa2BjI6FUvGhwNyGb0aUrmTW2lT0uorfHwuiIWBPPB4kxgb4Qao0x
         lw55cjgauH08Br84mQPJq28NkSlyZsi8+I4HM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734067626; x=1734672426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EgQ1AfOgEV/WtM/A3+uz4rEIqiFfux5uHfmCT0tsGtI=;
        b=SY1mpYwxAje6XALAjpGLNkGbdAr6CRMozoftDEbuw3SHfxza+CMRxVlTFmHhLf+xQC
         rB/EH7h/wRu9fk6cxna/mxZc5pJN7KGSFe+uOTDGd4e3reLmxBnmzZsGfTZaIatHJwcQ
         TaZ7rM2EzrAXyPDUiu3GDhiGE0gntlxQtCFw4dxV6FtGuvaSTkzllMcplFzhv2+hYk4p
         qbs/C0Uiljt4sDLu5vydOcTYDpn2pitDimAcSGCN69B7Fj4Le3WtjSZMrIuba17hmGUM
         hJQVTyUa1VyOez6YTONPNP3g6e3sC00Ywi46VFpTKHoLZwHljjKaH3cLOvAtjGEfGGCE
         0BlA==
X-Forwarded-Encrypted: i=1; AJvYcCUnr/Sa960wu9Duh6Y8y5ZZ0L7KOOgZW0ehL/fbopEg1hR8WwZfRZWttkymv9GyLnTXUzzhBieMrTaHli67tA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmMij8r59gfkhMjtF5YgoKI/BzykAd58xZrEz7GWOsmVgFuR4X
	kkklDQle4Q/n7bALOOkem6EDwSMxRyG3S3wGqd4s7YHN5ufa+KPLFYT1og7/HwM3siAguEgV1aH
	Ny34cBo1134oVmpJaRc/JRvtcEmbNxTqvHRve
X-Gm-Gg: ASbGnctRYeRlmAwHax4ohkRDBd9H+9GBe+HaRME+bRgk8qiUNMUqORGX1QsxVsi8YC2
	vSph6/Ytv1Zys2ZFcJFN0KZTYqvZ2XIbvFThhNlPawpTaf7o6URDfK5cLLRPKD+4=
X-Google-Smtp-Source: AGHT+IGhA9h/qMEh3kQO//+RlkgxCOjtkEXubWQ5cyZXn60MBtkXvqcni0KnjZPJqjy4n1nnTxAQnsTV3Ek/V6fc5uA=
X-Received: by 2002:a05:6512:104f:b0:540:3581:5047 with SMTP id
 2adb3069b0e04-54099b69aefmr240381e87.48.1734067626143; Thu, 12 Dec 2024
 21:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20241025075630.3917458-1-wenst@chromium.org> <173381930438.18469.15845444123528821647.b4-ty@collabora.com>
In-Reply-To: <173381930438.18469.15845444123528821647.b4-ty@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 13 Dec 2024 13:26:55 +0800
Message-ID: <CAGXv+5HY4s+0Yn35BezRWLKPnYkURhgg59eSVED1_6Z3QyQHiw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8183: Disable DPI display
 output by default
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_212708_898826_48DACB95 
X-CRM114-Status: GOOD (  10.47  )
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

On Tue, Dec 10, 2024 at 4:28=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Fri, 25 Oct 2024 15:56:27 +0800, Chen-Yu Tsai wrote:
> > This reverts commit 377548f05bd0905db52a1d50e5b328b9b4eb049d.
> >
> > Most SoC dtsi files have the display output interfaces disabled by
> > default, and only enabled on boards that utilize them. The MT8183
> > has it backwards: the display outputs are left enabled by default,
> > and only disabled at the board level.
> >
> > [...]
>
> Applied to v6.13-next/dts64, thanks!
>
> [1/2] arm64: dts: mediatek: mt8183: Disable DPI display output by default
>       commit: 93a680af46436780fd64f4e856a4cfa8b393be6e
> [2/2] arm64: dts: mediatek: mt8183: Disable DSI display output by default
>       commit: 26f6e91fa29a58fdc76b47f94f8f6027944a490c

Thanks! It seems you haven't updated the for-next branch, so it isn't
appearing in linux-next yet.

ChenYu

