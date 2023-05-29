Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BE8C7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AYQ9n22p6kGQgSL+k6B4EzgHqUeQB6SOyA61hXG0lI=; b=GRAkQIAsi4PGKg4+KxCth3kxiR
	dIOOY5hfW2E5rWt4NmgorY9DQflw5Xcvwjfd9dp2DSpT1kdLMgQuX9WpFZIEw+Rsq/aEoxlEUrKac
	+ZXBqrbwR2M9cdqxenUYkwhtthweViodRzav9zNKs/sc/uY3K2B9QcdILDT/8vzEjiLxwt8BJisrS
	pzH3x4luzSfwNlpcpbBkFKUDOG3455WnxVPme8NGyrbuqZuhsAn58rDZh9edleGNbuk1no26xurb9
	sbysN5/OgGFnJa1c69vkSJmbLrOHDU2dsqGlYhlvJVvaxOGntvokyBvZRe83JY1jiV2t9Y637N2N0
	z1doXL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dCQ-00Adpz-1G;
	Mon, 29 May 2023 13:46:14 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dCN-00AdoS-1B;
	Mon, 29 May 2023 13:46:12 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-30ad99fa586so3016917f8f.2;
        Mon, 29 May 2023 06:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685367966; x=1687959966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AYQ9n22p6kGQgSL+k6B4EzgHqUeQB6SOyA61hXG0lI=;
        b=V/EeDWSgw/h4RDwCInZqp6hv1Kes/5qnN6lCMscvMfcHgYuQcvVCY1OjROwifMtTvU
         SkSMGpaYs576Qsp0BygcfUKwGyLxsAwTjgalEUJhPqkAg2jOKxe+07HQdY9PMGUAJif/
         GwyltWytfgoPGflsfCgk/4vRftg6kfjHT+jo/U6y3SZcIQ1KNejzonH/nHYaRX8yv9qu
         mzwTU6fsTAMq+kgDmzchOIXA6ZPHpSCTrhKTzmyBMfCeV2zzYU5i/euWeUwJroWse0yk
         q6LpkvLjPNnGdv7ZHm4Kgn+nCY77dotOVgnZ5V6V/6q5NQkJAYRUBQ/N/Q2iEv05k7Z5
         B7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685367966; x=1687959966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AYQ9n22p6kGQgSL+k6B4EzgHqUeQB6SOyA61hXG0lI=;
        b=fmVZpM9A7GK97yTm58zU4mMJBLjU+fkDnvc286STEEfQ88pZ2TifsvRFOsN8t6ShTF
         rbOrQl36KhZjDh/wQxVIn0LgJQDZeAAdwwWejavcjdgxY8pgUPRpmL5lzhbcD1/BnBdc
         SvllAEami46aA+FMPf/6Y9wo+BQgHsOuewoxRk3Oo9pYawCPl1Q3SMv6kAaNFxfaFtwp
         DdyDvu5wKJZd84LtanUTpO/qe1Zq3Jv689F9/J0SPerLFjZMrMpgDy8IdotUQx/QNdRv
         5yr4aTcMMDjMjuXh62KAU6CJJ797+Xw+DLfTjghWW1PSzabzHCHOUhk/6Oj1M2gtu3ML
         4o0w==
X-Gm-Message-State: AC+VfDyCnKcNhuoFAIbwgZ+A8v+l64yTRfke8tfIETwEqCEUkwqXhv3F
	thj20JOqw8g7mHi9oiNeWoc=
X-Google-Smtp-Source: ACHHUZ4DCP3yYPiV76uVb9gUCr0GOWhiUQLj+dUIEsUz95VI9sBskAqjc9u+6S35gzmLJKY8NS/DOg==
X-Received: by 2002:adf:e941:0:b0:309:53ba:9703 with SMTP id m1-20020adfe941000000b0030953ba9703mr8503887wrn.16.1685367966245;
        Mon, 29 May 2023 06:46:06 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u5-20020adff885000000b0030ae16132besm41563wrp.12.2023.05.29.06.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:46:05 -0700 (PDT)
Message-ID: <ec70aecd-3229-ee5f-1375-1a116a1f6213@gmail.com>
Date: Mon, 29 May 2023 15:46:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 0/6] Add and update some driver nodes for MT8186 SoC
Content-Language: en-US, ca-ES, es-ES
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org
References: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230324021258.15863-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_064611_400365_38BFFF53 
X-CRM114-Status: GOOD (  15.09  )
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



On 24/03/2023 03:12, Allen-KH Cheng wrote:
> This series is based on linux for-next.
> 
> Changes since v4:
>   - compress the compatible strings for display nodes
> 
> Changes since v3:
>   - Add index for ovl in aliases
> 
> Changes since v2:
>   - Remove some unnecessary linebreaks for some nodes
>   - Use one line for some properties
>   - Drop "Fix the fallback for mediatek, mt8186-disp-ccorr" patch
>     (since this is applied in chunkuang.hu/linux.git/log/?h=mediatek-drm-next)
>   - Separate GCE into another patch
>   - Drop some patches which are appied in matthias github
> 
> Changes since v1:
>   - Remove the unnecessary trailing number
>   - Add aliases for ovl* and rdma*
> 
> Allen-KH Cheng (6):
>    arm64: dts: mediatek: mt8186: Add MTU3 nodes
>    dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as
>      fallback of mediatek,mt8186-spmi
>    arm64: dts: mediatek: mt8186: Add SPMI node
>    arm64: dts: mediatek: mt8186: Add ADSP node
>    arm64: dts: mediatek: mt8186: Add GCE node
>    arm64: dts: mediatek: mt8186: Add display nodes
> 
>   .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  11 +-
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 225 ++++++++++++++++++
>   2 files changed, 233 insertions(+), 3 deletions(-)
> 

Whole series applied, thanks!

