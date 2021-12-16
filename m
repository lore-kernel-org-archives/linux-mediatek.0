Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD4DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QxY1diTMKAbwg/m1XsaP0klI1Hsf2bXHllFxLHICS4=; b=oDXpf4NA9ltbmq
	su12xowpGiALl6fbeDAeaAv679Tlx8rntqfLTA6gONlOtVjtM/zOi8S3aaz0QTF9bnkCNOFJ7MZNZ
	62orygjZOfFKdS7PeUcfBp7thHjwhDmNFailSIlMFsY84UmJR+QHAhwY50RxVuw8uN+d1PMXtBLQx
	h4Lzme9FDBbUfnOQHdE7UUM6ce55wrWOEe56r/eJXyMxC17ZafCp/LvgTLNGTqJcmea0HgFJ92XDp
	G6Mz+kCPQ0F+f6jkFhhgPUQW8EjodKq3wEscruoeeRxdYxUX955iwg+E+J1k74yHA4Ux2+1TR0qCx
	rE3TPzEg7/YOxYnCg5Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxtCT-006SNc-J7; Thu, 16 Dec 2021 16:01:45 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxtCG-006SKF-RT; Thu, 16 Dec 2021 16:01:34 +0000
Received: by mail-oi1-f179.google.com with SMTP id q25so37188280oiw.0;
 Thu, 16 Dec 2021 08:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dbSG32y6ukLoqfqRo2sXQ+YKKGePZyrZXfU9tAawzpw=;
 b=IlyP02fU1KdNe1YiTdXyGym/YhhInZMYJZ8YoaXQvQC3EL9qSn4jqOeQgb8LbrMXjb
 gdGlRghTGTpAo6dL6shZRhVE5h3Q+cDk1WElGXHyGUNCHug4l0dX3mbAqcKMyNS/FW+R
 DZt3x/peWYVEpGUeU4wLKcEmve2dg+hJjXlofb14TLzR0OLux0FDbwcOZ+Y2hofJuHzr
 PISFacUU5Cys3tF3ErlRtj3h1zl9dd5MwOS4VyfdpvhVeSbe5USrDywY5KZNiFfj19a7
 8O3IfAuEb08nLQ/942TT7uk38+R2UUVhDG/NUN9S1thHPxTp/pFqFyd12O271NaDeEEk
 LP8Q==
X-Gm-Message-State: AOAM532En30XbBiQRitaHor8NW8UDlAE5wIgmqcxbxZWx6Gp+Z+v4U2x
 HJ1Bz9FHCeFmFE78GAZ8JQ==
X-Google-Smtp-Source: ABdhPJwT+stimIXyLjdj+CQr+hmRqN6GhTves5+Kg2E8pFUvFz/CQxyByaiN3nzlpTAMNrsQfGSp7A==
X-Received: by 2002:a05:6808:697:: with SMTP id
 k23mr4663881oig.18.1639670491935; 
 Thu, 16 Dec 2021 08:01:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x17sm1077566oot.30.2021.12.16.08.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 08:01:31 -0800 (PST)
Received: (nullmailer pid 298545 invoked by uid 1000);
 Thu, 16 Dec 2021 16:01:30 -0000
Date: Thu, 16 Dec 2021 10:01:30 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: davem@davemloft.net, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 srv_heupstream@mediatek.com, macpaul.lin@mediatek.com,
 angelogioacchino.delregno@collabora.com, dkirjanov@suse.de
Subject: Re: [PATCH net-next v10 4/6] net: dt-bindings: dwmac: Convert
 mediatek-dwmac to DT schema
Message-ID: <Ybti2mNfEVNWQWgM@robh.at.kernel.org>
References: <20211216055328.15953-1-biao.huang@mediatek.com>
 <20211216055328.15953-5-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211216055328.15953-5-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_080132_916800_F21A300F 
X-CRM114-Status: GOOD (  12.47  )
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

On Thu, Dec 16, 2021 at 01:53:26PM +0800, Biao Huang wrote:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> And there are some changes in .yaml than .txt, others almost keep the same:
>   1. compatible "const: snps,dwmac-4.20".
>   2. delete "snps,reset-active-low;" in example, since driver remove this
>      property long ago.
>   3. add "snps,reset-delay-us = <0 10000 10000>" in example.
>   4. the example is for rgmii interface, keep related properties only.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.txt           |  91 ----------
>  .../bindings/net/mediatek-dwmac.yaml          | 155 ++++++++++++++++++
>  2 files changed, 155 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
