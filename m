Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1A9C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dwu2BBEoj83lpS1r4JEpS+Hk0CrDCwjPWdyJ+RX619Q=; b=CTaLGYU4t72B2EgHgwLDnGQYuC
	bSBiA4an/15g/59O8TKw6bh4hQgPzg1ywT23y+QUe29849gQgwB6nmPW5kXMKfns7N5i/Hwtqz816
	vjsxJ1I/6fvNwADj8IWv5J06kFXyy1M4BbE+a37bCTfsjp+zbUXWOmv+zju48W6RuCbePwJLT06ia
	fCtdtPehmjzfq8t92yLRZ5phg4mbLTzlWptimLeDPVycXPHOr03qeWTWur58/b6NopkjsLGKJB9ey
	/cD6VXPfi74rH425LfoIQDBYcMSfvp0OTCQe/4dwKhiAYNY46xTXznBjwAVLX/7ig0Zx6hMoggquM
	AAT5f7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDXH-008dar-Pz; Wed, 20 Jul 2022 17:30:59 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDXE-008dZN-Vv
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 17:30:58 +0000
Received: by mail-lf1-x132.google.com with SMTP id t1so31328612lft.8
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Dwu2BBEoj83lpS1r4JEpS+Hk0CrDCwjPWdyJ+RX619Q=;
        b=oYKI3U2GMEZIb5MUnj7eH4PFisbUGppSiFnnwksNQxqDoY4TfY57IpuwuuJGPK5cU+
         nM5c/h8JCEc1UX2T5D81mlXreJwA3KeuB4qwmmIyfvwUTTCC81FR3bjNiXB9s5gRKKMw
         oxjCtU4UZinS8ivcXmPCGiK99rHUO7QSU7HmkASt75ASN8UjVPqbCO/OAx1pbUg3Hkgb
         3u+fwtEKcZS/mughwSBv/mQm1ZGe2V7h3K0Ih9kgEgLoILx9XPyiHJCctn9wbee2GHM9
         Vl5fVQLE/cYvifMviioAlWLmFL6jNxsUC10FM01mPK+gVgpqZpIV5WRJauiDNT+VtBcH
         /FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Dwu2BBEoj83lpS1r4JEpS+Hk0CrDCwjPWdyJ+RX619Q=;
        b=mOPXpE9MfmgGREZpy5nTYsavGhaSeMnaEhSLHfrbzc+fK++uASnkVbmNfCDtuV7CUN
         cjApC8+Vejxpv5tXtFFWGUUPPjPuuMO+kHM6U2/DOb43HxlVms0rV4Xt/GVJRJZlsQDH
         Mm6eIMNZhmkpo18M6lGmc7Xa1cMyevsXVe2VbdMJXVUiVXZaVC3GUpalMIvy4F5sIrXI
         BSylsOR/+C17oIqWD6RqikbKiyxL+n9e3k1ZEu5JxpYPeb5FBJR/5KFL4xqlgZN/T6GX
         6EedjDwF69MRXBlT9JKNBCFyMP9OuCE9ZHGB1gtAdnMOk99Iu5/C0pCFYz7Ix73J2njE
         QVgg==
X-Gm-Message-State: AJIora+TkgQsTNiHXAnuECaIMgOxvzvyWoI+8BpvcR74oG3QBLzPkBRe
	uyyfR8TR5sQFwmP2Mz5uxA7chg==
X-Google-Smtp-Source: AGRyM1svWBEnGoxfLgU/6XFYVxOvNlxfpkdOiQlU7cmJ6EexAMbAtjNzrJyianqFjVG2WYo/svPhmQ==
X-Received: by 2002:a05:6512:2094:b0:48a:581:f2e6 with SMTP id t20-20020a056512209400b0048a0581f2e6mr21907111lfr.379.1658338255557;
        Wed, 20 Jul 2022 10:30:55 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id k1-20020a195601000000b0047f7b641951sm3919079lfb.272.2022.07.20.10.30.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:30:55 -0700 (PDT)
Message-ID: <bd22ee5e-7b51-9a5c-2108-664261c2028d@linaro.org>
Date: Wed, 20 Jul 2022 19:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/21] dt-bindings: iommu: mediatek: Increase max
 interrupt number
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220720123023.13500-1-tinghan.shen@mediatek.com>
 <20220720123023.13500-2-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720123023.13500-2-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_103057_057212_261B5637 
X-CRM114-Status: UNSURE (   7.07  )
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

On 20/07/2022 14:30, Tinghan Shen wrote:
> mt8195 infra iommu uses 5 interrupts.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

