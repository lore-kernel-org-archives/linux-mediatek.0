Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD2DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aoLl38a49Ytc8F7mFoAyWkAOwbgRyjWQgRZBlbvUczQ=; b=IhrfwOKTlxodPN
	8mFAQc0JQy4xLfLUXc2YbdUkAoCphK/jn6ekDPt8bfQKchGjBI84ce9I3KBtLBmNzjwyE1HjbtKxg
	P6TchGHT9LjVa2MedaL9zfyoPbhvcpn8aedbz3f4DYvlmyc+6FAXAREMd+md4xCaB83WbPqJHkyZy
	AtZiG9XOc+qIIY7in5Xkz9W6xOrjIGLHM+RmWRs55Vh3k4w02Tbq55D5f5sJZy5EaZqupd3rbEHP+
	wMjjVhLDr0wpyISrXZHdDq8o3ZKS+ssis+2RijkVqozsfPYHOKE5FQLavI7ryLaIvDsNTpTlsQvvX
	m7Unkm0uXBI4iNkDZSFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9U3F-00FPFN-R9; Mon, 17 Jan 2022 15:36:09 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9U2t-00FP8G-Oc; Mon, 17 Jan 2022 15:35:49 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 g1-20020a9d6481000000b00592d01f2b6eso16179559otl.5; 
 Mon, 17 Jan 2022 07:35:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=uz9rWH9EExEde9e83L6Ci5xDXHmn67olZ/Bo1AaALIk=;
 b=kovswACzom6KoF6GvNUZtHmaL7x7OyFkdLvRwNt711DAgeWDDXdBL3rA7leZhd1SU4
 LRYdy3KIBo9S8heJiYssvlERICTJvqMtBwHjsj3HQSZRF+HMrKPKy4C3Jw0Y2vmgha4A
 8xyk8VhAkrvIvpCBcZLkYHf8TC/Ys/Idm2mj2dATPG9C9xrWFBFldpk9W1gpCbC3e/Lf
 184qSEkKanh7Dq0WX10fbnFkkyzXXa0BUDiAcILDaw0h7HocBMIGuHdLnY8RVh+ij6Nw
 QcYSlyiYwejOr0G4F91t9GZT93SZF1gqvSVvCvX8LzafhBqWNM9mHvHIyF7JIdiT5Gx3
 YVbg==
X-Gm-Message-State: AOAM533yEs9Ev5SJ065hD3fq29rXwXK0oRYr/GPlUKRl1m5JSThDAxyC
 QDSKJA5/voiTh7pm3Gugng==
X-Google-Smtp-Source: ABdhPJzAopoamav84cvKKv308QfSUylWTMQX34XDs9D8wI7eeXkkB7i7iaF0ajflyRA76l5dpV6RKg==
X-Received: by 2002:a05:6830:1f56:: with SMTP id
 u22mr9420465oth.138.1642433746928; 
 Mon, 17 Jan 2022 07:35:46 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bg17sm7015383oib.25.2022.01.17.07.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 07:35:45 -0800 (PST)
Received: (nullmailer pid 3923087 invoked by uid 1000);
 Mon, 17 Jan 2022 15:35:42 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, macpaul.lin@mediatek.com,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, dkirjanov@suse.de,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
In-Reply-To: <20220117070706.17853-8-biao.huang@mediatek.com>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-8-biao.huang@mediatek.com>
Subject: Re: [PATCH net-next v12 7/7] net: dt-bindings: dwmac: add support for
 mt8195
Date: Mon, 17 Jan 2022 09:35:42 -0600
Message-Id: <1642433742.934070.3923086.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_073547_823362_3C4F2F97 
X-CRM114-Status: GOOD (  10.87  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 17 Jan 2022 15:07:06 +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1580608


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: Unevaluated properties are not allowed ('compatible', 'reg', 'interrupts', 'interrupt-names', 'mac-address', 'clock-names', 'clocks', 'power-domains', 'snps,axi-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,txpbl', 'snps,rxpbl', 'clk_csr', 'phy-mode', 'phy-handle', 'snps,reset-gpio', 'mdio' were unexpected)
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
