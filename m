Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DEEC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B55O9gA7vaYXICMr9SJHzaOtnTvtSD1xBb+aJX6NQzQ=; b=JZ7oKabBGGVhC32peqjqsK5f50
	hhTEkrSolp748+ZpuhnPYJbWo9MDk0UCKWsSX6ehU5tU/vy03ZdSQFACu6HVuWk2Veu9F3OBw9BYW
	pI0/fUsMjggIkPY+sagAm2/nxZEqUTDZM5An/EUtwQYBSxHNre+SVQ3uXKhfL5ehiQZdc71LpSTw2
	Q3EjDeULm4K8mPA9FBEmhT8GakKMJUAxkwx9tYZP8xgHR5JANowb/RxBDFJHBugWpv9zzRWgSzM6y
	nyE0a8GV+pjIwhhnMU9edfsKDX6hA7aZ9CGewf3GrRtKgi6pxjrM9QRyoc5evKToOjnuRCFa8/W11
	skadj5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhba-001nDB-2k;
	Tue, 04 Apr 2023 14:25:50 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhbY-001nAK-2L;
	Tue, 04 Apr 2023 14:25:49 +0000
Received: by mail-ot1-f51.google.com with SMTP id k14-20020a9d700e000000b0069faa923e7eso17398008otj.10;
        Tue, 04 Apr 2023 07:25:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B55O9gA7vaYXICMr9SJHzaOtnTvtSD1xBb+aJX6NQzQ=;
        b=fkbGx6CDGCwH2gZJicYFwc0WHgRYHSrDuP0i7u6o6yskZ/RYfkufpJlxmiRLRdw6cN
         qv8ZhKAVOAclb7X6e2WeEmw2c+RUGDqZwIBqbwjq6KkqWK3qJEcrF86whaIioqP27YQg
         c+YK2EstnpWQXul+0ewxksi7eoXmn7ckFq9Dr0O4OgsLUM6OvMta54SQbmn7QnA5zgpq
         k90lNHS7fxEXvUI2KV0Prflp5nP0EQ1s12RSaMS41qWMEa3Ym1hI3/PlyHHeDMIzvJnP
         DuRZeTkCNNn0Vk1SP/TnrEdQtuwfOL5WlDR0eyg8RhexsI3KZWSAxlaRo3VrzRJL7MXu
         fJDg==
X-Gm-Message-State: AAQBX9fhDfh+YGPv/dSBwhSC3kE27oM8GXgNljpF9ZrfLzgbSiIaZWGr
	9VKmBFONqEalV5r9DJfglA==
X-Google-Smtp-Source: AKy350aZivBXjglElKTyJb4uxCvPHgWk/4MGuiIWmBx3WlxovCOJEP8w5cZ+FIpZE/XjbsfiLya7GQ==
X-Received: by 2002:a9d:6b94:0:b0:69f:ac87:f872 with SMTP id b20-20020a9d6b94000000b0069fac87f872mr1509169otq.13.1680618346680;
        Tue, 04 Apr 2023 07:25:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e14-20020a9d6e0e000000b0069f951899e1sm5610888otr.24.2023.04.04.07.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:25:46 -0700 (PDT)
Received: (nullmailer pid 3834119 invoked by uid 1000);
	Tue, 04 Apr 2023 14:25:45 -0000
Date: Tue, 4 Apr 2023 09:25:45 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 3/3] dt-bindings: usb: ti,keystone-dwc3: drop
 assigned-clocks
Message-ID: <168061834511.3834080.16768361106806766398.robh@kernel.org>
References: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
 <20230403191850.374839-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403191850.374839-3-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_072548_765278_2C2CBE26 
X-CRM114-Status: GOOD (  10.67  )
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


On Mon, 03 Apr 2023 21:18:50 +0200, Krzysztof Kozlowski wrote:
> The meta schema from DT schema already defines assigned-clocks, so there
> is no need for device schema to mention it at all.  There are also no
> benefits of having it here.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/usb/ti,keystone-dwc3.yaml         | 8 --------
>  1 file changed, 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


