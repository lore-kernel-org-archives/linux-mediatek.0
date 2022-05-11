Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7996C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 14:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTItRLs4Dkvglxt4Xfz7xiOGAwBPzeYaKaBkggv+JzU=; b=cxC3TUtdBbiTNF
	gAQ+ZYb2gUTONTfmZWvLDeV1feUVtCxPlImA+6JsY6sTvAqE696EAT8Nz8yEMHLuXdekLRqiLNO9P
	08TeuR/241D523LcZiV7oAvbz+A6Y6JV2F+r4xfrnnR4K8yUrdP2SUnY3voeMu/QkU82vyHBMDcMa
	bzN0aYechQ0ns7ltZoS0ykG4DxkVkKyuCxIfVuSZDSznv1JK+Ja811HMyRArFcZuyqL/8xZLBm9MM
	W/tNDYxG+2RiCj67oNGlCpE5zudJdPrxrjPeOAIolBP2aw4P8kt7j7P1BrSUrZj3ca9MD2DT81pc+
	V5b+a1YxUAd1iSWD7cpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nonSa-007FNs-IT; Wed, 11 May 2022 14:37:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nonSL-007FJ2-QH; Wed, 11 May 2022 14:36:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51E1361194;
 Wed, 11 May 2022 14:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DCAC34113;
 Wed, 11 May 2022 14:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652279807;
 bh=CFhh69pRRTRkzZMswQTkxgZWxD/YArFAjT9FIgk+yio=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gEiSBSsGKR+8BwK8haoPAsMJZYD8XCaC46lJnoHPerCMp1g6l9P3xZteEOsKk2MUo
 ZELEJ1mhPuDhJmP3W+BmC6+m5Y+12EYvpGP8QstJEZBeHL/AVpMiFpf493GaDnSS/M
 OkGALA59NNBTMT1eUG/2thE3TNfy8FjzAreDuz/5UUhAKiLbdQr/l3+ZqdH+XWYymp
 ZaPf2ZqzoiiKqUBpg+UMK5SZ278kFIWfvi1QQqMzqxhTdHy3Vb7OtHLdD9l3RgV0d5
 dQsiJXbqdK5Y2Rs8nGNZwhzkcD3yr374Vzpk+l1sKqylC3lo1EteelNQbN23gaG6vA
 yN18XzCLNNY/A==
Received: by mail-pf1-f182.google.com with SMTP id g8so2167958pfh.5;
 Wed, 11 May 2022 07:36:47 -0700 (PDT)
X-Gm-Message-State: AOAM531sqFn2Xy+V7qLmKoyKAyz+HelRXAC7klI3Gcf2KdQgrQS5H5oO
 DWOnltBAj9O8irU+gfqS86/6z+SsHty5lbAcWw==
X-Google-Smtp-Source: ABdhPJzuQsnkqZbdNusjFeMctKvTdpkvefeyuXEUsA0fTySx0Vw8lpkWlOD30zEX2dqbf4Ozf1dDOiJd7nqvDOobbuc=
X-Received: by 2002:aa7:9519:0:b0:510:5175:7649 with SMTP id
 b25-20020aa79519000000b0051051757649mr25841856pfp.15.1652279807276; Wed, 11
 May 2022 07:36:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220504091923.2219-1-rex-bc.chen@mediatek.com>
 <20220504091923.2219-2-rex-bc.chen@mediatek.com>
 <e45e68c76775edbf935418ca4f75dc83591805cd.camel@mediatek.com>
In-Reply-To: <e45e68c76775edbf935418ca4f75dc83591805cd.camel@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 11 May 2022 09:36:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcZ69-WPk6Oq54EgXPZo-wviu5-SrKEaAYRQ5LZU0rcw@mail.gmail.com>
Message-ID: <CAL_JsqLcZ69-WPk6Oq54EgXPZo-wviu5-SrKEaAYRQ5LZU0rcw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: dsi: Convert
 dsi_dtbinding to .yaml
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>, 
 "xinlei.lee" <xinlei.lee@mediatek.com>, David Airlie <airlied@linux.ie>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_073649_940779_9CEEE1A9 
X-CRM114-Status: GOOD (  17.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 11, 2022 at 2:24 AM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> On Wed, 2022-05-04 at 17:19 +0800, Rex-BC Chen wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> >
> > Convert mediatek,dsi.txt to mediatek,dsi.yaml format
> >
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,dsi.txt         |  62 ----------
> >  .../display/mediatek/mediatek,dsi.yaml        | 115
> > ++++++++++++++++++
> >  2 files changed, 115 insertions(+), 62 deletions(-)
> >  delete mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml

[...]

> Hello Rob and Krzysztof,
>
> Can you give us some suggestions for this conversion patch?
> Thanks!

You can check status for yourself by looking at PW[1] where you will
see the review queue is currently ~120 patches and goes back to 5/3.
If it is in the queue, I will get to it.

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/list/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
