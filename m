Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D215C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O76Cfk68KhrIxRJmJnZsx1C518bMCKM0WCIhUwoBo8w=; b=KT5BD84e/KXyZCWIwafTfujuPj
	jao0U90FGWnI2+dGUwnipw+OwyLmOf26PndWVKl5bp+lcxLpSl1BDryDuldrOqvXv5s85KyCJkw/o
	xCMVangBqV4bog56PEBgGqAi0xGWHPVMIb6zYz3UuDy9G8qXLVhwG0oJV7MRYMDxp82u7fta+5YRI
	LL50vFK+Mo1IQjqX9sVK7QW06czE4GkaVwwilhrd0iXn+wVRErPSOmKRQaLKQoXlTkl5Hz0V8ekSx
	Jpno0jlDpWOyCnRHHzH6uW9TlGeHceGUt9jVnHBlndYXQ7svtxMmf67Xtq3zX2EkYUJDKjoeewS0m
	gxSOfqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8O3T-008yJG-25;
	Wed, 29 Nov 2023 17:08:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8O3P-008yIn-2c;
	Wed, 29 Nov 2023 17:08:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d0192aa345so1648715ad.1;
        Wed, 29 Nov 2023 09:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701277729; x=1701882529; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O76Cfk68KhrIxRJmJnZsx1C518bMCKM0WCIhUwoBo8w=;
        b=BQBxFeoFVgs6TS/k2JfNXy6DhWfdmLhhd7GowN6PeRK9xphm8F0b26C7xayvkmEImK
         5BhXQH1Hv4m6U5TKWRLsQlp03QBj0SKAWHnAFcG4tujUC0PLaT5crMCx0VW3HpaXI+/W
         IIF7C4hADmgO8BLrO0bpWj1W2TIkxpXYK1/38GkSgwTTWMWjWwGNW8SoUYa/ZqYFpnFt
         1IwNOEp6OFLJWB4yzrHGnVR/+gseuOF43vKd22LCWK07p49hHnYFLFNu+U5yot8nXKjc
         sXCnFjaGQSoBvaPvgTEsboMEekaokv9ZxUHQu6tOzAD7BQLf2NVpkUJAhiYU1OQA2XyU
         E1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701277729; x=1701882529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O76Cfk68KhrIxRJmJnZsx1C518bMCKM0WCIhUwoBo8w=;
        b=kI7LZD+fds+USjwzOA2SQfu9UWmschuZBxWDm8yX7Pdo24rQkO2imX3NJmLyfxlNhN
         0oleDNAgyztW1BmXquCmz0lV2xDnZXQWaJQB/wxoO1+F9rMOSepOKf3um4Yxtpo1g3P8
         Bd3wMG2YXFQ6XRMwFUKm4T8cW9N7E9Rd1P/Igfm+cnt54rPuBAyU0e5LbSgh5Sa0Or6h
         KzDomhHy6atPaTekY30321HwX8Oe6z0LcCyplwIkekVyLmlrhdbKcBZ1x3WGnPl1IJoa
         LDcSnYCTJVf25lTTHl2Gh69b94LImOzOLxS8L2u0Z34x9zHh6bRjPfuF7aEyorWQ9J/1
         fptQ==
X-Gm-Message-State: AOJu0YzViMwGUK9fEh0fLceTAF/+HZPgrZ/dpWHX4n7ilDLo65P4xDwR
	9nGq2tp2mPIGAv5iteWrfh2oDCJJ49UB0nXTI5c=
X-Google-Smtp-Source: AGHT+IFtel5cMuSoclx/RD5jpcO3jFsf4gFjr/2yk0h//Bk9GZrDN+VMoKMUdgmJ/KVAvyVH4q/bBMMt3AS7ri8wwtQ=
X-Received: by 2002:a17:90a:d996:b0:285:f76:9d6e with SMTP id
 d22-20020a17090ad99600b002850f769d6emr19702101pjv.3.1701277729276; Wed, 29
 Nov 2023 09:08:49 -0800 (PST)
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
 <CAOMZO5CZpQjWKimNReUkwHOc-mF8vWoq2HDhjGKSu6E3g5-aVw@mail.gmail.com> <ZWduPKmBWkaIdLhi@smile.fi.intel.com>
In-Reply-To: <ZWduPKmBWkaIdLhi@smile.fi.intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 Nov 2023 14:08:38 -0300
Message-ID: <CAOMZO5C_dhvx70nk1HOSZdw8hMMmED69tdsXgydXdpnxHTJ58Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231129_090851_870296_1F788D17 
X-CRM114-Status: UNSURE (   8.79  )
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

On Wed, Nov 29, 2023 at 2:01=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It's explained in the first paragraph in the cover letter. Do you
> want to copy this into each commit message?

Yes, much better to have the information into each commit message.

