Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8796C49EA2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 21:26:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1AF460D07
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 21:26:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1AF460D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOBolXWVcgVG+zsl0pjzJ5GBiNjv4HDn2Qa2K5dQsEQ=; b=UzyqPeacpw3P+Q
	VsUNieiCaKfMi1kS2hmJ0z29drP1POtPaNpONhcnMHWzXl4fUFdZLD6SXZl2TmC0OkZTp3DYY5fny
	Wa2stLc2VAvwtivhgG8y9e4iz5zGRDFEfWEzdvO4gODDNtztDOOl1hSYRk6Ths2Ga4riXGY532e0n
	bzL9toAPD8ocTnuyddbWDStWBUj+Ez/7iYs6xCpXn5+0FjBdppvgPAS8QeBewrHbH+iWSbNCWyONP
	TtUFOzAuBAVKQxYLMWHu5VBM2NxrputEZEa8eNjFRRc5nFz6qWGXCNcK//nTEBTxWOr8s7jHQCry5
	B0A7JQKTW70yFT7qP6Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltzWy-00BnFf-IM; Thu, 17 Jun 2021 21:26:32 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltzWw-00BnEu-3K; Thu, 17 Jun 2021 21:26:31 +0000
Received: by mail-il1-f169.google.com with SMTP id p14so56465ilg.8;
 Thu, 17 Jun 2021 14:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=p45NMbcaVp4H9evUR08HW/+ZfqRoQVKi3z17BKOdh6c=;
 b=ar5rnNVlwdIv1WmL0waT8PR6UWmNdLz/iLExpJ2DTGXeLdlGB9qlmhx6Q33ZHUQ+i2
 tHMH0bDOvZV+lvOPYtaUq0Z4FqlDN6dLPz9B9FrwKfnyRDYP+VbVfFHviQrF+uET4a7o
 C3ZAvJuwyW7ebKyOMmiZYjOPqxljv3KkC/73zea46U4IQAIji1+f8jS03QXV2BNHAfO2
 KcV+KKszkvUD6eGweP136EgVt0XX9ZdRMJ760tYnxaXT0QMk5erG48kHd8uW6ZybMVIq
 YXE9pTK/4SBpTEjox594BV6Sif8pXZi1xa8sOz85jy3/5cuTMstgQPSPCXa7kw3K43N6
 4uCA==
X-Gm-Message-State: AOAM533gTblXDSovaCWEmxb015KU2GxMmmrcfd+GIoJXKpZPxIq39jvG
 J2kwglRSdn/2lYAxhEpCUQ==
X-Google-Smtp-Source: ABdhPJwm3AS35eq/yoc+fK1o+R4mYlC3E5uJ1Rfsjp9EPZNVptpaddPf4yldQ69E3tTW7CyCyzsmPA==
X-Received: by 2002:a92:260b:: with SMTP id n11mr4925314ile.134.1623965187706; 
 Thu, 17 Jun 2021 14:26:27 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id q19sm82124ilc.70.2021.06.17.14.26.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 14:26:27 -0700 (PDT)
Received: (nullmailer pid 3336113 invoked by uid 1000);
 Thu, 17 Jun 2021 21:26:24 -0000
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 bicycle.tsai@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, cychiang@google.com, jiaxin.yu@mediatek.com,
 tiwai@suse.com, matthias.bgg@gmail.com
In-Reply-To: <20210617054740.8081-7-trevor.wu@mediatek.com>
References: <20210617054740.8081-1-trevor.wu@mediatek.com>
 <20210617054740.8081-7-trevor.wu@mediatek.com>
Subject: Re: [PATCH 6/8] dt-bindings: mediatek: mt8195: add audio afe document
Date: Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.501241.3336112.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_142630_183454_663CD603 
X-CRM114-Status: GOOD (  12.42  )
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

On Thu, 17 Jun 2021 13:47:37 +0800, Trevor Wu wrote:
> This patch adds mt8195 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8195-afe-pcm.yaml        | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml:14:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mt8195-afe-pcm.example.dts:19:18: fatal error: dt-bindings/clock/mt8195-clk.h: No such file or directory
   19 |         #include <dt-bindings/clock/mt8195-clk.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/sound/mt8195-afe-pcm.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493197

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
