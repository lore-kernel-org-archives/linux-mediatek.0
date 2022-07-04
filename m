Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837F4CCA483
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 09:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIA0tkEJFCPwLmR+R6eKHNKrvI9a6bVM4TsihGfrld0=; b=sOd1MP8T7nLVS83HtW6nFgsDvt
	hPV+K5gTOUp6D9dlqPSC4FNFFnLrc2XFH5CrjOQw+LM/UFgVxxpBREKsiSH9+E4ArFckieiJgEs1C
	nhzYYKWIYi7LUelEik960B7vmvRR3avsu7bsiHkvg2y16439P/a/Ykvj2tFA1yH+aC3FHjjYQDmC/
	13AFp0Ma4M8arhghL/Q27pN/nP0x6Fo0tDYvFBOCUsXurXfkMqh83hZp0D7IGAChCABpVLnErcnzn
	9NNrm0HXjC0XcDYTb02NxZdCcepGW0508GxnGIUXlXSl0A+Gi0A5FkC2FGfU3AYFJU7n8y8S72AUU
	EhhmEFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8IQt-006UXK-GW; Mon, 04 Jul 2022 09:31:55 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8IQh-006US6-Fk; Mon, 04 Jul 2022 09:31:44 +0000
Received: by mail-pl1-x62d.google.com with SMTP id r1so8062311plo.10;
        Mon, 04 Jul 2022 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xIA0tkEJFCPwLmR+R6eKHNKrvI9a6bVM4TsihGfrld0=;
        b=f8MhiLRjvn4JhQhz9F64yCgS5B6jrH8tJwT1awj7AGv9RShuJdBVz84vc1kQVsx0Lv
         eNwaezjyn3nuI01xLjtA8+y0NZAqsqTswX489ZxWe/DK4qA3KOAt8JChBJylkfu6iBcj
         ORlmB+OW6RB+2+Vau8HlQetnTopYsjVTFjp0f9KRNoR/+YI371o5iIsodX7EUGlhLxKP
         kIepqqS2tlY+l7PfLRiLbmuc06ZAkcN8W3clHbhEfFPx2LGi5BU/JurrZIflfzIJK1dI
         KLvXaDm+sy2U5Xe0lntfK9VA1zVFQuJyC2Hbzq2cctn7nouM2bwK0yqcoPWSdeZyN5vE
         +/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xIA0tkEJFCPwLmR+R6eKHNKrvI9a6bVM4TsihGfrld0=;
        b=IN0635AKGjSGH66IrH8C7toMrnck+0YTX/eu224GpXkqRGpVO8S8iZGL9XCM0jtxQM
         Coh4heYIK/NMiy31rtbSuTrjmzvqizWUBZz3L401g/QhigQX6Xt54Uxw9azI6U/SyAm7
         32YZeAfCGRKVym0OUuE1fJh97G3iko5v5Zh/sQIUAZOSCWONQSIqGp27Nmww3X/YRCWr
         fBZJGq4jSM8wzeKPdrRIxculJLMGU0yJX0fByTy9jdmER5y+kB+m5DudEOLz2nHZtHpV
         /CmMR6muu1sLE686apGRYEZW6fz6i7SQ1ZkAdgp72P0pNd0pacn1HYEJ3/fg4EYhyq2w
         Tmhw==
X-Gm-Message-State: AJIora/uZaEod1TLPgRj8r7ItnJ6s0h3s4tHdXL6KzO4TpxXN+YEUVI4
	+WDydxoQMFXAE/njEkrlo9qv1QaptRKtk7vIfXg=
X-Google-Smtp-Source: AGRyM1snqrRpQbd96zgAVBmjrPX1x2o3afFwTRTiOLpzM13U4eENpimphE3z0PHrUTRqdjm3Nu9HaCkQlEPGsPeCLlE=
X-Received: by 2002:a17:903:110c:b0:168:fa61:1440 with SMTP id
 n12-20020a170903110c00b00168fa611440mr34740455plh.149.1656927100855; Mon, 04
 Jul 2022 02:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220704053901.728-1-peterwu.pub@gmail.com> <20220704053901.728-9-peterwu.pub@gmail.com>
 <YsKXcnys2Wa8Zz0p@kroah.com>
In-Reply-To: <YsKXcnys2Wa8Zz0p@kroah.com>
From: szuni chen <szunichen@gmail.com>
Date: Mon, 4 Jul 2022 17:31:29 +0800
Message-ID: <CA+hk2fYA3phYAoh+BFr0ddy9MR8Ro1WCoqBpa1UK2StwMtLyfQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] usb: typec: tcpci_mt6370: Add Mediatek MT6370
 tcpci driver
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, "Krogerus, Heikki" <heikki.krogerus@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, chiaen_wu@richtek.com, alice_chen@richtek.com, 
	ChiYuan Huang <cy_huang@richtek.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	USB <linux-usb@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_023143_590872_E38E6465 
X-CRM114-Status: GOOD (  14.55  )
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

Greg KH <gregkh@linuxfoundation.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:32=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Mon, Jul 04, 2022 at 01:38:56PM +0800, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add chip level mt6370 tcpci driver.
>
> What does this mean?  Please provide more information about the hardware
> being supported here so we know how to review this.

Dear Greg,

MediaTek MT6370 is a highly-integrated smart power management IC,
which includes a single cell Li-Ion/Li-Polymer switching battery charger,
a USB Type-C & Power Delivery (PD) controller, dual flash LED current sourc=
es,
a RGB LED driver, a backlight WLED driver, a display bias driver and a
general LDO for portable devices.

This driver is used for the Type-C & Power Delivery controller in
MediaTek MT6370 IC.

If we change the commit message to

"Add MediaTek MT6370 tcpci driver.
MediaTek MT6370 is a multi-functional IC that includes USB Type-C.
It works with Type-C Port Controller Manager to provide USB PD and USB
Type-C functionalities."

does this meet your requirements?
Or =E2=80=9CAdd tcpci driver for Mediatek MT6370 IC=E2=80=9D is enough?

Sincerely,
Alice Chen

