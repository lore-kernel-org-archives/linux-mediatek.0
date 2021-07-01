Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37E8C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 14:04:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B40F613EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 14:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B40F613EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fErDgWMMFMUI6sYO1Znwo7Z5PpSyGpHF66U39RX2a8=; b=5GpYYi+vKWXfvD
	KJC765ffj8dKe7+9YjDyEaNyrVOPx8XZl4AnWKi388oOSjnJnb4hr8vEcNGdW7p3YW9bswqClXL8e
	H7gPfH2p1ZGK3j1gS73+fMHOAInE07/L+1jDNotsbf9/A84U52/xLKASYwcw6oKdbA3vbPSk+2GAp
	hsiXKkyE4HqGSwEH9Uq/9h/y6egqtwI1r+9vUmS+Pi2f58lflYXSS3qCIqIvqYhV8dfq7Q1KcpSey
	VjCVeFsaBeV5sY88/Pa8v3GfEB9M5DyapDaPf/pQXltkMsIdSJFQISWzrZtQBWJ/gjs5XM30qpwl2
	/XXZUa3VyQA+xpDHk5BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyxIO-00HaAu-J1; Thu, 01 Jul 2021 14:04:00 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyxIB-00Ha83-0M; Thu, 01 Jul 2021 14:03:48 +0000
Received: by mail-il1-f181.google.com with SMTP id t12so6424800ile.13;
 Thu, 01 Jul 2021 07:03:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=bBAtbGxea4Uyvv49nbdyK4xv/8gJ5gfZXo1vPratG8A=;
 b=HMbUvL7+34KkdvNV8/lnxnIGfmL2wT+zAvgtRvqOXWL3LTchTFrSX9+oxNk7+boaxT
 fjAqWXJpwYXF+jtTo/FA0XUAfnqJRhFx6IRvd4zABwyrFUjILVqnV6MTdLRYdDzad/M2
 tdCBOXLolIT9ALvX2qkWIbn7WZ4vQWXjLY1tRjYqay0IvAttXBZ9RsDA4rjhy3eSkIBS
 5B2fiPhzUegrB0VpCwpEaEe4UkdsaCycF7oSxxWXgM+BupYwsE8b8oIkYD4onRX0BfjS
 grHYFJ36PAnMD3bSJeK6/tFhtkQxusbVz/hCZjF5X7vDtd9+qhztrvNorw37WpyY7RZa
 9+4w==
X-Gm-Message-State: AOAM530Y20z9W5mK9EFP85ZveR1TxzqNk6RO547+q960kvswyxbEqN5G
 V5i7hnfHrEO4NgN5Dw6ISA==
X-Google-Smtp-Source: ABdhPJyww/o4rG1Xgg5+OFNePM+PG/LX43Ff1V/MH9eSJ83/mWZ4rTI2R7sC49n3N2R3tOttPwHezQ==
X-Received: by 2002:a05:6e02:174b:: with SMTP id
 y11mr30453947ill.207.1625148224856; 
 Thu, 01 Jul 2021 07:03:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u2sm44406ilm.19.2021.07.01.07.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 07:03:42 -0700 (PDT)
Received: (nullmailer pid 2278706 invoked by uid 1000);
 Thu, 01 Jul 2021 14:02:43 -0000
From: Rob Herring <robh@kernel.org>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
In-Reply-To: <20210630132804.20436-2-chun-jie.chen@mediatek.com>
References: <20210630132804.20436-1-chun-jie.chen@mediatek.com>
 <20210630132804.20436-2-chun-jie.chen@mediatek.com>
Subject: Re: [v11 01/19] dt-bindings: ARM: Mediatek: Add new document bindings
 of MT8192 clock
Date: Thu, 01 Jul 2021 08:02:43 -0600
Message-Id: <1625148163.568657.2278705.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_070347_094957_465AC543 
X-CRM114-Status: GOOD (  13.60  )
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

