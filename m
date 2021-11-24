Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84671C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 19:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lp3MMxmSBC8ZDMk2XGi2a93qoVWrlHlu05cvxFh/IU8=; b=BHG0Eskd5m4Xnn
	8P7HwewY9/qLFrYrZso6uZRe6VBIFvXzMvx26AsZaiBTcKW09tczdZCza+BP+2taVSCrZnX/cFgMw
	pNRXSocaHl/ivjccytCPbpHUFIGBrw2VdmrJyjkeuxlGlg/FAhLlTiCaynnB2kBS7cKvycw5IC8xm
	4sUZKHm9C0LE5jx6Pt/eZ0OFPDhpoqDVzXEn2ZXb6IOs3c2v9Fct7ovw3+HmBpWrO8xxY9dOUwqtA
	7AuPvGdvWZh4wFExBnDkgNu9ok7IZgcbtJQfn4E6F2kUxi5An9irpwCmNY9QehFJpY44QwDz+KkS1
	B0n2BSZAzjEYgqwPTkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpxsS-005ejO-1k; Wed, 24 Nov 2021 19:24:20 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpxsN-005egr-Qi; Wed, 24 Nov 2021 19:24:18 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MoOMq-1mIr7F2fo8-00orSV; Wed, 24 Nov 2021 20:24:13 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so2970776wme.4; 
 Wed, 24 Nov 2021 11:24:13 -0800 (PST)
X-Gm-Message-State: AOAM530vfqkkqzzRdKPvcnjqVWvxDarIE6odeDSUndXnCfSyng1H05AP
 X1sE2/55cgnKgMwfjIaxZe4uLMNLXwSXSrlpCY8=
X-Google-Smtp-Source: ABdhPJxU3XHzGkZdmjVLUlcDMysYVZXYBGK7dc18pfMdKQoniTree9ljP7IJbkiJjYrYSt/hozmOHO002j1Kgkumx8s=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr18501034wmb.1.1637781853302;
 Wed, 24 Nov 2021 11:24:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 24 Nov 2021 20:23:57 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1kQp4g6-59ui8ASBb-QYmwrtK5dh6L2PKjyXVV_VEGvw@mail.gmail.com>
Message-ID: <CAK8P3a1kQp4g6-59ui8ASBb-QYmwrtK5dh6L2PKjyXVV_VEGvw@mail.gmail.com>
Subject: Re: [PATCH 00/20] Solve the remaining issues with clang and W=1 on
 media
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linuxarm <linuxarm@huawei.com>,
 Mauro Carvalho Chehab <mauro.chehab@huawei.com>, 
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Andy Gross <agross@kernel.org>, 
 Antti Palosaari <crope@iki.fi>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Malcolm Priestley <tvboxspy@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Todor Tomov <todor.too@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 llvm@lists.linux.dev
X-Provags-ID: V03:K1:OMvt8jPYl3veQq2jPIG03wWHxridRD4CRo3dCxR8+hB62eJ41pq
 bM7H1gSe0M/dr4X9MmiZS1DF3rHi3lJpaJhR2QhelmBg2M1DCBsbB9TSpTXuBSMwgEyHz9S
 lrFAiMhVGxN9J0zUBTusuYeVIjK4vxzEJoIANhI19wAQBMfPoRa27K+L8rHdzpJn1plx6Cq
 SztPXDl6pPhQRwA4YfSlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JCtInnTxhwU=:xDtyawcD6u75Jj/0+IdtK0
 3Fl00kWE9UBR8xdcKwKdUwx6OoJAFBlZzzMjkGynSqrV+657A0imvrE5+t9h8qP7AjeOe5pDk
 4Al4WRW93gjC5A8VjIbvDRRnMalCdsPmaocIEhmwTh7x+DJZhLlCu78L5ht6bGgEaWlPZN5T7
 r3mbChzQwh/3cunpUFpiRtotDVcaPejesTqTPPfIpXA+rjYo383R16CYPraTsEpUcZHpBs3Fd
 rtjPynNF52VCZ0IjJoz8ctnw5+WpM6ukgt40I3X46xTNmxmvLOzRRMywKdQLB3lRVuuyEQ1I2
 +teMOsSM38kZK2VOwlk/bGGH9B4lzsL5F+Nw8Icjrel2ejk5FAmIi4B5McQUKl81jXvTqI/k1
 c0hsBe/ql0XFhhRT3bMqhELoctesutlIlmwC249+cRh+cayojdC2qjHCJY/qb6+fWbVKJLu05
 sFp3dOm8/TprTCkv+ry5SGTyOgGFjZDxLYI/7d5TviMoFjJE+NFdzc91q6wJsdpATWuxZZAKF
 fiV5lrnA6P4TP2LeNTRO0M3TXbtzza8okvd38LglzquZfwA/lveG08LyJ++WvT+lCOX4qPfs8
 P/WAMiTnNakxLgE6QzSAPw88/K04cVtLe5V5wQiUqsaHzmjMXb50M1FtWtq4oZCwRB5k0y6pl
 m7GqnjUnKswvCWw8mWoa8RXL+FDJGhAdiS4QaPh95izqrkPJqGmZwNIcn1COOn/owKZzgZIFa
 RvFw3YX5v867t1LnCj8wYNbb2hJlKz/Mao59E8XVoJwMne3Sf06Yu7zFg7SGidT65ME0AlSy/
 tALQ8lVZNhHNzuZ8XW0Wre069cma/QcLK/QxcLIoKfBRdoKgao=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_112416_185898_936FD3E0 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 24, 2021 at 8:13 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Currently, using clang with W=1 and CONFIG_WERROR causes media to break.
> This is reported by builder.linuxtv.org.
>
> This series solve the remaining issues.

I looked through my randconfig tree and found one more that I had
initially not sent
as I wasn't sure whether we want to fix
-Wtautological-constant-out-of-range-compare
warnings. I'll send it now, as all warnings of that type in other
drivers have been addressed.

        Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
