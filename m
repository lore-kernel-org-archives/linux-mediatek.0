Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B260C6FA8A
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 13:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOAXxPoSqwbSOG0ofk9DT91+7QBHKnohIB4quLfJkAk=; b=NgeKInqgr5AOpfugn2uimdxnTv
	8Pe6abJsvNOPSAECuDz0MfUrSnbPExTxqfSm60NXqoPK3GFfpCVPzJSU227xFRYXJL6WlrmNYBpYi
	dJBTS+mqToNw1zla2Aj2EyGoS0cXxfvB8ntZYz3Uq0EP3i3LGwoFkCm81WDmWsNmx8DyxS26bp0pe
	TpteSb/mBKoBw3C7MYHOQrbAd0qmfZSnISqrHpkN3/AiuRgzJx6iZQgRr8C7Fe1JCFGot9ux0FQav
	Rp0pGjPCC3bRN6AWABb5uU4Du1CZyEdjX6BTFlMV7WUpYmhxTwpQcBqMkZMvLcLyVn4oOmqwGVWjG
	0+d8/HWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHFL-003ZY4-Rq; Thu, 08 Sep 2022 13:07:07 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWHFA-003ZNJ-Io
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 13:07:01 +0000
Received: by mail-lf1-x134.google.com with SMTP id w8so27558168lft.12
        for <linux-mediatek@lists.infradead.org>; Thu, 08 Sep 2022 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=gOAXxPoSqwbSOG0ofk9DT91+7QBHKnohIB4quLfJkAk=;
        b=i+RfaVmr6TwYbrjKu2rs37bY30XQzhyA7yLm4s9A22Uu+/HQYoKfOy5Q03iILzxn65
         6NjhMKI92f/OlDQunY7TBeXo9SKKxkIw89N/07527phtr5Bp1ly67fDqatRR5S9spGBN
         mdYeT6DfN5K1a+fvCDD+94yXS/UAH2WXTnxZ17VjF6pW7Akk0qHnlLc+QKVHKiMFcrpP
         cPkFIMjqdfzWFGWn0ymj4wGf5NIFAvG+Z2078mv7kYKNBZtPQ9rAz86zbmlHA8F0U7Uz
         sb8k649vh0kUt6smBTqEHiugCuLgC4ZnJcji4aaAL/hQBUkyYZQv6DD7FWW4YpSYMHeJ
         mbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gOAXxPoSqwbSOG0ofk9DT91+7QBHKnohIB4quLfJkAk=;
        b=XKwxmK4MO8HAV57cuVBUljqluVRUxF5O8GHCyADzDKgdOhkNBiPnSgIm9Dd6N5AdDT
         CuxKSvPr+03kf1jVKCF8ubf5EVHX4efjim5xixGsNbpF+LeCcwmxkM+1xTlkI15YTGv9
         xJ+UCGEYcHPIywIOpkW/p30jJwdC0UhouSTHNKxQm2vdNw3eU7Wq9pS0roIp17BsMOFp
         Ja+h3u02PYlr0I5cMNzHSRwG4WPbwcU/qH87rtM6+J8MjotSwazQ08TP2tqYbobgWVdu
         0l2OCOuwMjPqDrhuwJj0ZUx2ijjWcul+/wrSysJxECio+24/LBq5yGqVUNDcQgUgXOIQ
         1LSw==
X-Gm-Message-State: ACgBeo2LAYLg069MRw+c/etjXxN4Wo2rUQQ15Urwe8NN3GEgww9DK6iD
	M7KH7+ORjiL0buDNUMUaOW0NAQ==
X-Google-Smtp-Source: AA6agR7AH0qv7axgXMrX7mRX46ybs/CgAIoyHustwbaI5FQqFhUa2Ora0+qrERSUdxYriHwxcymxYg==
X-Received: by 2002:a05:6512:3f90:b0:48a:826d:f727 with SMTP id x16-20020a0565123f9000b0048a826df727mr2541872lfa.281.1662642412767;
        Thu, 08 Sep 2022 06:06:52 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v7-20020a2e9247000000b00264bb2351e8sm1623322ljg.7.2022.09.08.06.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:06:52 -0700 (PDT)
Message-ID: <cfa357f6-ac12-c391-b3a4-0175167dd358@linaro.org>
Date: Thu, 8 Sep 2022 15:06:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/6] dt-bindings: mediatek: modify VDOSYS0 display
 device tree Documentations for MT8188
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
 <20220906084449.20124-2-nathan.lu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906084449.20124-2-nathan.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_060656_698279_D86F6F3D 
X-CRM114-Status: UNSURE (   8.25  )
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
> modify VDOSYS0 display device tree Documentations for MT8188.
> 
> Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

