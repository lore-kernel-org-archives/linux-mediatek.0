Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E075C04FE2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 18:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vH3CkbS+no8xu7xLg3uZvAz4wzema/itwp2Tc+c167Q=; b=zhUikf85KCaZ72tdKOQU4xtEYE
	9kM+3qYavu1wqKKzSVVoR6oPUeOKJs9JE1O+8/Zch8T0Se9x96Th9+swQ7aQ+7wAVLMb3JUyGgDPH
	zGALqdFyooU5GHWTFPw9GCrgzmBeqUNWdB++Mfj39EmGwQhufR2La0CUyyWwd9lNksBXiHN+qP/E7
	PySJmxwK1TdNLtVrN5WeLhiqJJvzz+mz0DEcYs2E1P6z2+WFQHpN9npyx0bUOMDIBwrs7RzbgUQyq
	X7OOgSvq3wciPJX70T6WFdIp6ab20V3hSInOuW6Id5HJCN8k8dNeMqctZ0smC24Mf92h3ZG6l02m+
	DCGXiJfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWLCS-004msU-02;
	Wed, 16 Aug 2023 18:24:56 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWLCN-004mqj-1d
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 18:24:53 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6bd045336c6so6000538a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692210288; x=1692815088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH3CkbS+no8xu7xLg3uZvAz4wzema/itwp2Tc+c167Q=;
        b=llZD2J6325NRzggUheb32gJnMOi0s+ae4Wl7M+BJK9y4mft/TBWwNVki7sdnPSIBgP
         0sGjTfxBw+CvxYl8en56GwsG/rqZVEOY3cv2nvoXeWLsI3qQbzU1He0r4Xco2aHaObgD
         cq/JIfDJBlkJQsT0zsDGjsyj48B8MzOmd5EX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692210288; x=1692815088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH3CkbS+no8xu7xLg3uZvAz4wzema/itwp2Tc+c167Q=;
        b=Xxp6AAXqzNGo3Ttd3kmMTFYPG2ivJUyXM9HdSPInLtwf9IFo7HqyB3WwbCZE67VSTY
         7wkIdP45vIebgTjPXOoCO5jgCGl+NNgeVNlCfAkSCGdD7gWZGAvSMs39HtPR0GHDNQM1
         BUi1przXuUa1AdHeoPT3UdFesiGZlkpw0bqru0p9nMt9lgd/tceb8fGF1b8C9xRZd4oD
         GZbDytr+B7cG33puVt+wfcoiBkpFgTWM1XRUm62bGjdRCVDisII/Luw0/8iU9C19w28K
         KJY/DvB4cJVLSEXed8UrWSOh3zcpfeoxI/z8Sja6BSvCac2TZpge46GcJe+X/M4Dj+KR
         F7og==
X-Gm-Message-State: AOJu0YynMit0ZJUEZ+AhhSv2lEo07HXiJ1laIr+ksjrH0z3Z330jUccG
	6pkrEPorCJ+myyXorIT99ULAiuk5jF+8669e5DXVRw==
X-Google-Smtp-Source: AGHT+IFhH83WvJtRVMVm2GAtVDT3sTRvuK+g1KkIMZB0RU5RRarSlXYvZLoA25e52zZYKSGVkqvK7p18o08QNZFd3O4=
X-Received: by 2002:a9d:7d13:0:b0:6b9:9129:dddf with SMTP id
 v19-20020a9d7d13000000b006b99129dddfmr2763929otn.16.1692210288472; Wed, 16
 Aug 2023 11:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230816104245.2676965-1-hsinyi@chromium.org> <6702bac712daab13698b9bb9ad81d49e@walle.cc>
 <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org> <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
 <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
In-Reply-To: <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 17 Aug 2023 02:24:22 +0800
Message-ID: <CAJMQK-jgcH-OBQox3fisr0M0gbhFnSvKWCHwos2mtiRH7t8kVA@mail.gmail.com>
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <michael@walle.cc>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal )" <miquel.raynal@bootlin.com>, 
	"Richard Weinberger )" <richard@nod.at>, "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_112451_545756_26D44AD1 
X-CRM114-Status: GOOD (  26.97  )
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

On Wed, Aug 16, 2023 at 8:34=E2=80=AFPM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
>
>
> On 8/16/23 13:22, Michael Walle wrote:
> > Hi,
> >
> >>> like a fundamental problem and that commit 39d1e3340c73 ("mtd: spi-no=
r:
> >>> Fix clearing of QE bit on lock()/unlock()") is broken in that regard.
> >>
> >> what's wrong with the mentioned commit?
> >
> >         } else if (nor->params->quad_enable) {
> >                 /*
> >                  * If the Status Register 2 Read command (35h) is not
> >                  * supported, we should at least be sure we don't
> >                  * change the value of the SR2 Quad Enable bit.
> >                  *
> >                  * We can safely assume that when the Quad Enable metho=
d is
> >                  * set, the value of the QE bit is one, as a consequenc=
e of the
> >                  * nor->params->quad_enable() call.
> >                  *
> >                  * We can safely assume that the Quad Enable bit is pre=
sent in
> >                  * the Status Register 2 at BIT(1). According to the JE=
SD216
> >                  * revB standard, BFPT DWORDS[15], bits 22:20, the 16-b=
it
> >                  * Write Status (01h) command is available just for the=
 cases
> >                  * in which the QE bit is described in SR2 at BIT(1).
> >                  */
> >                 sr_cr[1] =3D SR2_QUAD_EN_BIT1;
> >         } else {
> >                 sr_cr[1] =3D 0;
> >         }
> >
> > "We can safely assume that when the Quad Enable method..". We cannot, i=
f we
> > don't have 4 I/O lines. The quad_enable is just the op how to do it, bu=
t not
> > *if* can do it. It seems to be missing the same check as the
> > spi_nor_quad_enable(). But I'm not sure if it's that simple.
> >
>
> I see. Then extending the if condition should do the trick, as
> spi_nor_write_16bit_sr_and_check() is called after setup. Something
> like:
>
> if (spi_nor_get_protocol_width(nor->read_proto) =3D=3D 4 &&
>     spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4 &&
>     nor->params->quad_enable)
>
> Is this what Hsin-Yi is hitting?

Yes, it is. Adding these checks can solve the issue. The read out
width for both read and write is 1, which matches the default bus
width.

Thanks.

