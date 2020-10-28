Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775EBC388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 13:55:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCC4D2474E
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 13:55:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GsoZPXe9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCC4D2474E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=32fe0/PrgSrtUTVjFOJyPlU2Hl30QnMbiRGWDazWV6Y=; b=GsoZPXe9K4ZJJ8i4y+F5xbdI7
	Mx3wyRBe/wwqb3uWNTBFvqEdBsU2OrKGW4JUvUvFkbdrK8HQDcdK/XkjLYR6kDQYdAqiBn57XaNWL
	pb/0SzUOZnZUlOJPIIz0aMsZMBvJ8VkmRXltojnTz7fLlRkQjbo4+S7mV+yaCyIb1ZOXkTFUJ50Hb
	njNcytHlAwP1sPc0NDivd7C82mhPXWKyrEixd8inCOMxbS5Do3wA9rC9xshNH8lzJ7HXudPLCUyxh
	bgM0zjMvoC2v1JUL5xqFOJlDMtxMfTfJpY3FjT9CLtNyEuJ4HaomTJOIfinpFIeCoQTeIJoP5DHNM
	Dy9HEzPvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXlvM-0006B0-C9; Wed, 28 Oct 2020 13:55:36 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXlvK-0006AB-1D; Wed, 28 Oct 2020 13:55:35 +0000
Received: by mail-ot1-f65.google.com with SMTP id x7so4287025ota.0;
 Wed, 28 Oct 2020 06:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PxEFiESFFvIIRPRbjQZYOy9rW3FUEJN6c1uP5x8Fe0o=;
 b=L2w8JM8oqYl1cChAmeNas9IIEXoy+/ER1CfS1khokor3DSuUFh9QU+ASsmrvomOUIo
 x9CYpyth0Wcx+dLEEbG2uVpxq+XsKTx4TQIv+P52ZCctSdUXFXTezQi7aCp5CiDj6CpB
 +PiWsml6LMnmdgVQmgn0MLXBsiMhNliryZhU3SIFEu6U7zyMviRG0lLWYSeeQ6YUSE7f
 HmuD64AS0eYXeQAX9tZ8MrpHuYL5OLhY3VJ0mnEPq1eEH5o1kEJvLc5StjuQVz04dAku
 09H1i+2wEL71E2EzJ4czSqmaDtoHaYZJj9scSovyNdBR9pw7uvshoaJnvdeqCSEsraJv
 +Phw==
X-Gm-Message-State: AOAM533YE2tr242mnNM0nmrRSjs3GMNmMH6svtzO+zLlcKfme8O5+KB8
 nBafe8p3ui8lvv6myQ84fw==
X-Google-Smtp-Source: ABdhPJxt7hN4xUvuog8gqBqk13H5yJDzXn4vFsZ2RtHulAwtm9rjXpNnE8FyfD0Skkw3nwCGpElVfQ==
X-Received: by 2002:a05:6830:1241:: with SMTP id
 s1mr5047362otp.366.1603893331451; 
 Wed, 28 Oct 2020 06:55:31 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z126sm2710580oiz.41.2020.10.28.06.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 06:55:30 -0700 (PDT)
Received: (nullmailer pid 3930187 invoked by uid 1000);
 Wed, 28 Oct 2020 13:55:29 -0000
Date: Wed, 28 Oct 2020 08:55:29 -0500
From: Rob Herring <robh@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v3 01/16] dt-bindings: power: Add bindings for the
 Mediatek SCPSYS power domains controller
Message-ID: <20201028135529.GA3929806@bogus>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-2-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201026175526.2915399-2-enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_095534_089188_7061635C 
X-CRM114-Status: GOOD (  14.72  )
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
Cc: devicetree@vger.kernel.org, Matthias Brugger <mbrugger@suse.com>,
 weiyi.lu@mediatek.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, fparent@baylibre.com, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 26 Oct 2020 18:55:10 +0100, Enric Balletbo i Serra wrote:
> The System Control Processor System (SCPSYS) has several power management
> related tasks in the system. Add the bindings to define the power
> domains for the SCPSYS power controller.
> 
> Co-developed-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v3:
> - Use hex for unit-addresses.
> - Define child nodes for nested power domains even are duplicated, but
>   more clear than adding a regex scaped to be a valid URI.
> 
> Changes in v2:
> - Use generic node names (power-domain).
> - Define valid values for common properties like #power-domain-cells.
> 
>  .../power/mediatek,power-controller.yaml      | 289 ++++++++++++++++++
>  1 file changed, 289 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:48:13: [warning] wrong indentation: expected 10 but found 12 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:99:17: [warning] wrong indentation: expected 14 but found 16 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:109:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:147:21: [warning] wrong indentation: expected 18 but found 20 (indentation)
./Documentation/devicetree/bindings/power/mediatek,power-controller.yaml:157:18: [warning] wrong indentation: expected 16 but found 17 (indentation)

dtschema/dtc warnings/errors:


See https://patchwork.ozlabs.org/patch/1387955

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
