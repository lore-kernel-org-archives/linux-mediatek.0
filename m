Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BC2ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOi9kFOde5m40Z0kzt7eejwPpj0TyHiFN0Epj0E8EcY=; b=UP7pG6QrkPiZhwN8e1CjEzJ+CG
	Q0vvPlxOERHCpOdSykWY/InfobXCqMOAjUOgiwSpLI1rnuqHAmCoMg6K6L42UlHiW1AUWSO5lYCUe
	woI1tONl0Ix1vI82VCgyiwAKwW3PowupVEKowfOXcAWroTvDzIe+NYSmLsnZVroqF2GIS4+6qOQbi
	8b8zY5icSSv3aRZ9lgCKW9cuNeHB+jCgfMZoLBqche65Q7lj3DHtygtYRhlRHIFl4MGg01+iZa016
	4jxxcK3Xdbu1CN66k4Sk/f1t7CRyzuwMUvHs+Fy9IYqBsEl2uhDvr0jRSU+TPYxz2dp6O6ErVnFHT
	atO5RTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5W1-0012Sz-OD; Tue, 30 Aug 2022 17:59:09 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5Vo-0012Lt-6R
	for linux-mediatek@lists.infradead.org; Tue, 30 Aug 2022 17:58:57 +0000
Received: by mail-lj1-x231.google.com with SMTP id k22so12188802ljg.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zOi9kFOde5m40Z0kzt7eejwPpj0TyHiFN0Epj0E8EcY=;
        b=kOSsVdTVsCPhkycrz9pFHCagY9vhvZ/ZsHKsO5/WpC2KatVlstdZC08p4rRCGwGnlI
         vvMTass1nOfPlNAGL9Trvt+FHMNNL7Qh2MzuJ8CqKER9ItW1mo6hIDF7t4D+lvlbJRJM
         rwZGQV18MmjoPqeP1qNb3zT8C9aHqzsQ9F3uXBaEMUDEJYzA6Mn8HSdI2Cm4L5LR6TOE
         QC0prfswFQK60mYEimHhLstNDjvG79CMdJd13Xbb9Hbaa+857gKoePXq3i1OXGPD16FH
         eaLK/BIKs1UvuaajzvE6hn8fEg7e8WMWUbGpiGOI0e8kml4OBsZQO3TYsDM7Qezz3RFa
         lqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zOi9kFOde5m40Z0kzt7eejwPpj0TyHiFN0Epj0E8EcY=;
        b=hk36zK+CrHwljgO2niZ3nUCT3ytGd0uowj3JphuJ4Ylu5REabAvsHmGy8DxkScsvCh
         EIv7k8tJbczLfJxzNyLniPDdsZdoqRBM6Erg/BxfR88qr8y1I4U7cVHUCNpbUCck0yTL
         akACKcqAu+9jW5kw1sctCP8Tqgu3anCPqDn8N1QiskxYSgHSkgi3t6gTyy6e5T7zRm2A
         4/ci30u/WtROpKKNVhKkofOu4rvyR1aFxuJ4wJKUizcrIMwcA9x9jU13JWjaTYwDWWJI
         s0OX/Fui9dpytnp9xoI5VvZ5MxBy/F90FJC5T18LSrCoL+3QXP6dlwDtCdMZtljMjg1N
         sLRQ==
X-Gm-Message-State: ACgBeo3sPS3fDY/bOmL31aK7YcpH4N3ObRPHMnrNnB/JYhcDmsAeNWb8
	8LCfvTOvlBa0diO9Y3ZPNntUyQ==
X-Google-Smtp-Source: AA6agR5fB8tcI6nebScGu9KgPYQP+YMJ6wrIkqasj8/WnuIm+BOxrAGCTs+OgaoBOeK4z79Jb3aqmw==
X-Received: by 2002:a2e:be9b:0:b0:25f:e027:4999 with SMTP id a27-20020a2ebe9b000000b0025fe0274999mr7477279ljr.395.1661882332908;
        Tue, 30 Aug 2022 10:58:52 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id h5-20020a2ea485000000b0025e6a3556ffsm1851394lji.22.2022.08.30.10.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 10:58:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	yong.wu@mediatek.com,
	chengci.xu@mediatek.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	yi.kuo@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	anthony.huang@mediatek.com,
	wendy-st.lin@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/4] MT8188 SMI SUPPORT
Date: Tue, 30 Aug 2022 20:58:49 +0300
Message-Id: <166188232676.14577.13660349538278549218.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817124608.10062-1-chengci.xu@mediatek.com>
References: <20220817124608.10062-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_105856_253201_6A67CA79 
X-CRM114-Status: UNSURE (   8.75  )
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

On Wed, 17 Aug 2022 20:46:04 +0800, Chengci.Xu wrote:
> This patchset adds MT8188 SMI support.
> 
> MT8188, similar to mt8195, there are two SMI-common HW, one is for
> VDO(video output), the other is for VPP(video processing pipe). They
> connect with different SMI-larbs, then some setting(bus_sel) is
> different.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: memory: mediatek: Add mt8188 smi binding
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9d9fde47430298455544b283cffa390c40d58bfc
[2/4] memory: mtk-smi: Add return value for configure port function
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8c1561edc0692fa8e321daf2777c3c32454b5748
[3/4] memory: mtk-smi: Add enable IOMMU SMC command for MM master
      https://git.kernel.org/krzk/linux-mem-ctrl/c/4e508b259ed02f5fa608cdd83b817a7f49c22271
[4/4] memory: mtk-smi: mt8188: Add SMI Support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/673e71df5ccfaefeb32bb5b3130a5d397b742194

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

