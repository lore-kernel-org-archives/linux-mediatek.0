Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E50C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 18:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGKDzpQl36bGqwBBeYFJNy6u4C/uzXcd+jWKiDdMto8=; b=RwSyvmNl0V/BVbTBZA1gtcDuoS
	05+0iErCBXl05Dra1YHLYnhVC6MbTLe00af/P55/3LjWg0JJqp7yAMahbqOm8oOoyXWLAErcCl7LS
	tGjedUDimSOsozq4OB84TAAgf9Uznd8EtVEWDT7v4k0+JD3RIPEg1yZYR5ZkCD4j1z4B6mtm+xpZX
	ltUklgPiVvV69ZDEkUeOgj+WQxSWUzEIpM10ssyn7MRSD0KI7y07XPV1z2cwpCs54nUlSuBdOa3y1
	Mm2VXcDgV3tFVn4yEy4Coh+YYwtMVfPGg85flm6bZ3oQQqezuLjapW4syyNLrIB85eaI5iSgohN+B
	ZP4h1q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBSi-002mGU-5a; Thu, 09 Feb 2023 18:16:00 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQBSF-002m0v-N4; Thu, 09 Feb 2023 18:15:32 +0000
Received: by mail-ot1-f43.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so799180otj.3;
        Thu, 09 Feb 2023 10:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGKDzpQl36bGqwBBeYFJNy6u4C/uzXcd+jWKiDdMto8=;
        b=mD7pkCEewfftiLNWbnTMs7jTTIDKtCGSaeW4bEXV2+V7YbfdnXNjjvSyTTzctQq71j
         2k2V81PAfdI0t199GRjIKgrTZcQFPORq1EOyJp2bkajJBmF5T70RguTuEmWDaTEo1Sv3
         UJEBJi9LMs6bOQDX2Oz25EcUoJHoPQxl3LJ7q7kNY9nbijhb8tnOMFtuucoi6IJL+cGl
         HkbfAOsxCkQFenotcbbsyPQGv9hvhUaoDmACckhwmjxGnkOw4JB5qL40KR7t+GlX8bDG
         ONmcuu/oLRhyl3oqhEKzTAwxDChLwowQCf80OsRWkCbMbik7p1o7mi2qh52pjtcMCMox
         8f6w==
X-Gm-Message-State: AO0yUKViBwn+9oxJ36NB2BC02r+YGXP7T7pMcm/FgSR5xGYwpg0/+Qfs
	w6gCDHfJzaZsxT2Xiis043TOJjT3ZA==
X-Google-Smtp-Source: AK7set/vKPnpTPG7LfxGY3SZG4NkXDy5WVxyF5/HKjTtS2pCGvrXXIv4QnhMbYB01iQJ9u0d1Jyjkw==
X-Received: by 2002:a05:6830:6102:b0:68b:d679:9530 with SMTP id ca2-20020a056830610200b0068bd6799530mr9249542otb.1.1675966530910;
        Thu, 09 Feb 2023 10:15:30 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w3-20020a056830144300b0068d4292f4c0sm994977otp.35.2023.02.09.10.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 10:15:30 -0800 (PST)
Received: (nullmailer pid 588545 invoked by uid 1000);
	Thu, 09 Feb 2023 18:15:29 -0000
Date: Thu, 9 Feb 2023 12:15:29 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, steven.price@arm.com, airlied@gmail.com, tomeu.vizoso@collabora.com, devicetree@vger.kernel.org, alyssa.rosenzweig@collabora.com, linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, daniel@ffwll.ch, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/9] dt-bindings: gpu: mali-bifrost: Add compatible for
 MT8195 SoC
Message-ID: <167596652912.588493.7192091258835336091.robh@kernel.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-4-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208103709.116896-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_101531_797216_2C0A5212 
X-CRM114-Status: GOOD (  10.19  )
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


On Wed, 08 Feb 2023 11:37:03 +0100, AngeloGioacchino Del Regno wrote:
> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
> same number of power domains and requirements as MT8192 in terms of
> bindings.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>


