Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACC3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 23:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B5vqZBPha6mUZWvy7YwZgnUsezY2xFGxB1eIDXioHmw=; b=UZcku2liFeWotT
	xWF2yquIjfh2JXZT/aPW5rfG9/sfng23cnjJV5w2ooD5Xtd5nogUt0/uhz4PZIRvinyrZ2MhuVvWG
	ibRyB2G5IXrS/UefKdLydOhxYyufmcTl4A31bF28lJH6+RQNBhPnoXwubOOYQNgpGSv9PG9IIopOD
	o2T0k2g6EiBQYVP/UlxAsmL8N5c8mqM43b7+EuAupulLPnJkP8ZXBd+xqQDAawNlxNUIvzRa5K2Ep
	CC+ipg+LHabA43RrjsNkV2QfQRoyirHy+LamrWZ0QVRBDSIHzGkj11w5doW7Q5blaI0JcKaqrHc3X
	ZOQLQwcwXp8quczfKPYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nF2sn-00DqZi-Ot; Tue, 01 Feb 2022 23:48:21 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nF2sa-00DqUh-Er; Tue, 01 Feb 2022 23:48:09 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 w27-20020a9d5a9b000000b005a17d68ae89so17820580oth.12; 
 Tue, 01 Feb 2022 15:48:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5RUplZRfk9YiyZU4EF15hHG6YA+dvhtsvLI3vOjO5F8=;
 b=pj1b9XiHt2mZmL1mxetVJJ3gn4NzpbMc/djzlG2hoco1IJweesvB+Q942+A0TOTmz2
 h+dQtGquFa2G2wMzrU/CaeodoqwG7iZYhiunlHXZVPjAwnoEM6ZuTYAdQuxsT8jaDr83
 ti+hCytIX3xRQxbslkAwYpxTDj29SWCZTV6y3+TtpCgjtmU0g3a0NuK9SIRgUGQmNsRw
 TaRVcBzP6DHI63APewvWJvun5aS7VoSLdtBtna0ZZLHit552n0uPv4D0lp6iaXUk56jp
 n8D9fa2sw+qBYD3e2r3gt5gbBfecssdetbga5haaZC+ByIejMKPwBZ0Ibzg+aiV+IfSK
 QQLg==
X-Gm-Message-State: AOAM531k3bnBGNIb9huhXP64tpIyLJGdTkm7jzULiB0m2rj3FWcc4HUT
 bxrJymatNRcBDSifOhjXBA==
X-Google-Smtp-Source: ABdhPJwEcIPJ/wlzFp18MRMmXG5x/PY4EflMK5dXNRpiHc3/DtsJc9VwDGSIe8m9lYbL4pWMuPPqow==
X-Received: by 2002:a05:6830:1dc5:: with SMTP id
 a5mr15290341otj.147.1643759286959; 
 Tue, 01 Feb 2022 15:48:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f21sm14562717otq.4.2022.02.01.15.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:48:06 -0800 (PST)
Received: (nullmailer pid 994944 invoked by uid 1000);
 Tue, 01 Feb 2022 23:48:05 -0000
Date: Tue, 1 Feb 2022 17:48:05 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Cc: angelogioacchino.delregno@collabora.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel@lists.infradead.org, macpaul.lin@mediatek.com,
 dkirjanov@suse.de, netdev@vger.kernel.org, srv_heupstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-mediatek@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, davem@davemloft.net
Subject: Re: [PATCH net-next v12 7/7] net: dt-bindings: dwmac: add support
 for mt8195
Message-ID: <YfnGtWZLujX6SWQD@robh.at.kernel.org>
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-8-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220117070706.17853-8-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_154808_525639_C9306435 
X-CRM114-Status: GOOD (  10.47  )
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

On Mon, 17 Jan 2022 15:07:06 +0800, Biao Huang wrote:
> Add binding document for the ethernet on mt8195.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>  .../bindings/net/mediatek-dwmac.yaml          | 28 ++++++++++++++++---
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
