Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A82C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4xcdNfgUB8A/3KrK/pkTkDn6tlFzVt2oKgvssbhENc=; b=UUZjMawFLssu0WpAFqtg9TAkEZ
	rZFinSwojoirpsliectwhsa/Hj7v38f1kP1JxXcdbpLQzac1Kl7RulJzd7OFbZcrSuEw+X3NSm5dm
	GOBLWlWntmyOpAwMHHeBP1O0l4MxXDCW362MAI8yjRC4Mdno/d5GhjXLtasir6doYJ9P0/dSrYMjh
	g9sAeRAeLpiLoOw4yqTY9s/DxNcdmyQFqOs9ZGD+ufiElnB9GhtmXmEvIWK0AUhZwZd/yC9Wmr4yd
	Sjs7IjbCatOxUBxDEL0acK65iA5LGovfGLDnE7AKevCpPtu0wVbUHXkKAHRTHpci3NJjp0VNvcFwN
	Upy6XvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKTn-00AXAj-08;
	Tue, 24 Oct 2023 16:42:07 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvKTb-00AX5O-0I;
	Tue, 24 Oct 2023 16:41:56 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-58441865ffaso1892971eaf.1;
        Tue, 24 Oct 2023 09:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698165713; x=1698770513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4xcdNfgUB8A/3KrK/pkTkDn6tlFzVt2oKgvssbhENc=;
        b=K6i2DTM1eSJomwXxvwbVR2r8an7X+r20Z8p8WIdd7KxenSYwsWOdX4kHUCHPRsfArR
         wnovUrvqZTouMon8TJoknIH2UIwTOBr4NpT/Yj0PQP2lOWdQkk5668hgzWdFp1CuEikE
         ZCOG8V5G2lHve6TThMpoR2EOYwI4uB5Yh9ZVhApEZfAuR9pSe0N+7y2btewuSDbI2QUO
         j7OuLgvA/BPLPj+ZGvbPTetWJ+FEVWxR5B8IAa5leJ1Yff3xqcRdP9mefpg3o2UU/l3X
         /X3fauGbTHpu5m4XZ9Iia7r2GeeGkMr3SI+rmLtrbupu0oj30KmrA+j9801hNczkHMMQ
         2irA==
X-Gm-Message-State: AOJu0YxWG1VKAHiM3tIpJq9OuA0sRJP3jK8KGk/PI0dYDKR3b2lVFuc+
	S4nxh8L5tD8mwuDMOduHzQ==
X-Google-Smtp-Source: AGHT+IHYKyO3ogdUGL4R4E9sBhKDQ/3y/62tY8hPLoGpOKOm3RsZpCwkW+zvRJrXop02dDrQyVwNzw==
X-Received: by 2002:a4a:a581:0:b0:57b:469d:8af6 with SMTP id d1-20020a4aa581000000b0057b469d8af6mr13049788oom.4.1698165713249;
        Tue, 24 Oct 2023 09:41:53 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z10-20020a4ad1aa000000b00581daa5c5fdsm1993792oor.29.2023.10.24.09.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 09:41:52 -0700 (PDT)
Received: (nullmailer pid 4065610 invoked by uid 1000);
	Tue, 24 Oct 2023 16:41:51 -0000
Date: Tue, 24 Oct 2023 11:41:51 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, Simon Glass <sjg@chromium.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Trevor Wu <trevor.wu@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, alsa-devel@alsa-project.org, Julien Massot <julien.massot@iot.bzh>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop kernel copy of common reserved-memory
 bindings
Message-ID: <169816568976.4065099.2725442642169549559.robh@kernel.org>
References: <20231013200851.347042-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013200851.347042-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_094155_125659_386040A8 
X-CRM114-Status: GOOD (  13.84  )
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


On Fri, 13 Oct 2023 15:08:49 -0500, Rob Herring wrote:
> The common reserved-memory bindings have recently been copied from the
> kernel tree into dtschema. The preference is to host common, stable
> bindings in dtschema. As reserved-memory is documented in the DT Spec,
> it meets the criteria.
> 
> The v2023.09 version of dtschema is what contains the reserved-memory
> schemas we depend on, so bump the minimum version to that. Otherwise,
> references to these schemas will generate errors.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/Makefile    |   2 +-
>  .../remoteproc/renesas,rcar-rproc.yaml        |   2 +-
>  .../bindings/reserved-memory/framebuffer.yaml |  52 -----
>  .../reserved-memory/memory-region.yaml        |  40 ----
>  .../reserved-memory/reserved-memory.txt       |   2 +-
>  .../reserved-memory/reserved-memory.yaml      | 181 ------------------
>  .../reserved-memory/shared-dma-pool.yaml      |  97 ----------
>  .../bindings/sound/mediatek,mt8188-afe.yaml   |   2 +-
>  8 files changed, 4 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> 

Applied, thanks!


