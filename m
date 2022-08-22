Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E1C32774
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Aug 2022 18:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgI6tvcF5ekm6PkD5j91BZaJAeBSFOE8AYovOrfGK1o=; b=C+f5IhX71JkUAc1brwx2IgiV4J
	7LCCNKR5+HZORP5rIbJXfe3z38otB6eYWU8VdFMRK8AkcfuJSQOYADX92umxa+H2QWNeJ+gN5Nd5j
	/tTye4tcUecpzXCfLCUsIBUp33btDopLj0lSaHIp+KDeURjb0umZsRt2fCcVa8TAggCCo6WGculks
	nJMYZcw32uQhi/axDO4aD/t2G1T8x185wAiF75RDsMAKTWfVofJEnGZW3lVSY0ArreOGSJuAGx0Pz
	HRpB6oewWJWUepP1ZRRn7kr0EBHc3mHC5mYFzSy6Xd4vNVyKb+j1XzVBfRY/osiJR2QEFpSHHwjkV
	4qLX7aZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQC6t-00DX8X-EF; Mon, 22 Aug 2022 18:25:15 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQC6j-00DX2D-VV; Mon, 22 Aug 2022 18:25:13 +0000
Received: by mail-ot1-f52.google.com with SMTP id h9-20020a9d5549000000b0063727299bb4so8261994oti.9;
        Mon, 22 Aug 2022 11:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=KgI6tvcF5ekm6PkD5j91BZaJAeBSFOE8AYovOrfGK1o=;
        b=Auwv6mvywCfXrgczs5YCZrDEVGyyt11ecGUJX83k0/HM4uHPx4BRZmYfUv8mgs5XYp
         a6nqixbAJeCuijgIp/HG3xH5URZ8c2O5SC+rdVpx34nqwMSdsZFybrdjnpdNc3ub40Qm
         REiA8XOHo5CQ0Lip2rXau2b7BzYaN7W4PPKByAgU72h1aTgLQBst5zy/08hKqpNZhIsy
         84fd7eVbiF64Ukmg1SFT/tWhR35igH/aC1iHPDRo2yZMwYwt6jkBy2dp6JxPV26lfFTX
         mohvKBQm4vY0yn7DpqMLJrGIo+qB0jJOqRLTaYCQKYvFaU5L86tTMu3mIpBWzMoxIZxr
         WFTQ==
X-Gm-Message-State: ACgBeo19wy7kydGTN1Fs1IIURIfhBCPK/+rHXqEbjMjClkOmBV2c71Q4
	6DQD1IgCrYDQVgcDfogvwg==
X-Google-Smtp-Source: AA6agR5txWZKQZG3RQw2mRr0rNhMvBqip6eol4eL2ljd2cDvICfAIwhZ+UURdLKdP33prwbEegj2DQ==
X-Received: by 2002:a9d:6a4d:0:b0:638:9c7b:40fe with SMTP id h13-20020a9d6a4d000000b006389c7b40femr8140146otn.37.1661192703024;
        Mon, 22 Aug 2022 11:25:03 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s63-20020aca4542000000b00342df642fd3sm2706471oia.48.2022.08.22.11.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 11:25:02 -0700 (PDT)
Received: (nullmailer pid 111155 invoked by uid 1000);
	Mon, 22 Aug 2022 18:25:00 -0000
Date: Mon, 22 Aug 2022 13:25:00 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH 1/7] dt-bindings: phy: mediatek,tphy: add support type of
 SGMII
Message-ID: <20220822182500.GA111114-robh@kernel.org>
References: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819091344.2274-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_112506_049136_371BD807 
X-CRM114-Status: UNSURE (   9.63  )
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

On Fri, 19 Aug 2022 17:13:38 +0800, Chunfeng Yun wrote:
> Add support ethernet SGMII, forgot to update type supported.
> 
> Fixes: c01608b3b46b ("dt-bindings: phy: mediatek: tphy: support type switch by pericfg")
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

