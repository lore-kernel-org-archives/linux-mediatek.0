Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CFFC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 15:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRnjrNrKpUEdCWynwN46DRbvjj6rSysENOSI8RxBlNo=; b=ZqL/CqpwaaNS6XwoNEwbKJCIpn
	sntUAUvm4KNRxnAWIGuE91nzA7YejpeG0I7yxbQWrUgHHbBlKTo6pamh3Bd4gzjZGL9VBmQtvEDlv
	EhiXI8mi+VgbEpYB/ldJheQXunzlzDs+/rTQmnHPVc9vEDdryWR202gqHJGT4ZTpAwINPSRnIS1gH
	9c1V7Wk/9pIOSaPlJtDArX5tiYODUTNd8zWsk8qyoWHBKlzglNE2OxSR+7sdXjeR1glwHpvowDn1M
	hjOpIvReMnlBRWolct7VP8dGIfafWWBs5zuuuZzgrqsKhb1lpXKIiVzxph2Wa9161RLGiTYg+g7TQ
	yx+I0sOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqyTi-004AFI-A7; Fri, 04 Nov 2022 15:19:30 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqyTe-004ACw-I7
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 15:19:28 +0000
Received: by mail-qv1-xf30.google.com with SMTP id c8so3381992qvn.10
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Nov 2022 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRnjrNrKpUEdCWynwN46DRbvjj6rSysENOSI8RxBlNo=;
        b=nG9oFgohsMgh0IKM6eaQaQ76xOTmewTADKqUnB3LIf8Pyh2WRzvGKl2UgeDuNsnYrO
         ZhO0HKTxzc2OyZQ1bglKCjndW9q33wxeSysF3DgSu4S3CMtFgd9y90jyWtC5b5U5ifjO
         aqfvBJVpBXXQWhAxEHawDdO9jwhdjT6SLOw45/Y16BFnutT5MoPm22ogdg0yZFT3U1vE
         lQcM6vmJlDiOmFH6oWMlPc0e3QC6JZIXwFeREE7TJRUb2bs+LV3pQRpNjk9KasIeY7Iu
         tWqHLNTjzLeGW+1hcJSDcC3DyWPpc0/FLatlRgpXn8OHXAzG96ee9jwrbMZJhiNmDvNv
         BM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRnjrNrKpUEdCWynwN46DRbvjj6rSysENOSI8RxBlNo=;
        b=tqBPYeibQv2dYGpOxN1dxLq12OlXbLy5UePcsF4atXGlP5gzGLGSEk6Psvr6xgqkvt
         1zI6Ez2eHsz6IgSGp7cLDay54OnvE9iU5PtR0k+tC5naI7RulDedRyy7RFdL39DoHeBV
         b7EXW6kMgnSYYFTJtxEyoCGDjyvp+eZnpaVAM5jxBc+TWQG/3djDjpHKrNe7cE/Ruyry
         afF3x3sZnJSuKTQAEA/N3eaFo4AkIOhj1xSy21yfpPAeWVQFbDCr+iojLzCblHjgx85S
         ZYODGgVWoRDSu5Hq/+a7fa1F6i6WapZf6KDdoEBpN2IGNIiLHSBc6TKN3qR/5QeQ5XKx
         7rMw==
X-Gm-Message-State: ACrzQf0BRgxGGgaIWsvLJNcHpe2o7+tm4Z6Jp80s70RnPbSXm0cLdmYJ
	LuXUZLZyHwpfilzDZTW8FioyTg==
X-Google-Smtp-Source: AMsMyM6/bD7TwetAszdHR3EmYhj0XT1Ya2qXerlaVZb95uTZIfvp1C7Y6AQQUqEDn0G3VLRG4dxKxg==
X-Received: by 2002:a05:6214:20c2:b0:4b1:316c:67a2 with SMTP id 2-20020a05621420c200b004b1316c67a2mr32412761qve.32.1667575163412;
        Fri, 04 Nov 2022 08:19:23 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id bq37-20020a05620a46a500b006ee77f1ecc3sm3160269qkb.31.2022.11.04.08.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 08:19:22 -0700 (PDT)
Message-ID: <8cdd0560-8a64-de1f-d1f2-a4dc729f8970@linaro.org>
Date: Fri, 4 Nov 2022 11:19:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 0/2] Mediatek eMMC Inline Crypto Engine support
Content-Language: en-US
To: Mengqi Zhang <mengqi.zhang@mediatek.com>, chaotian.jing@mediatek.com,
 ulf.hansson@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 wenbin.mei@mediatek.com, angelogioacchino.delregno@collabora.com
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221104095848.27444-1-mengqi.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104095848.27444-1-mengqi.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_081926_646450_3DBD37A6 
X-CRM114-Status: UNSURE (   8.99  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 04/11/2022 05:58, Mengqi Zhang wrote:
> Change in v2
> - change patch 1 commit title
> - change patch 2 commit title, and correct commit message
> - add crypto clock description base on new code base
> 
> Mediatek eMMC hardware IP has Inline Crypto Engine (ICE), we support inline encryption now.
> 
> This patchset supports Mediatek eMMC inline encryption which meets the upcoming version of the eMMC specification such as v5.1 or v5.2.
> 
> Patch 1, add crypto clock control flow in mtk-sd driver, patch 2, document the device tree description about crypto clock.
> 
> Mengqi Zhang (2):
>   mmc: mtk-sd: add Inline Crypto Engine clock control
>   dt-bindings: mmc: mtk-sd: add Inline Crypto Engine clock
> 

Your threading is broken. Resend with proper threads.

Best regards,
Krzysztof


