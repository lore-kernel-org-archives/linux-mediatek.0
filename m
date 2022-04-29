Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E665EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 06:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kihnlS1dWAU/qb9m2AWD5DH6njermSDL9HDxavWzrYE=; b=XZvzHPBnfM5Jnk
	DZCggu1XwbaCQyiKJUN50IE39YepCPpYvRiA2qBRgItzfcB4FDZ324ScNTy9RXEK0PIUx4z7FfZBH
	3kB2/owbeEMvxN2OBCuzhYyyO15ZYLjrRZr5RKda7PSgnqFZF6LgJ5l8XaeeRmRuZr8TaB0FAmwXA
	lXdM4IK7pezjeRHW22T5DCzDUhncjydmIBLPQ7kpgZJRcE58f+r7s1g83tsW6Aa6szvFTG8iMjJoh
	+mNBpAcpIn7qRjzMoFEchOWqVpSGYPrQqk/wRtym2hk2IYi1yuDhqrHm5gDdLcU30dokXJXM2byFn
	HL6YWhrc2JmsIkIE444w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkKTm-009r4x-8g; Fri, 29 Apr 2022 06:51:50 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkKTk-009r4H-7T
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 06:51:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id bv19so13633891ejb.6
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Apr 2022 23:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mDlkYW1jOvACOQZC2hs7NlPEH41hbIy3Cee6HSyQR1o=;
 b=S0HLAOz7G2rA2yLeEvr2F3lrjjv2nPsprZHooIN2NIj88OOaU8taSdX9pKfLMuaXls
 fG7DRxmtn1K6/L4Lec5G9xzPgd+JWZ3bq2tJocG6FDdWIsXeLa7yGRb7rsqVfFYe9OHq
 gf6V9IM0lPCmra8Pn//gbNCyEGFaOVMnJ8Ut+LVJKup9ocmgqu92Idv2GOogtwh2C5Im
 JAbbUW0ygqiSA7nLeLEtxP3TOjOKidni6gZ21GG6HkdPsZx7zNG7eCaFHwRTVmx82IS2
 rZcQph3O8fdi4rQ/2hKoVIlRxSrz+4Zs/UyzVHqzQ/HW6RlsxSkxShDfRGnXGtBVWuxB
 M+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mDlkYW1jOvACOQZC2hs7NlPEH41hbIy3Cee6HSyQR1o=;
 b=YzBV9yQE2mrA+EoYwAu9DCyN8JV/nIh40d1ox2hM1r0sXMsrXyl7jEPcbHwjb+dZgi
 SrSSrQ5LZqAEc8EjZ6YMLkweTxHP0BPKGjz1CMIClaVxVy5KeML2ZpG0l1TcJLITR9Qj
 yC3O4k0Zn9/rbuyTAZf3lHh+ORK3/O3umHJMUDr1W0+4WHEdohpkwFXB8crFtDB2z9mJ
 LTJjJnTY8E6+dAmiz+VLKP0T7PvjtvOaG6EkvHhJ/0g0DW8YfnGYn+ChWrBriDfKOrDl
 XXA12YMYkAQ7DKAZvqFQDxTfJ/EWq1lsF1MZaKj1GbA6DO9+GqHHmrn9aocToy4HAKUg
 fKAw==
X-Gm-Message-State: AOAM532Bvm0ueE9DQWQmvmdedXYBCOJ2OKU8oF9ZaQDAE62gwVOIderQ
 nIRJ02HNGROrkMdIhPaUHbuedA==
X-Google-Smtp-Source: ABdhPJyKpoYsRgUvdWhjm6qmhIpd2ZkWDXaTdwpzyMQVoxXJm0Pmjoejr9XVBcOAFMWc6EkjcMA1tw==
X-Received: by 2002:a17:907:c0c:b0:6f3:8667:9be4 with SMTP id
 ga12-20020a1709070c0c00b006f386679be4mr26384276ejc.325.1651215106368; 
 Thu, 28 Apr 2022 23:51:46 -0700 (PDT)
Received: from [192.168.0.169] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 hz13-20020a1709072ced00b006f3ef214db2sm347293ejc.24.2022.04.28.23.51.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 23:51:45 -0700 (PDT)
Message-ID: <e010e330-590a-780a-c9a2-0f90e5aa04b9@linaro.org>
Date: Fri, 29 Apr 2022 08:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/3] dt-bindings: nvmem: mediatek: Convert efuse
 binding to YAML
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220428132520.2033-1-allen-kh.cheng@mediatek.com>
 <20220428132520.2033-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428132520.2033-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_235148_322156_C4F27321 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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

On 28/04/2022 15:25, Allen-KH Cheng wrote:
> Convert MediaTek eFuse devicetree binding to YAML.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../devicetree/bindings/nvmem/mtk,efuse.yaml  | 57 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 --------------
>  2 files changed, 57 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mtk,efuse.yaml

No, we discussed it already two times, so now third time? You are
wasting my time. Please read all my replies again.

NAK.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
