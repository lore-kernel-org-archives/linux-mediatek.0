Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA580C61D97
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xe7iByES8qCcfT1IfYNFaShLSvrVUDFw50wM8vwtGhs=; b=Vm44JHLbzQvpKHrEvQV64ZEo+F
	QbOBtIGDlctxVk/ZKzJ/W3PuPQSG+GvZufpTDkeICn1kN21vzgMOPtIc3pMGeVjJbKfNbMKg4Xqkj
	NkBH3/9zK3f2NoNJ8SvPX46pKmVaQGTW1NfAXoE/uYJ7xzwUztT6YdT2dLtYtt65DlC/VL6cZlY4d
	1ZUZ5uu6OIC9WJC4Ls/lLSxl9+sMyJjlPcXHbBQPfdL/ZGNRyutXC6fDtjp9oZ39My9Q1jmAHdim4
	dX7fI3DD6Z6NUgGLmbqglbcS4eMqadhsqF1um+dLN7jyLGLp+lU02rrnt44zi/Dq2R2L0A1s3qmgw
	aqf6P6KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TGR-006oEB-2R;
	Fri, 24 Nov 2023 10:18:23 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6TGO-006oBM-03
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Nov 2023 10:18:22 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5cd2f1a198cso14923827b3.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Nov 2023 02:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700821085; x=1701425885; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe7iByES8qCcfT1IfYNFaShLSvrVUDFw50wM8vwtGhs=;
        b=TveMeFn67oesBaog/QnHmFkKBa/ZAnhEYhlXZEadNUSOyxYkUP2ATBIFHHZhCCjCZI
         D33lYuhMsDLZY40Zf9ybuwmHZwleNusTHIm/ImKL4tvV7kAah1EKIbNx/GqRtTElJsNa
         EQEKrAM5FSb+x7RrlCb9udoG9+5X6EPGTSG2cX9Wgah6f3HdfDHuYx4GmwPIGxDEpcJ7
         px03D8RgUapn0d1z1gD7YyJ1WZ+z/WWjBubSByGhyv//97bSXxWCZFpQ2mejZhxytFog
         f/cCjJACCQ3WMAUSetxzzRPGczBXtvjKcQRYbe0nLP6E9r6bdqPTjwXlXZ3667CeByF0
         kFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821085; x=1701425885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xe7iByES8qCcfT1IfYNFaShLSvrVUDFw50wM8vwtGhs=;
        b=BfaBG74nKf8LxdxZ6XGyf5nkv67yQhwGdP0GqvML06XxNTCxmp5sEHdpF4Hgc1d8vA
         l9F9ABNvVgBoiA0ALSkUskOKK0KRQGHf4nk96Brwu1RYfq8sVZLKbsSDgWljOuH2Ec90
         cVywov+7uamqGkBp30yOLUpLdiR9tChUlDKSkMnOqM7w4M8+hl/UU4SYl5QNNC8Tv36O
         phdQfzfS6noRIb1JYgFPdZJ5KxXJucO7FXSo37dwJXcHVwP6/HwalhuDoahFACQarCtv
         pwamSUhw8cuS777SC5CCEbHL0W/KLlcmIYZt2BNfYgOlNUfHZp2OTUGAAL/RXYq8sntU
         ywZw==
X-Gm-Message-State: AOJu0YwahpN92mWPmnuuC56yrkxlEBmXJy+9mAnSg7hpvIbHT6ul8NLW
	vaIQGcdURmuhSSVtplONcJcKUG1/fFfDTtSI9/6cnA==
X-Google-Smtp-Source: AGHT+IG8iaEyiFM59ESevDjE9vPuHHbQDr1w/P/tGmZWOMIBN3A2ZiFwbVfmEed56HUcIuuKQk+nI+Fh1ToiAf1nTUE=
X-Received: by 2002:a25:6d7:0:b0:db0:2f97:8757 with SMTP id
 206-20020a2506d7000000b00db02f978757mr1792022ybg.38.1700821084607; Fri, 24
 Nov 2023 02:18:04 -0800 (PST)
MIME-Version: 1.0
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 24 Nov 2023 11:17:53 +0100
Message-ID: <CACRpkdbEoAvTs4c5e910bsBZej2Gs6H+SPLAXUnKM2qRk+5MTw@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] pinctrl: Convert struct group_desc to use struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_021820_058112_943D481F 
X-CRM114-Status: GOOD (  12.93  )
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

On Thu, Nov 23, 2023 at 8:34=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The struct group_desc has a lot of duplication with struct pingroup.
> Deduplicate that by embeddind the latter in the former and convert
> users.
>
> Linus, assuming everything is fine, I can push this to my tree.
> Or you can apply it (assumming all CIs and people are happy with
> the series).

I would give people some time to test the changes and ACK it,
but admittedly it's a very tasty patch set and I am eager to merge
it ASAP.

Shall we give people a week and then we merge it?

> NB. This series contains previously sent patches for Qualcomm and
> Nuovoton. Here the updated version for Qualcomm that splits previous
> patch to two and fixes compilation warnings.

Fair enough, I'll just use this series.

> NB. The function_desc is in plan to follow the similar deduplication.

Yes!

Yours,
Linus Walleij

