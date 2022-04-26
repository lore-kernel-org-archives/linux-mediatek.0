Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFF4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kse8+6tZzOl+uwG5KG/31aFv+V0J2XgtVSsT0ez1j7A=; b=isCeCLkBXEZHVe
	ERCcg3O8etEN+joTB5LuODslQw7hqGlOT43xjFnzwwMSvS9V7eEd8/tvDYZy3GJyz0V0XYCwyx5Ca
	EzgsTytVCUKLQXq1x5awHvMfw8WonCOF2bgPgIOgEKG8FoDe2zfeuyASk2UTgBYh7AF+VkAypQKP4
	mWBbyCAws3qIJPYq4ibCLekQ6TwgVvst9X7m+z/6FkRDtEHiMzVZ9WdNP+azKbOqwM4qya0RPItCK
	g0qVKwFWtF+hY72eWq8nMVCejKnZ63hWwD4oJER3lQljGYJWQx1AHOE1VYUVp8KAA1Ir/2eP2P8bf
	KUEHExQAki2+Yy2/P+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj946-00BwKY-IQ; Tue, 26 Apr 2022 00:28:26 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj93u-00BwHT-9z; Tue, 26 Apr 2022 00:28:15 +0000
Received: by mail-oo1-f48.google.com with SMTP id
 m22-20020a056820051600b0033a41079257so3107039ooj.4; 
 Mon, 25 Apr 2022 17:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SFFQr41CrK0hpZb0QawVnEuLVgHVc+Fj3FqF1lnbmG0=;
 b=lwfQYerw/aC5/r0F4EHc/teohkFPjG5Y3D2aH+0ox+aOHuRhnziqc8t7XLcAI5kN85
 /NuoD6JkY6FC3x1OIUXMQ71zRC6JSh3ElzADhGCk2kflhxinsWvNvvcYHalJ81ejWFX+
 s34bKTHOWd+X2ohcVG7SNJgf9suTCI31KyNr8FGi1GryCaNsdYasCrvuHWFTTLVsWyMb
 VPjUJ7VeFig+Oa8M1A4hyq9j/zWYNtL/tJHFXJ6ClY+K4taDZ6/ms81aSMEp7Dg+O0eJ
 /1kOwC4o0XZYNIyWXSfrKKUFWmnFdC53wFsadLhxh26cqx0Vo00lwyfDsc9C5YvenJQH
 rCgQ==
X-Gm-Message-State: AOAM532hZzbq+xT3T2z0Zq46P2PM4tlxpKPGth5AIduqrCQU2zehNyoh
 ZoLSyCdOnCELCILH2G/ksA==
X-Google-Smtp-Source: ABdhPJw59OK2Y1K9vrvU+qPU7j7PKh3L5AfO5Jhnd7VcgAhlOX360MKdf1AxoRUnz0bNQSUohxdmOw==
X-Received: by 2002:a4a:e85a:0:b0:333:2aa8:264f with SMTP id
 j26-20020a4ae85a000000b003332aa8264fmr7277374ooj.65.1650932892015; 
 Mon, 25 Apr 2022 17:28:12 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t3-20020a056870048300b000e686d1389fsm264473oam.57.2022.04.25.17.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 17:28:11 -0700 (PDT)
Received: (nullmailer pid 613027 invoked by uid 1000);
 Tue, 26 Apr 2022 00:28:10 -0000
Date: Mon, 25 Apr 2022 19:28:10 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-remoteproc@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Ohad Ben-Cohen <ohad@wizery.com>,
 linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: remoteproc: mediatek: add
 firmware-name property
Message-ID: <Ymc8mjDNx36OWm1/@robh.at.kernel.org>
References: <20220419123331.14377-1-allen-kh.cheng@mediatek.com>
 <20220419123331.14377-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419123331.14377-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_172814_380578_D82766BE 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, 19 Apr 2022 20:33:30 +0800, Allen-KH Cheng wrote:
> The SCP needs firmware which differs between other platforms and SoCs.
> Add a new property "firmware-name" to allow the DT to specify the
> platform/board specific path to this firmware file.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
