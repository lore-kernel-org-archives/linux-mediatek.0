Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1676C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRVwWrjJDCQx2PTwDXm20wxkOYYY83T6jZ7prdQHy30=; b=JkIFTCOLTSyPbi
	yVvg9X2reZNiFmzsqh9Y/xVOJNjyet24MaLMqodL/DmqPTl5O9wgmPKggkgLq3mApI98KU5xjkRQk
	DU16h2rNnttT9/1bZRMsjIzYP2TLsLGtKd2A2geTe1xn4xx4L1zSMl1wBadGKOtWGUnb8ZWsdopcz
	3BwFR6cBmNZIWxoOO166sKqjKt/HYbm+iAZD+s9FZJVwe//btT5axG2q+jRbD1fmguYIyLkbQnYQF
	fxCvaSYFsR14h74mcwhnxG1kCgJg/4DQDvXhUy+ZPfEDmLwI8HQEq3KJs/SZ5rca4+44nn3BDzzeF
	gQI6iXiwfPDk5xnXqmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgjq-00BzoT-6T; Wed, 09 Nov 2022 08:47:14 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgjg-00BzlB-1w
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 08:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1667983597;
	bh=PRVwWrjJDCQx2PTwDXm20wxkOYYY83T6jZ7prdQHy30=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=gEoRVWsYKdnB/rSvLatOuN1uNvbJw6dbVKqfNn9R64mJBvcFdMo6cBDEbxGAvqPKM
	 WpIZlPdP1F2hUiak6yx7XW/yJRysiGvxJtIWC2k1cH4GCutUQmqJD3QGeMNAXv8n7o
	 /mtRP/rmbT7Lk1uBbpZHmFLpvzO8lvewtbjUl7bIPdoE5nMu+aZhw6cz38CD2OWb1u
	 EjQ6e0nHrLj/OWbARNGOyCUPHukY672dZ80JmuuigM+UCWhYnWHzNoPIDcu57lxKhS
	 RrH2miHq/+S85DO1z8CfS3kr7J2Wx/vTETwRoxXdmIF4VgT8NJu4+D24xfi8Xb1f/x
	 9Yc/g+9dYTqsQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([80.245.72.218]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeCpR-1pSIzi1wRT-00bKIF; Wed, 09
 Nov 2022 09:46:37 +0100
Date: Wed, 09 Nov 2022 09:46:30 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>,
 Sam Shih <sam.shih@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_Re=3A_=5BPATCH_v1_1/4=5D_dt-bindings=3A_pinct?= =?US-ASCII?Q?rl=3A_mt7986=3A_add_generic_bias-pull*_support?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CACRpkdZsP-aj6hcD2sOB8ypVqdxwC8dWOo0d52qnDpxppUwNAA@mail.gmail.com>
References: <20221105084905.9596-1-linux@fw-web.de> <20221105084905.9596-2-linux@fw-web.de> <166765939131.4158830.8416727494529058690.robh@kernel.org> <trinity-c732b826-2a12-4ab1-aaac-294ac5524926-1667660774779@3c-app-gmx-bap26> <CACRpkdZsP-aj6hcD2sOB8ypVqdxwC8dWOo0d52qnDpxppUwNAA@mail.gmail.com>
Message-ID: <6752A6BE-3750-4195-821A-917205F59258@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jHtmrCYPElP8JtRuEiA7NPBiK7ne0lZA2T52PK4SqtN3oFto41e
 NGuuF+JH3JRGNhbou6J8OX3FKcKEb+neiidWWEMEBOb9haLmrkCrjKZA1I23S5mC24I9pAo
 C7oCYwBOW+psA88hZZzYtg61yyDrVrmQGbm9Db4VvJrm7jReOjYZOTGwJU3lItWU3JKjIi4
 L0Sy8AeH39BsxDiaTJUdQ==
UI-OutboundReport: notjunk:1;M01:P0:ZxB4zEPrxfU=;JLtousEZBz6ZHywN4c7nHNSTlW2
 ICihBS2ALeVKO1JYgkwWYwCarSmjhYnmzpEPZhYFJ/CQr56GHvqq1RLnOGsWPWuIay6qu4LwE
 /dX2BfTIMBRNAzi7L+5jUZ9UxuaZYZu45B0uIjYkgdGuUDeeoxqy5JTNrT+GHz+wNl587eNgt
 dyaKdEudzRuRasc9N1kkExxWQFLOmbtL/IXZxn1u8tlOEdNAaoCvNsIelqx2DYj8wmbCD4Dmf
 hia57i4GSDNkNw/b3tNeKaOkk3tEtKtK1Fluu2N83wQY+whFDwowtD3c+yKRp7EZ+FEjL8ZVk
 qvAyv/1Y6nkjIVJIfCn57Lo9hdIMhIchvLTc7IHON0TrLMZT6rlcgk1ntWH+RQXjBiX5p278j
 Vbv8ydhZlQoAzjIsHjY9Tr1trubrzOXzXrHTd5CIc2g7F3PsbpTCpyefkXqz0P1LWKDNEjH2t
 ISm6jy/rQqEEyrCzBsLS8oCD8oya7vjwm2FwuHtUKTdmnRH0T0K8G/3zOykyFJIab24hIY/wG
 nPMLh330svNlgcpXFhNpYIAI1iWocS3uaGcL+H31Eo9wONsh7rsA9u+zcI9mXMJNvgJNhj5SV
 ejgoJXLxSEYFhUiWOODYV3M+SHqisrljYEW1QKbXInz8HrOtwUDEXLMF4PtXBsfBgxfFVEu8V
 HtegHtJMXhDnK+cWJahkN9CdkKIggWEsnfxFI2mE3Bymh1tyyBA0RQOwKVqZfTFM5uQmjgthI
 9xiVenpgbBN4DjyC+RkonzHnTF9CGrcCwZeyh6WAlnRHQdgD5UyfdFYoyjeIS069vITYHKUQN
 /stzNrIngSl/+kCGXzvayP1VT8Yh3WvfDq22PcX4L1hlSyMeSYoExcr+7z6UgQvbk6GXDLN+M
 QS2Ij/w00u/lZVvy7/GCryjRibr/qdLpV76onBU3ys0xPQJXs4rM6vxzMt2gZLsvE+bdPcvzv
 VDR2GA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_004704_420739_F03901E3 
X-CRM114-Status: UNSURE (   7.70  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 9=2E November 2022 09:38:03 MEZ schrieb Linus Walleij <linus=2Ewalleij@l=
inaro=2Eorg>:
>On Sat, Nov 5, 2022 at 4:06 PM Frank Wunderlich <frank-w@public-files=2Ed=
e> wrote:
>

>That patch in turn says it needs another patch first=2E
>
>Now I am utterly confused, it is really hard to follow these trains
>of patches depending on and breaking each other left and right=2E=2E=2E
>
>Can you please tell me which patches I need to apply and
>in which order?

Sorry, picked the wrong link=2E Put all pinctrl patches together into this=
 series to make it easier to follow (but v2 because v1 was for changing onl=
y mmc pinctrl and to have no conflicts or "broken" commits):

https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/list/?series=3D692=
462

>Yours,
>Linus Walleij


regards Frank

