Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A917C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 22:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWOOAXRvMIn3nmdoRTAsM6gMSIFiVMl8rg0+vLOcNWw=; b=1yrcZzEz0+rum+
	P9XbyJrypczbFWIzVtQ04LUvh6PA1rN6Nel4+csrLXttxB7AQkyvOUdHJDhmroC2LkGCWz9XVO0av
	HHog6sk2PQ5/jNbWzWfoY10ZvSQRsGg9Wug7sybIdBD0RaV151Gl6rSqSvjZMn2kjy1tKRjJrmwtq
	yAisMKhbAVOgM1vLuYi3sy+Rq8kT9b/v9hOv/roCijgxUI5fZTgzCyQbSvps0LRnEjvUr2I2eqNhI
	pc/FLUM1nU6cpBx8OrW8dJkywacvjuKiD61YV9TNmGKKYYXELcsOBUN48faqfavcqEpOJD/9gr5lx
	Nfkf9Fc9eHplL9mPYReA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noBzS-00GagB-W3; Mon, 09 May 2022 22:36:31 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noBzI-00Gaby-0J; Mon, 09 May 2022 22:36:21 +0000
Received: by mail-oi1-f179.google.com with SMTP id e189so16746364oia.8;
 Mon, 09 May 2022 15:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c1M6wqhWWv3BpYBqrk6no0d2EvsycYmqX1VGhpzRGEI=;
 b=PbcqbSNEWKUc6aOODA880Yqifz7CinsNWORYZECRBxJJLvOQAIKEOIBqC/zgWVpR5C
 tbEJ5fRGbwAPx8vgIqc4H3iWu1F8vhp66z5rUTl8EXGmWFThLp7gJPWhV+KaDdAFRtZu
 DByQRoaYNwyW0DLlSItk3wOIDU9GXiO+NZHCROVsWWrTMm4j2NoiEqvWAo+TanF2ekwq
 AOvL6uO3OkMtFugRDzRWofKeMUHwF1HVAtNW7sa7uACLqYJICpelOcA3l3kQGJlifMN9
 Y0R+2njlQpxF6Hi04ITvxWKiBypVG+qy4SsDTf0XRz4uzickk/TkKlKxw/vdNAyIeAkf
 fYpg==
X-Gm-Message-State: AOAM5314UH7GIfcpN4KsQ4FLNW28HXbVx6wEOdvOuyUrP1onYPPYG5ft
 vAShzB74HIq+QHS4BiRFKQ==
X-Google-Smtp-Source: ABdhPJwSvKg6NdOMWBJFDdtLoIBBQirxE56XmsbpySMSeXjq7HMZUZDlUFltYh7Kr/XklHJvznIbgg==
X-Received: by 2002:a05:6808:11c4:b0:2d9:c395:f15e with SMTP id
 p4-20020a05680811c400b002d9c395f15emr11975287oiv.47.1652135776986; 
 Mon, 09 May 2022 15:36:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g4-20020a9d6184000000b0060603221250sm5139319otk.32.2022.05.09.15.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 15:36:16 -0700 (PDT)
Received: (nullmailer pid 335215 invoked by uid 1000);
 Mon, 09 May 2022 22:36:15 -0000
Date: Mon, 9 May 2022 17:36:15 -0500
From: Rob Herring <robh@kernel.org>
To: Miles Chen <miles.chen@mediatek.com>
Cc: allen-kh.cheng@mediatek.com, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, devicetree@vger.kernel.org, ikjn@chromium.org,
 krzk+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, matthias.bgg@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding
 of mt8192 clock
Message-ID: <YnmXX0DldjhmbjY3@robh.at.kernel.org>
References: <YnGjScfQA9axBYBO@robh.at.kernel.org>
 <20220505053111.13924-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505053111.13924-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_153620_087788_E070B44C 
X-CRM114-Status: GOOD (  16.27  )
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

On Thu, May 05, 2022 at 01:31:11PM +0800, Miles Chen wrote:
> Hi Rob,
> 
> >> From: Matthias Brugger <matthias.bgg@gmail.com>
> >> 
> >> The msdc gate is part of the MMC driver. Delete the binding description
> >> of this node.
> > 
> >An ABI break is okay because ...?
> 
> Sorry for that, 
> 
> If the mediatek,mt8192-msdc part is removed from the driver, 

That's an ABI break too. You just need to explain why as Matthias did in 
the commit message if the ABI break is okay.

> Is it ok to keep "mediatek,mt8192-msdc" in the binding document? or 
> we should add '# deprecated' to "mediatek,mt8192-msdc" and keep the example.

We do that sometimes, but depends on the situation.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
