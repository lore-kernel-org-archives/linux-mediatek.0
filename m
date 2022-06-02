Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC034C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 13:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7Aht7VPQrstE5atO60haJvT/it+ai5pbViGK2vJ688=; b=1TcrdZc9uRwegO
	Uw/xjrnEZ4xZRmxGB+MPJqFr66sQ9UHzLBNFJL1g9c6i2qc8hQCjNaMx5uR5iNqobUwhWCmU9Dcbx
	VH7u+Gn6/xbZiJXviX5pBnJbm6aYFBAiGenMbxzg/b1zxzR/cPwr0x6jkQW5vJRswD25BEhHG+68M
	STCoBsIPHeFYFxT17GpmWfivao0ebmHgaT+jff21AYesH7Q9BDNm1HMR8apNwitg5zwxWK5sIa+gf
	hrJPhD+E9xInYPOXO5mYe/6RivHJz3W2Qc5vZeZOTkdNieC/nPl2sMaNqH5zwhL+qzQWApr0wtaqA
	pbyMWvzH9xERLKHgXDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkVR-003JXo-TF; Thu, 02 Jun 2022 13:04:53 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwkVO-003JVS-Pw; Thu, 02 Jun 2022 13:04:52 +0000
Received: by mail-oi1-f173.google.com with SMTP id y144so1331073oia.7;
        Thu, 02 Jun 2022 06:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lUqVqrJP8hpf0KLUEUTHZhE9DaMt/u7RwjOLvmeIQa4=;
        b=h6myyCr0GSztyZ6ZIYC4mleCVaQzjcUZbD3avSiZSk48BslpDiouSjjfKVZnDDAUCp
         0slzXBN8sEf3KloDYO2me1bEfkshzOul+0oXhp+7giDaHZoWsueARtAj4xkGcF+4Vqe2
         67t80e/XXr6oiUsBPIyL06XuI6t/MZ6nMnH/N1A6yaZ4rShDtn6fJxfvD90uom63DBzK
         RxWlgCAMtmZqaj+xkJF7bFXM86McxQOkT0Fpa4XsuAL2siEcouurm6tNEbKZGlXrXfqI
         dlTKMMLz9oYyXFUpnreAenXMbehXM5206iJSoFdrGkIMJpqWVd3d85w5Z2/3dq0jrOxo
         C5mQ==
X-Gm-Message-State: AOAM5314H7kRSHpIqZx+zvDGox00qEyoer23bgM6cXUZCBN9ZOTVjmC3
	filmluR1VhYASTLSDlQChA==
X-Google-Smtp-Source: ABdhPJzCakeKGnP2z4QHnJMY/hAq5LuT05CQuOiettY954ZRY2sgkP4PmgjaCJ5DPW8q6LFib5tLvQ==
X-Received: by 2002:a05:6808:1407:b0:32e:1ad1:2d4 with SMTP id w7-20020a056808140700b0032e1ad102d4mr5048424oiv.235.1654175086977;
        Thu, 02 Jun 2022 06:04:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d6-20020a05680813c600b0032bbcbd59b4sm2338696oiw.17.2022.06.02.06.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 06:04:46 -0700 (PDT)
Received: (nullmailer pid 2106788 invoked by uid 1000);
	Thu, 02 Jun 2022 13:04:45 -0000
Date: Thu, 2 Jun 2022 08:04:45 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Subject: Re: [PATCH 2/4] dt-bindings: usb: mtu3: add support 'resets' property
Message-ID: <20220602130445.GA2106738-robh@kernel.org>
References: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
 <20220523090449.14430-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523090449.14430-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_060450_858131_25E21689 
X-CRM114-Status: UNSURE (   9.74  )
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

On Mon, 23 May 2022 17:04:47 +0800, Chunfeng Yun wrote:
> Add 'resets' property to support IP reset usually by top pericfg.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
