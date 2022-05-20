Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0472C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfTcRkT+/ny2n/w7yKl5AKSi4f6I3IeqAOmIKrwaMPU=; b=ixR/zHIGc0djcc
	v66sLCSQ9Ord1gP4m+vE5t5pQ5R80r4G+5RahfeZiHOlzTY2//FJQvcbwyb4I9GWYrSEvwfxYKMnQ
	m0ABKyZP2L9Agr9viwYIQ5uNTQylwHMbXsowUKSLTk3vHpuo0bsD6WnUYcoyHCTeS2KPF3q4CFnsr
	xWMOgyur9gT9TTYg4p93CoE1rm5J0aPdFQ9uiY3oLQy/C4a5jNn/r7C6pQLRTASOjcjVKGm+jNMm6
	A80HbJfKzDohfcC8QI90s53LBpDEldzJa92ZnijdDrtjEQtd+vCkSRXU83FDWA7mTxQNioOJkF2or
	xICN0oOrfC9m5RQijlHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsBA9-00EmR3-9L; Fri, 20 May 2022 22:32:01 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsB9y-00EmOf-I4; Fri, 20 May 2022 22:31:51 +0000
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so11810129fac.12; 
 Fri, 20 May 2022 15:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ggCgD+ecJUNc304fvLo33dXBGBOItGeeTMTlvKmJ6V8=;
 b=q3vDQcJTyoLD8y1+R0a+tivI8N48i9V6V5cskNlkUcf16eQAQosJHsi+gQQbPDAV+4
 +QQ00ReP4A7sGvhp6U0IkFSXFzvVO4avs5s0nQh5SBKK5b09BYcbtW+qhcpJRCwIM1/J
 4FjBs8nTbKxwqC1giOKGZFMbwgsfZyBGSyA+BEibRoCMOiEN4D5jRDRxtfYP2py6GJ3N
 4q+RdJUzWObZsONUVsPIjRDzzSUvB0Mke22ZApcD8eT3/SpX6zND/IhdQPfalzDzonZ2
 EaOSZ5vurfX6bI8l0AkKLYffwKXAkTExyim2RB0Xf4+jJ+VFxg21z1g/mpFq/XRDX9At
 8K/A==
X-Gm-Message-State: AOAM532rFKEbG7dF1V/QlavPB5JUNxQ7gR23S4s9GxjffIsN3lYVhrQo
 1K4H4XVKts7/vemdgLZjFQ==
X-Google-Smtp-Source: ABdhPJxOBzEWcjzqY1jgrge+hg8TP2rhGj/XCO23lR/mV1xoV5nDbiL0wG8OasuLd+XsdY+e9N694g==
X-Received: by 2002:a05:6870:f713:b0:d2:8adb:aaeb with SMTP id
 ej19-20020a056870f71300b000d28adbaaebmr7118602oab.111.1653085908584; 
 Fri, 20 May 2022 15:31:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j5-20020a9d7685000000b0060afaae0e34sm690705otl.0.2022.05.20.15.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:31:47 -0700 (PDT)
Received: (nullmailer pid 371624 invoked by uid 1000);
 Fri, 20 May 2022 22:31:46 -0000
Date: Fri, 20 May 2022 17:31:46 -0500
From: Rob Herring <robh@kernel.org>
To: Tim Chang <jia-wei.chang@mediatek.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@google.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Roger Lu <roger.lu@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: soc: mediatek: add mt8195 svs
 dt-bindings
Message-ID: <20220520223146.GA371569-robh@kernel.org>
References: <20220519060924.13493-1-jia-wei.chang@mediatek.com>
 <20220519060924.13493-4-jia-wei.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220519060924.13493-4-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_153150_631734_F79CC89A 
X-CRM114-Status: UNSURE (   9.78  )
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

On Thu, 19 May 2022 14:09:23 +0800, Tim Chang wrote:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Add mt8195 svs compatible in dt-bindings.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
