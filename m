Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F42C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 09:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yN1bSzBgfcsuMT0uBzVDoecNKoQ/lkv/yPCgPk/2xTc=; b=L2JKYrOMp9RVkB
	GpSU4xI2QmOj6PEIwqvGYfOjfgvrZaCwjd8LYqrHxM1p+GqFafQXspWzcQjohsDLFW3TqO0x1GLH1
	K5YqmmOgRlV3/P4mQ8fEpvlWFV5dbWHn/xWixbLFljT9i7ir9si+IkTtHe5w8tS/CMDq95w5Wwkew
	XI/nuq15xlqeSOu6PzDtF1O1mdj1HDzHkTB96pkaiwqhAnKsVigNO1yZX/KpQNYSsHI4ZSL6/m7vO
	amGsgNNxqk/QtV4LVNBqnFlbA9csY53V2Qq2Axq8EWsYj+ogAgWglSU43it34R6RAphJCCaMHEc9H
	FhXN7MrhNZP/1qCamCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny8vF-000MIK-ML; Mon, 06 Jun 2022 09:21:17 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ny8uw-000M5A-Vi
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 09:21:02 +0000
Received: by mail-ej1-x62f.google.com with SMTP id m20so27653300ejj.10
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 02:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zoHlWTM0mh72u63WTDkrFJTCMvo9HZydx381A5IP8W4=;
        b=fAp+mLefPWSXPVw2gR16yejLON+sGRvH+uoxH7R5Xn4PRMiw7fUb+GOtXbO9tB1YBm
         Euiv8jhzT9G4gzVuRjouOcFw97lOQmqYzdwVIUFvIHBbYE7wUd1IDic+47IXlZT3jF9l
         DpGMw5uGIGNO11RdIypEQk1hZa5iuxSvBQzMtqgjl6e/hruhDsMPb2EEmP7dw2gpldFO
         kbZ/CauE0DZxBSg+3l2/fo9jo2x2t3vl1GnTxH+175H+ow2QijiKmeYR/m7yUZVujjar
         XlML2hWGe201Dq+eiaueSfJ0gnLyOLnfVPAA3h8dfh4UAxCRAcPY7IxyB+/yy4lLtgTP
         E5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zoHlWTM0mh72u63WTDkrFJTCMvo9HZydx381A5IP8W4=;
        b=r7ryxFC4jg3fcjkZ9ST19I+G8ASzqRBHOHAbNxyxKDXASpIDDEP/5/Vj7yXDIhaDS+
         P7g9IwMpZOlLeCQProgGOyGQ9tWb4PnZf7UQM+mvgpsP8LfOlFHpk88vAPTTxq20lc7U
         iycYO9kvku3F0vn6w1hXrO7kY9SL7eW4nXkcSkhBToVMAZsQZd6pAzkD/t+clGlM0O4Z
         gZ7l3eDrra/+mOEULD7nhjpKuMToO85rj9ctbZ+hRx2KDOptD6GSS8zT9F1lVJosAfyu
         EwT1y8mct2HFAtabeFD5moAd256DaxLtNy7jabqhDLM+1QFZBsefX/v6+hP2PECCZnyq
         B9Tw==
X-Gm-Message-State: AOAM531I8igfJGYsPLK4lnvaGQr/LXIWVY/iAjy2Dx+EX+Xypy58LfYU
	SrrhYNI7Qb7yQbtJEuBkZR6Zjw==
X-Google-Smtp-Source: ABdhPJz4EadSpCFcDPBbGQ9J6jbCva0Tb1Iy0T24C2zZl7EamP7i01FChZZW/ERhuc8Ca3iSlUf9Xw==
X-Received: by 2002:a17:907:3e86:b0:6f5:917:10cc with SMTP id hs6-20020a1709073e8600b006f5091710ccmr20045928ejc.53.1654507249751;
        Mon, 06 Jun 2022 02:20:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b6-20020a17090636c600b006feb6dee4absm6067412ejc.137.2022.06.06.02.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:20:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	yong.wu@mediatek.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	kernel@collabora.com,
	konrad.dybcio@somainline.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	marijn.suijten@somainline.org,
	paul.bouchara@somainline.org,
	martin.botka@somainline.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] MediaTek Helio X10 MT6795 - SMI Support
Date: Mon,  6 Jun 2022 11:20:44 +0200
Message-Id: <165450724182.62574.9805820724956534003.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220518091038.22380-1-angelogioacchino.delregno@collabora.com>
References: <20220518091038.22380-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_022059_135347_9522C809 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 May 2022 11:10:36 +0200, AngeloGioacchino Del Regno wrote:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series introduces support for the SMI common and LARBs, found in
> this SoC.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory: mtk-smi: Add MT6795 Helio X10 bindings
      https://git.kernel.org/krzk/linux-mem-ctrl/c/a24394059a1bde7c630352827543d50034f03180
[2/2] memory: mtk-smi: Add support for MT6795 Helio X10
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0d97f2176dec9c1e070215c4e28ba87e036458c9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
