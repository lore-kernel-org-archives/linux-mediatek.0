Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E490C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 13:47:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0116B23E26
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 13:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0116B23E26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UwFlr6t6wLR+/7HcpBZWmCjiBr31pdLgyF7KMdgqG1o=; b=YJ+aywUSDh7sCm3sVYwAw2due
	aBjhZHTKX7j8aA5vDx/W41TosWycWV9163sKa1/aysBQJifwD55CBZkLIXwJ/3w3iigQFAXIm7XgJ
	acpO4VXVsXgsHfihu91TQqM/GGzEAqAT+Kazvol+UcE6FGYpdYlbRW5bV2wBr9u6JORjwTiwWGzMI
	Ri/81K/lw7LUhOlRbMPNTSNZBeT7aSl3y0x4w6+B4M3u3T6dlU9SNhSFQBOQaK8iNtsKd07UpeG56
	E5qzWVuzZAvD5kITJfk5dZjmuzx/pWhoYrcl/lbQi1DKRSS7GSCd6gdlcj2B9xjuXU7NS/TZ9M9e9
	mI2lIy+/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knilN-0006Fv-Mu; Fri, 11 Dec 2020 13:47:13 +0000
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knilL-0006Ez-BE
 for linux-mediatek@lists.infradead.org; Fri, 11 Dec 2020 13:47:12 +0000
Received: by mail-vs1-xe43.google.com with SMTP id b23so4787702vsp.9
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Dec 2020 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FfZ8Hbqg5JOVMCVU7zFQQsVHbxKEp1AAS0eJ5Y7LnV4=;
 b=nsFbhL9mAsmWp/jt5PSJgGDYNEwHYlwEVqGJ2AEAoidm6SBverb74n1+1qnawRF61O
 Wm+qq9KhtiBet5cXimLfrtOXbxmTAyvRuSuQZy0kcPtlrwbi3lIRlWdfw1zmv6XkCY/j
 O1XqtKw+zE1Cx3aKWQInx+KTqEbBV5/8SGFirjTVzHbJbJNVA7UDHc5cLC3q19uA87BI
 2ElrfG/qvsWy1DnGU3q95X7jPcct1+GoMPD59/ywMAvpXBbbeb76Sf1lQMmTo+67i8k5
 VNnDEp19Jc9RMHkO2NN7lve4ZSyAdBE7ZDM8gJ2URSETW7xq0+1PvRuOMjQ7H6Rzg8jk
 S5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FfZ8Hbqg5JOVMCVU7zFQQsVHbxKEp1AAS0eJ5Y7LnV4=;
 b=ENnEE2f0Cy0lWQ4N2TnmU4xOIpiYTb20TNpXDr/G6naRV1Eq+ZyDytdQ42osbkqWtF
 EhWJBkl4XTGVkcVB548u0B+JJqTf9pPEbyLdwQ/lPS8eBqDtqFI6IbfR0aDU1Q327dk0
 lLe5nHouzLCRF4+ITgQPKM8kYwUjaXFyk1ky5K8nX4VCXzfRdOG+0eff9nPPi6puNRwX
 YSXZnYo8BexEK2zpmn5Qhefpq2doBRv7COq7rxGrM+Qq+UacmlZnLnMdyzreKI3mBM7a
 rlBHYXokwLgpMWTywjqIu9FVkfSVVgEG2N3CamjA7kaDVr5KdyI6cA4nyMGDqHvDQdIJ
 nGmQ==
X-Gm-Message-State: AOAM533yZgVLqT4T04Y3IspTIqVa5GT26f/8eBPlXmtKbxOHcm2HzKrt
 XhvFJ5cNndQob0w2ktF2CZhfMWPNhw5iLfbYSy6tlQ==
X-Google-Smtp-Source: ABdhPJylD1P8t8sm/PPT2AIOH0OZEU0uw5g6BFwZEtaYiQ6BCREPd64WU7PMO3pXVotWlSLhn2H07FbQkf+hp2l5rd4=
X-Received: by 2002:a05:6102:2127:: with SMTP id
 f7mr13236500vsg.48.1607694427887; 
 Fri, 11 Dec 2020 05:47:07 -0800 (PST)
MIME-Version: 1.0
References: <20201207032626.1445-1-thunder.leizhen@huawei.com>
 <20201207032626.1445-2-thunder.leizhen@huawei.com>
In-Reply-To: <20201207032626.1445-2-thunder.leizhen@huawei.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 11 Dec 2020 14:46:31 +0100
Message-ID: <CAPDyKFqJrb5SQ0o4cc9=Yv=GAZ3chjQoDRrKjPUUnUi__g7iiw@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: mmc: eliminate yamllint warnings
To: Zhen Lei <thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_084711_467283_56824809 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 7 Dec 2020 at 04:27, Zhen Lei <thunder.leizhen@huawei.com> wrote:
>
> Eliminate the following yamllint warnings:
> ./Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> :20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> :30:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> :33:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 26 +++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 030e3fdce49293a..01630b0ecea773e 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -17,21 +17,21 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> -        - mediatek,mt2701-mmc
> -        - mediatek,mt2712-mmc
> -        - mediatek,mt6779-mmc
> -        - mediatek,mt7620-mmc
> -        - mediatek,mt7622-mmc
> -        - mediatek,mt8135-mmc
> -        - mediatek,mt8173-mmc
> -        - mediatek,mt8183-mmc
> -        - mediatek,mt8516-mmc
> +          - mediatek,mt2701-mmc
> +          - mediatek,mt2712-mmc
> +          - mediatek,mt6779-mmc
> +          - mediatek,mt7620-mmc
> +          - mediatek,mt7622-mmc
> +          - mediatek,mt8135-mmc
> +          - mediatek,mt8173-mmc
> +          - mediatek,mt8183-mmc
> +          - mediatek,mt8516-mmc
>        - items:
> -        - const: mediatek,mt7623-mmc
> -        - const: mediatek,mt2701-mmc
> +          - const: mediatek,mt7623-mmc
> +          - const: mediatek,mt2701-mmc
>        - items:
> -        - const: mediatek,mt8192-mmc
> -        - const: mediatek,mt8183-mmc
> +          - const: mediatek,mt8192-mmc
> +          - const: mediatek,mt8183-mmc
>
>    clocks:
>      description:
> --
> 1.8.3
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
