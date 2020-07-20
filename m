Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9973C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 23:16:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E102065E
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 23:16:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O8ZXuqwq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E102065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ypMcMzF9jax4IvN+8GFsKw2JUDC2KTvqX+XOF3ufrVY=; b=O8ZXuqwq6K6hf3rWf7AyU2v7q
	C91713Sr1dHsjqoUTrQrSQWUdN6c7q4foJQpNAg5qTBAQ3NFzBaYNkbM4ydks33RWNbwjf2D4EH1i
	O5KDtCr5UZY5SnDLurnt4DWK/0XCMvKUUriRSdmKmoAqzpvZKtLMEnZMooSu+oRe4FBvBf3U6JBs2
	XOgIwruSu71gIy8Way6oIE5tWMQWdgRq+ZM6Ae6N0RdydxOgwuNpnwXCh98X6RC7cOKuCoGrmI6QB
	N4lz9z9sPP2rcbfCBnrShmhdkP0NCr9nb+Bc+xJNd236dakEaNFCYpF06ERPmPJ6AGyAI3wP4xAqE
	v8kqdvN5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxf1G-0000Tw-Eh; Mon, 20 Jul 2020 23:16:26 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxf1E-0000TJ-1J; Mon, 20 Jul 2020 23:16:24 +0000
Received: by mail-il1-f196.google.com with SMTP id k6so14812902ili.6;
 Mon, 20 Jul 2020 16:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rvvIyeI/O+OX0a15wh7KP70spFPqxmPPVr5citgRAhs=;
 b=KKWv1OuNqHB3lu4ZeXKdrPxP9SPEC+gjEb48YJgxvNXeBgYA2VK6s8dSRLTkFOGS3y
 9wC5HxofCAMmP4xkcGovIbwgzTjOGC86zfSnedZpVL3OI7wFdgbp41355s8BBerD2IAy
 aQwx5DcIVePCRLWVrhQZLwhpSWQ88rMrcUVw2vo+TW+yx7UQBoTGv5cEUuLBelawjl6m
 kWpGcEAukaJKai2J5hNOHkhhoV7bIfc+TZnX2Ua6otb2NLMmTcG52mB9wrV6xSTiHoxg
 OHiWId0BRrDQrNnkGWJK09sau1RowB+A8Q7ktnJJKTFtD61+PwiutFFphY32a6vnk1pf
 VM4Q==
X-Gm-Message-State: AOAM532j9EhBPKIDelOGc7EGe9M3aPCX0Smt2NsmmTf0GJ5ZQp8d87eD
 7HjATJhDgqvljX+tASIdMw==
X-Google-Smtp-Source: ABdhPJyshFo0omA3xHohlTk0hyWSZGLg6Id03dPze2mNf5c56JFT/g2414OvfN4EWj1udjb5SIybmw==
X-Received: by 2002:a92:3407:: with SMTP id b7mr17598958ila.66.1595286983360; 
 Mon, 20 Jul 2020 16:16:23 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id h11sm9515742ilh.69.2020.07.20.16.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 16:16:22 -0700 (PDT)
Received: (nullmailer pid 3136375 invoked by uid 1000);
 Mon, 20 Jul 2020 23:16:21 -0000
Date: Mon, 20 Jul 2020 17:16:21 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 04/21] dt-binding: mediatek: Add binding for mt8192 IOMMU
 and SMI
Message-ID: <20200720231621.GA3106350@bogus>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711064846.16007-5-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_191624_090467_AECC00D2 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 11, 2020 at 02:48:29PM +0800, Yong Wu wrote:
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

You probably want to use dma-ranges for defining these 
address restrictions. 

How is the domain-id used or needed?

Rob 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
