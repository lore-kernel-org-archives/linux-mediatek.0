Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437A7C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lLkHlGevvdceJH/z9Q2B9k1T4jkGrkPxzE4a49wxQs=; b=iTCNXuTUYlBKrIvq9ajVJjrz/T
	iobJlHjg6R7ozPs2yGW6NpPE1gvDBBi9hEUYfnBe/+GJ7zVhWlLnB6W0fpCfXise4qGibOmSQLOnH
	LOzB8XpY6TyYhGsi4G9UdhMMxnAPzkWDEoPHr7EbGTQeYD1E10NF/CBIc63DGlbLdojvrbq7WGbIi
	Gj1P6GbhrKlDJ8YK8JmefigVO8RS6yc4hXvwEzn8p+DXqjKxzQRLcbFvc02pLNBoM24CnKL5LHMJW
	y5bYtm92MEqeB165gL6HCAseEkf7aZdcRiPOxPONPYUF66qiQ9cHcKe/ADpEgnHkd3GI7yidn3l33
	blsuyU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6oZ-003ROL-9v; Mon, 25 Jul 2022 22:44:39 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG6oX-003RLe-3B; Mon, 25 Jul 2022 22:44:38 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-10bd4812c29so16589865fac.11;
        Mon, 25 Jul 2022 15:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5lLkHlGevvdceJH/z9Q2B9k1T4jkGrkPxzE4a49wxQs=;
        b=hDCnEmyW3mS7RmAr/Hoc9jllcnAcJYtUXXoLZADKqgfUUvrcqw0dkiBHNBzib41G4R
         1G0O42ygLtfVd4SQNtel+KVmrI/0zkFz+1d/Fp06rrAg68i+DfDAPnuYwUW8o9f9F+PG
         agb2ldRfNtsRlB9pM8vMCSHXUPPc5zE4Gl+MmurBJ1BX1Js62osTWApwI09qcIzQzosL
         1l2q/RystWchdeNA+r26pvU/TZEpgA2nwiiDXeLOGlCwHqzUA6/CSB3f0a6QDXlHNLmt
         0lxAvudZoTdmU3OqA5fg5MSAFBLdJwT2eRcGdZBQpHQCobBOLM0ucCwzYU2RaVTVKSUb
         Ynvw==
X-Gm-Message-State: AJIora+uE6LRtLia5C0l19bWrL4uxjP7ObLG+nMD5PWTQ3jJdMphC8re
	9kVYWcIff6ncLN2/ywaDcw==
X-Google-Smtp-Source: AGRyM1s+bJWxKUgB23p7xrO0B5oIPbMw4dLvQHY06IhlsMaYnDULkyq67k7ADy/FV4BlJQ4FLy7fug==
X-Received: by 2002:a05:6870:a90a:b0:10d:9e83:98a6 with SMTP id eq10-20020a056870a90a00b0010d9e8398a6mr10800351oab.228.1658789073924;
        Mon, 25 Jul 2022 15:44:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id bp6-20020a056808238600b0032f662af5d5sm5445081oib.1.2022.07.25.15.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 15:44:33 -0700 (PDT)
Received: (nullmailer pid 2885354 invoked by uid 1000);
	Mon, 25 Jul 2022 22:44:30 -0000
Date: Mon, 25 Jul 2022 16:44:30 -0600
From: Rob Herring <robh@kernel.org>
To: Runyang Chen <Runyang.Chen@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, nfraprado@collabora.com, Guenter Roeck <linux@roeck-us.net>, angelogioacchino.delregno@collabora.com, Wim Van Sebroeck <wim@linux-watchdog.org>, Runyang Chen <runyang.chen@mediatek.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [2/3] dt-bindings: reset: mt8188: add toprgu
 reset-controller header file
Message-ID: <20220725224430.GA2885292-robh@kernel.org>
References: <20220722072316.582-1-Runyang.Chen@mediatek.com>
 <20220722072316.582-3-Runyang.Chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722072316.582-3-Runyang.Chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_154437_155087_908B1B54 
X-CRM114-Status: GOOD (  10.58  )
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

On Fri, 22 Jul 2022 15:23:15 +0800, Runyang Chen wrote:
> From: Runyang Chen <runyang.chen@mediatek.com>
> 
> Add toprgu reset-controller header file for MT8188
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8188-resets.h | 36 +++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 include/dt-bindings/reset/mt8188-resets.h
> 

Acked-by: Rob Herring <robh@kernel.org>

