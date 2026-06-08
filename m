Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC397CD8C92
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNOgVXs7S8GJ9Sg1bq8BaYnTVZCTG+kvEqG5BQlDdGU=; b=JKV/QrF06bi6mqhsK1CSHxqO+Z
	USdbg/q7cMvEZkZhTV137O958sYNNqdLVz5ZCoHXuSNFSSUqzKV5T2RmlfbBoinLCoLfQuL1F1Lnd
	c+n/fOdkcc23jMaP0snYbJyxOVbcdHtqC++HeSQFXNdv2lhfMveVUkiRNDAXyzpBuo8iU5w7x3vOv
	wvXgEvJANoFEcoOcyUGEtR96s4MFm0akw72QKKO05GNiuFfJhmzeumZvRre46U/IuP4kNrqLdyucO
	fDAn9E/i44H97kENdw94DJlptRX2kscEG0X0C6FMmDjgQfeB/KNdQ2puVJfW4V/yXdZmFFzJ5Jds1
	aozV3fng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcbd-000000042Sx-38N4;
	Mon, 08 Jun 2026 16:13:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcbc-000000042Sk-2AAx
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 16:13:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AA64405B5
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 16:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22871F00899
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935219;
	bh=PNOgVXs7S8GJ9Sg1bq8BaYnTVZCTG+kvEqG5BQlDdGU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=OT4YKxYL8nPYqXLq4iVRjRkuv6wMoAqSGtS3C2mdFHFBszCWe54bWNN+q3OCgAZWb
	 6PvSQ4+BEj8782al/5jliCV7YQp24JJqnvQ4RwzOhFeFogU5swE3zBxaizI7bhBmd6
	 T6qa2QeYhxYGQLfSCu+kxouLqAFIV8C6yX/qikMnX50w9/HaAf4w8L7A319RMJIxQA
	 msPTr14VxkZbqOetyHk5cbZ2PeH41j2ZhHnfdXzMV1G9HpoDPq2R70xvzl6IBGoMx1
	 x/vDErrXS+dI0m4OZzgPAjacyKP7CvVarOGfS189dfWJZUkfuOFNhEv/EVWx7NfAs4
	 iFQ6VprtATucA==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1382533d428so491867c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 09:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/gHNjKQGPS4RZw6L9ZRiPZx8uMx0ggHuE70dpoWzPJrrindxw4x0yOpdmGXtTX7Z/y3yOgBqMxzHehfIVB8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIAaZKbRGQ0meHPPD1hqqYkhtwGEHvRgbXzk2ZkJHyIVhXHJ36
	mi4wzM3Xn6uS6JypTpmRSoHffiG2ibGWOfOHurzpiVu6S8l7pJWhQKAdJkR2TJhrk0ri4qlf0lf
	0O2sHLEyW5ZPE7KW2u8lGgEmnUaEWoWSsBkmBsoFHRw==
X-Received: by 2002:a05:7022:6988:b0:137:feeb:3fc9 with SMTP id
 a92af1059eb24-138066db0e4mr7852243c88.18.1780935219351; Mon, 08 Jun 2026
 09:13:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:13:35 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:13:35 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-7-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-7-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 11:13:35 -0500
X-Gmail-Original-Message-ID: <CAMRc=McXE5uVFchzK1eLEY=a47W9MExbXqEPW_8L-tL0v+t_xg@mail.gmail.com>
X-Gm-Features: AVVi8Cfr03TF-ZZw5uesCgNwFbbmqiX4FozcVhH_SMCH6F9qaiCx29XYm-wRAiE
Message-ID: <CAMRc=McXE5uVFchzK1eLEY=a47W9MExbXqEPW_8L-tL0v+t_xg@mail.gmail.com>
Subject: Re: [PATCH 06/18] pinctrl: airoha: an7583: fix incorrect led mapping
 in phy4_led1 pin function
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:42 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> phy4_led1 pin function maps led incorrectly. It uses the same map as
> phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).
>
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

