Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A46EEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 21:48:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A693F208C7
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 21:48:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HnXy8Z2Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A693F208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yt3gKWgmZikgo6fcbTsqPb5q2ng93AHJrq7zP4RKWg0=; b=HnXy8Z2YYdoFDF2YwvtsoAA02
	HPS4VQFUgaq67Ep+izPbsc+N57Uci1EObz4s24PUBqzJDRjSKBbeb2q8p9KURlJfDLISCr905pixB
	iPijfBLJyFSUCSxF0jg6sgUKvqS3UBofT7DzZAvW3q+20AiCpRVIAAbvlvAQAq7uT5dZbINg0zuXk
	WpxMcYGSKk3je/Px+vgoDQEq0q3kGkldj9X77nHpu3r3Mo5hFqNhljYghlEGpudTd9FVRxqOe2iSL
	JiSv+eVe6SNG62sHagb+Tnaxjn4cpB0WVFD6PavVSadYPABjzkzDlRdr2p5k7/F1plRYrXX80wLNu
	BzYZMWC0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2iJP-0003UX-6T; Mon, 03 Aug 2020 21:48:03 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2iJN-0003Tw-AM; Mon, 03 Aug 2020 21:48:02 +0000
Received: by mail-il1-f196.google.com with SMTP id 77so3980369ilc.5;
 Mon, 03 Aug 2020 14:48:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sHz6FTErPUV4uyPRUEgxafeUbmRMcPUvMFZhatB72Us=;
 b=BgPeY98qbDj2gPi1kvMLpJvs8Ypx4hTG7l+w+hOjISLwwbCCZCyMvRrZVi6PPpCvSb
 +GKzswS8cgLu8B7pm/EeTae5mGRzftXthgcjlVvjBgIaVgEQi04i9SACp5/SOG6gK20b
 2h2oCqHrihbu1KpUw4ZCh0ZBQJG0n4pLh8ak9ut29HriVMjQS2FhTN5D/bxcskFePwMV
 RqcV8XVIfw5y20OR4Q9uxv6+3nxSt1YRbSORG2C838bOj+NVd7Tr8PJNJ2T5orInuA5x
 JIcaekLGojl0RlquHCCpsjArjqwIwmFBwhanPADaqXWX5RGR1ZiWaKQZakxoABXIwHLD
 E0rw==
X-Gm-Message-State: AOAM533+GW96E0Q2YaA6vj3tFLdq2t29FRGruQQB8b+zHcw86JigoOT0
 ced5BYFRAbGoNaRQBRqIpGfhJPLSlQ==
X-Google-Smtp-Source: ABdhPJylcuweeEkx+1+KUovLiYX8jxNRUF3xyQNwfrqYRLu+TiNCe7seRBGrPKmFOecJ6W8M8VxmBA==
X-Received: by 2002:a92:aa49:: with SMTP id j70mr1548669ili.107.1596491280702; 
 Mon, 03 Aug 2020 14:48:00 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d6sm10704358ioo.9.2020.08.03.14.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 14:48:00 -0700 (PDT)
Received: (nullmailer pid 3194959 invoked by uid 1000);
 Mon, 03 Aug 2020 21:47:57 -0000
Date: Mon, 3 Aug 2020 15:47:57 -0600
From: Rob Herring <robh@kernel.org>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: interrupt-controller: Add MT58XX
 interrupt controller
Message-ID: <20200803214757.GA3194548@bogus>
References: <20200803062214.24076-1-mark-pk.tsai@mediatek.com>
 <20200803062214.24076-3-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803062214.24076-3-mark-pk.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_174801_385043_A5A2C0EF 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 03 Aug 2020 14:22:14 +0800, Mark-PK Tsai wrote:
> Add binding for MT58XX interrupt controller.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  .../mediatek,mt58xx-intc.yaml                 | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml: properties:compatible: [{'items': [{'const': 'mediatek,mt58xx-intc'}]}] is not of type 'object', 'boolean'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml: properties:mediatek,intc-no-eoi: {'description': 'Mark this controller has no End Of Interrupt(EOI) implementation.\nThis is a empty, boolean property.\n'} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml: properties:mediatek,intc-no-eoi: 'not' is a required property

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml: properties:mediatek,irqs-map-range: {'description': "The range of parent interrupt controller's interrupt lines\nthat are hardwired to MT58xx interrupt controller.\n"} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml: properties:mediatek,irqs-map-range: 'not' is a required property

Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/interrupt-controller/mediatek,mt58xx-intc.yaml#
Documentation/devicetree/bindings/Makefile:20: recipe for target 'Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/interrupt-controller/mediatek,mt58xx-intc.yaml
Makefile:1347: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1340146

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
