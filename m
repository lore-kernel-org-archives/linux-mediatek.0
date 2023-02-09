Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86060C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljNnToeTIL1TFk9BZIDWfKvJLhPyA6JgaKeGR7D+Uy8=; b=P+IgOys6S8IbDzXJMlMhU9zjxg
	EM4t6jeoV9j3Rq9InJSTeA4JIwG3MU7wLAzPzhe1TfvrJM4i3bIDX4rC+uldT165MIuPCqg+RCoaJ
	4CBI7wVfzHcjdrzhUT7nMdLXy3IQ+Vt5YwPEtEt5wN/Rry8UaPt2phX5pZJVvUdokSasRqwfvjOrB
	qMlgGHDm+DNYUovSNkjEwuVXk+MuD72KxoIVCMXn/OG7Lgsj3OkJ3eawKk/7dvjlkiTtXzDkHyqhw
	zln1dLRTyl7TMsqdTfYFOFRMAaOJO83zqGUGO9ExXtN8uJ/2472hfMaWqf5mB2P/6TkhAVT19Uo33
	E3IPO3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCGj-002ws5-TU; Thu, 09 Feb 2023 19:07:41 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCGZ-002woF-Hc; Thu, 09 Feb 2023 19:07:32 +0000
Received: by mail-oi1-f176.google.com with SMTP id bj22so2475803oib.11;
        Thu, 09 Feb 2023 11:07:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljNnToeTIL1TFk9BZIDWfKvJLhPyA6JgaKeGR7D+Uy8=;
        b=rJ95PHBRWHXHG4aut5ds4nSrK0yFSqcpNyvGOUVhHuXUECaVpv+AFY4+lV6CLaby8K
         7ol3bPklasPSr1v3Vkx5yYnqBKKipQ6WRd+FXLvMNYCuSDLX9dUmh5eDU+6p0Y0mDriW
         s1CPQMXx271ikHUYuS7TCL62oCMqAp3uetHN1TjJZaSv7Q5mnVRTfMlcI6l5BIoUWX20
         Vrix0+kjXDezdXDKq9xO02V82JVewbE09NMR/XZJLqQyNQHATbfT236EQBYHfE7ONlbF
         aNKw52bpM2GRfdA64mQdjEO1gAeWBaz1nJvBb84kNrPJ6HMILNEKCcAdyzcGFIe1KIwD
         Suyw==
X-Gm-Message-State: AO0yUKVaPLsCWCshd5vD321VVMzwY83P5Xy/UYJjmpI4auFlL48XmcZn
	t5sYKCDvpDnolWv4nlSAEg==
X-Google-Smtp-Source: AK7set9kNL5f2SUSoOcy3zcL5Ej8M7/ppJqU+XYT7yBpDlUf9vvh4vTus6vEzRSNOxkw8vmpoD8elw==
X-Received: by 2002:a05:6808:6292:b0:378:1e37:ff44 with SMTP id du18-20020a056808629200b003781e37ff44mr6380288oib.33.1675969649382;
        Thu, 09 Feb 2023 11:07:29 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m128-20020acabc86000000b0037880fdb1f6sm1200297oif.24.2023.02.09.11.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 11:07:28 -0800 (PST)
Received: (nullmailer pid 647682 invoked by uid 1000);
	Thu, 09 Feb 2023 19:07:27 -0000
Date: Thu, 9 Feb 2023 13:07:27 -0600
From: Rob Herring <robh@kernel.org>
To: bchihi@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org, khilman@baylibre.com, rdunlap@infradead.org, daniel.lezcano@linaro.org, devicetree@vger.kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, james.lo@mediatek.com, rex-bc.chen@mediatek.com, linux-pm@vger.kernel.org, rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, krzysztof.kozlowski+dt@linaro.org, ye.xingchen@zte.com.cn, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v14 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers
Message-ID: <167596964747.647630.15058465615417584783.robh@kernel.org>
References: <20230209105628.50294-1-bchihi@baylibre.com>
 <20230209105628.50294-3-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209105628.50294-3-bchihi@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_110731_603440_08C4E099 
X-CRM114-Status: UNSURE (   9.15  )
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


On Thu, 09 Feb 2023 11:56:24 +0100, bchihi@baylibre.com wrote:
> From: Balsam CHIHI <bchihi@baylibre.com>
> 
> Add LVTS thermal controllers dt-binding definition for mt8192 and mt8195.
> 
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 142 ++++++++++++++++++
>  .../thermal/mediatek,lvts-thermal.h           |  19 +++
>  2 files changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
>  create mode 100644 include/dt-bindings/thermal/mediatek,lvts-thermal.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>


