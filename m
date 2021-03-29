Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE10C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:22:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED96561934
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED96561934
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lifPPdq4PUMAQdnzsm4sCLasDaIt5hjjBMrahq1k4as=; b=FAlRFQ/NzRvKbtKc77qvyCYdA
	uHpJp1RudPzGCjJaWR/TYaFNmALOefDK1xWMyY5EOVXmZzs7DXKf8QM01Meppjxov95Kuy4JYkfo5
	Ir4GJKUGJReV+RkgiN3UBqLVNO4jydxtDCu3eXnHbYckiJNY92GjT2jotpVy12oS1AFljqX/RWJQU
	gAEp7YqimuiQGPu1Pn5EAHKVtunhPvt5a0whWGvpvVx/HZzBQNfHRIPyDA2JEk96n5rcG7D0LNwJ/
	uUDUDVaqwGV700deezvv3yKLmSma7rTagJ/nmreZDyKitfYZ3zQJJI4ej0iy4C6/FLvKsvWCDgFj9
	6IAHVhniA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxSR-001ELn-5Q; Mon, 29 Mar 2021 19:21:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqMX-000ctO-Cg; Mon, 29 Mar 2021 11:47:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 a132-20020a1c668a0000b029010f141fe7c2so8397099wmc.0; 
 Mon, 29 Mar 2021 04:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/+Lj/2HaePE9ZbmLrkf0oDmdmPYd6wO1doOsEpNfmzk=;
 b=PZgKOycvkhuVEF8tOTQP+bdoe4R1L0KUCVi9bDR1Ync5LAYraWl+5ilxmPkKZOltou
 kp14FSZmOi9km59EwQmlxrbWiIj14qKW1Br4KzbWlT6KKbxrkTruUOqA3ljgxwbShptE
 pdlE12Cqk4j4yf+jtK0P2v2gMHY+bDD+O2cpYPTg4C7lpxqk0QlPKUDKS0vNiXqlTZpN
 oZBoo9qEI6zU/Gfpophy1pProg00WYcjFOfUSsIBHp8fd6YfzFOzX1aPt8DL8SWa2esL
 4Mif7iz7yHeb4ZIFBWdfLCN3DrPlV4zQObYTiE+BFexnmIkP6C0YNIMBXDEOv7yYp7T3
 1L8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/+Lj/2HaePE9ZbmLrkf0oDmdmPYd6wO1doOsEpNfmzk=;
 b=cd/c0JTuPA7DQQLrpxdWeNgrFPGhkqFM/QKBtHJ5gkYx7oKHkaszsFvVNhUcrgKJpR
 B0f+kLYNlb0+tOYrzJZnpVKlZCyqdEzBG6EeMuAfuToflmlc/QMFFWjY7/zKdQB355pH
 CufPzYWqRkpOak++EZmHTlHxGmd/JaTMZ2VskmyZRmmBCIbasbeFPixSaLAyKxQC7GsJ
 P4M0rDxKRlHpV8di8WeZY0oEOVY11u/zCzF0sfpap7OJxFDdhHRQ5oYkNslrCFb5I6EN
 UOLBBywJdc9uFovCAT6cVV21edBZf928ffBAil3r5eLaZ1HkqUfO9VnnejXqX3Eoqlxb
 7f6w==
X-Gm-Message-State: AOAM530Gi+oRrOc9pL9o09uJ6FcTCh4wlSpIJwuIaUbDBFcCG5HuLtzD
 8PvmNzaoM2t+fjDysmNIvT0=
X-Google-Smtp-Source: ABdhPJzE5G8N/olo2jafAg3eQ871kyiQXpS6UKbqstv3IT1K7rSSv/tb4wT1nCl68AXIzS5QCdcyjA==
X-Received: by 2002:a1c:7714:: with SMTP id t20mr24202271wmi.107.1617018436804; 
 Mon, 29 Mar 2021 04:47:16 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id 1sm25030535wmj.2.2021.03.29.04.47.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 04:47:16 -0700 (PDT)
Subject: Re: [PATCH v4 1/4] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-damu
To: Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
References: <20210319035245.2751911-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <16cc2611-c2d3-e283-2f40-a424b2067f72@gmail.com>
Date: Mon, 29 Mar 2021 13:47:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319035245.2751911-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_124717_557261_6964ED59 
X-CRM114-Status: GOOD (  15.28  )
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



On 19/03/2021 04:52, Hsin-Yi Wang wrote:
> mt8183-kukui-jacuzzi-damu board also known as ASUS Chromebook Flip CM3,
> using mediatek mt8183 SoC.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Whole series applied to v5.12-next/dts64

Thanks

> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 93b3bdf6eaeb..a86716cdd408 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -125,6 +125,10 @@ properties:
>                - google,krane-sku176
>            - const: google,krane
>            - const: mediatek,mt8183
> +      - description: Google Damu (ASUS Chromebook Flip CM3)
> +        items:
> +          - const: google,damu
> +          - const: mediatek,mt8183
>  
>  additionalProperties: true
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
