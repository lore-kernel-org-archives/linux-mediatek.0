Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BF5C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 07:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCowh7oPKQDKfddKouHpaByvNjhTD1qDX3l1ombbgok=; b=MJKwAfl0iVITl8g/h+WIr+F7q8
	T/WLhjGrQ2QzWNuTCpviaPm/ky9Lh/MFjhjKXDtbaYe4IzPJWq9ly2U2Ss2FE9Bxn4/0pEq3HDn/d
	ZGug20Tw/N3rzhwdkuT718hsodABOHUNjTWhbpPRhjhb5GFR5fRj7PiIVO1Ts37Zl0Ibp1cgIZUwh
	FLpuSL9LbQdJLT1MWgl58qq003KZ/PM0UhKlZ45MwF3azSB1nWzNueEj1tTSbXAAqgjBSzIQxFZYg
	b6YKdaIlZFxZXt7aIMGOO6yAp5XmuMCjTgDupl8pzADg51QPMF/+bBxwJCWQt7sBGrjYnvvN6KVPw
	ldOii/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKMB-0000000BCC6-47lb;
	Mon, 10 Aug 2026 07:23:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtKMA-0000000BCC0-2GWX
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 07:23:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 18CDB43FD1
	for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 07:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D451F00ADF
	for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346614;
	bh=WCowh7oPKQDKfddKouHpaByvNjhTD1qDX3l1ombbgok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jZS4PyddW90wd64RsAZDXEDTDc8z7ncRc8ghSnHjqMRfNocu0OllRQvx0dthxmDA5
	 7iB1NH6/N/XpF33sOYvrWNJT7OBVsB9jbkQIgWUU2XW4vrjcSR0dYhU/H90b5gVGyQ
	 gPS5cRTLKxfWKmuUH2Pj34/Hw1MVW6uBci9EO6TjSdVsCen16XjMnLsaHEHhcuzRAS
	 /+f6DA6R3rFHX33fw2Hj/n9r4ChTmjHiVMH4vwL1EuPy0bba8O2cEE2cUE3BLZRNfM
	 e33/DpqgGhzJKdou0GlsNzR3d9/DiBzmTgjGpDXeKSEnnvbc9Wru1h5eYaVMqaH0Fa
	 TRSG3/ZMA84Hg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2aab18795so1473381e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 00:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDIjdYMhZUSH3rtHqnGOEL/nOVDZDPD7kRJEe0y80CbWx6NhHTibXCf93YwrrAif5Ah6NCeK/sjr7tnH50rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YywFyqcCGm5fJkgsjqWTsk3Mi92Omy2uoqN7PGmXfHbrObRmfeA
	/xT9pYbLRxOZAtGutHldJSaPN5o/5zuzvcmQvUSsf3nbqWE9C0SF4ivFyjPAtwEjo+/a3INeZr/
	MWpHkcOXqnbPbapv2Kn3PDIIgYDJlG0o=
X-Received: by 2002:a05:6512:3189:b0:5b1:5379:8b6d with SMTP id
 2adb3069b0e04-5b30b72c871mr2256251e87.23.1786346612692; Mon, 10 Aug 2026
 00:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com>
In-Reply-To: <cover.1786262697.git.naseefkm@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 09:23:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
X-Gm-Features: AUfX_mzVkSbHAHgL9M7a1IoNBPEOmu4qBOswFPvdaIh1-PehrZuAw66Jtzg-62I
Message-ID: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Ahmed,

thanks for your patches!

On Sun, Aug 9, 2026 at 10:05=E2=80=AFAM Ahmed Naseef <naseefkm@gmail.com> w=
rote:

> The series is based on linux-pinctrl/for-next, as it depends on the
> per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
> phandle that landed there.

If we can get a speedy review on these patches I don't mind merging
them for v7.3 already, it's nice to get some movement on all the
nice Airoha silicon.

Yours,
Linus Walleij

