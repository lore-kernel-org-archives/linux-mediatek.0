Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF89FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 23:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5traN7ITJqQLIsXqZxrfqdt03Yo0fFSCLHA2irq9c1Q=; b=QZYTTNhBfY7u5n
	vuP9CCsGim331XtDt0+VZE91PusGbrhtxeUHZS1rSIypn2iTwffpiKxLBIMH4W1SX1yOE/zneuzRQ
	90Vs7qROL5tkp97ZmUIPD1kkzlDNSJo1J79z2PqoHsFteJq7kPeVnwmnXnwXtclDjxj8yhDevKrJb
	w/PQtoOPO/nCJMlmMsiWwzst9BJSJndThamfQ0PTZFu8Q3iDQQKjb42krjK4qt8q9KvP3ig+B/9VG
	z6U7Yxe9Z4CvzMjRcmsbhccU+FwzyC1gcxN3DL+lAYeEEzoSMjFX9Ng79DFnS6wKMM7LFGJzlNAxk
	2nH5kEh9NQtHpo+96ORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMT6-001u8t-Tb; Mon, 07 Mar 2022 23:08:44 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMT4-001u86-CJ; Mon, 07 Mar 2022 23:08:43 +0000
Received: by mail-oo1-f53.google.com with SMTP id
 r41-20020a4a966c000000b0031bf85a4124so19892809ooi.0; 
 Mon, 07 Mar 2022 15:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fkg7oi8ypJp3+djSvTk7y0jfuF9EzsvhVs0LqzzSRMk=;
 b=SV/Whvl4Ci3+nYNKm+PRM0bXuFLM9hjzcKQJNMd9CSslOUfxrxelOYuHA9aTWQom/E
 qoSb8biFP/7AAEfPuImdeyr2L37hnaPAoszj0Twn+5XIxJiSdVbblpY4Q9+ZUDP9WX1h
 KrbXbajVbb9RxE/S8s/fzKbowe5NtTDSK0kO1hrlQnjji3WfHOCabwSLpjWygmn2XVu0
 lnD1RONfEZO7DVANDB5y7578dVx8vW+oW7LgKO3XG6+cFE31gKwYAAAjm+5kKN/hKgqg
 zyjIEWQHMZhgNU2Ti9iN0pqucXhRUh7B2vDewUPSNvFWj76FCI3V+/3tkt1dCwE6/S/j
 GUPg==
X-Gm-Message-State: AOAM5328bpDmY6O7hZPCsiovJ1TnxfzPQ6N8kcQ9rqeWbO81omBY00JK
 1aMa/UicybfCoCX9stujtw==
X-Google-Smtp-Source: ABdhPJxGpHsR4FAyDmAlZgdhkDLM1uLBQdtWFxkHCiAQqC2M/strClCm8Qk47svh8X/NY+FmjRMLfQ==
X-Received: by 2002:a05:6870:e88d:b0:da:6cdf:60f1 with SMTP id
 q13-20020a056870e88d00b000da6cdf60f1mr728425oan.285.1646694521354; 
 Mon, 07 Mar 2022 15:08:41 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j25-20020a4ad199000000b003171dfeb5bfsm6144226oor.15.2022.03.07.15.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:08:40 -0800 (PST)
Received: (nullmailer pid 3431519 invoked by uid 1000);
 Mon, 07 Mar 2022 23:08:39 -0000
Date: Mon, 7 Mar 2022 17:08:39 -0600
From: Rob Herring <robh@kernel.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, daniel@ffwll.ch,
 robh+dt@kernel.org, fparent@baylibre.com, hsinyi@chromium.org,
 linux-mediatek@lists.infradead.org, jassisinghbrar@gmail.com,
 linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de,
 chunkuang.hu@kernel.org, yongqiang.niu@mediatek.com,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, airlied@linux.ie,
 matthias.bgg@gmail.com
Subject: Re: [RESEND V6 2/5] dt-bindings: display: mediatek: revise enum to
 const
Message-ID: <YiaQdyqSvw0Xz6Pv@robh.at.kernel.org>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <20220303065725.23384-3-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303065725.23384-3-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_150842_437491_8161E598 
X-CRM114-Status: GOOD (  10.07  )
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

On Thu, 03 Mar 2022 14:57:22 +0800, Rex-BC Chen wrote:
> There won't be more than 1 fallback for these bindings, so we modify
> them to use const instead of enum.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 3 +--
>  .../bindings/display/mediatek/mediatek,ccorr.yaml           | 3 +--
>  .../bindings/display/mediatek/mediatek,color.yaml           | 6 ++----
>  .../bindings/display/mediatek/mediatek,dither.yaml          | 3 +--
>  .../bindings/display/mediatek/mediatek,gamma.yaml           | 3 +--
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml  | 6 ++----
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 6 ++----
>  7 files changed, 10 insertions(+), 20 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
