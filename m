Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCDAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REOvcwTNX+HHh5DB1hw3v2xjt7wumUwB2puLvNL/Q20=; b=NXEqPydxUefTPC
	NvTunruweUqYgUWPTeWE/i8M5A2UdTwb7liWX01p/NiX9gvPLpHh7hvaDOfoeR3jwaUtYdLsUnB76
	Ha84HbUwGUv4cDsN2wCf0mqhNKXqY/WSYn4NmeZp9SDv6N77vIW7njZMeq2XJ/h4oKqsd1LvlOmYx
	MWOOIqmpWMOozzvaxHCj14AHxPA3rdhvBnRnOWh2CMDrxGz+5/Iljd/eyCsDT+y7LAiWWnEosf2gi
	gPwZaAmKt8RJn7tuM3y6f0v/s9T6M4OHlVsvgFwtpO3VMZzQt7MwEPVtxgAY72Aof5Iq7g0nAPvft
	mzyRYZLJfN9IFt+v6NMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQH4d-00CHrA-2w; Fri, 04 Mar 2022 23:10:59 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQH4a-00CHpD-P8; Fri, 04 Mar 2022 23:10:57 +0000
Received: by mail-ot1-f47.google.com with SMTP id
 40-20020a9d032b000000b005b02923e2e6so8589444otv.1; 
 Fri, 04 Mar 2022 15:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RuShRiqoesbAiGJ0CpdraJFq/JZTca6v5cXOWBV0j8A=;
 b=olfnyQwBFF/qQRBGzEqGEEZBHsjXbn3rjCkaoKTJIZuM7Nz7GHYuq3iHBHIf+5Qypw
 5ZGFkx6lCttMTWd5i7a/QcvzOLftzOnTIhs16OLyEals6YFWJYIMsrtWcIUrZ1U+oPOJ
 9AfIsTQIGflE99GQ0ypeyoO62d8Spw4AsWjIZM20a1QLrNEfGxIsDZHv9Q2lQb7PD7P2
 YfY14/Egu+fBFqBt2lYskEqDqIdxOam2Qhx395b0bZOff783ADEKPZYbr7phKaF4x8v7
 zPRX+5DvPc8PYiixZVp5YXEG/g88P2xmFT8Y+20aCPnOdBno/HIZwfXpyUQuzNMuxD4m
 X2yg==
X-Gm-Message-State: AOAM533sc4+eba3T0ZD0iDOgkHp70stUV19RM12C/HxjBeyeoseFHyOu
 Bg4wcRCv3BjH1N9gZkB59nEi8je3IA==
X-Google-Smtp-Source: ABdhPJxoHOlh3iJcAzoGmaWLYOE0MAvCtrMZ9X79UTOLyDJ2P5w9QsU2Oj3dFAizgZutXoAKGvi5HQ==
X-Received: by 2002:a05:6830:1e4d:b0:5af:3fad:e09b with SMTP id
 e13-20020a0568301e4d00b005af3fade09bmr444951otj.334.1646435455450; 
 Fri, 04 Mar 2022 15:10:55 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 o22-20020a0568080bd600b002d49b19bc2fsm3337303oik.23.2022.03.04.15.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 15:10:54 -0800 (PST)
Received: (nullmailer pid 635132 invoked by uid 1000);
 Fri, 04 Mar 2022 23:10:53 -0000
Date: Fri, 4 Mar 2022 17:10:53 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-media@vger.kernel.org, kernel@collabora.com,
 linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 3/3] media: dt-bindings: mtk-vcodec-encoder: Add
 power-domains property
Message-ID: <YiKcfeo7yjbljr+h@robh.at.kernel.org>
References: <20220225225854.81038-1-nfraprado@collabora.com>
 <20220225225854.81038-4-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220225225854.81038-4-nfraprado@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_151056_842261_BB278218 
X-CRM114-Status: GOOD (  10.94  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 25 Feb 2022 17:58:54 -0500, N=EDcolas F. R. A. Prado wrote:
> The encoder node may be dependent on a power-domain. Add a property for
> it.
> =

> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> =

>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> =


Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
