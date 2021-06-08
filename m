Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC923C4743E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:00:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC3D261363
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC3D261363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A6abmCC/jqxXPXytrngpedwWUTZ2kgmLexiJrZPk2xs=; b=s3oIJOfoFyf4EW2YOSNayDTQr8
	gtMxSU3KKPO2ql6Tkkx/Pd2h9nEI6siWhX4t410v6Voyp6cxSIseCGBNYUxPMPBkuWsZM5NUH70nA
	7G2x1hsU2m4sXaolbnz7q+8m+qOk/inVmF7wQIqJzhSfaH4Yeb6wCBL+hMQK7HASOrPeinaf6mZDI
	4SQMr12d/axNildZiiuU9QydxEHXtnbuZs2ISyKCdaV6k6vsvTTRaJvCPIxVx7eJVfp5vdKiBms6q
	SxpIgIRON8eR5CIBOy4Yjnq5/OWTwjHrBu+/uWfYwgN8Ch2BbNQL/4ndx7Ro/siQpz0MTmhIQlTSS
	o1yq66eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqcHK-008iTZ-1u; Tue, 08 Jun 2021 14:00:26 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqcHH-008iSF-6Z; Tue, 08 Jun 2021 14:00:24 +0000
Received: by mail-wr1-f51.google.com with SMTP id a20so21762335wrc.0;
 Tue, 08 Jun 2021 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wha8NSsJMXDXrgiU3SNfxp/2iBxAp8C222zWJjqhoMU=;
 b=bcJnF3H57bJobBww34fPeDlDuVccrVj5KUGko7NQweDYMMXx7lqxEkDXL0NR5OKARZ
 uKUc4ywXc7NJ3V45uiYqjUzW7IvRUdHBiBR+XclX4qf8MOe7SMCPX5PI0FCjDKBwWrNg
 /8cvtLpllVjowaDJryvXyx4ZdZ+G8+MLeXPNNOkXPK2sKVZfkuYwd8lXLgTTB5IrkHci
 PcDzpxUebjnu9qaNEf9amsuW53IAKY+AWPRoVnELwCthEo38JDNrjTDmsQe4cLEoNO4x
 Ii9LNgyup0+1+s8QavDbSf9g533wmF67Wn4Ofr5yg0muN9KDXv+eMh3jIwdYLNLw3S8L
 JYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wha8NSsJMXDXrgiU3SNfxp/2iBxAp8C222zWJjqhoMU=;
 b=lAp/+5TGTIn5I9YGF9e3Gtt338vRSkXgL9UGssOpTjzWIRK+5g5vBYY0jRRqnvgdS8
 tpAN/fsS/LMgcxI/y3e+SUHVOaWCHrr+tt5D8SWRIHnjjJrr4HdVGw3kAb1/lDv40ec6
 BIGRTtuxvFm5dBzQIEomkt7xfmtf6Q3ya87qsLkb3l66kx7D1KzqFP0DxZEqM0SAfu3a
 wlufRjZlwgtRHycojlelLNyHM9xTDXgRzZp1AABgLwdxLPtCw9dInQ26BT7L+OouhWd1
 37UvqqPxfahJG0RldlXatoVuItXjbp/Mr+/99AW31bKMRR/By3fRRgBCivE5VyUKV5xN
 RwCw==
X-Gm-Message-State: AOAM5329XV4AQslHiI94/Ydd/7wovIrhW/pvFF+ZfljddZl8BP7s35Pd
 qzIIzrvslCvmN6vlbVjPvp4=
X-Google-Smtp-Source: ABdhPJxWHnY/CZiNAzieh2cURAlIqm+0x7tH/zf160ESS25e2FExXNlpwmpZT2iayb4PANYHUMn/ig==
X-Received: by 2002:a5d:4567:: with SMTP id a7mr22632327wrc.362.1623160759809; 
 Tue, 08 Jun 2021 06:59:19 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id b15sm19028240wru.64.2021.06.08.06.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 06:59:19 -0700 (PDT)
Subject: Re: [PATCH 1/3] dt-bindings: i2c: update bindings for MT8195 SoC
To: Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc: robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 qiangming.xia@mediatek.com
References: <1623122200-1896-1-git-send-email-kewei.xu@mediatek.com>
 <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <4df57c35-529f-9534-979a-f5d862a519a3@gmail.com>
Date: Tue, 8 Jun 2021 15:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1623122200-1896-2-git-send-email-kewei.xu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_070023_274782_D80201BF 
X-CRM114-Status: GOOD (  15.84  )
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



On 08/06/2021 05:16, Kewei Xu wrote:
> From: "Kewei.Xu" <kewei.xu@mediatek.com>
> 
> Add a DT binding documentation for the MT8195 soc.
> 
> Signed-off-by: Kewei.Xu <kewei.xu@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 7f0194f..7c4915bc 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -15,6 +15,7 @@ Required properties:
>        "mediatek,mt8173-i2c": for MediaTek MT8173
>        "mediatek,mt8183-i2c": for MediaTek MT8183
>        "mediatek,mt8192-i2c": for MediaTek MT8192
> +      "mediatek,mt8195-i2c", "mediatek,mt8192-i2c": for MediaTek MT8195
>        "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
>    - reg: physical base address of the controller and dma base, length of memory
>      mapped region.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
