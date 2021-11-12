Return-Path: <SRS0=l5E7=P7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE1EC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 13:49:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0137D61076
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Nov 2021 13:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0137D61076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aRerId72IazddTIWhqH4FiC92gifKpr/MxK+LuKC1sc=; b=rz9UL3yy2gzrMi
	S79N/J0YdTjF2+AZeXp+rqt7v1003u4zAvSr31BCS/AeGbNJU4r6erRlH8MCJ/LMpGdo19hndYmdw
	wGeMZ+98ykIR9wht7J124KxaeaRaXBuu7ItENq2UCBOs328cIpjR3rNTZaTaBsH3qP0byEND+Ci8O
	Wq9Ghaewxt5i1z2JHmcmat7ncJ/gVXQq81CobrAATWGSyfdyXXyjc5WuVQuzkHSumw3+uTh6UfCsU
	kAeUL+HGsPfo/mIWwOC9r6A1aYpMXJOzFKfHvmDommtVkm6fEq82F5WKbZPtf1LuvJ4MsfH0N5tI2
	zxLiTQA2w0Z6Oy87sSkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlWvY-00Ae0x-CQ; Fri, 12 Nov 2021 13:49:12 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlWvL-00Ads1-L0; Fri, 12 Nov 2021 13:49:01 +0000
Received: by mail-oi1-f178.google.com with SMTP id u74so17952963oie.8;
 Fri, 12 Nov 2021 05:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=lfnFk0Vk2nlPX6zE3Xuo6uqEuasd9Rkq/bqEgF/SFTA=;
 b=onCcLmykyO9p+95r10LaXMGqRoiIdSXne2c+iurkjU//k/7JH0EsJf1rm1f29vysKD
 UfKfo8fWNmMOnQokTSWcGFyRnPfbVYnluCL9VTR5iR8FUIdqFc+qf/MqxgIw5WixuieN
 3pkCnzXCxM1V0ZZNPCOGn+WVloxYhv7lVRBivkLOX/hXeYYlcv7LgPgYjqPaPxmP7JX9
 qem8n0Ul2K3rpDDnCzcZzqg3cl7jxT2OcAf02MJx7eyzKCoFPXS+OcuB/iYqfAcUjLNa
 YQc710PQIycR5D7qM4/Jnv6qzVUNHV6Y2iVbuBgwhiepnPYg8yMA9yBOrIkZZnLefMJ0
 zNsw==
X-Gm-Message-State: AOAM532nOxR2cxbGFjigOxPhajyaqTb21fRGH7WF/jcLeQH4sdQxQsk3
 9Tynhfq8Wien5f72xFvYMQ==
X-Google-Smtp-Source: ABdhPJwYvgxWt2U6crFb5cYgShEcV2k6Ksx10uPU+Y41+QNrwmhXTQw/q/at2PcM13hNbmCaEt2ZHA==
X-Received: by 2002:a05:6808:14e:: with SMTP id
 h14mr23166380oie.28.1636724925287; 
 Fri, 12 Nov 2021 05:48:45 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id h3sm11658ooe.13.2021.11.12.05.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:48:44 -0800 (PST)
Received: (nullmailer pid 2463377 invoked by uid 1000);
 Fri, 12 Nov 2021 13:48:37 -0000
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 davem@davemloft.net, Jose Abreu <joabreu@synopsys.com>,
 srv_heupstream@mediatek.com, Jakub Kicinski <kuba@kernel.org>,
 dkirjanov@suse.de, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 macpaul.lin@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20211112093918.11061-8-biao.huang@mediatek.com>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-8-biao.huang@mediatek.com>
Subject: Re: [PATCH v3 7/7] net-next: dt-bindings: dwmac: add support for
 mt8195
Date: Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.173620.2463376.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_054859_742576_D56C4CE5 
X-CRM114-Status: GOOD (  10.94  )
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

On Fri, 12 Nov 2021 17:39:18 +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 86 +++++++++++++++----
>  1 file changed, 70 insertions(+), 16 deletions(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554230


ethernet@1101c000: clock-names: ['axi', 'apb', 'mac_main', 'ptp_ref'] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: clocks: [[27, 34], [27, 37], [6, 154], [6, 155]] is too short
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: ['mediatek,mt2712-gmac'] does not contain items matching the given schema
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml

ethernet@1101c000: compatible: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/mediatek/mt2712-evb.dt.yaml


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
