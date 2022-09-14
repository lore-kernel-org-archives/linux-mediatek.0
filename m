Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB903ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+SZ90LOGKr6PSOG3NHenig+A+JoVupnzjOX8oY/5mM=; b=0M8sEYbOSL/9jO8TnZ4tJwHS4g
	mkeVIyYj5lp4SpUx8ZwR4SsiYrZBcQ+oy9NNmCqotDZqOxaKW3g4sM1fcY9/dP1+6tpnCLt1kxLzw
	JHvN2TF36CWFZ1XfPTOaJhreZ9bmm133ldur90lYZpeZ2C7GyKgcWyUB/T/i1Q+7P7xCbpE4FMqhD
	QSKfi7piH5rDMIU3MbAZQIoJvlZ9wVjOHLcu1Y+JzXmJIW01Fo+L3hduDZt9cAu5iBs3J4d6hXJRH
	5n4083OruZi/LhYBPyF9pPIRCe9DPbC9AI2pucPt8eIMCrrtats4U9A7cGmfdLBHcJSJYHcfjbfy3
	WekD9U6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOdC-00EAib-MN; Wed, 14 Sep 2022 09:24:30 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOJ1-00DpOh-Tg; Wed, 14 Sep 2022 09:03:41 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-127f5411b9cso39198054fac.4;
        Wed, 14 Sep 2022 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=D+SZ90LOGKr6PSOG3NHenig+A+JoVupnzjOX8oY/5mM=;
        b=nExX2H2C6WrTnNGSpxdkS/T1FL5M+Sr7vDYZT64HVjqQ5M/Pa7eAR4by6hMu0qfyxJ
         3qbx21WcZf9gvJ23WYaYT5830WSHS9I0fxKg5PWV043q44CqnXwRpghkSNe3CAkC/uqg
         JPNtPeZPgYSXBQ7jaLQMuYgYFWkLBrzEBMKeRSjk84LrI9NFp8PEgHV3rrvI5gEoAegf
         f0oQrUcSA3nLHzjEbTP2bLpRjk3SI89VDDLBFyZfxUCyDyebpuKlXPAIT+G/kgKm4CcM
         Wx3w7v7TzkDjxerXa+Q1jnVQXJueeoxUDhwHa49rCdpFkjQAs1c6QaIyJ738DjN9kXJM
         8TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=D+SZ90LOGKr6PSOG3NHenig+A+JoVupnzjOX8oY/5mM=;
        b=Bu4Nl0ewX+nstCs/EyLY89bqE6av2wdi4plAT57T1XEjd9c5MEQSI7UVlT97npH7Jt
         CVDF8gWgPJ1KZIWaPdd4ZQYipyj/e1glou7EEdopl8f3BEuwWc+V7G4HLheoW1NbMuy3
         dTZKonCFcgjGXCWLYy92lYmJfXcGFAliHASEu7GebBswh70bQ4rWLtpOAub5ZYx2VWOt
         xdkq/FipTHEWyq3FPPpweD5Erf4RDp+x1KVjNMsbIBS/kUnEZhx6RSYNdaO3uXKxc3mO
         v8I5tvaqlleEUXCH5GWPtYq2PCZ5LeCKLn0cdOkF4OuRhj030utgqEr96E/y5A2o7OCO
         yOmA==
X-Gm-Message-State: ACgBeo3Znw7hvzeLwH19XtArzYLHJeLm/gLw3kR30RYx/KDShsmTmPmm
	hGvsZ6AAHFsvRl9JiTI/cyvZOI+AYPxqI1vb3m8=
X-Google-Smtp-Source: AA6agR6ka3E1cNjL/pn5j8TiAFXOCTm4ghY2UhrM1mmRzKbdO8p0jFiJ1HzoekaKmYo3JI4vfIcTz0ZDPjt6wYynFCE=
X-Received: by 2002:a05:6808:bcb:b0:345:aa85:6f33 with SMTP id
 o11-20020a0568080bcb00b00345aa856f33mr1451152oik.83.1663146214114; Wed, 14
 Sep 2022 02:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220914085451.11723-1-arinc.unal@arinc9.com> <20220914085451.11723-5-arinc.unal@arinc9.com>
In-Reply-To: <20220914085451.11723-5-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Wed, 14 Sep 2022 11:03:23 +0200
Message-ID: <CAMhs-H8MohXO6xNf+vNodv9hDyCog5_Hjcb6_=_ujmYmmeEdSg@mail.gmail.com>
Subject: Re: [PATCH 04/10] dt-bindings: memory: mt7621: add syscon as
 compatible string
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
	"open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_020339_994668_C90685D1 
X-CRM114-Status: GOOD (  11.98  )
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

On Wed, Sep 14, 2022 at 10:55 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> Add syscon as a constant string on the compatible property as it's requir=
ed
> for the SoC to work. Update the example accordingly.
>
> Fixes: 5278e4a181ff ("dt-bindings: memory: add binding for Mediatek's MT7=
621 SDRAM memory controller")
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/memory-controllers/mediatek,mt7621-memc.yaml   | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

