Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F52E7FDF3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Feb 2026 00:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1g2xNOw4+l2Wcjy0vjXUWHCrsoKQsB5w4m7w88tpuI=; b=NR3bxsw9+OYzPF8KX8oT1yqo4n
	fMvMNo0anJLleJn9h2wXCSgOrL2aNLCydQJnuyXOla14lW0+bptbmfiilz0Xlp1xUnLIQMWWIzIuy
	74QosNdM3I+aiUWwrDtC2HCO9rVbtgcFZ3YAJhA+yeO27nmI0aN4L6pp/7fmiI8jq9PJAHSazBpI4
	NFbmaFzhNZQPUwQslp/Jg6C9yPWWExMgQ13KRHublINcuU860K2wLv2t4a+TGLBacDWp7v1WY3LMH
	U8m/qOpmDf85VI+wNdcW3vt1qkoAFN09jOhzawP6F47U04bIKkW7nrjrg5HwbO5MtVib99oz7tSH6
	C6S9ZSLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4ND-00000005oG0-30X6;
	Tue, 03 Feb 2026 00:34:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn4NA-00000005oEj-3s1s
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Feb 2026 00:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 619E944311
	for <linux-mediatek@lists.infradead.org>; Tue,  3 Feb 2026 00:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402ACC4AF09
	for <linux-mediatek@lists.infradead.org>; Tue,  3 Feb 2026 00:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078867;
	bh=X1g2xNOw4+l2Wcjy0vjXUWHCrsoKQsB5w4m7w88tpuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t9KyoB7aGi3Bg9Y7m7XIMWZqYRoUAc33/o9GDaWOz5fckkJ1cKt8217x79Yznbpbq
	 EzcKLw4UTEct0N37ZZFlRiKIbbGg3Z9P+SX5eo4lJuMpWoBg68pHBs7isvxuFDPOYy
	 OT4ZMg8prvQog4m130qft9YcyQVkq59pZA901lmiN++BVN+85yaJhpw6/ZBXK3E9w0
	 fT6VkKTM2uo3Hc3OxHTQHsVLviV94BX6S27CQuX5GE8YjTX2DjPvIjyKLuIumWKmoX
	 +cYOiFAIRABrawyjhPgupHs5usGBsYqvwuvZOphE+REwjiqr0P+vITV3CZ9/DVaqxT
	 uAxIAwxmeyL/g==
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-649d4690088so98682d50.0
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Feb 2026 16:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkwWjfMM3cE8XGikXOXi/mqFvbAn9WcbSUmFfLtHt0QdMpJLewRBqfDVYsSJnI98C0zCwN6q1Q27dWtmHdMg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3cHdIOzFfAapHmVJC5+Beb2EJaEafpULKvATtBa8G/Kg+Y0Wh
	4ldWY+Xu5+Bt3J/bN1l8v//bRzTugtUPhxHhJ1OJT/N3Ac4f17dHNienBNtiU5fODvHqmn0mTmk
	zwM7FECGd7PtsKNsDFZhol8BN1EOPNPk=
X-Received: by 2002:a05:690e:b47:b0:649:b536:d72 with SMTP id
 956f58d0204a3-649b5360f7cmr6593212d50.18.1770078866634; Mon, 02 Feb 2026
 16:34:26 -0800 (PST)
MIME-Version: 1.0
References: <20260111053025.251983-1-akkun11.open@gmail.com>
In-Reply-To: <20260111053025.251983-1-akkun11.open@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 3 Feb 2026 01:34:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
X-Gm-Features: AZwV_QjBhI9SswsxYmA3G0Zv5gva_FUHaiIkC2CnoLZUa8plV9-V8Hry7RO3aMA
Message-ID: <CAD++jLnG-GGxmGMmojYwSE4T3F1NjCDY-f0+CFC_Fi5gMA9v6A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: remove unused drv_offset field
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_163429_040382_38AF7E63 
X-CRM114-Status: GOOD (  10.04  )
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

On Sun, Jan 11, 2026 at 6:30=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail=
.com> wrote:

> The 'drv_offset' member in 'struct mtk_pinctrl_devdata' has been unused
> since the driver's inception. Drive strength control for MediaTek
> pinctrl drivers is actually configured via 'pin_drv_grp',
> making this specific offset field redundant.
>
> Remove the unused field from the common 'mtk_pinctrl_devdata' structure
> and its corresponding initialization in the mt8365 driver to clean up
> the code and avoid confusion.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

No word from maintainers so patch applied.

Yours,
Linus Walleij

