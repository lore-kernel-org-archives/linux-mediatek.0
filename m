Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A545C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 13:36:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644406103C
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 13:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 644406103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f0VA74ZUxrQo6dDCf5uOZNXrjZJ1ciTqMHwMfOu92qY=; b=zTQjs/iIFS9bZN
	/HLCXuQyAjIS7I1hvlOtZKkFepGF9Iupzjs+5cqLqkwMchmdExVYUHxHhRwLsArKK6EPFcQq7hWkm
	7qYdan8pNxHR/GdYaOCM90/f+8NrAwgNrq+thV1aHSc9uF6JlqwUIJzThwJATupkZuCABI9RHcVeP
	o3X3p7/R7+FXYfCnTZxryjTejKl+RN4J0Eu3wkPyJuLFQCanp5OAursHz3NscOr0Vqib2BuE5cw3H
	t675PS7h2TXFhcpmf5gFeO3iM+YedjEZb+2+BMptZLUraugrDEgQd49Daz9NrDP68lDhZ26l0E+ZO
	mUjcytX+RMSsglUm9d0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZvTd-009XZX-Gh; Mon, 11 Oct 2021 13:36:25 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZvTZ-009XXt-Mi; Mon, 11 Oct 2021 13:36:23 +0000
Received: by mail-oi1-f182.google.com with SMTP id o83so17241676oif.4;
 Mon, 11 Oct 2021 06:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=FwobwD3dd/WQMo67DlN9a1cS0XJZiy4pf9ac1aljPJ4=;
 b=nkncAq4D4O2atGn5f/SfYT51TVg/yq9scVtIFLp93LpJEgmPELwEiQIxg5eiyNGabL
 ROdFW3pj8EFrNLTwC0mYz7G6C4UPpXODq/jEBZCV7RwVxzzFCR0ZspBiBiZRmoINsK0B
 MBOafIb2ehitt7gUWwofiYiG6cEAQ+/xdhHeTYU/+Dv5kUcQJD11yTvQqOfYykQWmidL
 KAxfnwgjzH9mnnur8qTah18lJhLw2Yel2RFSG5WVN6DUcIBBfP2eVoCa1eg9707Hnvm9
 PunhQ0Jb7ilCA35FUUsieupi9oTgQvw1Q6hezbLzEc44tXZXeaVdGSRE9J6pkGgK8whS
 oeEQ==
X-Gm-Message-State: AOAM533tlA0eMamtDAgUz5q8ZcMDw51yT+3Ie74+g9KjpbPkQ57YXLY7
 TFHoo51ykwr0fsxAaS6OgA==
X-Google-Smtp-Source: ABdhPJzbpAfYUHviS4dvb3JlLbjzjzDQqr3WVI5FNzzIZbfL+xLeRodimbzcCB6iXPFvMV4JXGQIkg==
X-Received: by 2002:aca:d741:: with SMTP id o62mr6830038oig.62.1633959380237; 
 Mon, 11 Oct 2021 06:36:20 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id y5sm661869otg.52.2021.10.11.06.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 06:36:19 -0700 (PDT)
Received: (nullmailer pid 504939 invoked by uid 1000);
 Mon, 11 Oct 2021 13:36:18 -0000
From: Rob Herring <robh@kernel.org>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tomasz Figa <tfiga@google.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Irui Wang <irui.wang@mediatek.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@chromium.org>, srv_heupstream@mediatek.com,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
In-Reply-To: <20211011070247.792-14-yunfei.dong@mediatek.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-14-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v7,
 13/15] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Mon, 11 Oct 2021 08:36:18 -0500
Message-Id: <1633959378.213918.504938.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_063621_772085_281E57BA 
X-CRM114-Status: GOOD (  13.05  )
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

On Mon, 11 Oct 2021 15:02:45 +0800, Yunfei Dong wrote:
> Adds decoder dt-bindings for mt8192.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> v7: Re-write dtsi for hardware architecture changed
> ---
>  .../media/mediatek,vcodec-comp-decoder.yaml   | 193 ++++++++++++++++++
>  1 file changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml:44:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml:88:7: [warning] wrong indentation: expected 2 but found 6 (indentation)
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml:193:7: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: properties:compatible: [{'enum': ['mediatek,mt8192-vcodec-dec', 'mediatek,mtk-vcodec-lat', 'mediatek,mtk-vcodec-core']}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/media/mediatek,vcodec-comp-decoder.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml: ignoring, error in schema: properties: compatible
warning: no schema found in file: ./Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:29.13-20: Warning (ranges_format): /example-0/vcodec_dec@16000000:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:29.13-20: Warning (ranges_format): /example-0/vcodec_dec@16000000:ranges: empty "ranges" property but its #size-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:33.13-66: Warning (dma_ranges_format): /example-0/vcodec_dec@16000000:dma-ranges: "dma-ranges" property has invalid length (24 bytes) (parent #address-cells == 1, child #address-cells == 2, #size-cells == 2)
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:34.24-57.15: Warning (unit_address_vs_reg): /example-0/vcodec_dec@16000000/vcodec_lat: node has a reg or ranges property, but no unit name
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dts:59.25-85.15: Warning (unit_address_vs_reg): /example-0/vcodec_dec@16000000/vcodec_core: node has a reg or ranges property, but no unit name
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml: example-0: vcodec_dec@16000000:reg:0: [0, 369098752, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml:0:0: /example-0/vcodec_dec@16000000: failed to match any schema with compatible: ['mediatek,mt8192-vcodec-dec']
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml:0:0: /example-0/vcodec_dec@16000000/vcodec_lat: failed to match any schema with compatible: ['mediatek,mtk-vcodec-lat']
Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.example.dt.yaml:0:0: /example-0/vcodec_dec@16000000/vcodec_core: failed to match any schema with compatible: ['mediatek,mtk-vcodec-core']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1539139

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
