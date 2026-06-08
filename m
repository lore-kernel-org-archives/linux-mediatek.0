Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76AACD8C9F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVNzA+YimPCo/s+zQoYkCPo7qeLSIJKww/AqXzNRCrY=; b=fQvvsz7S7feU3kDtKIOj/ukMd5
	p/ZDbUGu1uCr9/ceb8lTf067vFUD9Ttjbd0f53HPpBTcOqPewH955EP8Nm5CxzQy47OkCnsL31eGU
	UR2ll7s5WJd8xjbetrOaDN8pybdZTVOAiB4s2+Yj8teAiLf5kSsALkkbzHNY3vs9GM5LJotdoXY4q
	C0rBoOb5YawVnYP54o+AMQh1uTLLqNVhG6w1ZEaEwMtRe20l2jTXuyLCGQ8nT2kG+2FmKQGoSpfRf
	6Ax75PSxLGQhoC7+hLsFRQKefNsWwSaTiLa/yEcoh/CnNz9I7hWWrKh0c7QT4OZ0ixyie25hyKvYu
	OEq652mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbIo-00000003rdT-42SZ;
	Mon, 08 Jun 2026 14:50:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbIn-00000003rd1-2UfA
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 14:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F33743EF3
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 14:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EEC41F008A2
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930209;
	bh=mVNzA+YimPCo/s+zQoYkCPo7qeLSIJKww/AqXzNRCrY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TrIIizPtQOgkzaa+GxeDtKPfW60MyqU1ONtrYnymBFbmmpCZtxUqUup3bzaQQPPKd
	 tAj/+o7ldAPervKxCXljVrSNnnVq7o0KTup4xhChoOaINKNyD+eKPTM/73A66/a8gr
	 p76HRluvfS4WZKRcD6BcKNG/LDsXY7yAY+O7YHqa2Q5Jf/t5tBZUteik/pdG+I79+5
	 TE+eOQUzAS5FG5c6GzIkcSrNLaTUVA2ev8ohezUqB/vrIj1AxPPmPJBtJ9IAnXkhOk
	 6b0KOI24YGpsR965rKKvWQ9ja6OAaeyRFZj3GCncGEv1va69MPELTNerCcSxvgLzcG
	 68umfE9R3kV9A==
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13809223fd4so3595872c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 07:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ96ncfRoROwHWhmfoJu85bFwwUuhgRcN84LgYB9lVYxLwhKeHX/87xddu4RF/kADaaHoDneBICqRaYKH4cQ3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOeRYo/mmm83+suXb9JPg9N2+UWiiVrzjH7Ac0nGnDxBEAwXpZ
	q7vKl13dfeeyVrfEOSQxwJTgBuk+0pMF4V18rbhM+/F6VFMZ4W1L030F/sgNqt/u27MRJMAsr1D
	98S+Nhy1drbI3ELDvH1QGP2fmvVbbedZfwpDgGMJjMg==
X-Received: by 2002:a05:7022:219:b0:138:144d:35a9 with SMTP id
 a92af1059eb24-138144d3684mr5766531c88.13.1780930208569; Mon, 08 Jun 2026
 07:50:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:05 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:04 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:50:04 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfdwrgHU-uQ=23SOth0W69pEnWOBZNADW5V1TZehDrggw@mail.gmail.com>
X-Gm-Features: AVVi8CfLdQbnTOwyGCfZAp__4hziGPZ_SRIyQWjmiKLBoe_O8lP48fbaszTAsbQ
Message-ID: <CAMRc=MfdwrgHU-uQ=23SOth0W69pEnWOBZNADW5V1TZehDrggw@mail.gmail.com>
Subject: Re: [PATCH 03/18] pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
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

On Sun, 7 Jun 2026 02:16:39 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> Pin 32 (gpio19) duplicate pinconf settings of pin 31. Fix it using
> a proper bit number in the configuration register.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

I think the term we typically use is "typo" but I won't die on that hill.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

