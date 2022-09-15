Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D888ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 05:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDYs7vs+thMMDY6yodcXDXhWOMLfZv2S6AqnKaCcDRk=; b=ZbpSVexeWRgCgyILUKqLaqAu67
	uZqoybDXC/qEBcPPSllLbq+60m1XadADOs2FEmCxHszDLbj309RqT6uYU+d98ofPTlEmOyhkdyb5s
	fNIuq1N6+6vO2envQLVu9E+C6h0HIpgf/PiUoPdc7N09CIBf85z1jKDM1cwEl/rcwmB5DWMp1rdZE
	4mx0FzjnCM8VazbLEkSsH4Cm4S72fjSKmdipwEXNzOEwElrNEnkf1/tX7Uf+VuS+RYHtQIVzyruu0
	ZZknaT1mcpTSUPl5KmTuCn5sl2yD2pIXEHQCRmlcjpgytrmR5l+otj7+5J2pCK+MnsuO5GUWR8IHB
	nXvytDYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYh77-000ATB-Lb; Thu, 15 Sep 2022 05:08:37 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYh6v-000A4U-R5; Thu, 15 Sep 2022 05:08:27 +0000
Received: by mail-oi1-x22e.google.com with SMTP id w143so895887oiw.1;
        Wed, 14 Sep 2022 22:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=HDYs7vs+thMMDY6yodcXDXhWOMLfZv2S6AqnKaCcDRk=;
        b=fjRmEANxa4Ci2C8NGJiFGaRrqPV7/+Nt5aUx0ywwlww2acQv/sYHN5d6AolkIP0DQX
         KqHyfAMrtRvGjnMHQjlU16OpHm+pdfyJRF2NicOj8VwEAcRByvQ0M5vG32FM+Hg8CRn/
         n0i6jEQKIS6D5fzEKN9CyVZv2AMrh6vaCgd55CiltFeLPSAXi9K7Hebvtfiq3Zt7ZgfT
         Ab522y4Lxwh2mf5KWWtJxdH2h6M5ZOfo5Urpbcf+wdjJkuAbk6dkDReLh05/97W5lk84
         TI9bfIKW2MLl5tSkw/By4VeksO1HwfGNfh1R4llpWrhD5vz6uoAOPS0vfQhMu/WYXlUy
         CvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HDYs7vs+thMMDY6yodcXDXhWOMLfZv2S6AqnKaCcDRk=;
        b=WO+dn1UOwx5IZUg/tfeun/nyqCVJsm75uTfPTqqyOEGnAzG/u7OpYudVD3kpJwNrmJ
         jGMgbfNcD0doaohfzdfI+5Hc2zNwD/aonYAwm/Y6qmdJifoqIM5xjDkye8OuGc7WVeqG
         CcpbdvIq+PoPNA9FnWt2X2ed9PgE8dUmp4h1NR9444KnZ/aXTN/4UdT75fCYMXjwG7kc
         xUwg2QFvn3WWlv0udlNUb2trK5wfgo+1VOoEm3T623oHY6Euy/QQJhlbFKDHS4snh5lr
         Lkm/rpcUg8yTKSL/tepQK4VBr8DEIpvueFsecCWuwSCeGCgfAsxbMD+HUYaZ73qgUMUl
         BfFg==
X-Gm-Message-State: ACgBeo0phQnT+7Wk4KB79WSpVmcM3wg1slUU8i570MBwbhstlJwptSiu
	UUr1jwcLmZVBJIExdgmZHuOwoobEWyaDiHp+9Jk=
X-Google-Smtp-Source: AA6agR7bm8mPpUUJY4ncvftwWMu/7VrdSYwhN+VZHkwkeVNOVpRT4cvzU/rsGAzLjl6BjtlpzTZ33WDL/s/fD5kAklc=
X-Received: by 2002:a05:6808:1b22:b0:34f:7879:53cc with SMTP id
 bx34-20020a0568081b2200b0034f787953ccmr3378456oib.144.1663218502705; Wed, 14
 Sep 2022 22:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220914085451.11723-1-arinc.unal@arinc9.com> <20220914085451.11723-11-arinc.unal@arinc9.com>
In-Reply-To: <20220914085451.11723-11-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 15 Sep 2022 07:08:10 +0200
Message-ID: <CAMhs-H-Nxub7==J0gTO9A+Lw_hurWaUeR+ZoqnS5KrJcJs6S_A@mail.gmail.com>
Subject: Re: [PATCH 10/10] mips: dts: ralink: mt7621: add GB-PC2 LEDs
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, erkin.bozoglu@xeront.com, 
	netdev <netdev@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, Petr Louda <petr.louda@outlook.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_220825_893366_85F7C089 
X-CRM114-Status: GOOD (  13.41  )
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

On Wed, Sep 14, 2022 at 10:56 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> Add the missing LEDs for GB-PC2. The ethblack-green, ethblue-green, power
> and system LEDs weren't added previously, because they don't exist on the
> device schematics. Tests on a GB-PC2 by me and Petr proved otherwise.
>
> The i2c bus cannot be used on GB-PC2 as its pins are wired to LEDs instea=
d,
> and GB-PC1 does not use it. Therefore, do not enable it on both devices.
>
> Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/=
GB-PC2_V1.1_schematic.pdf
> Tested-by: Petr Louda <petr.louda@outlook.cz>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  |  6 ---
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  | 42 ++++++++++++++++---
>  2 files changed, 36 insertions(+), 12 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

