Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5131BC77B60
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mu0CENun8oFZTueHArmv4VmXak5XmpNKe7QDDJtnNAM=; b=sWEJinHrhBkx74o7qWBo2LmURI
	wH0jxFamulXLBrZzDxwb35CMziOcxBwVkaZQk55Ubf6xOMRXYBWaZ53qezMSdgXf75DYNsyIDIV1I
	xozd1ltmk+7hpdAY+dJlu8p5av29M+lbg1MkjR/9vEZwyx24kinEd2N+/x2isewHtC0PHfT+76hu4
	qD5936vZINBCzVEIZ77dCH/ajSyecIF5EsF3A2W+LJbYyjLJnrwZ+8Xm+WNSGqVJWxwHNbeNAgADn
	lLpbEqVhgsBU4+6NFfkfc+p1yqi9Qa4J9lDZwDuGoBWKV9JnpEncelu01nZ7103L7LUNv87lJBoHH
	CbKLIW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prmP1-004sLG-0I;
	Wed, 26 Apr 2023 21:10:15 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prmOw-004sKX-1s;
	Wed, 26 Apr 2023 21:10:11 +0000
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-38dee9a7795so2840485b6e.3;
        Wed, 26 Apr 2023 14:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682543408; x=1685135408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mu0CENun8oFZTueHArmv4VmXak5XmpNKe7QDDJtnNAM=;
        b=fJKew+voK0YVbJh+nA8KKKvQsJ7o3CqNIWbmSbWaIseKGbqEmlZon7j3yFuMxpzXPR
         Ob8GQ8Gr1/4rPeo4/taryVSuPccvtzNxqq2UP5rcq9NyHfthkGYUyjrD70fAt7gI6Kko
         txxqNLIpOXezuTRk7uZeqN6pGkIzLH1/ZH3D5wfa39Fa+UA+chyfD/FLa/lpeuY8N/Ar
         BSO+0bJgaGx9aVYrgRDWtcX/S/ht1iItb+Bbx7z+bJt6bbXceXiE02/BXQ1OsJczySdV
         x84Gt9Gko4l3MdyjKUE6uzhqEpLtkRkEtBgjNnq9Vj1z69pAReIVGoMggzLR8ZisfmRP
         n0UQ==
X-Gm-Message-State: AAQBX9etxNv/w3ST7QsGqd3PgCOvA/bMKrcdi7i5UG1ICSuNLhYWqUtN
	qmZD8fG80v4f4sMEaNksHQ==
X-Google-Smtp-Source: AKy350ZiQQZVuONWZ4qZ3rjKWFp/+fC6WoEIdnMn+PbZciaDx8naIN2vbcz6/nEY74IMf5U9XKf8aQ==
X-Received: by 2002:a05:6808:21a2:b0:38e:6cb1:298b with SMTP id be34-20020a05680821a200b0038e6cb1298bmr11228463oib.53.1682543407669;
        Wed, 26 Apr 2023 14:10:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b82-20020aca3455000000b0038ec2b341c2sm4366485oia.12.2023.04.26.14.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 14:10:07 -0700 (PDT)
Received: (nullmailer pid 1240028 invoked by uid 1000);
	Wed, 26 Apr 2023 21:10:06 -0000
Date: Wed, 26 Apr 2023 16:10:06 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v6 03/12] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
Message-ID: <20230426211006.GA1227761-robh@kernel.org>
References: <20230203-evk-board-support-v6-0-8d6b1cfe7f29@baylibre.com>
 <20230203-evk-board-support-v6-3-8d6b1cfe7f29@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203-evk-board-support-v6-3-8d6b1cfe7f29@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_141010_642908_E0F3BC29 
X-CRM114-Status: GOOD (  10.41  )
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

On Wed, Apr 26, 2023 at 12:49:03PM +0200, Alexandre Mergnat wrote:
> Add binding description for mediatek,mt8365-wdt
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)

This has already been applied by Guenter.

Rob

