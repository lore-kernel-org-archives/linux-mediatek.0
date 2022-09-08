Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B03C6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5u6/MtXpxn1tTwAaduJUsG0IZt/fBpU15ZKPc1fiE2o=; b=Pk/njT4qLfoxiM1n/3eb/CSCGV
	7WZXfAL/ihsTV1D+Zpy5HNVWg7ZHYi3ygYBBBscXktb82Cpei7/eS4icVfToe6sHAXr5Wad/eBktC
	zQJRFfV+vXaw9/gGdjtvX97TkveMPwGTE8yQP6p4asn2bx2vcGL+HMHBL4EDOCUZE1wHeoT4FBACS
	5FkvHi7sFiipCg0M1SJVd42V+uXFCG1rTLlKg79WBScrBesfCi90l9hNfh29mPyC43ExzUS8BLUFN
	QDnazNJASMaVhIIEZCwAC4XgOArXjlk+onJly/JehmCHBuv6Km3i3FvSpi5jrbEO5Fu3JtD3Js0Eq
	ieIOh6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHFR-003Zd4-P9; Thu, 08 Sep 2022 13:07:14 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHFM-003ZUV-RV
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 13:07:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id m15so7935851lfl.9
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Sep 2022 06:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5u6/MtXpxn1tTwAaduJUsG0IZt/fBpU15ZKPc1fiE2o=;
        b=ehPfB6s0nVoR+tfYmVzHTZew8S0nkhf/njyDNfgALVDMbGOdgHuGGmQui0Pd7WnIsF
         I3JDjrelF0pvS8dBTeBTtCZc8FneI1LHcuAFJCg8RicNTf6nRpUjcfWcM0AR0EpgScdJ
         yvtWWmj6+anIcTY/ll1vMJZV+kHOAn+Bso7lm/mzGAZKtTDAdHRmZzAglSa9AOo/5Lgv
         ftsdKfEsM8lFNMy8ljTbmhzHftdY9nEWVi0dkpR1/FoN2XMM3756dODbS4srP5aCoeko
         JN0omm9q5QGOZhll2wwXkOHiCqv66gb6+/Ad+QJz5I62NEGPizwF0b+PJmcqGwlIHj4I
         JExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5u6/MtXpxn1tTwAaduJUsG0IZt/fBpU15ZKPc1fiE2o=;
        b=e3eZIymaENYI5Pq5v9/CXH1qf6lTStkxnujj6zpvekSWfgyxriPiIgJ3/x2ZUGOCWa
         LZF79zEmB+WMxqmQBBylAX9PoTvTLviGYvJAS3T1h6BUv9jCFuouHrgCYco0jP3kNxIJ
         x5cqOD5Uw8mgt9rM7C+hRDVI3oJFKBqXhmTe2kDnKekVPf/HBFpoZYK5ypQkJewROXga
         EQm9i6ODXsVH4Zpm296765yh5kQFLBHPFAWvYtUmIY0L7iBF1tLeSn0kgfftBVYUlxBt
         yzHtwbQdMgxrqDpVAA4nHx2wh6MSv2Is92sIdh5W6aMT9Dcdz58B1SIe3wRh/yCnTpnN
         /cqA==
X-Gm-Message-State: ACgBeo2Oxa+Fe4K/5AyO54w4lPTIEEjmxlrHAzmFNuOdwaH6vcn8jYeS
	sgBOftG5euZuuF1H0hPARKqcog==
X-Google-Smtp-Source: AA6agR6wXnCQ6Vkqjjc03U6QxWxuJlZ7Fdfx0r4tDx4eRfk3Kfg7iqmZkdEZRBaoTN09hgyUFzPdFQ==
X-Received: by 2002:a05:6512:10d0:b0:494:7811:e673 with SMTP id k16-20020a05651210d000b004947811e673mr2559502lfg.400.1662642426042;
        Thu, 08 Sep 2022 06:07:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a25-20020a196619000000b00497cb9f95a0sm319728lfc.51.2022.09.08.06.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:07:05 -0700 (PDT)
Message-ID: <603072dc-3595-ed54-53de-e88a0579d78f@linaro.org>
Date: Thu, 8 Sep 2022 15:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/6] dt-bindings: mediatek: modify VDOSYS0 mmsys device
 tree Documentations for MT8188
Content-Language: en-US
To: "nathan.lu" <nathan.lu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com,
 lancelot.wu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
 <20220906084449.20124-3-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-3-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_060708_922556_CA5A5901 
X-CRM114-Status: UNSURE (   7.37  )
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

On 06/09/2022 10:44, nathan.lu wrote:
> From: Nathan Lu <nathan.lu@mediatek.com>
> 
> modify VDOSYS0 mmsys device tree Documentations for MT8188.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

