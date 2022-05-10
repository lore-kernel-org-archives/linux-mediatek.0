Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA7FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmYYo9bvfXIy+Ic+kUsPhlGGCsWSrdj3o0tjgRi/Low=; b=QJM83MTU+a41yU
	0BsuCwnXNa+1cGm+Ln1r0TwCQXPyX1wC3d9XSoZwSWpptPiZcnbGQAqUanFz1AqTSvc6GO+XiTbDf
	ASXG6YFAhM/h8bMOsFiT1jVZ/7EhdIGFVFUEgAB3cwZWECPsOCCS9zL9fRJcFjtVUTtq6X9vse8bm
	za1tSbu38iF4pGr8EfixytRT0nRD6piozIgfnJUvQRY+DfoK1PO9bN+/eyX2CZpgxtLi2+EQEExj2
	36A0M84KfdkKoMYpnAPd6wQz4dsAtZ4DsMF6ptGnMziNeFQGuelF9wWkc44ULW/c51M2kcbRmHtOR
	INodCkfjuKOcDr+12geA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noTY7-003LYC-Hb; Tue, 10 May 2022 17:21:27 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noTXy-003LON-Jl; Tue, 10 May 2022 17:21:19 +0000
Received: by mail-oi1-f178.google.com with SMTP id e189so19226613oia.8;
 Tue, 10 May 2022 10:21:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h4ryxJ2jrSNExLhhmYzyKGyiel0OoRkU5ralwjePwSY=;
 b=eu2ZOMGfJ1rFHuyzuJgEb3ZbBWN7prI5eeUCamJwj6fZsvGj4iTu+T1vglk89vL6GB
 P5a76IU5sjoPoolt6fq+g+e+M1KTeJPC20EvY4ZQCUDeUhfqsH/nvntpvV9MBWgS1aDA
 lFvwYLSXkWgLlc/pktzNnIOQ2yXL4+Ca+bPVIfrWJxV8OgTfimVlx8f9hJ3G5F0/R4lS
 eDcp+C3/TSFDNjiOj1pSV4ZDejyhqjYwimF9PJxf3/6/xcrbELZ1BtTJPcNkgzHM8t4z
 +eC98ZoSw7ONbLVOLMh/eIaRppk7HAEYCdzl8Gvp+ueS13jH9ILr7mSuHGsRpGB91fiB
 WxIg==
X-Gm-Message-State: AOAM531RESxrc1a3ToC7J6w7z7U/aa5ZmVh3ulGcr2BJTW2tUmmDpCi2
 HPIR9th/QL1nNzSitV5Jug==
X-Google-Smtp-Source: ABdhPJxSViFtXleX6ACNx+piFFh2WquKpHvKnusM+eQztCmHieA6RVfY/Tq4ItgXWYejlF4c1oqxQg==
X-Received: by 2002:a05:6808:150e:b0:328:ab8e:fcfe with SMTP id
 u14-20020a056808150e00b00328ab8efcfemr314666oiw.120.1652203275435; 
 Tue, 10 May 2022 10:21:15 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s7-20020a0568301c6700b006060322123bsm5886462otg.11.2022.05.10.10.21.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 10:21:14 -0700 (PDT)
Received: (nullmailer pid 2232154 invoked by uid 1000);
 Tue, 10 May 2022 17:21:14 -0000
Date: Tue, 10 May 2022 12:21:14 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Ryder Lee <ryder.lee@kernel.org>, hsinyi@chromium.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/4] dt-bindings: arm: Add compatible for MediaTek
 MT8186
Message-ID: <YnqfCkaBJyFnDMil@robh.at.kernel.org>
References: <20220510075233.5426-1-allen-kh.cheng@mediatek.com>
 <20220510075233.5426-4-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220510075233.5426-4-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_102118_680972_044F8B49 
X-CRM114-Status: GOOD (  10.12  )
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

On Tue, 10 May 2022 15:52:32 +0800, Allen-KH Cheng wrote:
> This commit adds dt-binding documentation for the MediaTek MT8186
> reference board.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
