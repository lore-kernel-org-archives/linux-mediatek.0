Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EDDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 02:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blOA4JFmcqhrXwFHsn2rwPLCRuOysC5GjZIN+jWpU1o=; b=ZUjNiigS0rMmjD
	udyBVGdr+sYb0yFu7ElS1eSTNO5QXuiqnWMyPeUf1MJNn71pSkoCawd1g8n+8w05w84cCmDN3diAt
	7UzK/KnXOCBL8PukVXNHAQXz4zVtm6p7yt5nuU9A7QLGbHWE6YlxUq5yoAqtydaQpqdI0U2XVK2WJ
	7Y2YpgQpHNiWcX8LpNu/Zt8TuDNjBQTPUqngENb7NdC4ujkzWsi9KssiHoN9XKHeE2z+JkJQ16bt6
	M/v1MYEVT9xqS9NfEVK9MZhAjsLa8LYCc8AaONfRnFgSX6VauutVfFqrCxNiOLKmUNZmlIghHsaeu
	9B5WIcK8Gem1H5f+Ofzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0aAN-000vSK-4C; Mon, 13 Jun 2022 02:50:59 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0aAC-000vNz-5G; Mon, 13 Jun 2022 02:50:49 +0000
Received: by mail-io1-f47.google.com with SMTP id h8so4782624iof.11;
        Sun, 12 Jun 2022 19:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=rmYoTFjwwfLHaEAKyMwepQVd6Fyyjo475AJRyY0r/yQ=;
        b=sA2IBgjaX+MDpvNrbwCpTGJ0XtDaEqPRcSXcISi/ilYxpUr1o3kao3OY2LbSUW3qaU
         8aX7LluuCLaSqTiVI1MGaTUHMxfW4TL0yBM1r2uW5RLGz7eDSixbDpfO3LBh8DHRmRFw
         7ka3/xJdUIeCU0O1VJrfIqjPgxo/2zwmx83V9RW/XjAMA/BMOk3eBv7oYx9k68cMnDQF
         vGxLChJuIMkmZ+1qqSpjr7+i3WfkcROxCckrjD99rCyFdPyD1Cfa4/emoj732yvwa88l
         l0uVb+aXH8IFCz/gxLeu7uP0pRBiRU6jGDoiqAC2a690VX9X+x1NGiNa8linOeqYXqyh
         3tig==
X-Gm-Message-State: AOAM531SURg4VXiOZ1D57oONU7b2jkIRHM1SBTMPZVVV0YwlfJJC3d1S
	MEkz5Ig5Rk83DcxmXEHIjA==
X-Google-Smtp-Source: ABdhPJxyFckgQT337XDCiRAwgwtx3vUFkJL/tbw8qlrIqOoTtJpo2NVfXZ2udavPLZEGvQXL+u+/Tg==
X-Received: by 2002:a05:6638:dc5:b0:332:3180:fd5e with SMTP id m5-20020a0566380dc500b003323180fd5emr5261454jaj.285.1655088645082;
        Sun, 12 Jun 2022 19:50:45 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id w4-20020a056e021c8400b002d10dc367a1sm3261489ill.49.2022.06.12.19.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 19:50:44 -0700 (PDT)
Received: (nullmailer pid 2612895 invoked by uid 1000);
	Mon, 13 Jun 2022 02:50:42 -0000
From: Rob Herring <robh@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: sboyd@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Edward-JW Yang <edward-jw.yang@mediatek.com>, devicetree@vger.kernel.org
In-Reply-To: <20220612135414.3003-2-johnson.wang@mediatek.com>
References: <20220612135414.3003-1-johnson.wang@mediatek.com> <20220612135414.3003-2-johnson.wang@mediatek.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: arm: mediatek: Add new bindings of MediaTek frequency hopping
Date: Sun, 12 Jun 2022 20:50:42 -0600
Message-Id: <1655088642.973172.2612894.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_195048_241777_F114C8AB 
X-CRM114-Status: GOOD (  12.49  )
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

On Sun, 12 Jun 2022 21:54:13 +0800, Johnson Wang wrote:
> This patch adds the new binding documentation for frequency hopping
> and spread spectrum clocking control on MT8186.
> 
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,fhctl.yaml | 149 ++++++++++++++++++
>  1 file changed, 149 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml:44:111: [warning] line too long (133 > 110 characters) (line-length)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

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
