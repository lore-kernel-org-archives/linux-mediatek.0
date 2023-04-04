Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38411C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 14:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FngVgR0kh2xmJeYD62PuGFfghT3iglIWxN9KNtdB6gU=; b=v1AB0nYhgfOHXOOQPkGwHxcB+F
	rGzhyT7yJCpuidx3OD2Wj5Njof1BGhhk+nlvc2TrJmxkXTOXf3PBB+sgDVnvpuWHx3wno+DU4I9tb
	sxcCd4xcUG3wT8G6SJSEiKYWGxYrsuiA/7wC6bkaKCeJa5O50Mmmx+1SNew9AS93lRqcOLi+DhLa9
	Q0NGWYcRxS8LyCqeWlqsZBGpSluKFZspe/g27fHeStgfJlYsUtYdvKVotY5Dma8wavJHWVxnG5aKU
	pY79A1XiNbEfpH3Y6vDaUA7SHgOwpH0dFJ1Ye+WmIaVgtCOt9nlUsTcbWx6zkyDQ3h+uY4V10ahSm
	EqNhC4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhbV-001n98-0q;
	Tue, 04 Apr 2023 14:25:45 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjhbR-001n6N-1U;
	Tue, 04 Apr 2023 14:25:42 +0000
Received: by mail-oi1-f178.google.com with SMTP id r16so24249112oij.5;
        Tue, 04 Apr 2023 07:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680618340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FngVgR0kh2xmJeYD62PuGFfghT3iglIWxN9KNtdB6gU=;
        b=PuGS7iPJgFxNiruPd0pjtnh7UoX+hRWPKCM2lx9GehNHPMMMwznRdTH07C50lLgF+7
         ev96WJh6tUna/T2oQYO3shhS7qcUy33rEwV30o7aMG2btQugd2dDeQQJlbGI2mMFtrhA
         5K9/6L0spfP87ItIM0Y26d+626Lz8YLQ2TPAOjSmjMqB7qcy5NQElV4rnEXMNeSUKHST
         CCEFTxvI1iPCFUCgzQGvu372MBc0PNYjhsQ5EQsPdtxR9R5+yyOO4MZ/lS420UhUQP+w
         mD2Qn+4YrxMGcglQZelqQxKPWFrOqk37BJ/B/yxYfmGpFj0QOloPEmZHKYRmNALtKtcV
         9ujQ==
X-Gm-Message-State: AAQBX9dZ+inopqf8j0azufWBF2Ffl/19rei+Gf1HVjC8XyOJ7ItEe05+
	xJBh9NGgvVUK71NLZaf64w==
X-Google-Smtp-Source: AKy350ZV9CpqJhfEfjk+DmFTyAXO0oUmZ0qmOSthzq1gdjn+7THkuZ/x/QsxqP2i6BOETqhS06XA8A==
X-Received: by 2002:a05:6808:3a99:b0:378:9c1:514e with SMTP id fb25-20020a0568083a9900b0037809c1514emr1108299oib.42.1680618339120;
        Tue, 04 Apr 2023 07:25:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s25-20020a056808209900b00383b371f2a7sm5111928oiw.42.2023.04.04.07.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 07:25:38 -0700 (PDT)
Received: (nullmailer pid 3833881 invoked by uid 1000);
	Tue, 04 Apr 2023 14:25:37 -0000
Date: Tue, 4 Apr 2023 09:25:37 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: ti,j721e-usb: drop assigned-clocks
Message-ID: <168061833734.3833823.7201049539877639304.robh@kernel.org>
References: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
 <20230403191850.374839-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403191850.374839-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_072541_520774_39A0B591 
X-CRM114-Status: GOOD (  10.50  )
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


On Mon, 03 Apr 2023 21:18:49 +0200, Krzysztof Kozlowski wrote:
> The meta schema from DT schema already defines assigned-clocks, so there
> is no need for device schema to mention it at all.  There are also no
> benefits of having it here.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/usb/ti,j721e-usb.yaml | 6 ------
>  1 file changed, 6 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


