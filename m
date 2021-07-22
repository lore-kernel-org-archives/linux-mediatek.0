Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1DFC6377B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 02:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B79E36023F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 02:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B79E36023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dUDMb/tc9K1a6KPPhWUCK/3E3btuALk88XkslucXVg=; b=znnlnCXyjSsmMJ
	b/d8Q0jVGZP1iuZ0S4sWF45wNHUAV1hega7I5Fc9fbp7hHd62bC1mMY3rAcjHP3KrBcueXFJHzXcM
	gDGvoqYwiDQGzE1GoCCpKFGcx6LaEpyX688wi62l5UqmXw0TP6qCQTTSj+epOoJatLTwBgNs5YkEt
	ZBg8OkWVuhDfkXQ71Y5ge0P2MnmVkPlpmYm3t3QtU5SmzfKgw2AflRqtMuuBKPQDUgQhdan/lDqus
	Z/DdIkK5yzDYxgmfVlCq6QBTR2Z7Bt0882CqrACKim4T5c4jShL+s5wiwOFsqIZCU6RsU+e2JAdqm
	MGPKct91B0PvALOSMC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6OoV-0003hJ-Do; Thu, 22 Jul 2021 02:51:55 +0000
Received: from mail-il1-f170.google.com ([209.85.166.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6OoS-0003fx-VT; Thu, 22 Jul 2021 02:51:54 +0000
Received: by mail-il1-f170.google.com with SMTP id a7so4109574iln.6;
 Wed, 21 Jul 2021 19:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lsMmdb3RACH1JkoBJG5sGumKb94IlRY0tNHad0u0PRI=;
 b=lb0U9cKhNxsXx782dqTSbl0Xhq9Md+wMtzdlFyYGwxCGgiA8mHwKA6MN0/biOU87dM
 CAbPZYLez1E1ph7LTolUbnIf7cEWe8W18V3inCteAAscFArkKxyLeaUI78LV+CUIWsLL
 rWIb1xhtU+Z1kk/WHIP5ohoZyEZfZ85hZZWXdoGCKjGj9/6o1+byLY4Tt46ZEaVS6iQG
 Jdry+8ewdFEQpnFKdsb/RBUIi8MDfbhXRPFHPJuLToQYqg8M1FMRq5Y+SwaRRHRUCpKv
 u4aiG8SKHshbndwiGTB7WhfQbSRbnL11POOBrcVRnsEIU2m16Z9EacHEKL70RybUsQ2v
 9eHw==
X-Gm-Message-State: AOAM5328WSRv5pKh7SBMJEv8IhJEJKa2kmcwW3L3gr0mgiSuONsb1OP8
 m7pAUrHriQ+XokzoppMDSQ==
X-Google-Smtp-Source: ABdhPJzmZE18IFaBDdOlrhlpnBJ9AsAYn8ZvXINaR6JGQ41ByUku4NHP3Ts8jbSgGijUtBKOGvhjJQ==
X-Received: by 2002:a05:6e02:1a8b:: with SMTP id
 k11mr26794183ilv.136.1626922312055; 
 Wed, 21 Jul 2021 19:51:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id l9sm6060802iln.12.2021.07.21.19.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:51:51 -0700 (PDT)
Received: (nullmailer pid 3204306 invoked by uid 1000);
 Thu, 22 Jul 2021 02:51:48 -0000
Date: Wed, 21 Jul 2021 20:51:48 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, srv_heupstream@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 ming-fan.chen@mediatek.com, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 anthony.huang@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
 anan.sun@mediatek.com, Joerg Roedel <joro@8bytes.org>, yi.kuo@mediatek.com,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, youlin.pei@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/11] dt-bindings: memory: mediatek: Add mt8195 smi
 binding
Message-ID: <20210722025148.GA3204276@robh.at.kernel.org>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715121209.31024-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_195153_054161_D66EE94B 
X-CRM114-Status: GOOD (  14.38  )
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

On Thu, 15 Jul 2021 20:11:59 +0800, Yong Wu wrote:
> Add mt8195 smi supporting in the bindings.
> 
> In mt8195, there are two smi-common HW, one is for vdo(video output),
> the other is for vpp(video processing pipe). They connect with different
> smi-larbs, then some setting(bus_sel) is different. Differentiate them
> with the compatible string.
> 
> Something like this:
> 
>     IOMMU(VDO)          IOMMU(VPP)
>        |                   |
>  SMI_COMMON_VDO      SMI_COMMON_VPP
>  ----------------     ----------------
>   |      |   ...      |      |     ...
> larb0 larb2  ...    larb1 larb3    ...
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/memory-controllers/mediatek,smi-common.yaml    | 6 +++++-
>  .../bindings/memory-controllers/mediatek,smi-larb.yaml      | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
