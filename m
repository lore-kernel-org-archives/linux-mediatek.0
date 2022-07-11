Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF18C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 22:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JVsyVNeM7VExApQQm27V2U3K3Ew7O7BqPXEGzNor7JQ=; b=jH1GV27AnjVQuSBevRjLlbDKdJ
	bUbJl9GiPM1J+fTzKAWeWYlKZ5mivqykPtE0R5eOrvPayUqzlZQHB+Pvhnp3ng4jOgA00DSxwuu/e
	8X1CaLGaEvG64/TLpHaKl5pB1JmUemzhOd6Y4IMzY6qzRAZVkxBKIry79eT8VBAbNyzTUUITCLGym
	vtyp8Ukb6xJJc/WxcrPhTWLq/HShz6lVwKPtlnRHJmqHo7gNJ6tyteHbEdvYvj+m4bk9t2A7wXYWy
	FjB8H2TXQWvmc+O6kDm5LoCD+B1pL5ZKF5UMhWhWUzkQDZ2Bw4DUxVRWGGRmiDDKSW2z7EEDXgDes
	vd/UW2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2GI-005Oc6-8j; Mon, 11 Jul 2022 22:52:18 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2GF-005OZz-JB; Mon, 11 Jul 2022 22:52:16 +0000
Received: by mail-io1-f41.google.com with SMTP id z81so6376702iof.0;
        Mon, 11 Jul 2022 15:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JVsyVNeM7VExApQQm27V2U3K3Ew7O7BqPXEGzNor7JQ=;
        b=ASuDs690P9Z1eSQ2eG7g75SdM5nwdjMH8kYqCx5e/9s+84jAD6+tjUfzmp8+4xebr3
         9zmlG0A/vfsVrL/hx4M/Wj+xcrePQO3S+VLza7Wc6HFUbFWjrfMVFdtbV7QQQAYKSMMI
         uaS3ewRwoX/PH0mxq2lqws3rukhC6DTJgkXkChAphNlsXRpWTvi5bZSdceKGXGQIjhSF
         pkO82jNO6laXCPcnG5e0fUVjP/k/YehjGPT7OWG/4B6c0aDBv7NWTdljXfn+xhywB2q4
         793Mx/JAF8MQbCKfg/3aO4xKf5dHjKMRpIa6VX3nJDAD18O2YrhzkRipqco332hSjHV4
         5IMw==
X-Gm-Message-State: AJIora8CdCa8r/XLjgu1ua36G7fdtiTItlspF59YMoHSX19YKSSsugE6
	8P8Ohc6FHElI3Uz6rsSM4A==
X-Google-Smtp-Source: AGRyM1tboW87HTQuEDF23kVnOyKb4dQSSMkiAiV0GeGCkS39NqiwWm05SeXFvwjvxMgWWBF0r8rcVQ==
X-Received: by 2002:a02:9044:0:b0:33f:3845:3ea0 with SMTP id y4-20020a029044000000b0033f38453ea0mr9718285jaf.176.1657579932190;
        Mon, 11 Jul 2022 15:52:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id d20-20020a0566022bf400b0067b78bcba0esm4183238ioy.43.2022.07.11.15.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:52:11 -0700 (PDT)
Received: (nullmailer pid 417587 invoked by uid 1000);
	Mon, 11 Jul 2022 22:52:10 -0000
Date: Mon, 11 Jul 2022 16:52:10 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: phy: mediatek: tphy: add compatible for
 mt8188
Message-ID: <20220711225210.GA417534-robh@kernel.org>
References: <20220708065834.25424-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708065834.25424-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_155215_651275_DE728D77 
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

On Fri, 08 Jul 2022 14:58:34 +0800, Chunfeng Yun wrote:
> Add compatible for mt8188
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

