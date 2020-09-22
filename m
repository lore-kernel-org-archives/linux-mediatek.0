Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1010C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 16:08:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C5922206
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 16:08:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XR4eLCR1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C5922206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w/xaxo/58ywlN+zUtEyrTONoy49neCj6R1Y67UauGI0=; b=XR4eLCR189U2mlBIOcdDMJdf+
	jsewGJHRIww6vbXLG5dAP8UvMmCb7yf1GS4kWlLJgDL+zeintk9vcGOIq2M5XoKZ2zZsv9VSOXQQ0
	oEIneL0B8xCBU3xNUIq56/y4lLD7WjFtpYod76lwS6Dr/LDszDk7H/DkuJkH6gt6jiiiQjymzBHWG
	38W4ryFv+AJXjKpS0mnNsbTssAl+bkYxRooKu5RhBD5Q9i5lHJoXgf+e/mtCdSyBMmTv58MBDOKEw
	/4+DiqH9ldPKj4Y6ldBCst5F3hU8UI5Z65lMCwY0H96jS5gs2j1QzdLzmIATweMGpyULGP8BCVqlF
	3B/RUnZPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKkpe-0000vN-Vq; Tue, 22 Sep 2020 16:07:55 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKkpb-0000tP-QV; Tue, 22 Sep 2020 16:07:53 +0000
Received: by mail-il1-f193.google.com with SMTP id y8so17488508ilm.11;
 Tue, 22 Sep 2020 09:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F7+BrvUPgVKWs+Ft1mHTZOhfkcaTDiJxgGH1Y7f/TKM=;
 b=SzWFOANyad4wUHG2ZZJnBqO//+J5IwToul2lVpK1ZEnjjFgjb8DmFmHOly7QwQDsfz
 2SqkKvTOks/oJ3VrrENkqkb3afubzomthsUAaRBcw+v7MpK8TDqaGtOjI5AV3F0C0XrQ
 Z/cvaJZ0dL5Q2Xew2Xr8ITRTrpFHr/bnyEUj0DzGKgF5h0emb7OiwwoGF4u/mvGGb8Cc
 syfPImLsMIHMVB6aZ5yfUEAmzqprpXPOJSmd5N1uCWEbpc1S/8b8cr3sWkbYCri8s976
 MQiEulDsmmNTJtht+psCCU4K9sP5kZo6XJxXYbIaEEucULbYeDgg0JzzBALHMYHaefo+
 MJbA==
X-Gm-Message-State: AOAM5332nyEQeOgod7WEWE2jqcPhZ2Rt5p0qFnKAxY2E7jAhX3XF9fOL
 DCO81RwPUzeJXsolcFbn6Q==
X-Google-Smtp-Source: ABdhPJyqvLH69RvwbH3NSNIYfqeuJSyfMOJ6wcBZfY7zb6r9ddzGrmuzScWO3eNeKcVGJhWVOt1L3g==
X-Received: by 2002:a92:1309:: with SMTP id 9mr4821490ilt.129.1600790869671;
 Tue, 22 Sep 2020 09:07:49 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f1sm9083225ilh.25.2020.09.22.09.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 09:07:49 -0700 (PDT)
Received: (nullmailer pid 2773927 invoked by uid 1000);
 Tue, 22 Sep 2020 16:07:47 -0000
Date: Tue, 22 Sep 2020 10:07:47 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 4/4] dt-bindings: phy: convert HDMI PHY binding to YAML
 schema
Message-ID: <20200922160747.GA2773711@bogus>
References: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
 <4817a10e1c3b2beeb79b0cf5e182df747ce268e7.1600760719.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4817a10e1c3b2beeb79b0cf5e182df747ce268e7.1600760719.git.chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_120752_017906_FBDF057C 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 22 Sep 2020 15:55:08 +0800, Chunfeng Yun wrote:
> Convert HDMI PHY binding to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../display/mediatek/mediatek,hdmi.txt        | 17 +---
>  .../bindings/phy/mediatek,hdmi-phy.yaml       | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.example.dt.yaml: example-0: hdmi-phy@10209100:reg:0: [0, 270569728, 0, 36] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1368816

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
