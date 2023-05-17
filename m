Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AB7C77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 16:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hIDvPEdjftlVYbqhIG0JXGHdNlYOdLmSjve7aY9Eo0=; b=OCEGeX36iFdgfwAQ9uPeiZrbxN
	7xOtItkYcinzr6+yF1gu/kFnv5QtEUWrx/JqqJOL0N63LVZfPN0TmuXlqBqZ2t9erob4SYYw6f2sv
	zGfCa1vgh4Dcl3NuXRHbBdchMakh39XLdeFB4NOQaucYG4t9wuhYxp9hnYtpuYBzIbk8Cexj8joAX
	kRO3DehakTqFwynt7O807XHhhcoXKcq3fcgPVjQAzV87qqhYa1I9xgKF5Rqz5F5QXHV4nRVsZ8wlb
	3i+3m46iIncPx9QEh5Mf8xr+ULTmev574DtmJMNsVC6i8ZqlkU1BO7zX4cfnNS0XPvyzzjzbRrtDq
	itoRrteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzKPU-00AWdt-0Y;
	Wed, 17 May 2023 16:53:56 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzKPQ-00AWZf-09
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 16:53:53 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-510d8b0169fso1004693a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 17 May 2023 09:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684342428; x=1686934428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3hIDvPEdjftlVYbqhIG0JXGHdNlYOdLmSjve7aY9Eo0=;
        b=LuAGyfOolGY2lv4bXLQZDUlCkYAFbMjVgJBhtQ35ZvoRANe0rP+NbkFwtPlSSeIKq/
         Z1ELa4OdH1BhZPPVuEcS54mWAsAWMdI99jGP8mvKnKSUwftMqm5xSRaOfxTPxFqtkLxY
         qdUkIgvZbQvT+RLeoqerdDueR+U+biU/Yr3n0d7E/Y5DiwxKMmqsHwOlN18at7sz3xX0
         hix+tDpT085M0KrBRn5JxxVnqtP8l3xr6wG5PX+qP30zi+WThJQQGkTX+BzXAmY+WljI
         684VChIFfk5qFuVy1ZK+D6QjxLctgUm4HmqkW+vvQDOPqCPVkbasYZ1D9Mdfy/5Rs9bJ
         aCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684342428; x=1686934428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hIDvPEdjftlVYbqhIG0JXGHdNlYOdLmSjve7aY9Eo0=;
        b=LHfnizm8p8trFd1APk+cbHvmungWdFiXA93JZu68ppRs4cyqtb6fCtJhDO9hOCbwk+
         CySuT4zsXXdfrB5T0QjgCx87A2USI1a9f2/sF0cQWXeYCKJQXGhS3l0U3/M1/otRdwXQ
         542K9Hj62j8TBPI9xO3s7AdvqNZqXDODOAEQAuaFsKlx1koSmWiz8UNiFuBHEL/zVxYE
         oCpDaUv3uOgeMCT+tP3jICjgU5UkjphX7qKWFMJhR+eodl2c1bJkIELXIVZ39chmras6
         JcR2pO3nPt+8TuZedwLtM/n0/R4zwGcAwqa5CW4/WPzyWbfPHssRxq9IuBQS6woSOMO8
         nLXw==
X-Gm-Message-State: AC+VfDyC0cjPZP6jPd7WzFLvputvnPrFt5fuDTBJ2kmk9FYUjXD1giCQ
	+nFjOh64R3mEhS/gmqoJn6lTOQ==
X-Google-Smtp-Source: ACHHUZ41XuiV/6uHDBhzp+l1Rm28KeZOiUPPrRFoy46T5x5hqEOTvHbPfGD88VINkhOzOmp9caPxnQ==
X-Received: by 2002:a17:906:9b86:b0:96a:5a59:92cb with SMTP id dd6-20020a1709069b8600b0096a5a5992cbmr24102081ejc.47.1684342428067;
        Wed, 17 May 2023 09:53:48 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id mc27-20020a170906eb5b00b00966330021e9sm12332628ejb.47.2023.05.17.09.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:53:47 -0700 (PDT)
Date: Wed, 17 May 2023 18:53:44 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: conor+dt@kernel.org, angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, matthias.bgg@gmail.com,
	sumit.semwal@linaro.org, daniel@ffwll.ch, tzimmermann@suse.de,
	christian.koenig@amd.com, linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	linux-mediatek@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, linaro-mm-sig@lists.linaro.org,
	airlied@gmail.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, bero@baylibre.com, mripard@kernel.org,
	nbelin@baylibre.com, linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org, khilman@baylibre.com, jstephan@baylibre.com
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Message-ID: <20230517165344.6gzwzkwzu44noyqm@krzk-bin>
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517145237.295461-8-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_095352_090932_D956A01F 
X-CRM114-Status: GOOD (  12.52  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 17 May 2023 16:52:37 +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
./Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/mtk,apu-drm.yaml#
Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dts:18.15-22.11: Warning (unit_address_vs_reg): /example-0/apu@0: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dtb: apu@0: remoteproc: [[4294967295, 4294967295]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1782720

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

