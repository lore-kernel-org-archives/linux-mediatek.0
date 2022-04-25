Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D26C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyClNF5qleDladg7Xm14etoEjms1inWwPjMnEEf0X8Q=; b=iNCZ0D4rp9uf3L
	mmiYbRc4syfsVud+2n0uGW4pdL+RQzpVo/rVY4sy3o7ZrDcwO5+/rh1Wtz2/VkOMCN0uPIr9mR82t
	pMK5H4SJI0jBf+3455RCofWRFMBFKWHQGwe/4LO169rSJmeYdhsuPu+YabqOsCntjnr5uVmw0tZVz
	fWzz2+O4mw9hZlCrR0xwDf73w36IPdIg6OMinqBmGc1Ufp1Ull9z8jfGeYJ4P/VvE7fjBBUD09iIs
	QHzWItPMZsYsavjcwtOrX+UsASrzGdtvjXzs5xj9srfdoaOll6LiHn/lsA2H5YFzxMWRNoTD/NESV
	+/EozmkqeYGkBSfM223w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niuFY-008ljN-5I; Mon, 25 Apr 2022 08:39:16 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niuFK-008lhB-F5
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 08:39:06 +0000
Received: by mail-ej1-x62e.google.com with SMTP id w16so6918044ejb.13
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 01:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QbEF4qFNLXRA2Mh5ymqohDq27cRk1ERbjnuwvIvXpNs=;
 b=lhdEJ0nXJSseOKcda97U9Uiz8QjsEbGs05TmptJGOMSMUP42qs6k4aNVh9PSN+UMFt
 BgIED4Cgslr1dGcWfGFHbVYeazmmr7WtgubdyZIacyE3PfKrVtPZcwXV1NXS1KyQzWU4
 SLnCACbci/qtEScO3E/jJVaIlXUw/FWrYDdN2gTyMWgUhzC3vZXaTl5m4d5HLcT56gG/
 eV2TPKpZbhljCQC3kj56j7DPjvFtXKlaGdeeUILFGekDM1dM2HAhHy4CQ+RCorBN2o6b
 1ArWiJ3rYfKIvr15UMZ+91v0kFVGOSOlD6ZQvJ5E3dGwfsiuUPlNCy++nu1luqpgLbKm
 CrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QbEF4qFNLXRA2Mh5ymqohDq27cRk1ERbjnuwvIvXpNs=;
 b=XU2suh5rTXGuAjX3LDSn4AUwMV4A/eafstRB4EP5SVPq8JXDs/A8iMIFLjilWRIsar
 H073TTj2JpLxg5s2ZTvxYMgbFnxg8V1NjVUPnJ+GtsCBH+y3xfAYWreqJmtRAjwRojRw
 yUMJFyvvJslIK6QzKWUO4ZslU00gGgcMmz44fO0Kuz26Ti4fqidKQCKrt7Sz8fBIgXrf
 WuBFbgDMDtfnyC5/7GuM2qJnvHhpTr+Q4sQYsqpa8VKUv9CkkWDVvs4KhTeIA2MGWrzr
 iSgj4IjM7bnOIiLY0lC4VMZ5eBmdmNHrJX3QcwRikddd4VEq08E3idfEdeJJZXk0G2eA
 UuZA==
X-Gm-Message-State: AOAM531R3B0bS1LlINQGViP2Jh4oACOb0OVS+c7gm0QaIKiXTyDr32fz
 xdahpsbkq3ysBJ3fw+SFhR6I0Q==
X-Google-Smtp-Source: ABdhPJyZ9/gVVCkh1Yxdughre/E3F2MUxbOp3vw5ku2ymXTYYMfeLNv9mb2IJMEjnjZGSRPYhdrmYg==
X-Received: by 2002:a17:906:7c5:b0:6e8:7c6f:4f49 with SMTP id
 m5-20020a17090607c500b006e87c6f4f49mr15325007ejc.378.1650875938808; 
 Mon, 25 Apr 2022 01:38:58 -0700 (PDT)
Received: from [192.168.0.240] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 z16-20020a05640235d000b004258d76a908sm4301359edc.54.2022.04.25.01.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 01:38:58 -0700 (PDT)
Message-ID: <316737f4-2581-0bad-37da-9bddbb415231@linaro.org>
Date: Mon, 25 Apr 2022 10:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: mediatek: topckgen: Convert to
 DT schema
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220424084647.76577-1-y.oudjana@protonmail.com>
 <20220424084647.76577-2-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220424084647.76577-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_013902_532543_175B401A 
X-CRM114-Status: UNSURE (   9.13  )
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

On 24/04/2022 10:46, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Convert topckgen bindings to DT schema format. MT2701, MT7623 and
> MT7629 device trees currently have the syscon compatible without
> it being mentioned in the old DT bindings file which introduces
> dtbs_check errors when converting to DT schema as-is, so
> mediatek,mt2701-topckgen and mediatek,mt7629-topckgen are placed
> in the last items list with the syscon compatible, and syscon is
> added to the mediatek,mt7623-topckgen list.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
