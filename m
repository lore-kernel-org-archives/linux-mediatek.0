Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402AAD0D16E
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jan 2026 20:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw1dDqtzxhWwWEi8xX5ZmaE/Mztn8IdFjmib1q0cdJY=; b=jimdMnLtULZhdaiZeID3Qco6Xj
	6kV7Nsb5YwkrUa+AaBoZZfhgXmTbbN0Zjym7W3v3JEYZ58xXce+bDecyql/5CwBc+wNZAiWCecpbK
	aau4ZqkKVi6U8jBw4pwQF9c9nWmaZeUK01VHbCOnGcMO9+g7WM/X1z4zNJHcAZB9AIj/shFiUb4YX
	6db16wMUwGY0GqHkmUvm4hcftgIJOR2J7WR2/Q8W05SsScF1iA2lNpjfIOBrsZQJsF/sx3le0P+t6
	xCbSUf6VGMPd8HJFqfIV7J/IZUMhsUsYdYhfnp7B8jH1VerB2eYVfjC+7nZxkufDLhABSIIk8c/DL
	8m9Qk8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZiq-0000000FaR9-2aOS;
	Wed, 07 Jan 2026 20:01:36 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdZin-0000000FaQ9-2rQg
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jan 2026 20:01:34 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-64472121ad5so1663425d50.0
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 12:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767816092; x=1768420892; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bw1dDqtzxhWwWEi8xX5ZmaE/Mztn8IdFjmib1q0cdJY=;
        b=haXHu8AiVpaPFnU9FY5Gg+tK8N3zGxmq5V0XQzQKvoxQTjs2gfcN7JKHzMMgqbrb63
         4GKLrEWoTiAiSs47OrrU5BZi2tEbNa7Fozant+E6mzMCwkoxVe2kJYOc21gC88pGMEQk
         2VaiBVxWtP8rWBiAZVnCA4jSIadFpY+gQMPeVUh3b6L9HB62YnBRnmEx42uATJxgHUlM
         BHJIl9aGC3BKHpJamMNg2EN9lqPopHT3MRlvVEKEujo8l2pEgCGWl/NdNgDxEmXKx3HN
         xKfM4+5x7UwwHJWvRMo+i0YEcFbBKHLHOuu6vW/x0Xd5mOrQe7ljBG5PKdQemfnspkPq
         fXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767816092; x=1768420892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bw1dDqtzxhWwWEi8xX5ZmaE/Mztn8IdFjmib1q0cdJY=;
        b=IGeOzFHBoA30uczRrRc691hb3dzKDbKRQcTyN7/zpzLO4clDxpR+rCKZWGeqHbdCs+
         azo5/SymvI4tWNS4tkJFY+cZYxk/8UqmaxqgC2PPP1ypHNmSmmUWE9eRPw6tTiswT1SP
         hJx4R0f6B73N+JLOx1A8GSUCGB1BHcLi5fXQz0cjGrmZiuiWHKJe5I0mB2/0+JgB+LxK
         GYh+boD2G81WK81hCqWrOqRfOZasUvVDQ7Oks4CdqGwe3hV2BPors3rQc94tnuv9TdWM
         1lDCrMHZkMRFldRpNXllFqW7rrDaK5UsrH1xiHLaymYtBNnoq03YAOgYNoXD5htKTIkf
         0+LA==
X-Forwarded-Encrypted: i=1; AJvYcCVVVQ30P4DWnMKV2RQJwxRoMIs57asV9pjc23DsIymLRwhzf7ghmxg3eKakSrLlgCErTgWPZJK+T7hSlK8khw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwnQJrpDE23k3ujoz0jLQzpsu0dOiDVVTHchLaOw0Gb3NcTL8g4
	FufsEeNQxWGz1snDyLnTadg1e4mxz638er6XWATyj+d53S5U4mrlF0ZQxPubfFY0q24qY1jjz8v
	wWCjwot2KnsHIjWqkVg37PpU868ab8xc=
X-Gm-Gg: AY/fxX7xgKDY9TAX+WeXGB//fb6N6lzHhqXCfKPdop+c3CBB28r9IEWyer1hJ4f+lQF
	vcxdQ0bGA2zxwY7vdSA+ST6Td/muUGddm/h6Ec0NJI/G/xL0bWWtrGI8Zxm77D3btEZ6hFz/Fmd
	1ah/hs6bPmbObYgoZbEjAHhWjUJAmRpErAw49IFZ9s4HcRijhl+JyoFafxcvOBw+F8kmceQ9pQw
	uKORglfG/3rZmmt+3xZ7CSlann5f77uTH1+HsVrwVi9PNDvQOPr0AptCPdYPtWJhxVya8IiEOrQ
	MON9Ez8ClNHP+c4eWQBA/pXujUX6fA==
X-Google-Smtp-Source: AGHT+IGvHXnVPwLtk2AfaYjIl3ufVpWEoMzjf05Wlyvun5/WGBAyf6b3AZpMO0jrqG+zCakLOjQyoYGCFgMnaCLej7U=
X-Received: by 2002:a53:eac7:0:b0:63f:b5a5:37c with SMTP id
 956f58d0204a3-64716bbb65dmr2504318d50.2.1767816091690; Wed, 07 Jan 2026
 12:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
 <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
In-Reply-To: <TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 7 Jan 2026 21:01:20 +0100
X-Gm-Features: AQt7F2o4QulUaJZZRb2rNrPuwYD0wKGX8_-w5ECTaHV1w_JbEvoPR6OEd3x_uPI
Message-ID: <CAFZQkGxdizG15chbehb-TGfBy4yL4NRy7GVD1b51mASmRG+0sA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
To: Shengyu Qu <wiagn233@outlook.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, daniels@collabora.com, 
	ariel.dalessandro@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_120133_713854_7275D8FC 
X-CRM114-Status: GOOD (  12.50  )
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

Am Mo., 29. Dez. 2025 um 19:53 Uhr schrieb Shengyu Qu <wiagn233@outlook.com>:
> > The curves supported by Gamma are:
> > * scRGB
> > * BT.709
> > * BT.2020
> > * HLG
> >
> > Given the lack of support for writeback connectors on the MediaTek KMS
> > driver, combined with limited hardware documentation, I haven't been
> > able to verify the correctness of each curve, only that they were
> > visually sane (gamma curves made the image on the display brighter,
> > while inverse gamma made it darker).
>
> Hmmm I don't think this is acceptable. sRGB/scRGB has two transfer
> functions mentioned in original specification[1]. To keep color
> accuracy, we need someone from mediatek confirm whether this is
> piece-wise or pure power 2.2 transfer function, this is already done in
> original amdgpu color pipeline series, sRGB means piece-wise while also
> dedicated power 2.2 function exists.
scRGB is a different specification from sRGB and has only piece-wise
and linear, not power 2.2. I seems unlikely that there's really a
problem here.

- Xaver

