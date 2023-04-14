Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157B4C77B6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1720p3siIfGtX4Ig+Z8rM9FJYarwB+pzhTTSt4MACL8=; b=YDb1ilj2ccxlk1leG/9aPTWeEs
	IKMt4vcDjuKe1U9coSsGfVtMq0inosrjctp68my3OnjOD8gR22/oZ7BI/FVTBbnEk9gEnOqhK6nq5
	zB08Xh1JEOFHmWg2kXWZtCnragyqlN9SOHM/L7+LWT6ey+7aPrJZlD6A+BQoRgpkmxkTZMO6FMNut
	9prFaj/X71B58tv3+AFyVSLSHRpPEzjhzoKZWuOW1rkopyqKYfT/MTdcAQAe0VNcQAcCG57ArxZdY
	eFijUNooJ907b4XDIHdUuJsCvlil5r8Dcv0vjD95Zc7dXejzBtK4X6h7qK7HJVtMY8ATPtKaJMSGJ
	gGi7jztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnGia-0099j0-0F;
	Fri, 14 Apr 2023 10:31:48 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnGiV-0099eA-2Q
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 10:31:45 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-94cfe3db2aaso268312666b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681468300; x=1684060300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1720p3siIfGtX4Ig+Z8rM9FJYarwB+pzhTTSt4MACL8=;
        b=P4W8iZ2w1Gh7w85Jw+AojjPgK8APjJ7qSz1fTCyoPkCa8pfiyXaWxx90phdGQQOHuu
         bPac1TD/9gNZKaxRbz72Wunu/xHXHKFL4Cjd+Kbo52qxYaxOIcxUROS9Zy3LzFzKcr5I
         vrNiZB9B8jI3QK3Thuhu/5A0m1jUs5B6xfgGgfbTJB7LU72BfxDmi6sw0t1l9pGk3YQp
         jJ05crgXl9OPB3wfvTnJ0+FiJaAaNf5r2bwoioghBIUqWem/txWIR74BMuNN6nnS29eV
         FGQJ/+bVKmWcbBYbm982gzUtSJCvXphxxoWHiJskFaVd/XvHtsbTh68neo11aAgkcmFw
         tzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681468300; x=1684060300;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1720p3siIfGtX4Ig+Z8rM9FJYarwB+pzhTTSt4MACL8=;
        b=eV0ytMWaiVaKZray8lNRCwJdX2WnPSK8jIHrfjIGwsgGEKUVOQFH7pCJq37iPD0mjK
         C9pcA+Ydo2vP/eB3q89tpRyVz4O+oVKN6z0CxyZY/f0b75ke+TZXPELTk5X5i9Ladeg4
         9esAoe4p9G5tcy1w3NCQDhuAQGpb7UIKoTBFM+LqgSt5RJ7yZI9csqp0Nads+sTeby3j
         f+LZksYGQyQNcH1Yt+9PIKY81x5ov6vkzXs1V+4eg1rCup2kwBa0BeYs6OWA12PzlWd+
         yqWaD/aYxNkbujDI9iMnCRR/VzplB1Zc3nm4kD1b+Wy47sXVGrnsYe77jrOu0XM87ZYl
         9aXg==
X-Gm-Message-State: AAQBX9fpb6/SohKh4pgTasxYCHZJCeWwUlYntUlSvK7fLwU61xiujz5V
	Dq8lGv3jXpnEfyoyHQMsh+pMjg==
X-Google-Smtp-Source: AKy350ZIjMP6TMSw+k6xUakCFEXrjNxzNtDnPVbQjujlC0FIdzUT/htNABiisXWE6rAig7qQ68+/Ig==
X-Received: by 2002:aa7:d947:0:b0:501:cf67:97f3 with SMTP id l7-20020aa7d947000000b00501cf6797f3mr5612068eds.25.1681468299842;
        Fri, 14 Apr 2023 03:31:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:40b9:8c57:b112:651d? ([2a02:810d:15c0:828:40b9:8c57:b112:651d])
        by smtp.gmail.com with ESMTPSA id d25-20020a05640208d900b004fa99a22c3bsm1949428edz.61.2023.04.14.03.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 03:31:39 -0700 (PDT)
Message-ID: <eea67985-261f-6ce0-031e-2acf0e682375@linaro.org>
Date: Fri, 14 Apr 2023 12:31:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_033143_790519_D556D64C 
X-CRM114-Status: UNSURE (   7.34  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
> block: this is the same as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


