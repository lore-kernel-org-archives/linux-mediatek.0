Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7482EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 03:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nYPmGOojrQPjPbpgyXGjtpjI33BNAjNRNukPoQzTm3k=; b=Zd7AvUKyNUQzql
	40xKCN1b14cnxoSFriYea/LAe9csze7Is2U0TVTxZ/n2IEs6Va2IUW/aQOf9d7b1D+Sp7zZ/WXyOZ
	6ht01yAjbjv1cRDuACUhDsNWNBdM+eIDMKBuLUc08pF+15yZB8e87YNAYQa0FyHpoVnb2kPtYHpvv
	h+LLLhlLYt0PBCLkTHN11iL/AOnjhfEHc+oOwiNJcS18D+W16ecksvHffffBTgZ9mmGfy0yvoLIeM
	AEXqLUmzNwA0nylaXM8PewZ+psHvF4oLmL14YBmHZmx5H8DGYIydCwKMDJh7WwlZmVFdMcSYZkozn
	Zj3wL+sIl+TsIT2KrNdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR3zY-00Fhdf-0y; Mon, 07 Mar 2022 03:25:00 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR3zL-00FhaJ-L8; Mon, 07 Mar 2022 03:24:49 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 h16-20020a4a6f10000000b00320507b9ccfso16204039ooc.7; 
 Sun, 06 Mar 2022 19:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=d+wQHvIVygqyBwtniWZR0uvXCr9KYxfN8+WYYAjCuSc=;
 b=E7omv8fx36slwLH3gah5GY1+Ga1YL/cPjEFohx/gIctqhHcqZ47C4LBp9IPdy0sO0R
 P+oTkkxD7zzclBCwcVX6GzyagLxmbO6wSzm8p5yfTRonxQUZpx8VRArMThMjoV2BFSPm
 mxt1w4zPHn2r4jC3L5JqsTSpGy6fEbpBF/2fE8ZZATBx5nQkqWM+elrmOlRk6523sn61
 d9lv/PH/fhc+Hm3VAyh3mDPqIZ8e77at0H2najaER9XMhuecBnivlQgkFwha9dRVKZkZ
 GfO2IhZn6v95IGjNX1nQ1VapWA7lEILldEsLqXlIOJdYLtdEjec4z4A/sakUYrQPoRKx
 UF4w==
X-Gm-Message-State: AOAM530++OdId7o0FbFfRjhEwbgvItDkqdUawvpvUEELKn5ELVfxJSQg
 YMTjRljIdfnG2QwR0iTTHUOskSMGww==
X-Google-Smtp-Source: ABdhPJyo+cVwfftoH3b/RmqIsCrh9wn28oxnbtJzcd9pD8qcd3HGAHqGVSVU1h18cO8sKLG5SldA8A==
X-Received: by 2002:a05:6870:6085:b0:d9:a258:df59 with SMTP id
 t5-20020a056870608500b000d9a258df59mr13560336oae.90.1646623483719; 
 Sun, 06 Mar 2022 19:24:43 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f188-20020a4a58c5000000b0031ccb8272f1sm5367939oob.33.2022.03.06.19.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 19:24:43 -0800 (PST)
Received: (nullmailer pid 1496444 invoked by uid 1000);
 Mon, 07 Mar 2022 03:24:40 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Jan Kotas <jank@cadence.com>, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Avri Altman <avri.altman@wdc.com>, Wei Xu <xuwei5@hisilicon.com>,
 devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>, Li Wei <liwei213@huawei.com>,
 linux-kernel@vger.kernel.org, Stanley Chu <stanley.chu@mediatek.com>
In-Reply-To: <20220306111125.116455-4-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
 <20220306111125.116455-4-krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 03/12] dt-bindings: ufs: cdns,
 ufshc: convert to dtschema
Date: Sun, 06 Mar 2022 21:24:40 -0600
Message-Id: <1646623480.209864.1496443.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_192447_718336_64B08A63 
X-CRM114-Status: GOOD (  12.17  )
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

On Sun, 06 Mar 2022 12:11:16 +0100, Krzysztof Kozlowski wrote:
> Convert the Cadence Universal Flash Storage (UFS) Controlle to DT schema
> format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/ufs/cdns,ufshc.txt    | 32 ---------
>  .../devicetree/bindings/ufs/cdns,ufshc.yaml   | 68 +++++++++++++++++++
>  .../devicetree/bindings/ufs/ti,j721e-ufs.yaml |  7 +-
>  3 files changed, 71 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.txt
>  create mode 100644 Documentation/devicetree/bindings/ufs/cdns,ufshc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/ufs/cdns,ufshc.example.dt.yaml: ufs@fd030000: freq-table-hz: 'anyOf' conditional failed, one must be fixed:
	[[0, 0], [0, 0]] is too long
	[0, 0] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/property-units.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1601674

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
