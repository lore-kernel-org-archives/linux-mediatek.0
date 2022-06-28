Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6670CCA479
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 11:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WRlzJEXIDSC/xppUDMk3dCziyjCMe9bw9g7ZjtMlNWc=; b=KNnaHH6Jcb9v6b7iS0p1NvLKjJ
	PKG4V1UbCAuRyYm9a04sIRzedXMTxT8qoCxSncHM5KEQ1Po2oazt8hM2doRffKRL+BsfN3fBjOd0r
	vvpjCBCCNwi+b7nnILRNTM7V4VSTt4Dcvzhv4AyyCDS+TBUlU+PUpdqRQAp2X55PTyLO8VSPZKUlP
	wIIp7+u2daFrGAPsJ9IrdkSOkMRTOenTPXeLYZJYXdWLhQFcXKUKHQ0oiGDd2U2PiQDw6hUES+FMC
	5Fw1rXDnOExJv4PSaTc+tOauwy21VYQqJxqpO4iN9V6C3FU+15paEvayQYH0jNQTC43KMBKjjkQaz
	duvDzuzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69oR-0062oM-WC; Tue, 28 Jun 2022 11:55:24 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o69oG-0062k9-3L; Tue, 28 Jun 2022 11:55:13 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id p7so20364579ybm.7;
        Tue, 28 Jun 2022 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WRlzJEXIDSC/xppUDMk3dCziyjCMe9bw9g7ZjtMlNWc=;
        b=CmaAQlqVxTtwAwTMBcNHdcD5nQ8/1n9uY6sAAnGoXMm/bskTVcJe0doxfjfSuV4DDM
         ycJrmTEU7M9ompmrsazJrcgK8CBOlHlKxkeOt5AKb7PaHVBJ5BdmBtpKhaL/omLeJwKd
         z8KIWABeC7iqGcV8umJupiQ+jv33fn1pYiubviGcSU1JMg/YFdU/oLBYxHNEyLAXNJ7q
         CXrLCTZFp+lpvSdjP1qxtjhI+7PnKczCA1dk/JaN/g81TGDN+1OIJ68dTwZdWHARiZdv
         fb/ZpWPoCUVwTZnMjHEKZ783H7+4wqhvDfhyEwNsJoST3WRImOzRQCQJwalBEqCZd6jE
         Fw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WRlzJEXIDSC/xppUDMk3dCziyjCMe9bw9g7ZjtMlNWc=;
        b=bu6cYSFEsiN2zB+0faWMLBFMMrpkrXFQ60AEA6gTB/q/4IQukdCkzvaIX09ruiAyRs
         2IAGwv6fd0QrF+XSC+pSuLvP39uPzDisQdmEz9D2eqmkwlbyLmI/XlXE2MjAWOm3frZq
         UxXLxudNkXr/95AeH5LDzsjKtGklQbPB2PE/H7pyo3bXkFwrYILWGc9a2kjg6N1Kqp0/
         qHB06GNYaGGALsQ3dn7c7OTYnlNwC1X9mSTEs8mt3OsZFLAv52bVshDfhokO4DAaxlQ6
         Muv3ux/0xSAaCSbjf2CyVTGhEi0Betp6YsSF9EaDSCM+Dq5KeU8y7GfxSMEpE4ibg1K+
         606w==
X-Gm-Message-State: AJIora+1TwBa66ii3uVXvXoCGN1ovCkMJd+Bfisa6KXIkBzEdbicjOtd
	nsnrVycrNaxxkuHcchD57AhuO5hBAUZjwds8eGs=
X-Google-Smtp-Source: AGRyM1uykJWizq1yWSU8bYm0BHbWS+35APefPp+3MlNtqzzo6MB05yQElDVVW/E20r0RIxop4VWi/8sWSqknbKaV00s=
X-Received: by 2002:a25:ca0a:0:b0:66b:4e6c:e094 with SMTP id
 a10-20020a25ca0a000000b0066b4e6ce094mr20612051ybg.296.1656417309029; Tue, 28
 Jun 2022 04:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com> <20220623115631.22209-10-peterwu.pub@gmail.com>
 <CAHp75VdgxR9aFQmi_MPrX=t7RMnKDiLAwWMvxbpW9OoQMJkKyw@mail.gmail.com> <CABtFH5+YLpYdWNsy1DwkKf19L6THo5NYvQ8e3rpo9wkTS9HxwQ@mail.gmail.com>
In-Reply-To: <CABtFH5+YLpYdWNsy1DwkKf19L6THo5NYvQ8e3rpo9wkTS9HxwQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 28 Jun 2022 13:54:31 +0200
Message-ID: <CAHp75Vccc3xx29DQUMdwEfPz4k3Zwn=T5g24KAzEw4Y8KOp62A@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	"Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	ChiaEn Wu <chiaen_wu@richtek.com>, Alice Chen <alice_chen@richtek.com>, 
	cy_huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, szuni chen <szunichen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_045512_182601_DEFC1E76 
X-CRM114-Status: GOOD (  12.84  )
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

On Fri, Jun 24, 2022 at 12:33 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=
=9C=8824=E6=97=A5 =E9=80=B1=E4=BA=94 =E5=87=8C=E6=99=A82:19=E5=AF=AB=E9=81=
=93=EF=BC=9A
> > On Thu, Jun 23, 2022 at 2:00 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote=
:

...

> We got a notification from Mark telling us that this patch has been
> applied to git.
> ( https://lore.kernel.org/linux-arm-kernel/165599931844.321775.8085559092=
337130067.b4-ty@kernel.org/
> )
> So, should we need to make any other changes in the next submission?

You may do the followup(s) to address all or some of the comments
depending on the case (e.g. good to clean up code with dev_err_probe()
use).

--=20
With Best Regards,
Andy Shevchenko

