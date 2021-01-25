Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E72C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:36:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91138224DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 19:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91138224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n2TbPCMa1arc39XKpT/twGeAGzo8jx3VZ6Ut5IfWeD0=; b=gZMBT0ctXNyI8tI9NcF1JMytR
	toG32IqrgzDmE8zx47Z9KWOBNm3HK0aT7R0gvPtmvOP5rfereCzeOXPsAm9V/d5ZSQ8iKyEpfHVQI
	hwJnekuUObWqqAv7shpnpL077yWovSL7k41eULmp1xDGaxp/Ix+OPjMydU8W3PUz9WiAGcx/T+WKn
	NVddQC0f12UqgmZecaVhbMyKJssD0qLLwjSKaiNNoVuUTqXAGXOFNOu+46srqW/2K7HtoM8MQ5Wsd
	immB3WDhjV4HcU6KRWELCN60P3KBtfhNP4eJyYZur2xn53oGLVzagF36UTsJ4sbhpu6Ah6xDdTC1t
	E7CCKFsMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l47en-0004iG-Gn; Mon, 25 Jan 2021 19:36:13 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l47eh-0004f5-U9; Mon, 25 Jan 2021 19:36:08 +0000
Received: by mail-ot1-f48.google.com with SMTP id e70so13877749ote.11;
 Mon, 25 Jan 2021 11:36:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mH2q1AZz5irHrvq/3t1+Obhg0JHH2TFjERBNOT0hM0Q=;
 b=T71upTgz3QeYkbArpPlY7OXMMtatp+AN7+B0bdnJI2LLJyryr/DPusov54eb1XHPFL
 69NR0mhGk8JWPb5lne3XqsFL5JCQQ/Tp58n6hmRQWM9h2X3AzpmAcJsOeIq7BLq5eBTx
 PwCsxEG9g5ai/53S9HHYOhX6160lw9galan2+SI9hFrc+ojySzw9GveQ3R8zfUPLiIMA
 0y5cIieHRrTlcDZv1p4twEfTYvP+rk7UUnPybXDGxfaN1jPT/4FcTYuJjTmZGNUOQ6rq
 UiX00qWC6UrMb5HAtw2HZ+wan4dZiDnM4o1PlgzX3h67H/izUNHwOxIyBIOslC+icf2S
 OF8Q==
X-Gm-Message-State: AOAM532e76IruGNbmB9f+EHGadvWa6ztk6dL0ny0H7Vx+Yqy0Jia6DkM
 nnuxq0DVqrZYlU7qu1O3RV8y+oapig==
X-Google-Smtp-Source: ABdhPJwBqs6kpkcYrx/aXfe/1e/07a9bQgMjrd1YtHP4Jbg6s9G1TE28GLJ8saSbZE8IZ5BXrEU1qg==
X-Received: by 2002:a05:6830:2f3:: with SMTP id
 r19mr1513671ote.299.1611603366943; 
 Mon, 25 Jan 2021 11:36:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z4sm551224ooz.5.2021.01.25.11.36.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:36:06 -0800 (PST)
Received: (nullmailer pid 830007 invoked by uid 1000);
 Mon, 25 Jan 2021 19:36:04 -0000
Date: Mon, 25 Jan 2021 13:36:04 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 22/24] dt-bindings: memory: mediatek: update mediatek,
 smi-larb.yaml references
Message-ID: <20210125193604.GA829546@robh.at.kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
 <c70bd79b311a65babe7374eaf81974563400a943.1610535350.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c70bd79b311a65babe7374eaf81974563400a943.1610535350.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_143607_979957_7B442709 
X-CRM114-Status: GOOD (  11.46  )
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
Cc: Bin Liu <bin.liu@mediatek.com>, devicetree@vger.kernel.org,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 13 Jan 2021 11:59:23 +0100, Mauro Carvalho Chehab wrote:
> Changeset 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
> renamed: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
> to: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.
> 
> Update its cross-references accordingly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
>  .../devicetree/bindings/media/mediatek-jpeg-decoder.txt         | 2 +-
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.txt         | 2 +-
>  Documentation/devicetree/bindings/media/mediatek-mdp.txt        | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
