Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56173C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 15:43:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6299206A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 15:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6299206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qsX/AqI0RLzQQApLMHL4/Ea+hfy9/EOCaow2n88T2ZU=; b=f77s4g4egyy8smWHscvrFHeaH
	98Wd59/6Yo5m5lFdet9VG7J2rHtxRqGmEMbazfFdpqAOLfV81EJOrcO5DEija7w+3NEyaai9GB8v/
	HnmsrRFIlLeUgmQ7040uZaB9VhaVDmpwpGowHSnDVLJFaLfdZ+/jWrS+e+W4GSLDdFzjPxvfmabht
	CzhFmP8ecsENG/bEviyVNfTdc3ZmwQWtfWayPokGsKbmfr7jS4R9ARhuiookArP8Km4nuv0Tf++UD
	I2xb0hvNFEIQLTxduR7X/aXnd5ozDHJymK9+VzuNkqhW0Isx8g8CuCQxQvufbHUriNiiX6dlJnehI
	0VcwNO7jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyzLv-0005iu-Nn; Mon, 11 Jan 2021 15:43:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyzLb-0005cL-TT; Mon, 11 Jan 2021 15:43:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7B45207B1;
 Mon, 11 Jan 2021 15:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610379790;
 bh=RonP8ve3WthsTBKKQ/UytIvBztNvyV5RjN0+msXV9nY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EgsgZofnCOPBEefh+/TPgHC68i8JC3CVERGqmBI3ncBGYet9Hw0TLEERVXD5wXkFY
 duwV+IlNESa3Ygu7m9Och5ei/39fVUxOP1DGtZZcIocRggogvyMbWDrRCs8qDXDFqF
 ZrpTMQZYIY2OyI59+EGg7GincB9gN4EDdo5dp8Po2xmV8LVY3GCEBZkufC3KXpDH3I
 nP4xQentOyqNwkv75+pbdoYPmDdFoCnA8O3d4B09a8t3lz/Mntl7kXYBSuFl0utk2N
 3sPoTstRVpQRLjFTajeRCn/9iyiXEV60W6jZy8J88GxPk52xZZz+kMJYLeJUnKgkLd
 TScPvN2llX70Q==
Received: by mail-ej1-f52.google.com with SMTP id b9so299473ejy.0;
 Mon, 11 Jan 2021 07:43:09 -0800 (PST)
X-Gm-Message-State: AOAM533LPig+RQw/HPB3X11XqHq/QRJth4luIfmjnIQer1Dm1URwylSq
 jkyna8hRn3JRot9XKWhFdcTZm+skt/4DkedMCw==
X-Google-Smtp-Source: ABdhPJx/jzAlheiwQjfn7BpiqB02i68e/htTzamuYVsQwpyl2HDp4/Rfdpic2s2pRL+gj/DN5FUyq/zWNIoZo3v0HcY=
X-Received: by 2002:a17:906:31cb:: with SMTP id
 f11mr58560ejf.468.1610379788269; 
 Mon, 11 Jan 2021 07:43:08 -0800 (PST)
MIME-Version: 1.0
References: <1610092095-5113-1-git-send-email-henryc.chen@mediatek.com>
 <1610092095-5113-2-git-send-email-henryc.chen@mediatek.com>
 <1610163019.789930.3762037.nullmailer@robh.at.kernel.org>
 <1610333553.2992.7.camel@mtksdaap41>
In-Reply-To: <1610333553.2992.7.camel@mtksdaap41>
From: Rob Herring <robh@kernel.org>
Date: Mon, 11 Jan 2021 09:42:54 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+W3UL4-s6ezFJrhUYko2EBPsO9nMOGzGR1nQT3x_VtdQ@mail.gmail.com>
Message-ID: <CAL_Jsq+W3UL4-s6ezFJrhUYko2EBPsO9nMOGzGR1nQT3x_VtdQ@mail.gmail.com>
Subject: Re: [PATCH V7 01/13] dt-bindings: soc: Add dvfsrc driver bindings
To: Henry Chen <henryc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_104312_068020_E021957E 
X-CRM114-Status: GOOD (  16.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, James Liao <jamesjj.liao@mediatek.com>,
 Nicolas Boichat <drinkcat@google.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryan Case <ryandcase@chromium.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 10, 2021 at 8:52 PM Henry Chen <henryc.chen@mediatek.com> wrote:
>
> Hi Rob,
>
> On Fri, 2021-01-08 at 20:30 -0700, Rob Herring wrote:
> > On Fri, 08 Jan 2021 15:48:03 +0800, Henry Chen wrote:
> > > Document the binding for enabling dvfsrc on MediaTek SoC.
> > >
> > > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > > ---
> > >  .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 67 ++++++++++++++++++++++
> > >  1 file changed, 67 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dts:19:18: fatal error: dt-bindings/interconnect/mtk,mt8183-emi.h: No such file or directory
> >    19 |         #include <dt-bindings/interconnect/mtk,mt8183-emi.h>
> >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> Sorry, because this header file is added on "[V7,07/13] dt-bindings:
> interconnect: add MT8183 interconnect dt-bindings".
> Should I change the order of the patchset (let the yaml pathc behind the
> header) to fixed that ?

DT headers should be part of the binding schema patch. (Or at least come first).

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
