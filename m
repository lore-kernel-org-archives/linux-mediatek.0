Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BE6C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X376wL3T8sy/ZF3e8JDdjXowqGN/pb6h2TwQ05Gxs1U=; b=raWk+m1TIAF9wbstnp9qkZq1Fu
	nEMZ7H6tGu4eJZaLvUJhsJfeerSLVSoCfR5PbZP4Ei2y9SGyT+DjbaAzuaABqgdq5KZ6yqz50Hfku
	hNJO+BeTB/uwOQJaeOBGyJE6zQQwMtHRVNgRsF0zZG+g7znAI7/mxpCS7hSTIqYI4w6WTTFDPLXbK
	FG65ZqRJhHCs12rjrIlVsMLBHtOWRmYeBPT9lX1b79leg+FIh81tpcAqrkMl9Y/4TGvZIQgeg7eue
	ABok+vdCWMwJ6CVMtqc2l/oEJUF+tO+CBDm9kepQn/iRzPl+AOcMkF8LTNcjGQJR6CpnkXaiBJiaa
	EIFH74Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prN3K-001uII-02;
	Tue, 25 Apr 2023 18:06:10 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prN3F-001uGc-2t;
	Tue, 25 Apr 2023 18:06:07 +0000
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-38bef71c258so4335178b6e.2;
        Tue, 25 Apr 2023 11:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682445963; x=1685037963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X376wL3T8sy/ZF3e8JDdjXowqGN/pb6h2TwQ05Gxs1U=;
        b=DB2vEzLhL1ChAk9hwhLZEkyXYRyMmhaSfkDVaS7dhTXryaraSR7qDV+lv5q7q5WXGp
         r4vVWa482Z874yxlODjMCa5R51nblWLsKk2mNQf4ypmZ1vsH5YKB7TVyXxGNsBe1elCS
         r3Q5OXKA9lIl0uZcW0Eia7OJzREODzvr480/tHfFKxSvs/DFNxGtxNvh7FaiBrjKy2iE
         OB/acmS1wv4nZ6//eUtFB6d3VI0rOcWYUEwtDruzz9Wa8+cRb3TnWTFwneYvyeOPt54R
         yWm31Wk5raGS3hO4123JOnywClo28BXu4ojaJgpM35MZ9VjHbo6856h9nsd4D4di+TK5
         ztNg==
X-Gm-Message-State: AAQBX9fcJMFsQqsReLoctA+DAnqKrB2Ocaf2DmYTFOsGl6d2zCCNrDMC
	VUUbTUzxneytvYuZa3UmlA==
X-Google-Smtp-Source: AKy350ZnwmyDkZuMRppHglz4M32pu2rq/AGDWRh6cTIJ06tg15gqMgSWbRzzsxN4kZf8EtIbVksCgQ==
X-Received: by 2002:a05:6808:2389:b0:38e:2993:be7f with SMTP id bp9-20020a056808238900b0038e2993be7fmr11625977oib.38.1682445962905;
        Tue, 25 Apr 2023 11:06:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b24-20020a056808011800b0038c0cf168afsm5852298oie.7.2023.04.25.11.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 11:06:02 -0700 (PDT)
Received: (nullmailer pid 2025900 invoked by uid 1000);
	Tue, 25 Apr 2023 18:06:01 -0000
Date: Tue, 25 Apr 2023 13:06:01 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v1 1/7] dt-bindings: nvmem: mediatek: efuse: add support
 for mt7986
Message-ID: <168244596061.2025844.2232344223319000455.robh@kernel.org>
References: <20230421132047.42166-1-linux@fw-web.de>
 <20230421132047.42166-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421132047.42166-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_110605_935524_DAC946F0 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: devicetree@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 21 Apr 2023 15:20:41 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


