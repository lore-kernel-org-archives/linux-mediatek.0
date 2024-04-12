Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9928CC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 13:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HaWhaqdaDfNBrfCl5nObWWrEOo5ajao2bIANOPV6KI=; b=dDCUlUryptoWGBw1HVEay4Pskz
	4YdKttFuR3sHBT6bjb4irAoSD8BsPmZGUxKjsQ9gVdHjNKzcxNlQB8TLLFiq0/6c3L8qQU+RCxBtL
	HyikH5PwIHhWKihHBypEQQCyOtkaWjTTf4S9OMDk5GlKK+P8QtiLNPy7+fW+wgjOm0nxZhj1iMUqL
	2LaAjTHF2sEKNa8xt02hiDQQomzP5Zz9Ej+HlHTpoWLzNzL3qaURfcly1YWa9Yz0h+eVwtrhFG7PK
	DWwDSsIz2Sd8ralUaeo4MIl3tNtf5b+pwMmpmSO1TwShSOVqKscUEqoQBHKh/X7I7u+/JAfImZDs8
	CwqeRXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCf-0000000HOMP-2fbq;
	Fri, 12 Apr 2024 13:44:29 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvHCY-0000000HOGf-38AH;
	Fri, 12 Apr 2024 13:44:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so149481866b.1;
        Fri, 12 Apr 2024 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712929460; x=1713534260; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HaWhaqdaDfNBrfCl5nObWWrEOo5ajao2bIANOPV6KI=;
        b=OFP8ArS9M9UK0pZ6xFzxA9H3rZAsYUCTSzv7J3Qe/6lla9/NJQMCjKZoRGrc8MJbtD
         v8KhZG4n7NrGAqToaYYB/FQqt1S7HHSt+zYKO0XShLUK8J18bTv26mxv87333jO5LizK
         06khHKwdt977/RGXug7afk2K76GOiD8lmK+gjr0ODsgGQ21ePXKRGw5bGLTz6naiXHbW
         GLyFJOj2D2N69K6+eHRDecI7QN5x5/+VEVc5wmJg5bBOi3RqBuCsXqKIyruChV+MVK2y
         LKTEeNPCJeU0rKXk1f82vKp7WLCYqgEwKgBezlxotyzyAzmpRZEndlP1wVuEOg3yMQr5
         D09A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712929460; x=1713534260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HaWhaqdaDfNBrfCl5nObWWrEOo5ajao2bIANOPV6KI=;
        b=MUjibRkXo/d0xMcZLAqOV+PsbWKlLH8L69Nqixw8b1HIulXAt/3LGsy5KBxyl4XDjL
         5ic6zUQl8ehYaeF3l78bJ+108HtitcZGzll2iUhLuTL7ZQ0N8sOYG3n5SVeeD+aTEUJs
         8xcrmSzcMIhBujAwXOEXmvOVBPK7Kiddd4e1r4B+6pHjvXFQKnbeU1KT/TzI0R7IRFm9
         UFd60kHlzx0JSnvVkNv/9iw4cHJ82cBpXfQP8CEMBjiWs1pR+INOsmyqJ4ou8Cvg4Z6d
         LqruCPrsHX8x6bf7zbT2q/PMl/o7+/8KIjdrEKwFXaZGYbv7ZiY5f2ZnVkLWRgv0+Il1
         auMw==
X-Forwarded-Encrypted: i=1; AJvYcCXzsyUQwPaKAmGK8PrF+O4FmVfqHtq9ySiSiAATftOd/hW8W3k14vf6eO5OTZ9VXvM11ZNqnz7tRuDMFa33oARXBvKZAw4sLV8bTgxcUWW+8ilf1kLzHViZ2SAJSwyZ9vOrVcrSjTddVigttXmjAoHQBb3tO1/ApNk=
X-Gm-Message-State: AOJu0YycMivV7eG+gm3wToaJZUqYFLOIZFQOp/0dl7aSoulEQuT8r7xB
	fc529RGUOEruOegsKUPibAm3/RFs09Qd1SNfbwR4Jb3EvDLcaRrb9R9/gjW3f6Pk5Ra7685cFYR
	7D5I0EDvVmJpmCyfKtzzXRpN1BYY=
X-Google-Smtp-Source: AGHT+IFEC8uEkeMBRcT6w34by85kMHZS8oKJ5rLKlabaLd1wkl5XRtWFVYL35N3RsZ6AdPmJmF+szA/5GkrvS36dQyQ=
X-Received: by 2002:a17:907:2ce6:b0:a52:a25:2077 with SMTP id
 hz6-20020a1709072ce600b00a520a252077mr5020537ejc.14.1712929459777; Fri, 12
 Apr 2024 06:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240410104002.1197-1-zhi.mao@mediatek.com> <20240410104002.1197-3-zhi.mao@mediatek.com>
 <CAHp75VfF0pbrKXjWZg7sTr-T=_CbjP+deFQP-VLCGX8ooahctg@mail.gmail.com> <ZhkBIee2X0UY40yD@kekkonen.localdomain>
In-Reply-To: <ZhkBIee2X0UY40yD@kekkonen.localdomain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 12 Apr 2024 16:43:43 +0300
Message-ID: <CAHp75VcKFCvzcESqsc8OQ5SVuO4gJiE5ZEUwkdoqvLzM=2PejQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add GT97xx VCM driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Zhi Mao <zhi.mao@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Hans de Goede <hdegoede@redhat.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Paul Elder <paul.elder@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@bootlin.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com, 
	yaya.chang@mediatek.com, yunkec@chromium.org, 10572168@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_064422_882974_79155D4A 
X-CRM114-Status: GOOD (  12.12  )
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

On Fri, Apr 12, 2024 at 12:39=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
> On Wed, Apr 10, 2024 at 07:00:02PM +0300, Andy Shevchenko wrote:
> > > +static int gt97xx_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh=
 *fh)
> > > +{
> > > +       return pm_runtime_resume_and_get(sd->dev);
> > > +}
> > > +
> > > +static int gt97xx_close(struct v4l2_subdev *sd, struct v4l2_subdev_f=
h *fh)
> > > +{
> > > +       return pm_runtime_put(sd->dev);
> > > +}
> >
> > Hmm... Shouldn't v4l2 take care about these (PM calls)?
>
> Ideally yes. We don't have a good mechanism for this at the moment as the
> lens isn't part of the image pipeline. Non-data links may be used for thi=
s
> in the future but that's not implemented yet.

Aren't you using devlinks? It was designed exactly to make sure that
the PM chain of calls goes in the correct order.

--=20
With Best Regards,
Andy Shevchenko