On Wed, 30 Jun 2021 21:27:46 +0800, Chun-Jie Chen wrote:
> This patch adds the new binding documentation for system clock
> and functional clock on Mediatek MT8192.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt8192-clock.yaml   | 214 ++++++++++++++++++
>  .../mediatek/mediatek,mt8192-sys-clock.yaml   |  64 ++++++
>  2 files changed, 278 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml:18:7: [warning] wrong indentation: expected 8 but found 6 (indentation)
./Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml:19:7: [warning] wrong indentation: expected 8 but found 6 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml: properties:compatible: [{'enum': ['mediatek,mt8192-scp_adsp', 'mediatek,mt8192-imp_iic_wrap_c', 'mediatek,mt8192-audsys', 'mediatek,mt8192-imp_iic_wrap_e', 'mediatek,mt8192-imp_iic_wrap_s', 'mediatek,mt8192-imp_iic_wrap_ws', 'mediatek,mt8192-imp_iic_wrap_w', 'mediatek,mt8192-imp_iic_wrap_n', 'mediatek,mt8192-msdc_top', 'mediatek,mt8192-msdc', 'mediatek,mt8192-mfgcfg', 'mediatek,mt8192-mmsys', 'mediatek,mt8192-imgsys', 'mediatek,mt8192-imgsys2', 'mediatek,mt8192-vdecsys_soc', 'mediatek,mt8192-vdecsys', 'mediatek,mt8192-vencsys', 'mediatek,mt8192-camsys', 'mediatek,mt8192-camsys_rawa', 'mediatek,mt8192-camsys_rawb', 'mediatek,mt8192-camsys_rawc', 'mediatek,mt8192-ipesys', 'mediatek,mt8192-mdpsys']}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml: properties:compatible: [{'enum': ['mediatek,mt8192-topckgen', 'mediatek,mt8192-infracfg', 'mediatek,mt8192-pericfg', 'mediatek,mt8192-apmixedsys']}, {'const': 'syscon'}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.example.dt.yaml:0:0: /example-0/syscon@10000000: failed to match any schema with compatible: ['mediatek,mt8192-topckgen', 'syscon']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.example.dt.yaml:0:0: /example-1/syscon@10001000: failed to match any schema with compatible: ['mediatek,mt8192-infracfg', 'syscon']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.example.dt.yaml:0:0: /example-2/syscon@10003000: failed to match any schema with compatible: ['mediatek,mt8192-pericfg', 'syscon']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-sys-clock.example.dt.yaml:0:0: /example-3/syscon@1000c000: failed to match any schema with compatible: ['mediatek,mt8192-apmixedsys', 'syscon']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-0/clock-controller@10720000: failed to match any schema with compatible: ['mediatek,mt8192-scp_adsp']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-1/clock-controller@11007000: failed to match any schema with compatible: ['mediatek,mt8192-imp_iic_wrap_c']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-2/clock-controller@11210000: failed to match any schema with compatible: ['mediatek,mt8192-audsys']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-3/clock-controller@11cb1000: failed to match any schema with compatible: ['mediatek,mt8192-imp_iic_wrap_e']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-4/clock-controller@11d03000: failed to match any schema with compatible: ['mediatek,mt8192-imp_iic_wrap_s']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-5/clock-controller@11d23000: failed to match any schema with compatible: ['mediatek,mt8192-imp_iic_wrap_ws']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-6/clock-controller@11e01000: failed to match any schema with compatible: ['mediatek,mt8192-imp_iic_wrap_w']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-7/clock-controller@11f02000: failed to match any schema with compatible: ['mediatek,mt8192-imp_iic_wrap_n']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-8/clock-controller@11f10000: failed to match any schema with compatible: ['mediatek,mt8192-msdc_top']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-9/clock-controller@11f60000: failed to match any schema with compatible: ['mediatek,mt8192-msdc']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-10/clock-controller@13fbf000: failed to match any schema with compatible: ['mediatek,mt8192-mfgcfg']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-11/clock-controller@14000000: failed to match any schema with compatible: ['mediatek,mt8192-mmsys']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-12/clock-controller@15020000: failed to match any schema with compatible: ['mediatek,mt8192-imgsys']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-13/clock-controller@15820000: failed to match any schema with compatible: ['mediatek,mt8192-imgsys2']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-14/clock-controller@1600f000: failed to match any schema with compatible: ['mediatek,mt8192-vdecsys_soc']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-15/clock-controller@1602f000: failed to match any schema with compatible: ['mediatek,mt8192-vdecsys']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-16/clock-controller@17000000: failed to match any schema with compatible: ['mediatek,mt8192-vencsys']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-17/clock-controller@1a000000: failed to match any schema with compatible: ['mediatek,mt8192-camsys']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-18/clock-controller@1a04f000: failed to match any schema with compatible: ['mediatek,mt8192-camsys_rawa']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-19/clock-controller@1a06f000: failed to match any schema with compatible: ['mediatek,mt8192-camsys_rawb']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-20/clock-controller@1a08f000: failed to match any schema with compatible: ['mediatek,mt8192-camsys_rawc']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-21/clock-controller@1b000000: failed to match any schema with compatible: ['mediatek,mt8192-ipesys']
Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.example.dt.yaml:0:0: /example-22/clock-controller@1f000000: failed to match any schema with compatible: ['mediatek,mt8192-mdpsys']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1498893

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
