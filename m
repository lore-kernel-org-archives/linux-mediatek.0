Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55A8C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDYi0w7H+J+q+dM9ucawgoKr/ctQDdxFveeMbGCHqgs=; b=mzsmFPxnT21k/3hstJO+Rn2UuV
	nddcJ4Fg1Z/VN1hNXRTw8m3z/Y1BBvDIV/Ci3JOniazA7/X1y2KUrpwy3ES+bdZ6hZjMR0NbFkh3f
	kxHaGJHBtvU/9EAnAlZGFkjvIu4UD5nF8BESLyTlOKAUjto+p+x6Pqlx0d/WlTik5z2pL9Yu9Qu/0
	aPaYZFk8+TspuBMvBa3Sen0/zPfnrn4L86FogQ1Vt76/I98AAddnHLWHXFnU2RVssasAUKrRu//yB
	7G+/V4RTWA2nyy1XEc8pkOqpqtTPtJOgnTchWclePFqUwk4kTOSTbuHUjbuxfreKEBw9ypD21YS2C
	rmIsuGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NYk-008unx-1K;
	Wed, 29 Nov 2023 16:37:10 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8NYh-008umb-1T;
	Wed, 29 Nov 2023 16:37:08 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cfa7be5650so13421935ad.0;
        Wed, 29 Nov 2023 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701275820; x=1701880620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDYi0w7H+J+q+dM9ucawgoKr/ctQDdxFveeMbGCHqgs=;
        b=F39lx4OI0sxUzQglGz0swsdMRriZ2HLalewqjOyCB8mO3kKmvtIUM5qW0Jq17QL51l
         ZUl/R3IzFBz5ez/C1JLqooYxAH0kmqMX+YSx+Vci6ukunzwUFfyHUV8RQuTjCwFDRRnu
         ckaZuKihzZFHXffvXMGZvv2GGSCZD6vZ508ll7FsFf3ChedGdq3gHamOkMQ+kDoQx6ge
         22E7aikjlqPPl9ZzmYkhcW6hAsRQPhlP99ws9Xnrk89Z1M2q88bgAdKLiW/U2RQxfQGh
         6+aRjhEoSSzFYcW/8i5tJFAju+bySy1d7wACEJd+Psw5hizEtcEgJNBZ5rrScjQw0Xcw
         /oHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701275820; x=1701880620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDYi0w7H+J+q+dM9ucawgoKr/ctQDdxFveeMbGCHqgs=;
        b=RX6xTOkncivDMmGCbjkVC4CUY2ArC+/vZrUFaSOhIKZONyiutfmvmgDOvRRU0Hv0mw
         Z0uC+SjM766eFQnAdDG8eIaN6RP4lR/+iwQfyhY+splPENkdMLSfBxq2DcpQOlItPH6d
         nZDKXeDojWbESaZIdioBPwB8cj9tSt2RsT458zh4nZEPLIHW7gDWKUOuXfzHF8/6OpSf
         I9PC32UP7xfPWc3OoJf3YnUIUOXt794oN8MNbb/B3lNos1tRt8H5aTJ2ZRsVU56dS38L
         AsxgLNaqsPdnqWZNcqTO+9ibys1rrqdP7y1mRU2YxITGnWAlOMIcOhmrT2wYgRTIso9w
         PsiA==
X-Gm-Message-State: AOJu0Yx5hjQdn/+WKATuie8QJo9Qx7hIIObyK/G/ZR0nKl/tFxdB2clv
	4dZuD3PbczMCf3yMcUX+PCIeBfF8Ln0QrQt7R4w=
X-Google-Smtp-Source: AGHT+IEHOS/VoqEOAE9S0a4Bo0mCXwMfAjLAWB11WdwDsJGo7JPiUty3L8kqBCtFFqb6Z8cDlcEqIcrQbJXKS8k7E9Y=
X-Received: by 2002:a17:90b:358f:b0:285:59aa:fceb with SMTP id
 mm15-20020a17090b358f00b0028559aafcebmr18947614pjb.4.1701275820473; Wed, 29
 Nov 2023 08:37:00 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com> <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 Nov 2023 13:36:49 -0300
Message-ID: <CAOMZO5CZpQjWKimNReUkwHOc-mF8vWoq2HDhjGKSu6E3g5-aVw@mail.gmail.com>
Subject: Re: [PATCH v4 16/23] pinctrl: imx: Convert to use grp member
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
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
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_083707_493173_45E98E87 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
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

Hi Andy,

On Wed, Nov 29, 2023 at 1:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Convert drivers to use grp member embedded in struct group_desc.

You explained what you did, but you did not explain the reason.

