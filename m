Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A2FDECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 16:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAOafVCNVmR9N9v0Yvq51YsgQAP+hB4f5u0L/4nUBKA=; b=OBLVayBOTWyNZ/g2ssrB0WKJap
	CwMYrglqjq3y4Cha7/f70qNn8k7TOB4kIgCnikGsGRirvBPgAq9sNxbxXjME+dxjLCrojc6vq5CgU
	GUmGfsSrbtv52X0uw604SQ6G1sYYxxyuatPtOjkffJTqjCUommbC+e6MbegLDdc64pj43lmVzb4QL
	L3rAYaFTIJ3b/e+P1Y9xoPHdTOY1KLlQQcDLwFiBhOQzdMko4YnbOfur0BRPA+dThinaxmJeaoR0Q
	nYypwKzsXkms+sPKI1QvUctASNLAzfBzgVOJYkgXOSP4U70QLMkgDopsd/UrcscrBL4JOZffPR8L6
	l8V7XUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJa3-00Cs2s-Mi; Mon, 19 Sep 2022 16:25:11 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJZs-00Crvn-B6
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 16:25:02 +0000
Received: by mail-lf1-x135.google.com with SMTP id o2so45610095lfc.10
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 09:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=eAOafVCNVmR9N9v0Yvq51YsgQAP+hB4f5u0L/4nUBKA=;
        b=ethu0EynC43p9UpiI84ruyAXrMRMdZfuiof4jGWO3COHQkx9EjPMb0Llez11+BLPKc
         5EqefT79o5oAfWdTFyJjgnxiKXiq84VSTx1yMZv0TukcBhrSE770dxQz5AgwGe1/wdX2
         cUJsrSok2ZwMke4mNjZjszTcRrHhEleMa2aQSfFC8yHWRZB04kXsxZz6CdO77YeDIaKv
         W7FxT0sb23ogGQ7pc/WVP0aKVEqqH7TJDENRj5695hxAabD43bspb6BjFX+2A2W7QhTc
         h3skjS9SO/0P+2xMjVxsZpwoqFCCIKq/pCYKaq7GoKibRjTOB+55a8piA4ChmXfjbqDC
         To3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=eAOafVCNVmR9N9v0Yvq51YsgQAP+hB4f5u0L/4nUBKA=;
        b=TYRwvuspaz/Q6KdvwWVoNFzBJ30w6ENcWhQ1kuOTrWd3GPpxlpHekC8kpMfgQjvqUX
         j+912LYb7HNMuEKGfVR1szqJ8RPU/lSWFVTrAUEAD85oHTZT7hjT13emZ7lTKBVcyuXf
         XCpxyE4yYHCmLK3+8e6qPgCZuA4ulerxhx5p7AAuXOxcF5mhvA1Ko6tL7xLgO40TscPN
         Wd4kJHZYNCGnQDEa52v16Al45QsVaz7W6C23szDwOglHlpZc9+8U/YYwprmbgVyawJMC
         YIQokNWYxGROBZVK8cOWY6gs2Hajo1W4G7MuslqGHBi+tkCSOQ3McQct8QGBGfMJYP4y
         4jXg==
X-Gm-Message-State: ACrzQf3R4fjDaOuVbghbeKdYfuk+RC1h+ZovfxWzRSuFiFtQZe/OsrKy
	bbikK0wSzBmnugQaP4oEfmDpdg==
X-Google-Smtp-Source: AMsMyM7Q5L1McMMFqSUa7fGLN03YMRs0ciA4N40x8PHN9GOTdAWbWDoQN39MejGALAtGiMvhd/RDEg==
X-Received: by 2002:ac2:4e0d:0:b0:49c:d593:9d6c with SMTP id e13-20020ac24e0d000000b0049cd5939d6cmr6740730lfr.37.1663604695831;
        Mon, 19 Sep 2022 09:24:55 -0700 (PDT)
Received: from krzk-bin (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v23-20020a056512349700b00499d70c0310sm5061842lfr.3.2022.09.19.09.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:24:55 -0700 (PDT)
Date: Mon, 19 Sep 2022 18:24:53 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jianguo Zhang <jianguo.zhang@mediatek.com>
Cc: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Biao Huang <biao.huang@mediatek.com>, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Jose Abreu <joabreu@synopsys.com>, Rob Herring <robh+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH 2/2] net: dt-bindings: dwmac: add support for mt8188
Message-ID: <20220919162453.4kkphzhc2tu6wzou@krzk-bin>
References: <20220919080410.11270-1-jianguo.zhang@mediatek.com>
 <20220919080410.11270-3-jianguo.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220919080410.11270-3-jianguo.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_092500_443755_CE64EFE1 
X-CRM114-Status: GOOD (  11.51  )
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

On Mon, 19 Sep 2022 16:04:10 +0800, Jianguo Zhang wrote:
> Add binding document for the ethernet on mt8188
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


ethernet@1101c000: Unevaluated properties are not allowed ('clk_csr' was unexpected)
	arch/arm64/boot/dts/mediatek/mt2712-evb.dtb

