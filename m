Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49025C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 20:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNSqlgSKGtUFTFR78Kr37qdXCj0wDv0um9PT07unkQM=; b=sEMWyHf3n6nJmTgeW5jNMcUYAP
	Z3BUfjSXvRLeC9lAWJqMGbHTXZG6irQngy/HyrZsI4S1guUd7DTj7jHoRwiLqQj6VkqmRV+EHP08L
	ewoqwh8xCWD1oDMVvfyllODJ8eHFdYCvMUZ5IF4QEkiLpIoRf7408GwN5Vip6UbQQviYEO631ViB4
	vhJjD1f4HrjyyYrk8b/fteO4yK3P9J9mS70S8A6wMxUkMDyHrtJE3zRfGS21oo0JzKMOWhrjP4ir5
	LUTWrYc4OXt0uJwfRpkDTRXhUVS0ecV0LXBdfrkrr9BXBA4G4VSC3ogRApJwARjBimnajPMgkJV0P
	hXZJN6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogXDQ-004x6f-88; Thu, 06 Oct 2022 20:11:32 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogXDO-004x52-1S; Thu, 06 Oct 2022 20:11:31 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1322fa1cf6fso3465482fac.6;
        Thu, 06 Oct 2022 13:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNSqlgSKGtUFTFR78Kr37qdXCj0wDv0um9PT07unkQM=;
        b=e5VdIo0FeM9Gvxe2HI8PNV/Uql1zY4FG1/C71sMhOxl3S/tYgB+1Ppgn/HTV1d0RLp
         jlOv6ZkcSP7eb8pJ7uREpU5OaHYEcB6f91vFS7xl0fA3FvhD0Dk7ljfG+MgZAXupF7sz
         12Zb9slu5udx/QOpVNM8A6GPAcBTZRUhnP5lC3mC4c9IW5uFCP3l5sCH9BqV29SmnB23
         L8/Kq6O9NOuLxo+xKIln7U/S1351V2yz32/pikCIQ+/pV7APXBTk7RZLDt9AwmrCQX+F
         Zk9v3XXorDL0g1JIzDsvw4P8omagrKUYzDUWyojhGXueg8ieRQMDqpv5lPuZwkHJmuHL
         3naQ==
X-Gm-Message-State: ACrzQf3ruHX5NiSwrDRE3DBFlKGmiEuyPM9HbCMiE2Up6aEqmhG/fFQD
	oKrVC/dWwTaLMzSl1qbrwA==
X-Google-Smtp-Source: AMsMyM46fj19/QYMi6Z4y1YQn+olg8t5MJzGfn9ZPfJCaPFaGfEP9xbFVt7S9jLwI8IQ9n3BxHsjXg==
X-Received: by 2002:a05:6870:d204:b0:132:7810:d2a8 with SMTP id g4-20020a056870d20400b001327810d2a8mr836970oac.26.1665087088861;
        Thu, 06 Oct 2022 13:11:28 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id i14-20020a056870c1ce00b0013255d14610sm320225oad.16.2022.10.06.13.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 13:11:28 -0700 (PDT)
Received: (nullmailer pid 92463 invoked by uid 1000);
	Thu, 06 Oct 2022 20:11:26 -0000
Date: Thu, 6 Oct 2022 15:11:26 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, nfraprado@collabora.com, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 5/8] dt-bindings: watchdog: mediatek: Convert mtk-wdt to
 json-schema
Message-ID: <166508708200.92361.1398358660025530702.robh@kernel.org>
References: <20221006120715.24815-1-allen-kh.cheng@mediatek.com>
 <20221006120715.24815-6-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221006120715.24815-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_131130_100493_54FA3094 
X-CRM114-Status: GOOD (  13.17  )
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

On Thu, 06 Oct 2022 20:07:12 +0800, Allen-KH Cheng wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Convert the MediaTek watchdog bindings to schema.
> 
> The original binding only had 4 without a fallback but there is a reset
> controller on the "mediatek,mt7986-wdt", "mediatek,mt8186-wdt" and
> "mediatek,mt8195-wdt". Since there is no reset controller for the mt6589,
> we remove "mediatek,mt6589-wdt" as a fallback.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Co-developed-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 78 +++++++++++++++++++
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 42 ----------
>  2 files changed, 78 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

