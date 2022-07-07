Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6DCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 06:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZh+dn4czsVPREHl44O7IddFEHHwiTNYYgVX5E+3arg=; b=WkBC17AJtWH0YnFR1DQsvdIjV/
	NZyDvIEJBCkZJNzDlMlfdUW2WCcN7vFKr4Teik985FAL300Y9rP9MmRuyDpPB+n147Qdu3N9uHcjL
	ipBRhh7iRaDrdRIKI6fXmwlSWvDGrFPLlkXWScwZMI+/5km1BZbaufT34FZHMjPL1Vo+RJSnF6Dal
	FrhYuLanxVNlUgzJpd2ltJ6C1uOPIoqmWtZxHZQ6Ulgw2lkLcCH453u+ByGYBnFK7DOsgmtm/TTqa
	85K5v88w3CnuLI/FFILkTHuHVFpf6DwiTtlIuAaGegVwbZPq2U2gz8gb5YYJiBqcMXpv2MhPRFCGg
	O6pxE9zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9LHj-00EFCV-Ma; Thu, 07 Jul 2022 06:46:47 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9LHV-00EF8Q-QQ
	for linux-mediatek@lists.infradead.org; Thu, 07 Jul 2022 06:46:35 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s14so21096597ljs.3
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 23:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tZh+dn4czsVPREHl44O7IddFEHHwiTNYYgVX5E+3arg=;
        b=AfFd7vdcM7BrjURHfGmIIl3YmliD3VHhxWZ7Vw16prCL9B9sYswdVolgCUZWTF6isG
         +oH2PjLfB0Rr1/Yw9LAQR9Re4F060fLQatLnFByB6UX3i8CF+e7ZDTxVHkBbLfu5GAJJ
         oG/Vw9mhKeAHn93/xC1N+oTrVNBjJzmZrYkxBk6+TnNMjmhWzNJNUkWnzLmd1RDsoMGd
         pLFqonUey7BkmhkfSRXU/P6WinA9ngq8l0SXgdBazjDKmC38aeARDWcP1Qhg2NVOj6O5
         NoKNOQ+GH1U7XAlhjT8OHYHhYce/U3iAwlwgsRlc7+6pNysE8KyvjoYmZZtBDowV83+2
         YqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tZh+dn4czsVPREHl44O7IddFEHHwiTNYYgVX5E+3arg=;
        b=Z9C4k+SM9wlQgUxCXiPnI5T6IlwbTpc3/Sbxuy600fjLeX7X5YjYlMk+Lkeei9W94k
         MLsRDUs8VHSc1CPWgxGVg9dWQllKjmC3KxIvT1QGecIQj7sEPtvKQYdEjmswUWWgd11/
         cUStrNGexlepZGVf5aGbeDSxFcQhZJrCCbI+TmBU+miRs8nySI+bOIzDjGbuuCQC0qsZ
         gunz6kWpq52DRArvFRsOXkV6jE8tOXMBcoI0JThA6zGhD69xlGjZXI9ydSSydntA2BsN
         DHWmZ1fWnCxY6/tB4gxVAickl86LIWzB3lymlyJzrVvOo28cPdglJ+X+u0E9FpNpgvZK
         sclQ==
X-Gm-Message-State: AJIora/ihyR+HtdLENw+2EoNA23HhvnelY/op7hDQOapAC4CYIWqGH5a
	2ubCK1PiEblHZ/mObRMZywPjdQ==
X-Google-Smtp-Source: AGRyM1sxS3jj5vIVCBB7Th7q596D72VdSdvG01Z1E2modQbGL/e4QVMyP3GktInsrEdzy3hucwVkCQ==
X-Received: by 2002:a2e:6e0b:0:b0:25b:bf22:47a with SMTP id j11-20020a2e6e0b000000b0025bbf22047amr25834609ljc.524.1657176392137;
        Wed, 06 Jul 2022 23:46:32 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id o3-20020ac25e23000000b004889096bc6csm156151lfg.134.2022.07.06.23.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 23:46:31 -0700 (PDT)
Message-ID: <41e17a56-5cb0-8e90-c7ae-a7a56de986d0@linaro.org>
Date: Thu, 7 Jul 2022 08:46:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: mmc: Add compatible for MediaTek MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, ulf.hansson@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220707054710.1396-1-johnson.wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707054710.1396-1-johnson.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_234633_883940_CAE83F79 
X-CRM114-Status: GOOD (  12.50  )
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

On 07/07/2022 07:47, Johnson Wang wrote:
> This commit adds dt-binding documentation of mmc for MediaTek MT8188 SoC
> platform.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 2a2e9fa8c188..3fbf33ad4f7c 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -32,6 +32,9 @@ properties:
>        - items:
>            - const: mediatek,mt8186-mmc
>            - const: mediatek,mt8183-mmc
> +      - items:
> +          - const: mediatek,mt8188-mmc

You duplicate quite a lot. Use enum.

Best regards,
Krzysztof

