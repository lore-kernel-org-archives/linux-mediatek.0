Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E09C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 11:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cna4B9OkGYaAGZnmz7auaJoanPikLRaFUkJT1PNzdCg=; b=NCnHrfpBKeY29unkmeNInn1qEu
	Thhp1n+ip+juU4I/W4+qb8a/TogLfTTQ+GfX35XwWhhgo6JGew/Cv4BgmU1YJ31BlKlsEOh89Euj1
	Qz1QtS7j9f7FB5a3gJZXLw91++fyOCHaubJTPukD2pJ0hfMGkPO+jLzXa479LR86DqBVCjAQzHFEE
	phXOeZriJvmnM+vYr3yc2Gz3sKbyHJy8tkutgKa9O0k6jbqH/tRURRnT9J7DfO0mobTOibz+tD47N
	jqNo7pj6X0N7D9y46b9Bg9Q+L/Yy+zbPLe8es/azbeI4SbTZemhvab+0LgsMv7sM0Caf6UQfa3D4C
	/PfoFkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67lC-004Upl-0b;
	Thu, 23 Nov 2023 11:20:42 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67l9-004UoG-1o
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Nov 2023 11:20:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-285625e1851so419683a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Nov 2023 03:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1700738436; x=1701343236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cna4B9OkGYaAGZnmz7auaJoanPikLRaFUkJT1PNzdCg=;
        b=ddt3gslhsn/g57m1+PiqYiTmj1RJ8YrdMpcmkGRXEFldPOsfzxdcH9BVZ/I85q3HMU
         qckiGIykh3WET6kQ1mkyPraZb5IBwYps4PTQ9YDv49CmaupPQ1zNsJAdgqmRRA5VrDZv
         g5ugVEpP8HsJOlhBkFgh9WCRZ0aTyEaqZUiFHU5XeIu+YLFl4RZb3cIi454sTkvXEEos
         t4vFjHb5bpXHME/kgjd1d0wxirq2pIhqFWIU6JCSlQQNsUkDF5ifEVjRrQGryyUnxAhI
         c8R5EbOcwWZ53FXvWwzxvCHJdSM2OhfJZkchZu0CBEPmV9VkD2DdlWkapAW1800FhxUE
         f6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700738436; x=1701343236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cna4B9OkGYaAGZnmz7auaJoanPikLRaFUkJT1PNzdCg=;
        b=i7E7mBcTc39DthwJFHl8AEg60SZ+M/tSymYFa1uZcVOFo6YcFprsDsOIFgguINUCfR
         lIOkeI1e0gryfTTgEM/3/af4E51yhvp/wOuqUCGMEhnOgQceH5eeEb13prqqw8gnBlPY
         9GETaCsuZAwVBMPcmoCzoRxsvjpvlToN5cOkc8alGwK74bFDKFsssI8culs1DLj//ifF
         /OouLq0bXExeLK98Tk9+ZjCS80b2pgcA5K5qyYpvUg2pBomwVZvea93ixvup59t40yQE
         m2BIw7wpY5RpRqo2aT3QlSbS7m17YjT/AfTrr7KrLL7qCrKerB+pjWs9BxdZl2oWqv0D
         qtlA==
X-Gm-Message-State: AOJu0YzATBIlY2M4/kMFOY6BPBgu4ElretVyGd35HUPTozRlm4MYiQvc
	yM2CE82kLCv6kthmLvAYQ7RE5OelVatetmEWK8dyKg==
X-Google-Smtp-Source: AGHT+IHpAi31AQJzfI++IcN15h2i2fjElwAR2+A2cq4nCMgOSMsdXf8at6TXQhpec1XOEn9ZPz1TGslnfGloZZAtd7g=
X-Received: by 2002:a17:90b:3014:b0:27d:dc9:c67d with SMTP id
 hg20-20020a17090b301400b0027d0dc9c67dmr4905828pjb.36.1700738436187; Thu, 23
 Nov 2023 03:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20231120135041.15259-1-ansuelsmth@gmail.com> <20231120135041.15259-13-ansuelsmth@gmail.com>
 <6593e6ae-3ae7-49e2-a6e9-c37f5a887fe3@lunn.ch>
In-Reply-To: <6593e6ae-3ae7-49e2-a6e9-c37f5a887fe3@lunn.ch>
From: Robert Marko <robert.marko@sartura.hr>
Date: Thu, 23 Nov 2023 12:20:24 +0100
Message-ID: <CA+HBbNFjmwtfJAON_BX9c9hqcBTsReMPm9ajPjFF_2z+LbARnw@mail.gmail.com>
Subject: Re: [net-next RFC PATCH 12/14] dt-bindings: net: Document Qcom
 QCA807x PHY package
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Harini Katakam <harini.katakam@amd.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_032039_598521_A822DD6B 
X-CRM114-Status: GOOD (  16.45  )
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

On Thu, Nov 23, 2023 at 3:15=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  They feature 2 SerDes, one for PSGMII or QSGMII connection with
> > +  MAC, while second one is SGMII for connection to MAC or fiber.
>
> Can you connect 1/5 of the PSGMII SERDES to the SGMII SERDES? So
> making use of the PHY as a media converter to connect to an SFP cage?
> I assume the SGMII serdes can also do 1000BaseX?
>
> How do you describe what the SGMII SERDES is connected to?

Hi Andrew,
I think that the description is confusing.
QCA807x supports 3 different modes:
1. PSGMII (5 copper ports)
2. PSGMII (4 copper ports + 1 combo port)
3. QSGMII+SGMII

So, in case option 2 is selected then the combo port can also be used for
1000Base-X and 100Base-FX modules or copper and it will autodetect the
exact media.
This is supported via the SFP op-s and I have been using it without issues
for a while.

I have not tested option 3 in combination with SFP to the copper
module so I cant
say whether that works.
From what I can gather from the typical usage examples in the
datasheet, this QSMII+SGMII
mode is basically intended as a backward compatibility thing as only
QCA SoC-s have PSGMII
support so that you could still use SoC-s with QSGMII and SGMII support onl=
y.

So there is no way to control the SerDes-es individually, only the
global mode can be changed via
the Chip configuration register in the Combo port.

You can see the block diagram of this PHY in this public PDF on page 2[1].

[1] https://content.codico.com/fileadmin/media/download/datasheets/qualcomm=
/qualcomm_qca8075.pdf

>
>   Andrew
>


--=20
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr

