Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3941C48BCD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 17:14:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEDCF61376
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 17:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEDCF61376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6IKZdZUkLjO9I9ERtHbCeUXmbEj73wRv4C3mAY6+MY=; b=CuWZVf9gqgxY3M
	I098A/3KsirJbr2cjWGEaknZMfz73okuT3e12d2pfUtQA9ZumbhUJTQAR8NGlwTRDdzrVk+CYKxq7
	kVT4QdnZrR9ypkK4BEdDaDviNry/pTMT3DYwk3S8wvvXLMa2GK6tpaVn/rJFnb8DCAehXNEGSm5Cr
	N33KrGJX6e/gYcIw4AarNdGbAYNf2BeixwaHop1Ockw58B4sXtbWglhdl5HcaCaJi60gfrbFbIP+c
	hFAAfi5JX4MsOuPdkixWdRbjUNnPqE+jdM7M9PwdWJBsLHX4LEN4CwLm9VeZhKfw3Qukmkt7n5e46
	9EfoSldnC3PPYtzQxIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lr1mM-00FE8v-Eh; Wed, 09 Jun 2021 17:14:10 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lr0sx-00Eqwy-PS; Wed, 09 Jun 2021 16:16:58 +0000
Received: by mail-ot1-f44.google.com with SMTP id
 j11-20020a9d738b0000b02903ea3c02ded8so10849737otk.5; 
 Wed, 09 Jun 2021 09:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZGT8NJquSdH6KtVZ4l+/GumWl0Nge0pj1zfQnG0ePmI=;
 b=qhr9A4RGXzYK2gv2B4Nu0cktG7NX/t2c9csqo/6+b3cnRiBkp5wsLa8ykIVQ7W6qRQ
 oOAsR9bypejQKKDEWXBsGhBfn1mdZ77lg5sbiY6z+HqPQFisLTJcn3cRjO8LXOtBNyYO
 SI8+AIqo5fbNs9ruK8AJOpHGzwu1/NepSxDU/O9q3T1HNxHqGhbIfrk9WsgERHkgkxrg
 +qWHIdzrOnZvLFCYJIkKxTTGKHDsEg3uMkszo033+EQCln/ni4ypC23RA9PUxofGDavC
 ELB7Z6mBB7HaTXGfzlmQvjjSq0XXrL3U8uzHCzSeNUlg+O15+Kii7+oSZneYdymkbOku
 U6sQ==
X-Gm-Message-State: AOAM532dwf2XzES/EqYWI/dijwWVw5f+g/WPBTd+dewdFSORoI30psmT
 qt6ZNg+IrkoWu1glfpWysA==
X-Google-Smtp-Source: ABdhPJwx20JacrP/HkOOmyVQLhIJvaerf0sB1n7gTBKsltZSgssSDfRDiaAlkWgtpw/1AbjRIWSNlA==
X-Received: by 2002:a9d:65cf:: with SMTP id z15mr181376oth.250.1623255414065; 
 Wed, 09 Jun 2021 09:16:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t15sm54602oie.14.2021.06.09.09.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 09:16:53 -0700 (PDT)
Received: (nullmailer pid 3763294 invoked by uid 1000);
 Wed, 09 Jun 2021 16:16:43 -0000
From: Rob Herring <robh@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: maoguang.meng@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, yong.wu@mediatek.com
In-Reply-To: <20210609104053.617751-1-hsinyi@chromium.org>
References: <20210609104053.617751-1-hsinyi@chromium.org>
Subject: Re: [PATCH] dt-bindings: mediatek: convert mtk jpeg decoder/encoder
 to yaml
Date: Wed, 09 Jun 2021 11:16:43 -0500
Message-Id: <1623255403.610773.3763293.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_091655_892809_9BE3D814 
X-CRM114-Status: GOOD (  12.39  )
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

On Wed, 09 Jun 2021 18:40:54 +0800, Hsin-Yi Wang wrote:
> Convert mediatek jpeg decoder and encoder bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> mediatek,larb in the original file will be removed after this series[1]
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210410091128.31823-2-yong.wu@mediatek.com/
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 73 +++++++++++++++++++
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 65 +++++++++++++++++
>  2 files changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml:19:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml:23:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.example.dts:23.25-26 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1416: dt_binding_check] Error 2
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1489789

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
