Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1455DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 13:57:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D44D7611C6
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 13:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D44D7611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Gwh63hNZOffuu4NSDHOQfC7GJ5GhnnPDdRepGIp2n4=; b=wLnrA1MN9cqfWU
	p4w/u7Zbb91oh6rMO+fM5LiWDTcx4XnvbVoc2onpZ7zHcerX38YjnKJ4wW3Wf6LSL21EsSs7a6IIk
	h3oZY+9BuKZ6cTmx9DLr1Jn4KkXGCOyQjc4NX5PCwgUTa7OI/mVKnBfaHgKpQq56MhDj7Z3Mh9nJu
	sC5Lq0kaaX2oe/h0GiHvT/fdnj3PJRSLS2kZhzKeYZLXELI7zCQES7yNhZ8C0NCXgWazCrB8sPBeZ
	sCxhXVwoPYAeK++DApco6KWUWsaL6KETi+fYlBElWSRtxx+GoZCVl+NK9nMgY1c3KlZbTyAybpu7R
	TaSspuUlUU7fQY9LnfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdC69-004gow-9B; Wed, 20 Oct 2021 13:57:41 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdC5w-004gjb-Fu; Wed, 20 Oct 2021 13:57:29 +0000
Received: by mail-oi1-f171.google.com with SMTP id y207so9703846oia.11;
 Wed, 20 Oct 2021 06:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=jLTSb3KEYnCRlQ01oYFy7OkpNs2aWBBSeM7tBxCTpD8=;
 b=ZSJF7wdifvT/tD6RaS7miJ8amvC2WrKA1tMr/JwpUFvq8JweZQBHhZCoIalXsNCd9g
 Cgl1rUmopZB+qmFTdq37M731PXD3K9WuZkhLj4aMvipBH4Mx67K0w25sjDwwiwboPIDJ
 +ujMtW7xBIFBzkdSsYRIbWs32FCFtmdVe7exEezSgjL9sq28hmjRAm7WGAfqPaQiq9gh
 3lB9Be+4zP+mNmlj2xYPIDlZl3YqxHiPS70rCU0yglm1d+U6ZWurnsQv/lhp7HJG5CBY
 ocA4K5YWp1jionWhbUB5l5u0l405Dk5/CjuAQ6eBtpeYWQrLm5OEuAcPmMIaCDGaQh+I
 GSvQ==
X-Gm-Message-State: AOAM532wDwGUfQUN9xGqoJgINTY2u6afwTE6EK4ECukVoWmsfEmkF33k
 dqETGvnWa8vFIZkaXiWH9QQ4xaLSaw==
X-Google-Smtp-Source: ABdhPJwS8b8/9bct2qZ/+hc4vStE7P565pOQsKf7sXcrPBm2vGWkW+CqezjlGdG+8JVNIlAgfkiBiA==
X-Received: by 2002:aca:3741:: with SMTP id e62mr9560890oia.107.1634737827694; 
 Wed, 20 Oct 2021 06:50:27 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v13sm488307otn.41.2021.10.20.06.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 06:50:26 -0700 (PDT)
Received: (nullmailer pid 2259920 invoked by uid 1000);
 Wed, 20 Oct 2021 13:50:23 -0000
From: Rob Herring <robh@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel.baluta@nxp.com, allen-kh.cheng@mediatek.com, trevor.wu@mediatek.com,
 tiwai@suse.com, matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org
In-Reply-To: <20211020115155.9909-3-yc.hung@mediatek.com>
References: <20211020115155.9909-1-yc.hung@mediatek.com>
 <20211020115155.9909-3-yc.hung@mediatek.com>
Subject: Re: [PATCH 2/2] dt-bindings: dsp: mediatek: Add mt8195 DSP binding
 support
Date: Wed, 20 Oct 2021 08:50:23 -0500
Message-Id: <1634737823.680277.2259919.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_065728_560738_7F9CFA8F 
X-CRM114-Status: GOOD (  11.43  )
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

On Wed, 20 Oct 2021 19:51:55 +0800, YC Hung wrote:
> This describes the mt8195 DSP device tree node.
> 
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> ---
>  .../bindings/dsp/mtk,mt8195-dsp.yaml          | 138 ++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml: properties:sound: 'anyOf' conditional failed, one must be fixed:
	'type' is a required property
	'$ref' is a required property
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml: ignoring, error in schema: properties: sound
warning: no schema found in file: ./Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.yaml
Documentation/devicetree/bindings/dsp/mtk,mt8195-dsp.example.dt.yaml:0:0: /example-0/adsp@10803000: failed to match any schema with compatible: ['mediatek,mt8195-dsp']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1543854

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
