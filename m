Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD717C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 19:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wd49EutyMLwKOtVYeW3XG9F3kbsUtYIJI3CsIowTYE4=; b=dZfC4ZF2vnwdE7EzGCromTxuux
	KFzqko4VfgvcNpOfNPIa95A/JDK27GpBnNatGMlI/LKPZJDoIxB1igmBZqvwXCuFcoEoj5LQPn+5f
	VoX/I19RsqtYVxcdlWf58ohJbQeuXS2sJzIE/SbyMp4yLhSHc6UPcOYCgDbxgDZH7Pru5Y5aH5H6+
	jA1/P8DfiDE8PCdvEsKTHIbHNTYRJhrKn7x2+3fE+bJ6jgvy9VZ9sUSirce6lwxbNOBB4sydT5ene
	R9OacXYyiI/DSevLFIEZIRV+epUbwxKpNIUq95hBRYatUMdH1aFXe1sP5mXmBdnQPovmB7MOqK75q
	+DGQaSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHqU6-00000000Kpa-2pXd;
	Thu, 13 Jun 2024 19:51:46 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHqU2-00000000KnE-45q3;
	Thu, 13 Jun 2024 19:51:44 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a6f1cf00b3aso230421166b.0;
        Thu, 13 Jun 2024 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718308299; x=1718913099; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd49EutyMLwKOtVYeW3XG9F3kbsUtYIJI3CsIowTYE4=;
        b=ms7qpCCqWEFUDLjguc+AQfWcvYGzRFDNjagd9BcJCJr13uidTlmdxxdpG1utRRpRBj
         OjSVa6ruMbNnpsHC3PLUt9yWgBOFOeG9ydiZIy3NKDadVdL+DeZEv8r/YLmAWrgD3iIg
         +JKm6DYZ5JOdpvboOJqHCauNaByBBBd9cFEqRPdZLOo4H9qlNyCh+p1dVFqWzmf6uMsq
         fCZnC5ueywKoDXCzJd2kEwPZHzMqTwmo8qLhfQ2Vm284yIetLPEBhUGJcq/pXPeM3CR4
         tM0g4qu/WAiOY9IUGEIwioRRwntRjD7RvcgpnWw5N+fMKL6OuyIgF1Q1FBTolztzVvAs
         AsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718308299; x=1718913099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wd49EutyMLwKOtVYeW3XG9F3kbsUtYIJI3CsIowTYE4=;
        b=SbiEjNioUjDA9QuXWwWmR3rpJMpZ6eI2/8/v9I1Rutk/Pv+YhFuwVzEH5CEQHgYHEg
         dqXox/+OgtULirrNCooxXrDIvdnYWCFpee/HYAzKyARcISyONCVD+/MynoeVC3Yy9sCg
         SzBqxvSZHVRcCbQ80YkK7i+HNCNxwHw9VGPN+w1qgpXcsCqpmBSFSj/bYxUmRuUqIm6e
         MtjraOikAz9MKYKfIfMudxPiRXvMFYvJ0L/AdhlFw2MtUVlVOOY3z/AkXtFGVoPXPbTC
         WNwi7LYF1Z9MAOhjZArjRg6OR6TTIpEcq/Ifh7Pptojv0V3I95eB9RgHF2pInsrdQvc7
         zFQw==
X-Forwarded-Encrypted: i=1; AJvYcCVN2Rlm+rIs074pw9RXj6XPsFj+ZfrvLmRvOhxUd3++4y3Nj394TYdqZFkjY6js8NhIYD6bGc9V2XPBE41jg9lCiZxiVL1ZHJw6zDeamkTGJZ0EhUQId1DNiAN/6RN5/IecKaUzFIBlgQTg48+dD9vT1SvSjBSTqng=
X-Gm-Message-State: AOJu0YwyexdpyVoRTRRwiQLI0lN9X8wHf9ufdly9JeVpHT/GdPEkSukD
	X4SFwLSzmn4q5vgUDVtREvJz6+xVw8p6rONsJMfgbFmYRkWonQiEivIcC4E2efFhxQ9aM42LOwn
	GgvwqAMUDtPiIXSyInLy78uXTOM0=
