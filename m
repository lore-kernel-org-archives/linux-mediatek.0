Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E75DC43467
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:07:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 286DD20874
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:07:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u7YAppNU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 286DD20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bY8uEhXzdUMPNtWeLJ0UTBKlqbA8+GwmsIeLrjUXAac=; b=u7YAppNUXdwalLn7M3Ime/rSG
	nmIbIunBnuOcbg7kFIpsMziylIlPKlOshVdGYq3eqPnyexmHqBqZQJZxRFlfoNGvNS0q8MPc8rHDo
	C1MKP62QkDOF7kZWMMggkTke9YyefRCHy3vPFi4eyAh4cqWK5RL+RUL8dW4QHAYumdDPrNrI1N+KV
	pPPHVCGKAqXFE7UZ8HvlN04YVpsCC+hrV0LpYELZ6PQB+Z50EuEVfvjdoVOLQmj9AbIvpnTIluoxj
	cVhsjpHyrE5WI6FhOWhSmaBSA9n55qrLBn/2cfLF2skHbd83PosPIOLDNfCltB17KySOIjANz4GOV
	faHeYeW3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTCg-0003nb-J7; Fri, 16 Oct 2020 17:07:42 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTCY-0003jw-10; Fri, 16 Oct 2020 17:07:34 +0000
Received: by mail-ot1-f66.google.com with SMTP id 32so3067197otm.3;
 Fri, 16 Oct 2020 10:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VOnUBlYCol3UnYmGYrGOQTrAlxbpurYNGe8gXF8RHnk=;
 b=n8bfKGdZepL05KuWXemcnQyZQBdtUQGglq8+hpEpH8XzxoV+9SgLjclfujIZm+Ax4a
 0M65sLKoUAm6CuPdxqEdVIsp13fYeJ6g6SlCF9nrrt2cSfYw7vDBXn+wIYDA7viwBANM
 ITv6wJ/wAdk3HT9YhI1mn0m8KIc5VkwbAYubdGG2NbvZ6qAkSXrWaU85GCry57tR/C45
 NomNGC/ApxKjZLIa79zWqfkbH4xEBLrqFH6iF/Fi21gDbD/JV5wK/qgO3C4sU6bUmVji
 YeL84aXsWLvWGBJLzz24RUE37KjLJH4aRjxPwLYa22/Ntac4zIIO7SguEuy+nM3Wp4MN
 YNFg==
X-Gm-Message-State: AOAM530njU2Z3kOsKnavbMmDC7Fg/o71T4PhcXHOouNNtcxlczQY8BVs
 jU/wkkHp39gPicGAI3nDRw==
X-Google-Smtp-Source: ABdhPJwg/aSdvLT6liD1DFywqtQD2ulJ09DrXmWwEbznkeBnRsDigukv0B1qfRnTkjDHe2MLKQ2teA==
X-Received: by 2002:a9d:bee:: with SMTP id 101mr3169477oth.257.1602868052731; 
 Fri, 16 Oct 2020 10:07:32 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o14sm1149734ota.63.2020.10.16.10.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:07:32 -0700 (PDT)
Received: (nullmailer pid 1583848 invoked by uid 1000);
 Fri, 16 Oct 2020 17:07:30 -0000
Date: Fri, 16 Oct 2020 12:07:30 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: phy: convert HDMI PHY binding to
 YAML schema
Message-ID: <20201016170730.GA1583813@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-4-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-4-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_130734_068729_12D91E7B 
X-CRM114-Status: GOOD (  11.90  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 13 Oct 2020 16:52:03 +0800, Chunfeng Yun wrote:
> Convert HDMI PHY binding to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: fix binding check warning of reg in example
> ---
>  .../display/mediatek/mediatek,hdmi.txt        | 17 +---
>  .../bindings/phy/mediatek,hdmi-phy.yaml       | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
