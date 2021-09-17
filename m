Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CD4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 14:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF8CC61164
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 14:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF8CC61164
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pTm++pAe7DktH9OZ8WiiJDV9OqGf4qnGNzq6OVlPhNA=; b=t/4cSs7DdUD4ce
	WnqOBo8fWXw/9rf2f1FtFB9ZEF1S3HbMCOzxlfWl6uQUN2AZDd+AjdvY0EoMfLGUVMsNm6z312rt7
	r8j7FjQ8f8R/eTybLDY5FaqEYqUt+2LfH9asZiy9tGR4npC7wGHZxs+UidPkMpCJMKrQJrJfjHYt+
	ZzySU0OzxfdoEWGMk+X0eb1nJ1QbwdlMuTkYtQ+XuwV5FhUgvWlznyV0+QRieazNxvo+cTEFLJexr
	nGGiZ+soRbvrrm1wS1hguKYRGVnRx1HkrEOJWhs5R0L5xRzp7T29PaO/ZHa/ogmFlVuqCCUf4i08u
	w6NFJ2Z5JhWd0VlPsH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRFJC-00ET95-DW; Fri, 17 Sep 2021 14:57:46 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRFIz-00ET6K-Oj; Fri, 17 Sep 2021 14:57:35 +0000
Received: by mail-ot1-x329.google.com with SMTP id
 m7-20020a9d4c87000000b0051875f56b95so13213569otf.6; 
 Fri, 17 Sep 2021 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HommjSZU0AKAIbij2iHpVnnWLtjGW54TVbe+ijcsoYw=;
 b=lPb2rV/oAhgrjCYBZIlVrsCzk27usUH6Yr7w+t8cGylQD0VOR3/Pmsxbq2fEGwfNdQ
 z1+MqIDv0+bW4yGCjhbK+oF3cvoQzQAu8pU3I6btsvwt/XTDQuqnLeD+47FEHtN1Ir2H
 wuUHXMXmWcjN36cLM7T6OJzFRy/EeVjWxX2U2kQh+bX/sPCuqXNxgKWQagLcIITkn/ao
 +BLA46DoNiQ48YYZqUrEL4S16gS0dTqTZ00gIPrrGy14Fy5D2n+i8gS8/NfnzBZTq18r
 zvLlU8QRVQ/aLyyygpq4qIZ9hq2VLdSJy78JjqlQ677wJmq8q4PJZSDPxh7i5AjEp6IW
 x5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=HommjSZU0AKAIbij2iHpVnnWLtjGW54TVbe+ijcsoYw=;
 b=jynUaKV1QHfXKJFHjmhR8fBd5oAP25fnYLPWzEkyw+u6T48Qpd3Uipw4t1qo8WT0Oa
 oDOKVFjEnjov1jMMMeFXmInv4ndEk6pEJ2HcS0+ipIHNObP5AQz6q0f953ylrYisZNKV
 6omc3Rt7YyGe+0O/ZuBCQLvz9uWmXHL3H0yFv4ScNkASWVfZGVO969IdQpqPcUoxC2aB
 aG11/jc9XpDKMZt2YgH7ufE60etnto3S+TVUww+GWgG3r5J3RW18QMK0V0jQ8wLo3UV1
 OVSBCYidOlv6nn47mgmJQwxrlMdoWIx8Z/4ll/14OcGpVOwWRaY+J9ejeFs6LXiUyPga
 LdEA==
X-Gm-Message-State: AOAM532tUE/PFIlew77mTqFyZE5OkFFepQJ2J49gLttXXhM9yNptO/B7
 Gnfmv0sZJ/B2gnn43/RgVHY=
X-Google-Smtp-Source: ABdhPJw0nznUgbbF88p8qquwhDmGqe5hPv4Kaux6JWVLLmnsuidDV0EnAGbUS1FS3wxGLB4XdBXpzg==
X-Received: by 2002:a9d:4a88:: with SMTP id i8mr9347177otf.290.1631890652285; 
 Fri, 17 Sep 2021 07:57:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 v11sm1571613oto.22.2021.09.17.07.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 07:57:31 -0700 (PDT)
Date: Fri, 17 Sep 2021 07:57:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Fengquan Chen <Fengquan.Chen@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 tinghan.shen@mediatek.com, randy.wu@mediatek.com,
 rex-bc.chen@mediatek.com, christine.zhu@mediatek.com,
 joe.yang@mediatek.com, zhishuang.zhang@mediatek.com,
 Rob Herring <robh@kernel.org>
Subject: Re: [v3,1/2] dt-bindings: watchdog: mtk-wdt: add disable_wdt_extrst
 support
Message-ID: <20210917145729.GA1426468@roeck-us.net>
References: <20210914123454.32603-1-Fengquan.Chen@mediatek.com>
 <20210914123454.32603-2-Fengquan.Chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210914123454.32603-2-Fengquan.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_075733_852886_DF48F2B3 
X-CRM114-Status: GOOD (  16.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 14, 2021 at 08:34:53PM +0800, Fengquan Chen wrote:
> This patch add a description and example of disable_wdt_extrst
> element for watchdog on MTK Socs
> 
> Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index a4e31ce96e0e..0114871f887a 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -22,6 +22,7 @@ Required properties:
>  - reg : Specifies base physical address and size of the registers.
>  
>  Optional properties:
> +- mediatek,disable-extrst: disable send output reset signal
>  - interrupts: Watchdog pre-timeout (bark) interrupt.
>  - timeout-sec: contains the watchdog timeout in seconds.
>  - #reset-cells: Should be 1.
> @@ -31,6 +32,7 @@ Example:
>  watchdog: watchdog@10007000 {
>  	compatible = "mediatek,mt8183-wdt",
>  		     "mediatek,mt6589-wdt";
> +	mediatek,disable-extrst;
>  	reg = <0 0x10007000 0 0x100>;
>  	interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
>  	timeout-sec = <10>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
