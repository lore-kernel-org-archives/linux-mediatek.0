Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D33C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 06:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EW499GBzYHaTH/WArZ0WtZvIkRlpsncxTw1RlPqz+v8=; b=PymBePKWfGWSRh/J26PE8e7jPE
	sXEZdQE8wxlpyDS1NTjzUCJ8hY822dfFsQ5m89SYQf/NhDNtMzF21VE/JJgh1LLTKqzKTFy5pTajL
	ypOVrzi1FTBbn12P/YiQZvpJcGQmA21XvQv3eko1NvFjtC8PDVJLF8GNJ+SKq3SSR0l6X7bFRmBeb
	R0ZMAnpgVM89VNg7DZ1qI7ktPOHGCaogTzzgi/97QOee0noHcHTpXt3j7HhdgYN3RLLwu9Z6u4N4Y
	MsJVtGTpip6aqEVkpQ/7tUcbGYAwZslZ67sLix8GzZCqcW/JdkplMWx6RnMSwEFfsMEFjESN/Wiji
	4c7AK2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJJZ-001pcV-Kv; Fri, 29 Jul 2022 06:17:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHJJP-001pQu-7m; Fri, 29 Jul 2022 06:17:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id y1so3784248pja.4;
        Thu, 28 Jul 2022 23:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EW499GBzYHaTH/WArZ0WtZvIkRlpsncxTw1RlPqz+v8=;
        b=bBJrwZNNbNwZOSdpiHnZjxTBlhq5e5F5z/aB01/7Rhm7XVlQWB/jv1YB3Yg3stPpPN
         SmPojYXgxob/8myvBqE/AYKB3hUIDzGgtgzp4td+2Rutu5SZSMSBz+TEPl7HNs7Bb9MW
         W7TCxTINNO2IXJYHAUFDEo60ceS/hW+jhm95xlptfVEjnS/+i/uxEzpBJqVXlteEWYKP
         MLSVJZ2NRzFuZR5K2IulKBp8EOOR/C3KOurSc/13nA+jBRKeS6G6Ni3gVaAmjbINYeTP
         Y/exdADOpBiQOL0wbDkY7ixd3HtrsRWGX3QW7Rcr/xwq05d0Ejbdfk37De6Lis+ytz3+
         Mzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EW499GBzYHaTH/WArZ0WtZvIkRlpsncxTw1RlPqz+v8=;
        b=yMC7NFRw9dhIJ9SMaamTfokqsWaF6jpUW/Gy00XRUro3fJhtIjZP3+63wi0Cp1+Yd4
         FWeXKI2KtIrZfEhbZ1LXpspxf5iaeHCP0YMYX4jssLUf/UjpLBSJ4J3BiEiZTTcdbfUE
         Mj3/Vsb65eBVHSVHNIA6dIfuWdOYEpbX1som9rCIcWQ1NjewKIZ2HL138UUV8C7thepg
         Ef1lBoq9ioqXQ/RZpRGSzyZBb10nV6k9dcp4d6NiMh+zh5d7pVcjzXAdbPZT3O7PKKN4
         5H6XBmyb2qV/rO79vGd3VdOxu3EWq6Pwe0QEYtthkv5ifNr+NQVdSu0TRZQJ2b5dHsiW
         VSnw==
X-Gm-Message-State: ACgBeo1XAec5ttEg5w+25ItNldX0hfUps+ECNlGZgqnK2Rb741/WRqN+
	18oRUi7c7VGQpZx64JcddsP4HOdFXnI6N7ArQpA=
X-Google-Smtp-Source: AA6agR5CfpBYT1/n0Fz3b0mpL30Y1BQpcR5ZJ1q53vOkI+o8r7h1QJKT9bGnP/JXhqgwA8TQcF5sWeEJfeZ5+jaoGc0=
X-Received: by 2002:a17:902:f646:b0:168:e2da:8931 with SMTP id
 m6-20020a170902f64600b00168e2da8931mr2450692plg.84.1659075444381; Thu, 28 Jul
 2022 23:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220722102407.2205-1-peterwu.pub@gmail.com> <20220722102407.2205-13-peterwu.pub@gmail.com>
 <CAHp75Vf85_uzA9fRxTizbPJxODcXFpM4wuU6DxP2j9UA47B_2g@mail.gmail.com>
In-Reply-To: <CAHp75Vf85_uzA9fRxTizbPJxODcXFpM4wuU6DxP2j9UA47B_2g@mail.gmail.com>
From: szuni chen <szunichen@gmail.com>
Date: Fri, 29 Jul 2022 14:17:13 +0800
Message-ID: <CA+hk2fYcw0szJ7bBvfEjtyUE_Z61_A1vFWmPSdhe-gmd5jbC6g@mail.gmail.com>
Subject: Re: [PATCH v6 12/13] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
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
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_231727_296045_D137E0A2 
X-CRM114-Status: GOOD (  14.71  )
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

Andy Shevchenko <andy.shevchenko@gmail.com> =E6=96=BC 2022=E5=B9=B47=E6=9C=
=8825=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=884:51=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Fri, Jul 22, 2022 at 12:25 PM ChiaEn Wu <peterwu.pub@gmail.com> wrote:
> >
> > From: Alice Chen <alice_chen@richtek.com>
> >
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> > LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> >
> > The Flash LED in MT6370 has 2 channels and support torch/strobe mode.
> > Add the support of MT6370 FLASH LED.
> >
> > Signed-off-by: Alice Chen <alice_chen@richtek.com>
>
> This SoB chain is wrong. Prioritize and read Submitting Patches!
>
Hi Andy,

After reading the Submitted Patches,
ChiaEn Wu wasn't involved in the development but he submitted the patch,
So, ChiaEn Wu <chiaen_wu@richtek.com> should be the last SoB, right?
I will revise SoB to

Signed-off-by: SzuNi Chen <alice_chen@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

If there is anything else I need to fix, please let me know. Thank you.


Best Regards,
Szuni Chen

