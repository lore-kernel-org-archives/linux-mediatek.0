Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D11C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:01:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27159600D1
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:01:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27159600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ei4wKctSiUqKqHI6vW+bJmNVktSsKXBA4ATVh+WEHp4=; b=R923hhgXomb3WGAyIwGZZRLnek
	n2tltuG+T/eFVCdMeqGcNAencPLPkQRrRUk1dpgedwIdfj0IFQC/I8h5D0aLp5uTqpY437jv+OFmK
	2wgjf7eT5J6P4RfQ729CsG8eodDmouZhdr5/go6Ls4uHLXEV75ZLhZFkxO/i9x6OpgHv3VXUW3ZcB
	TJ0+c4jQuyENJZCNV7hUgYa8CjsUYH92YbE9rM9aACGURCMA1x3KzXDqRiiSU2TD/FPDIPIa2kKOd
	arwTEngzzIymfEIRvuBSx9Vh41v+ofj+n++SXRSkQLhFoDB+PomvN84aZUcY5TSBy+xfr5OTYwaoQ
	9nem7J0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mApMK-001VI6-GV; Tue, 03 Aug 2021 08:01:08 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mApMG-001VGE-SW
 for linux-mediatek@lists.infradead.org; Tue, 03 Aug 2021 08:01:06 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id A63373F234
 for <linux-mediatek@lists.infradead.org>; Tue,  3 Aug 2021 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627977663;
 bh=xcgPwRTVNnlB9Ca1BryW6jcXJ520XlA+QdA5eYCuNqY=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=DDLXhx2OZEybII3k7FgTgiBoIUPNrPqSKn76jx9CAWZreKOcUFuUr5x9QVMVOpd0z
 yvCxC/TYawRI8hnuDIzQmQzu8X7Y8OqtCggfbO7Dlp12Sx281JNVt4m2+pbSep56t6
 TrDY5QHxrkID69cH0lGiPvDurP5bJUqm3fgQU1fSHh93A2GYPGoV4IjeATbPFwgt84
 RnOH13h8ZmBXN1DJIC6ETcn9NM6r2kklQtGKGehvFnE8f1lQ9LDK7zS/fKuTEoHikF
 bSpVl5ZF01asVc/CzjGYCA2IIgVQaURlaSpFqHPukUq57nx6/qdQollWFnmf9Ebv2Y
 7Gys5qX6rFLNw==
Received: by mail-ed1-f70.google.com with SMTP id
 l3-20020aa7c3030000b02903bccf1897f9so6468488edq.19
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Aug 2021 01:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xcgPwRTVNnlB9Ca1BryW6jcXJ520XlA+QdA5eYCuNqY=;
 b=KEBGbL+KfscJ+zTOinXYGW7azmcH8SLRkvT/XS4xUb3rU2N6rMazz9PSM5lOavFBcN
 fkhERo8Nx73jhPJiHC6CebpetwVMJEryXwJchMAdDip9MkMh7SqML4JwaByFq066+bnD
 eexxHecplMZ+xD+CkxGYL93UhpwzLSxo5YLswouGiCIsEUy3vh4E5Lks8Hggqs5oVG3H
 NphxTRqrjKF32mUa25pEHRsBfnQ8sePxgdGKvBCvBLO2V9rsd4R9Le1k8Zum3L7rMWZd
 nPKAZ5yUNnxO/AZz2xP+ZfcedagFf1O1Fvfi0+6/sjIHQUOl0jaueVyregmAxfUmV7aW
 Pm3A==
X-Gm-Message-State: AOAM533dkBg0FIalXuNOp3Zbj/ftIMZmE4oEQZPEeHQs+NfsQ77yzQig
 XrFVdsIvMLDmCYklk7ysJJEa5PFTOwiMNqV4eT/5DeTU1SFRvUoF6uhXToYRMyIlDQ4yCvQVjeu
 QPum01Vu84Irkq3zV7Byl/GKr8ysw0QKDbBxu3gro6nHN4w+HJA==
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr23476351eds.251.1627977663351; 
 Tue, 03 Aug 2021 01:01:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwj/qP1Q41wUE0MaM16YNSLHgwdPMzFI76UL7qB1dSy57AzxsYBf1Q0TLraQrcJ7Xxi0YM1oQ==
X-Received: by 2002:aa7:d7c1:: with SMTP id e1mr23476321eds.251.1627977663186; 
 Tue, 03 Aug 2021 01:01:03 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
 by smtp.gmail.com with ESMTPSA id c7sm7763197edn.45.2021.08.03.01.01.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 01:01:02 -0700 (PDT)
Subject: Re: [PATCH v5 3/5] dt-bindings: vendor-prefixes: Add another prefix
 for Mediatek Co.
To: Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, shawnguo@kernel.org, sam@ravnborg.org,
 linux@rempel-privat.de, daniel@0x0f.com, Max.Merchel@tq-group.com,
 geert+renesas@glider.be, fanghao11@huawei.com
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210803075922.11611-1-tinghan.shen@mediatek.com>
 <20210803075922.11611-4-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f084bd57-c6df-cade-fefd-217897caf88e@canonical.com>
Date: Tue, 3 Aug 2021 10:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803075922.11611-4-tinghan.shen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_010105_139034_8084FA63 
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

On 03/08/2021 09:59, Tinghan Shen wrote:
> Add document binding for mediatek.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 07fb0d25fc15..c4252cd570b0 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -760,6 +760,8 @@ patternProperties:
>      description: MStar Semiconductor, Inc. (acquired by MediaTek Inc.)
>    "^mti,.*":
>      description: Imagination Technologies Ltd. (formerly MIPS Technologies Inc.)
> +  "^mtk,.*":
> +    description: MediaTek Inc.

NAK, you already have one MediaTek Inc. I doubt these are different
companies...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