X-Google-Smtp-Source: AGHT+IErRieTi+saRfAiHY1ySQX0ddVIoYhrdonTqyNzBa1+IpOMd/MmGEDmPaGqQkjrTu7v+AA2L9lTIH5K61Z97aQ=
X-Received: by 2002:a17:906:7629:b0:a6f:1285:5799 with SMTP id
 a640c23a62f3a-a6f52474235mr242477566b.36.1718308299119; Thu, 13 Jun 2024
 12:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240612012019.19078-1-zhi.mao@mediatek.com> <20240612012019.19078-3-zhi.mao@mediatek.com>
 <7c71534f-9815-4ea3-969f-c04d249d35d2@collabora.com> <18d2c28fc8b47889689a1506957ea2a308c80fa2.camel@mediatek.com>
 <171823714905.1550852.13442340621133903705@ping.linuxembedded.co.uk>
In-Reply-To: <171823714905.1550852.13442340621133903705@ping.linuxembedded.co.uk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Jun 2024 21:51:03 +0200
Message-ID: <CAHp75VcA9yZ6bVt+10FrzB3L3wPj8fW5UBB9D7p0iHjLaxWCpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: =?UTF-8?B?WmhpIE1hbyDmr5vmmbo=?= <zhi.mao@mediatek.com>, 
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org, 
	krzk+dt@kernel.org, mchehab@kernel.org, robh@kernel.org, 
	dongchun.zhu@mediatek.com, "heiko@sntech.de" <heiko@sntech.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"laurent.pinchart+renesas@ideasonboard.com" <laurent.pinchart+renesas@ideasonboard.com>, 
	"yunkec@chromium.org" <yunkec@chromium.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, 
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>, 
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?WWF5YSBDaGFuZyDlvLXpm4XmuIU=?= <Yaya.Chang@mediatek.com>, 
	=?UTF-8?B?U2hlbmduYW4gV2FuZyDnjovlnKPnlLc=?= <shengnan.wang@mediatek.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"alain.volmat@foss.st.com" <alain.volmat@foss.st.com>, 
	"sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, 
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "10572168@qq.com" <10572168@qq.com>, 
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"mehdi.djait@bootlin.com" <mehdi.djait@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_125143_041088_14F223B2 
X-CRM114-Status: GOOD (  18.91  )
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

On Thu, Jun 13, 2024 at 2:05=E2=80=AFAM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Also - Cc: Dongchun Zhu <dongchun.zhu@mediatek.com> who is listed as the
> DW9768 VCM driver author...
> Quoting Zhi Mao (=E6=AF=9B=E6=99=BA) (2024-06-12 12:13:40)
> > On Wed, 2024-06-12 at 09:07 +0200, AngeloGioacchino Del Regno wrote:

...

> > Our project uses Giantec VCM hardware.
> > For detailed vendor information, please visit: (
> > https://en.giantec-semi.com/yqmd/164).
> > The VCM datasheet we are referencing is provided by Giantec.
> > Currently, the relationship between Giantec VCM and Dongwoon VCM is
> > unclear, but Dongwoon seems to be another manufacturer of VCM
> > hardware.

There may be plenty of manufacturers of the same/similar IPs, but it's
not an excuse to have a duplication like this.

> > From the perspective of software driver development and maintenance, it
> > makes sense for each vendor's hardware should have its own software
> > driver.
>
> Personally, I don't think so. If two vendors make identical parts, we
> shouldn't have two identical drivers.

Exactly! That's why we have compatible strings or other means of
reusing the same code base as much as possible. This in particular
reduces maintenance costs (of all means!) _a lot_.

> I still have plans to refactor VCM drivers if I get some spare-time(tm)
> as almost each driver does the same identical task. They're all just
> copies of the boilerplate.  That seems like something we should reduce,
> not increase.


--=20
With Best Regards,
Andy Shevchenko

