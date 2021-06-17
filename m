Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16035C49361
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 21:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB37613DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 21:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB37613DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/AtXWwrXfJ24sgDAu5QjQBWJhcP9RaeanMp+m1+rHA=; b=3r60L65MLA71En
	NXGAtOJb7lmBelCkArvUyTQdmelF7tIJJoCw3tK9QgkGNMrThbXiMGaO1to+HxpyvYNUB5XibFoS7
	hmZzgERqKFEVD74/2OOUfPgcXRZeC/VVWz7yVpdEKJPFD2mzLOGnUZFH6gHvJWanhtyuTd9Y9Nrn+
	w5RvGSeZtLd+VSRnF0j5UYxz8BP9M0Rc5axpD1grty+19+RG6WFNYzy2sleAtayzH5xB+KfJtUEks
	4zLQTBp0m7JPRsp94BtjKDUyGnUPPWba3jt+M/OYPda9LOFkHPbX22s7aXjzB/FyeW9ipq+CqN7eD
	I2zSED6ASWsbRQO2AOng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltzXM-00BnNK-Oj; Thu, 17 Jun 2021 21:26:56 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltzX2-00BnGy-NT; Thu, 17 Jun 2021 21:26:38 +0000
Received: by mail-io1-f43.google.com with SMTP id b14so4728748iow.13;
 Thu, 17 Jun 2021 14:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=5eq4f8x/PBXQ0L0KWI8lbvRWrLgR98TD03TAWNAHP0I=;
 b=NxeAXG4KW5qx/Fj1VKQFPXaPXcyq63jf7wOCjmfwlD1o4c8k4gTvWgkLLXOByW/5XU
 m0G0oaU42kgxp/O6mYWH5N+ibAGPRVxjnDfGIEkHNCthhpCZpLB89c7m0VzQnWHfOtxm
 d4xLuCribV3g4ewbVC5FamYdTqwKv8M1MiXC5FKeCPFDTYcGvMd1MAAHOT5xA30YLpN+
 bt0zcW9v+YgLOqD1wCEvpKzzLptuVfIYyHzA9zS5fMtImWgBjGbDVauhviI8FZZX1rN2
 XLr+Zp0TYtgfkXwrMuzxBTnsGYnsKADYj1SEKK0Du9LL7gWvHQIPNx1g0ztmM9/OycPT
 Aqpw==
X-Gm-Message-State: AOAM531EVMDNh242Qbx2aItrq/XV46dp4ge5qLPf7Mwo5QU5Zb43cvs5
 x9n/ik63d7RWJ7DExIuV2w==
X-Google-Smtp-Source: ABdhPJzKYftIYW1nBl+6hxGS0Ti9h9zAzlQz9WsWpBDeaZqwQntNxz3ul/G3t+wNmMg4w6xTU/xNXw==
X-Received: by 2002:a05:6602:581:: with SMTP id
 v1mr5561875iox.192.1623965195650; 
 Thu, 17 Jun 2021 14:26:35 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id 6sm3685511ioe.43.2021.06.17.14.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 14:26:35 -0700 (PDT)
Received: (nullmailer pid 3336117 invoked by uid 1000);
 Thu, 17 Jun 2021 21:26:24 -0000
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org, cychiang@google.com,
 tiwai@suse.com, broonie@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 bicycle.tsai@mediatek.com
In-Reply-To: <20210617054740.8081-9-trevor.wu@mediatek.com>
References: <20210617054740.8081-1-trevor.wu@mediatek.com>
 <20210617054740.8081-9-trevor.wu@mediatek.com>
Subject: Re: [PATCH 8/8] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-rt1019-rt5682 document
Date: Thu, 17 Jun 2021 15:26:24 -0600
Message-Id: <1623965184.524304.3336116.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_142636_807101_85B4E765 
X-CRM114-Status: GOOD (  11.84  )
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

On Thu, 17 Jun 2021 13:47:39 +0800, Trevor Wu wrote:
> This patch adds document for mt8195 board with mt6359, rt1019 and rt5682
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../sound/mt8195-mt6359-rt1019-rt5682.yaml    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml:10:4: [warning] wrong indentation: expected 2 but found 3 (indentation)
./Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.yaml:17:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/mt8195-mt6359-rt1019-rt5682.example.dt.yaml:0:0: /example-0/mt8195-sound: failed to match any schema with compatible: ['mediatek,mt8195-sound']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1493198

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
