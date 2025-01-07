Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DB4E77198
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2025 15:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=; b=2/SATgbt0JJZjzvCol0RKBB28w
	hUl5Vx0KALWPQwPoeupvLBSz49QMOlYPRUqQoknNf2hAyI2at5Aei+FWqwWsQGJWmbY98FKA/BEG8
	tKSHrCFLOHZ9V6Zbiur875lMw+p8kJQF2qefSlxEZT2GFjK3ENx00qk4mmuWch7BV+679oQuoCMn8
	6RQWsupum4xwrl3ZJzyXOGEGXMzs4PQbrJDj7XeTeJAplLTBE5GQgXxHx0UMybWEoVGEGedYK+Jve
	a5iMjPazUwIJDtdbv6PKHsVCJUeEB0ig6H4oAuFtlVSx++RBON5babla0u4iulSKz6O9a+DIi96WV
	zRvVCrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBFQ-00000005NKT-1oBg;
	Tue, 07 Jan 2025 15:12:00 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVBFL-00000005NJT-0ChX
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jan 2025 15:11:58 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-540201cfedbso1446831e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 07:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736262713; x=1736867513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=;
        b=YMvoMJd/aEfbTw7iWP9p7E+qMmBc0beUc7trBtPZngVUJgN2ulQ+Wa3xi7+I3XLrsY
         TjWqRWJnB3NaAK/0nYm081v+/bn+1InJ6bPxUeJ7L7qkAMBqJR+WHkO+bPtv/i/IoVQB
         ZdM2Dv6GlX71iBjiP867Wdid3M3wmg79cQsM3cy8eaZ9UyVDjLBPsbjBDi9VwQPTSc6D
         X09M44xC+bTMO9/egNOEi1EWk2tWUteQvrmZdU9cWVB8XroHtXPVI4Ne1isecdcCrTMm
         ZWvr7Sa6BCvsR/L9gycwrL/eqBGzOCpokdTYSLFBtb6+CuzwOhiylAKhBAK1fhS2MfIg
         VvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736262713; x=1736867513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZm9XMFo/ciEBfGF3Y+lnkNF8U3UY3ReBsxl649KajQ=;
        b=Jxg1qDiikCLactnEtzBSoycTxfjb9OWueDdU+R9BjZYsxlhwvZaYPQ/hkfI4bmod66
         1GQXQKvLWDhPUp6CNmyYmplm1XUCpmo13rPldAiPEarP+T9NL8i1sP32ckLWIZ+8OJ+F
         eHM1lB86E3bUjX3O3sgr41CU/doD2NdJpMILjXctIxEbNYuSKHObBpkWNcesrDHT6lYP
         v6UukE5BRATteRAZLoCtuAgT5ZvR3Ye6BarHE2AH6VaPHRngabKIWBwwpbK4+xLX+Xy/
         mWTSDN94QLA+/ZkpJoRLwdxBE3uzzNSLNRl79f9UMv+mQzUZQuss9jz8OORuM0o+C2Yj
         j+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUvjI0HbRS1vg0Fo3T+gegEDpJay6qrfaWrFyh/baGLLRLHBmlBvky9oQctRvW4vl3L/qt8qffnh094/2ZzmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXzp4+qD7zj5XoJpCBWJ1dvNB7pC/XbFbjgWDR/DTkRwTLEM2V
	1dk85QcmAxkJ04xSuIc47WY1Kc5pKiDho88D9uMhpqSnYVp+zHjFwScZgfZERHnVYXywxSS5Gek
	9e3DPTDlutWOl4RCnDfWRi7zsVTAYE5vSVAmI8w==
X-Gm-Gg: ASbGncsC7QP2x/NNkWX8bdHP/NtXtCrbxYiQqkMroHaqjAzb/OHt4G+uMokTr+uD7G8
	DC23G4VrYTpLxa+TfdVl17SRslFecrRjtJ4Th
X-Google-Smtp-Source: AGHT+IFehNeFi1I1U8aRoGxDWj9mUKo0jrkw2SzoaqZnp8E335DNw61G6ky+He7/h1LD9gQ8ZxOLYHtYW+T3a9Y3M0g=
X-Received: by 2002:a05:6512:33d1:b0:540:17ac:b374 with SMTP id
 2adb3069b0e04-54229540453mr15473106e87.25.1736262712723; Tue, 07 Jan 2025
 07:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
 <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com> <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
In-Reply-To: <47ca3129-245f-481f-9ca1-ed9d8db6e990@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2025 16:11:41 +0100
Message-ID: <CACRpkdarstoQW+ZBi+MWxEff_=h8bPo9+fwy=LW2uhWRuQ6YSQ@mail.gmail.com>
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chang hao <ot_chhao.chang@mediatek.com>, matthias.bgg@gmail.com, 
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_071155_096644_87E4D0BF 
X-CRM114-Status: GOOD (  15.66  )
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

On Thu, Dec 19, 2024 at 1:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Il 17/12/24 14:45, Linus Walleij ha scritto:
> > Hi Chang,
> >
> > thanks for your patch!
> >
> > On Tue, Dec 3, 2024 at 2:13=E2=80=AFPM chang hao <ot_chhao.chang@mediat=
ek.com> wrote:
> >
> >> From: Chhao Chang <ot_chhao.chang@mediatek.com>
> >>
> >> Change 1: change EINT from 1 address to 5 addresses,
> >> Eint number is stored on each base.
> >> Change 2: Compatible with 1 address design
> >>
> >> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>
> >
> > This patch looks good to me, as preparation for mt8196,
> > but can one of the Mediatek experts please
> > review it? If nothing happens I will just apply it I guess...
> >
>
> Linus, that's something like the fourth time that he pushes variations of=
 this
> patch which do break all MediaTek SoCs in a way or another, leaving only =
MT8196
> hopefully-functional.

That's unfortunate, and I see there is some annoyance building
up.

The maintainers are here to protect the code and the change
would have anyway just been reverted soon if it breaks stuff.

How can we get this contribution on a better path?

Chhao: maybe you can split your idea into smaller changes
that can be reviewed and tested one by one?

Yours,
Linus Walleij

