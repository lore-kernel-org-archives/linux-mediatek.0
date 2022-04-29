Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 22:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9mO4VBBW317pE3jXhJVTwyzeACQ2a2tXYyKRE5kWbM=; b=KdSB5Nz1YOEqek
	RgnRO2x2wqEHkFh/YBTIhPSadl6tSyburUIWXgBPxy+pm6e7e81Ex4wO2n8eoaxKAo4a4lvmlJn4J
	QF/VouHQHQqm6/8gkyw22iHDQIZLTvEBplZtWG/9dVSq9P0qfqimcyzX19ACWJdWEFt666NhYhICP
	Mvechv5gCpr3hFS0JiFD3YJLW2vxNdnabYrXADCWHaXqMcPbcDiYqwcuvoaPdD4t1b9Z1I9jJZSB4
	SROzYU/YprMkJMc572Rf1cwWoyi59Uu9Q+joRhtdWtF1skt554gr6GQWQHgrKBop3ywV1m050j1jQ
	dBETnX9D0S4oTnx64+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkZ9Z-00Cuwx-K2; Fri, 29 Apr 2022 22:31:57 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkZ9O-00CurN-Ge; Fri, 29 Apr 2022 22:31:47 +0000
Received: by mail-oi1-f171.google.com with SMTP id a10so9948382oif.9;
 Fri, 29 Apr 2022 15:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A8ShUMCXwevSM+KZHgclp3XqLzSAI00vI1y7sVAiRZk=;
 b=Qmr+f7bAkNyG+t0bZQ3m0LgbEsSHjMS8OKmaZfDpdLrfo3pT0wKcxLpjfLQfAcqTwl
 1VOUHf/idbSLV0hrmit+PVKpV9XvqpUulSfGWwBo0r0HFKwiyWNBFJqSSm5TfClCHUQM
 Zl40icnkEqgnd3ri3/+m369XjZSsVeUHNRtDc2fyBEZaqCXGiT+Livo2tdlTQ3X5x4yc
 ubQTwpxt942C8WmvDDVJ2mabgpklVtPIheu6uBoEpXutOqczFqCWFw5n5CUj5dzsMfuq
 8q3IJ/kzp/Qv1rTVflG9ZMmXjM81oYAjRdcucMqACUv9MB1l4HuL8s4/qBCBw86OonqN
 FTpA==
X-Gm-Message-State: AOAM531eHtPyeZgxZVdYu9dRdb58bwYWq7QIKljW76EbBNAgSNzQJvxF
 n4MW33w566XW6mwxJ4Xaeg==
X-Google-Smtp-Source: ABdhPJwDqejqhWuRQiFknX+EWaZwHivSuDpGwtm8Z46JIaGZ16DdkjJ1BxROqroZgrqC3YcKAlmfFw==
X-Received: by 2002:a54:4e04:0:b0:325:644:3374 with SMTP id
 a4-20020a544e04000000b0032506443374mr2614428oiy.198.1651271503950; 
 Fri, 29 Apr 2022 15:31:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b21-20020a056870b25500b000eba4901e57sm977104oam.17.2022.04.29.15.31.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 15:31:43 -0700 (PDT)
Received: (nullmailer pid 3019653 invoked by uid 1000);
 Fri, 29 Apr 2022 22:31:42 -0000
Date: Fri, 29 Apr 2022 17:31:42 -0500
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 Ryder Lee <ryder.lee@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: Add compatible for MediaTek
 MT8186
Message-ID: <YmxnTqCCtF7bchxW@robh.at.kernel.org>
References: <20220428061717.11197-1-allen-kh.cheng@mediatek.com>
 <20220428061717.11197-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428061717.11197-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_153146_588808_D51E0A04 
X-CRM114-Status: UNSURE (   9.65  )
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

On Thu, 28 Apr 2022 14:17:16 +0800, Allen-KH Cheng wrote:
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
