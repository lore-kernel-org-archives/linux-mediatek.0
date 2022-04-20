Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB75C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 01:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ylx/oxWM8QipzlUnZd92jC8/OEpsfGdDKnkhjPhtfrM=; b=4+zr+0wGeS8zxn
	iCQA3ouXOXb/uY6Nzl1xXJAGhVBAT437erBh57z0I0MP7I3+9/jL4yNbF8BkEmYCyVW6Gbu+c2el/
	N98/W2vCw0/w+IzYgR/xTKYJLhAfk6fbN5qKkldyHvZ66lK7HyNmbKN6Ify6JkNsW0kVmygP1vJ6M
	l8gSeSoB56u5uFxxGTAhhX9pqgaaEdRZBZkHNeDz5avLjH4/8LdMKYK1msqtHNxvvc6Ftu/OlKP2H
	erER2axp7ABmtCMSgmKbSNRv9o219xyCaDSDkTLp3xoe5hOCE27QBWlZ32RkwansShVamwk1gg/Fj
	MhSHLOSAcJB/DwSq8AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngz0L-006qc8-CO; Wed, 20 Apr 2022 01:19:37 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngz09-006qYe-RO; Wed, 20 Apr 2022 01:19:27 +0000
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-de3eda6b5dso508164fac.0; 
 Tue, 19 Apr 2022 18:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ymt6zLehDv2YaRJlxv7TiKEzkQbOENuBrCPBeLy0sX8=;
 b=KV4+iduv/ujF84S0dh6xa4KXS46I+CqyClMHphYMsnD8cIqcFdj+AKFwzCsahDje3w
 2VIPJ6KLrcAXyVBA856m7JCEX21d9LlnNtQ5SGvhN06VVQzYviuLwGfznBX/kHn6wETf
 bl/jrhpO4+0Kt6zXURR3pG28axOUwHZwf2JBA+ujoyZnTvz21L6zgzWg/keXoWHOL9l1
 Q6Q8lOda9MsiUgyaf1L4IF4dwnU9pFHVRcatWnV8ZWoUQ+QTGcKD39nN1KUoXPPAMJD7
 9fxbr/CJbzTWn8S8JqqO74x8mWqrMLBySN3aftKozz2Wc6k668SvJWaV8/lC5UxB/d6t
 J1rw==
X-Gm-Message-State: AOAM531olT+QxG+8V2yo4cEwK2jbaPBCeSY3uPpm+cBCs8QYaObBtTzZ
 S25VvspL0KqkmY657ll5PA==
X-Google-Smtp-Source: ABdhPJwG/Xsq9q7suyuuPEmJ1/c/c30gxnNuR+j5n45Cv6/bz718vvs/f+CesGdXCOra+fRs+F0SXA==
X-Received: by 2002:a05:6870:5702:b0:e2:9f03:dae1 with SMTP id
 k2-20020a056870570200b000e29f03dae1mr579743oap.201.1650417564088; 
 Tue, 19 Apr 2022 18:19:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u3-20020a4a9703000000b0033336ab4909sm6080383ooi.7.2022.04.19.18.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 18:19:23 -0700 (PDT)
Received: (nullmailer pid 4040590 invoked by uid 1000);
 Wed, 20 Apr 2022 01:19:21 -0000
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220419180938.19397-4-y.oudjana@protonmail.com>
References: <20220419180938.19397-1-y.oudjana@protonmail.com>
 <20220419180938.19397-4-y.oudjana@protonmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: arm: mediatek: infracfg: Convert to DT
 schema
Date: Tue, 19 Apr 2022 20:19:21 -0500
Message-Id: <1650417561.533052.4040589.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_181925_926007_7F13CBC6 
X-CRM114-Status: GOOD (  13.19  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 19 Apr 2022 22:09:39 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert infracfg bindings to DT schema format. Not all drivers
> currently implement resets, so #reset-cells is made a required
> property only for those that do. Using power-controller in the
> example node name makes #power-domain-cells required causing
> a dt_binding_check error. To solve this, the node is renamed to
> syscon@10001000.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
>  .../arm/mediatek/mediatek,infracfg.yaml       | 79 +++++++++++++++++++
>  2 files changed, 79 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


infracfg@10001000: '#reset-cells' is a required property
	arch/arm64/boot/dts/mediatek/mt7986a-rfb.dtb
	arch/arm64/boot/dts/mediatek/mt7986b-rfb.dtb

syscon@10001000: '#reset-cells' is a required property
	arch/arm64/boot/dts/mediatek/mt2712-evb.dtb


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
