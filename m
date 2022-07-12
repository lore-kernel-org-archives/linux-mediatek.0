Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIxn205KIvmS9VSb5lDf2UBPI0iYaOAaJ1A1MJqqVxk=; b=JDzfereNlbXMvCVo4E2oSEpfHG
	G7NlRRh154CAq16kDdXzCcVBsTqCosjaQFRPYSP9YPDj9av5qqLsbOe/7MlpEX0fUIsLyDMmV9YRO
	SIGRqTnyprMOEbtWI7vuqfPwtx9uYskgXlNAA6f/ZuIydIrIZDsDFZObohvoA8iZkrMk+MKzfaeFt
	gfPqdVMFRsTK1ugm7IYVnVYIHDJbMhhMKFs26iIbdg4w2+hOIZjEBJlmWQpAuPBpLeFie5ezq+3Tn
	a7Mw86735l5q+msLvFYHazd8XJsWzrYldIGNLcr2OH2rdfCJJvNCmbLtfy0cNM5QN5EXEgYZ+m35o
	ySFRndxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDmd-00AI0p-6b; Tue, 12 Jul 2022 11:10:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBDmV-00AHvY-Pe
	for linux-mediatek@lists.infradead.org; Tue, 12 Jul 2022 11:10:21 +0000
Received: by mail-lf1-x130.google.com with SMTP id t25so13351017lfg.7
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Jul 2022 04:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SIxn205KIvmS9VSb5lDf2UBPI0iYaOAaJ1A1MJqqVxk=;
        b=FNUE2acQhszuFh5gwSVw+Rwn9vCbiz5eeW9tj0ulcEp5CB+CXfZNt8End8wSLExYwg
         4MO0Xl4cRWRKs5XBHGbmhjPB/i1vtyPNV90bz1iw4x++t5iu24KV5R6FJi7W09ebLp9x
         S7wFe2tgt8oEN1HIukddBfHCiZO3jZmcu5z3d3BrD2zxyY2u0qHd++sqPDQ+kzN2tovj
         3q8HBg3/FmHKaEXwYT4Dfqb+TnqK4st+QY5oGz7HEfCyVhDwcVT+XW8TO0xoa0lPVoEs
         iojT44I21fzo9Uf3MJBs0yP9F1SVii8xWazC9xjcbn2X5a0LWztVRBgtuz01spJQs9uV
         WKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SIxn205KIvmS9VSb5lDf2UBPI0iYaOAaJ1A1MJqqVxk=;
        b=ni3KLklSQlqaOYB/shlHEkz1J+Gm3gXhMg+iEiBzHvw+LrdCrRUHwzWgPha9ierzFS
         b4MCb0tksmI1JPaZ72D+xtUvLBb+m6B+P8bB5wtR71Dbo0Yn2uVa534+XaAC35KgM76Q
         We2Xi75ywrL4o6JwCpuv1JgMysw0QwHKPviplCODonmvtUXB9hpfwLllqU5nDwgdDP3f
         JqfQ8M9Oqtu2iGiY5yKVJJsaxUkyBafM176la2/rgkuPKgr7O9RWPqDUWmNjcgdqanzq
         xMoLYrzEvLiE9roE/fmkR6tqj94b/gGQh11CT94MGy9TA9Rnc556ghZYfNCNrev/SwSI
         qs/A==
X-Gm-Message-State: AJIora/zLMQiRLWO2kOjBriFWgsramLzEGbKwyMaLZIYpThyIIA6Bxqp
	lgxd1nNtqf8+sZCbH842sy6apSMGVfxn8cq0nnMLXg==
X-Google-Smtp-Source: AGRyM1tW9I2SNwUkOEFsvNntEhlOoXvMH17jCpZPzFWoPNjDoKFFg72huJu8nMkwl68VqtR7rGwljMo7GbdaofhPCqM=
X-Received: by 2002:a05:6512:3d03:b0:47f:7023:2c57 with SMTP id
 d3-20020a0565123d0300b0047f70232c57mr14045143lfv.254.1657624215580; Tue, 12
 Jul 2022 04:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220708114747.13878-1-johnson.wang@mediatek.com>
In-Reply-To: <20220708114747.13878-1-johnson.wang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Jul 2022 13:09:39 +0200
Message-ID: <CAPDyKFqcP69cBEKDx1Uu0BKGOA6s1U+Suiz1KXDXtwn8Qj8kBA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: mmc: Add compatible for MediaTek MT8188
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_041019_865281_6F8A3B68 
X-CRM114-Status: GOOD (  13.34  )
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

On Fri, 8 Jul 2022 at 13:47, Johnson Wang <johnson.wang@mediatek.com> wrote:
>
> This commit adds dt-binding documentation of mmc for MediaTek MT8188 SoC
> platform.
>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 2a2e9fa8c188..be366cefffc2 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -30,13 +30,11 @@ properties:
>            - const: mediatek,mt7623-mmc
>            - const: mediatek,mt2701-mmc
>        - items:
> -          - const: mediatek,mt8186-mmc
> -          - const: mediatek,mt8183-mmc
> -      - items:
> -          - const: mediatek,mt8192-mmc
> -          - const: mediatek,mt8183-mmc
> -      - items:
> -          - const: mediatek,mt8195-mmc
> +          - enum:
> +              - mediatek,mt8186-mmc
> +              - mediatek,mt8188-mmc
> +              - mediatek,mt8192-mmc
> +              - mediatek,mt8195-mmc
>            - const: mediatek,mt8183-mmc
>
>    reg:
> --
> 2.18.0
>

