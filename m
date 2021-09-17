Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91340C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 01:59:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF1461074
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 01:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4EF1461074
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8Dbboi5U+eloexZqnBwD98BeCLqZLs59imk5aKO/0s=; b=0p19kYAHnUzt8N
	Feh00/A2OrZy+GsE/cB3Z3Qj6qszbQuxSpG72PZrkihEXo7E7O48hxP/qPmR14v/VdjkflIjqGEUd
	nYLOrvx3Fx2K4CCtE4djN1MUNHsKMvSIDWj1j+e4kEXLk/RNtiJlWP7Adowa2WdvhfQpWtrUx+CVh
	udDHGUYkjzkfxVNJIX7QzJxuH7yClrgoZFoh5ImIgEVkgRVrAdujRAtlJEdR13tDZ0Tx51udYHzNG
	3SoXz7V8eTXlis+qD0G4jBQ6JcANeEA84MfHdWwT53/nm1zj9c9IX6/nLV9QRzhpwmtDVrJCuGYAG
	B3kcOL2GDyeqg2/n7oaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR39p-00CuIC-R2; Fri, 17 Sep 2021 01:59:17 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR39d-00CuFt-QS; Fri, 17 Sep 2021 01:59:07 +0000
Received: by mail-il1-f174.google.com with SMTP id h9so8649318ile.6;
 Thu, 16 Sep 2021 18:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QncgAYsEAj4J6mbF3tLEr0rEZvz4D8ZpN12NlUMUfpg=;
 b=6i6u3+dUPOLuIZgaZehj+W94P81YQ1ekja88OYVLb88lnavrj+Dnfzm7tW/HDwhVZc
 ryFSn2PBat6Aj2XNx608GLMbnRWkPcCBxqByOONgiDLaXa0sFZjBS3oKKS1AXvyYPKkj
 9iWgjQ4OKFLhFCtUhLPoVqdk5pPgwkfEvoHZSFEZzxkdhg5Eb7vTQqhgqclxkHTpSr4g
 /Y81lrzFlQ3lgAJ05MF8OHOa9XEhJeTeeMItNsA37h93mCDSxKickpqLz24xzpsBkhWB
 axqf5+lCSx/dyxOrdzUHhmsd6soB/lkdQTqVRV60VPj6OUQD0kLHJtZGk2j0+pfobCsP
 KxNA==
X-Gm-Message-State: AOAM5313NaYbh3Wi+M3u4wYbGFOGDV1yJoUwZfkeKdTqP+y4KAlS+QuO
 uAA6ZOJYitNrkDv1XS4pOw==
X-Google-Smtp-Source: ABdhPJy4oTaM24SB6z0pQT/ToKAlRejgZB3SLM155KVMirfdI7mWZ3F3MD1XWjhJyelSQtEkJV3ltw==
X-Received: by 2002:a05:6e02:20c3:: with SMTP id
 3mr1021317ilq.269.1631843944967; 
 Thu, 16 Sep 2021 18:59:04 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net.
 [96.84.70.89])
 by smtp.gmail.com with ESMTPSA id 9sm2670305ily.9.2021.09.16.18.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:59:04 -0700 (PDT)
Received: (nullmailer pid 1610039 invoked by uid 1000);
 Fri, 17 Sep 2021 01:58:57 -0000
Date: Thu, 16 Sep 2021 20:58:57 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 03/23] dt-bindings: arm: mediatek: mmsys: update
 mediatek,mmsys.yaml reference
Message-ID: <YUP2YYKTVHdvTfD+@robh.at.kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
 <a87eb079a73e8ab41cdf6e40e80b1d1f868da6bd.1631785820.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a87eb079a73e8ab41cdf6e40e80b1d1f868da6bd.1631785820.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_185905_904772_88250D65 
X-CRM114-Status: GOOD (  11.65  )
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

On Thu, 16 Sep 2021 11:55:02 +0200, Mauro Carvalho Chehab wrote:
> Changeset cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")
> renamed: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> to: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
