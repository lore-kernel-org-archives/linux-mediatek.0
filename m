Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2A1C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 10:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DXNckt+1wBuVx3LpQLh6jkvD1I6eVSY2ub2nyt5y2s=; b=S61ZBgMqTmRLuI3Q1o1sAUL3/m
	kHyrA0Ax/ywjsmxXgToiXwDpwUYhwqV44k9hsLUJhznyGr7Og+fXKodmHOjAIyX1K3ic9yMH9pALW
	TrRDYkbxDgwfb1pDU/uSvhjmnikdje3BKc7DbHw72QW2KW30J1IaZkCph17YTH0mE3MIdkI2RPC8q
	taDGcd3bl53BoTCL+JCHn+5ClCWwuKpFNvgO5kFL9dA3lmNyAaKvn66H6hLATEont6uiaTrm4iP3T
	3iZLrdocCzD83thcs3ujJLLCdZhR9sT7YPVGgqzKRO+lMwTZTAngtcRg8CbjQICgPXjAj9aTMf9Vb
	sRSXxGPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeJR-00COb0-RZ; Wed, 27 Jul 2022 10:30:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGeJ6-00COL5-N0
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 10:30:28 +0000
Received: by mail-lf1-x130.google.com with SMTP id w15so18434271lft.11
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Jul 2022 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1DXNckt+1wBuVx3LpQLh6jkvD1I6eVSY2ub2nyt5y2s=;
        b=zbeJawWtnr8HlbUf/dQUmJkL9S2pqzQeP+sOExxZ8n6cqrv+fkEdtrGDBkAAjG90+w
         nBSmqsSUS/y2IWtnQtWIUk820C/xGf01Cbx2aVrG6IU4H0blN/rpR9XMRuDZZhHPGIK7
         9yNybJP38GPnz64+o9piU7UCcBTlTDVUvtNbI417LYRERbVe4lxHITscp4/+dZl+9FxW
         teeOnZXe1FIzw/PkjiAVnUIHgynb2Ak0PdUFgEtYTx3KdMjX/mQigdAvcTV4Q4/zuIx3
         Ay9noR82CBb4748uYreBtl+vY/h7aOYjrUE1hKFIhpWDcUc2Dh1Vneg44SFaK+oYbQ6a
         /roQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1DXNckt+1wBuVx3LpQLh6jkvD1I6eVSY2ub2nyt5y2s=;
        b=QvQuECOiGsmUg2W2gjIvhZ1eOAYV/7Rw/o/v4fUPR5BVmznPLwM+5rrRESoG+XPWu3
         1KierlP/DwDf0lVZ8C5LAEC+9QZYbm0zGmo+9QkNAXD8A7hnUSnPSJ/4LxnGz3/wOIjY
         UfVqnYAIL9cBKwDw88PFsHbMIcW5W3XxyqBk+/0U/X4xARzpdmOgKiYteEWCQtF2YkQJ
         uFfaARRrAwDeVWK1QyemWAZRWZ1lnFwM15sEOA/iSrIlTv9PwrEV3lE4yascLxBGeJ5N
         HmJkIBgTMtUTrmoGdXJ8nECM21ef2t9AOxTgLDzH8MZ1sKxFJOaakJDKWhCG8klBlmmL
         6BaA==
X-Gm-Message-State: AJIora+/E4TKLvF/VzgNXIQ/DmafcpKqOCmG0kebSMiKkYYmCV2HIoED
	VjoBzBC+V8dKiGhlhk6I+6o7qw==
X-Google-Smtp-Source: AGRyM1stiNr9XxY7shzNBKP/VCaCIMAwTIP0hycBVdc1xeWChrSE7+wxJE89IzvAPFFn0NgG8+F1ug==
X-Received: by 2002:a19:6459:0:b0:48a:7139:9ed1 with SMTP id b25-20020a196459000000b0048a71399ed1mr8254096lfj.485.1658917823066;
        Wed, 27 Jul 2022 03:30:23 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id z20-20020a195e54000000b00489c5e840d4sm3705919lfi.227.2022.07.27.03.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 03:30:22 -0700 (PDT)
Message-ID: <3ebd6dad-038d-eb96-3fed-8735de0cee2e@linaro.org>
Date: Wed, 27 Jul 2022 12:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: add support for MediaTek
 mt8188
Content-Language: en-US
To: Hui Liu <hui.liu@mediatek.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
 sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220727102140.6676-1-hui.liu@mediatek.com>
 <20220727102140.6676-2-hui.liu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220727102140.6676-2-hui.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_033024_774473_B137D1DF 
X-CRM114-Status: GOOD (  13.64  )
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

On 27/07/2022 12:21, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add pinctrl function header file and binding document for mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8188-pinctrl.yaml      |  238 +++
>  .../pinctrl/mediatek,mt8188-pinfunc.h         | 1280 +++++++++++++++++
>  2 files changed, 1518 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
> new file mode 100644
> index 000000000000..a9d5e9eec35d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
> @@ -0,0 +1,238 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8188.yaml#

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).


Best regards,
Krzysztof

