Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC96C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 00:43:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B47212CC
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 00:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cASmv968"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1B47212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6x0IFq+kxfq8WR5k5uub0pqhSpANXDpy0vVtGYZeg9w=; b=cASmv968jtrYdsbdVYMwH3xdI
	P0h6goDjwKjW1TJHpOLM84/o88aRWSHlZSAPnQtgq9+1EVc0mBY6l/M1MkNZhvJQ+QqpRvL63rCCe
	ehsvtwf2QmAtm2qgBXu2w1AEM3+O7l6cuT/VjsHXfn6F4ytoHXH1L6U+9Mwb8DEYoy371rBuxxYXQ
	22QIJBRAZzoSawMGjxVhR7E0tr/cNsMWcTsilhCdJZunpYasOWX/Qon0FR0jTvnHhJjwNdIIE8pyf
	DGZ+d9dN8PbaYLlKNocnISGMBDK9sWlJQ8Fty7VHrLTKoVJGoJjbPudoM2S0qVq1FT2OA26hNEYmg
	pnmbWFSVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHz3d-0006zO-SH; Tue, 15 Sep 2020 00:42:53 +0000
Received: from mail-il1-f193.google.com ([209.85.166.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHz3b-0006yS-C7; Tue, 15 Sep 2020 00:42:52 +0000
Received: by mail-il1-f193.google.com with SMTP id t12so1406218ilh.3;
 Mon, 14 Sep 2020 17:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ljTivD9aPg+KhnR32N2OLptR9gt/0CpuWiMcqWyJCeo=;
 b=KrjnywTg5R95SG9Udf10FruNDHYSXs9g8huDvkhC9wQ/8qGj5bpDbZ095sKAkOco+P
 6YuBpGqO6jLJcv05pz8pKDTS+Ze2qJwxemC9CQAKlhTC82aMF+fer0F03E20+pBC0z7O
 x7rz82UYyhTNRgZfxSQsiZLmI3TwtN/lmeKnjkYSilKEMWyOf6N8HixT6f21nc0i8rNL
 ML7z7fBxpogvG4OUX274PSTWtw0lCnEn2wC07yvOEBSJvSgdbVjgf0L08/N+pQbNKQHF
 xPKShkMUGeVWxFF5aubiN15VADpon2zhDd0fywFPtIUAUKAyKErpY4Bt3GZOLvuWKPwP
 JPkg==
X-Gm-Message-State: AOAM53106susNGgGpX/KFvLTNqSs4EPrSulK5/Ia5z2f0XANhVHaIaZS
 Vp/0y2aybV4yoXEVOKCg/g==
X-Google-Smtp-Source: ABdhPJzUShX3XEFb2+9+p9Q90jl6hIT+CV75GSpVkzUUmQNVd40GkohHW2eQma8HdTG14EAHPUGGzg==
X-Received: by 2002:a05:6e02:eac:: with SMTP id
 u12mr9654359ilj.285.1600130570492; 
 Mon, 14 Sep 2020 17:42:50 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id m15sm6693979iow.9.2020.09.14.17.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 17:42:49 -0700 (PDT)
Received: (nullmailer pid 591961 invoked by uid 1000);
 Tue, 15 Sep 2020 00:42:45 -0000
Date: Mon, 14 Sep 2020 18:42:45 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2 06/23] dt-bindings: mediatek: Add binding for mt8192
 IOMMU and SMI
Message-ID: <20200915004245.GA591931@bogus>
References: <20200905080920.13396-1-yong.wu@mediatek.com>
 <20200905080920.13396-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200905080920.13396-7-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_204251_424667_70F71883 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: anan.sun@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, youlin.pei@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 05 Sep 2020 16:09:03 +0800, Yong Wu wrote:
> This patch adds decriptions for mt8192 IOMMU and SMI.
> 
> mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> table format. The M4U-SMI HW diagram is as below:
> 
>                           EMI
>                            |
>                           M4U
>                            |
>                       ------------
>                        SMI Common
>                       ------------
>                            |
>   +-------+------+------+----------------------+-------+
>   |       |      |      |       ......         |       |
>   |       |      |      |                      |       |
> larb0   larb1  larb2  larb4     ......      larb19   larb20
> disp0   disp1   mdp    vdec                   IPE      IPE
> 
> All the connections are HW fixed, SW can NOT adjust it.
> 
> mt8192 M4U support 0~16GB iova range. we preassign different engines
> into different iova ranges:
> 
> domain-id  module     iova-range                  larbs
>    0       disp        0 ~ 4G                      larb0/1
>    1       vcodec      4G ~ 8G                     larb4/5/7
>    2       cam/mdp     8G ~ 12G             larb2/9/11/13/14/16/17/18/19/20
>    3       CCU0    0x4000_0000 ~ 0x43ff_ffff     larb13: port 9/10
>    4       CCU1    0x4400_0000 ~ 0x47ff_ffff     larb14: port 4/5
> 
> The iova range for CCU0/1(camera control unit) is HW requirement.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |   9 +-
>  .../mediatek,smi-common.yaml                  |   5 +-
>  .../memory-controllers/mediatek,smi-larb.yaml |   3 +-
>  include/dt-bindings/memory/mt8192-larb-port.h | 239 ++++++++++++++++++
>  4 files changed, 251 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
