Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FA3C6FA82
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 08:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUICUybu6k0R4UQZStovjdZZu8+1QmB1D6rhkDrri7s=; b=in7uBMKivloNKCEhSTOuQV6hgq
	2JLWmOsal+TkyEAjIE18moWk8XGtU6IWThrEX2ZaviPJp3aZZ1gNQONqjvZ4ju/r01grHwhTA7442
	/SS9O5joOhi56iPUnlyyD232jnHYeJpl4KkXPhYGh1OSJOfpKW0KRL9C/26Knp09q5HpWIjRyDQXC
	Uwk39V2DeivoPHDuExbRrhzPpDsDzSupK06dOYQcBfOkFMNUOOUSmsYbrvyEgam2E4lZ+bkQagd2j
	Z5eQGbazwSWl8D8TPLxweMBdF67M2CxMzMfQ35Wu+R5CW2JZPUQBh80K3WcYKbERTYJ9yNwq2z0YO
	8qYACXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odS9k-00EnQU-1P; Wed, 28 Sep 2022 08:11:00 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odS9X-00EnJZ-Gf
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 08:10:50 +0000
Received: by mail-lj1-x22d.google.com with SMTP id t16so9468656ljh.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Sep 2022 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=rUICUybu6k0R4UQZStovjdZZu8+1QmB1D6rhkDrri7s=;
        b=zcU6Zt06NfSw6rtHpF/0WoRvYMzJGGOGsQ4PtB8bWas8oYS5jS1kApvxWqN4DZbRNv
         fR5rRyUGz5C2pQHyt2eWNrUzy+XWWLbStre7c9kv1tveT1nUaZJZR8FWRKETK4S5hMEA
         RCoHummTvDbLsCSMmVFR2VvkOasUGWwVc5GbAane2C69s+SLWOuGn3K/Z1R8cMEkQ5vB
         GoTrUJrk3XOEA++b7AlZhvnC5mggUa2okKs5TagDlZQ08FRxBMG5TwBGWljqKchuTcPt
         xjNXMwZE5CIJj6h3jW3ZSk6PcRWyDezypPmF2SusxXPrdavZBqjkakaw/9bAr3C0PrSC
         RpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=rUICUybu6k0R4UQZStovjdZZu8+1QmB1D6rhkDrri7s=;
        b=xpkRSnHzkzY7gnjy4+2OcSbXUJsE7I62YOmgd4gXQ9e0UtGsnBsodMTgMRCVqYkbX8
         pZTlouvvjOKMNtD4C/OzfLdsjrj+yuDiaAOjJXoZ8W8Qfva/QDA6Nx3e29DIsCHIx2Xz
         sHHp8NL3V6ttavO37UZNk4oGAYkXjzUs37VaJhjhWlpkUV3JWpB18aSyKnQly39G1kt0
         lJviBrP8QMlsyKJIedikS3ktRlsTYkKxbek5Gp2B8wR9gn6sGyefV50vme47bHBiA2kH
         OpZN9SBBSTVeg5rVjopixWMmLj2693HClFKWlHA3He5IwPwUEMK+2Yyt25LDIXHIq5lG
         Xo6g==
X-Gm-Message-State: ACrzQf0uB80x8iiRG9p3zza16k4pCe+N0PmrQAH3nv9Qdnwk2IjI81Cc
	9VsLIDXS8bD5m5BT+1gkvJ7YSA==
X-Google-Smtp-Source: AMsMyM4GcksiN2jCplk/XJkNgZ4GAeUF9gbGq/34+da9ycl8TtmT37p61IniHzNnRv52dUw/ixEr/Q==
X-Received: by 2002:a2e:9c2:0:b0:26a:cbe5:21ae with SMTP id 185-20020a2e09c2000000b0026acbe521aemr11616443ljj.354.1664352643756;
        Wed, 28 Sep 2022 01:10:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s2-20020a05651c200200b0026c12b9b329sm370663ljo.70.2022.09.28.01.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:10:43 -0700 (PDT)
Message-ID: <b4b772c6-8dfe-bcba-8850-aac282f38aed@linaro.org>
Date: Wed, 28 Sep 2022 10:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-2-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927152704.12018-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_011047_630606_E4A0A4EB 
X-CRM114-Status: GOOD (  11.77  )
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

On 27/09/2022 17:26, Jason-JH.Lin wrote:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


