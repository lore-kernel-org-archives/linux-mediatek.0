Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1D0C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 14:54:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97C7764E9A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 14:54:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97C7764E9A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f6UzqHbXCWUEHPk1yNvyTOP/nnuyfMIv+lYB9GE5Hzc=; b=QhJszR+qEp5zOrr5FIASEsS5x
	rwqoQZpbhhg7Wr5C+yd3zJSUle47PCC30MkyY7Ul+0HRSFmOdUl+tsvBM/qN43e1eDoSEpwGQvuYN
	6PT7kkYWd1dyNsPsLK/OByFzQnCOMjFMtkS/C/RApOrQvjsI7tOkP2pIfawTjijUXNfr6e4wHQr7m
	1IubqT3JzGsx+TuA+UL/A5LyUlHlUoVGSjE22YVte8rMYHIYmT3L4in4Dm+qQOiQ0WwnEiNwVH2SD
	lks8hUxwyRspPoE+hAbJcF1urygLR7EfZVrWomyJRWr6rpxDg3oPPnpDy8o6HCKVJzflWMWCbNiH0
	YG7Z1H10A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6ab4-0000bj-7y; Mon, 01 Feb 2021 14:54:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ab0-0000as-Ob; Mon, 01 Feb 2021 14:54:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80B7F64E08;
 Mon,  1 Feb 2021 14:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612191269;
 bh=UfY3ArU2Ba52g7BMgBfvsVQ2y0huUNSig9ApYXP8TIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ulg+rsdevXRtCjtTFGOizv2sb4y2ls4EABbPyo9gn2WsK0n6vSp6Na2wilJ5T5C0m
 hK8/LsVRjMUQ+Aa+l+vRce00wC3jqhrVTXlZUgaMHnxcgp/kH+mC0fj/JXC+InheOY
 y7UjHKCM553yfX5RjpOE6MnP8Gz/jLjFS8YLb4RkzK8r4RQv+/6W0uJiBsZB4BaOjz
 BFJDSELZCG/g5ezyx7N4LFcjaaXXvRHoLCyO4SKbB67p1jOrG7dvwUBmGGuhT9NwiT
 +pvv1lmrEIC2y1CrJsa7PUN3NzkH77p+147UW3/uy5+jPO4ZHz2gkWwxlXCxRWDio1
 AwGMEZD4oK6Mg==
Date: Mon, 1 Feb 2021 14:54:23 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 00/33] MT8192 IOMMU support
Message-ID: <20210201145422.GA15263@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_095430_890443_63586CDB 
X-CRM114-Status: GOOD (  13.41  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 07:18:41PM +0800, Yong Wu wrote:
> This patch mainly adds support for mt8192 Multimedia IOMMU and SMI.
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
> Comparing with the preview SoC, this patchset mainly adds two new functions:
> a) add iova 34 bits support.
> b) add multi domains support since several HW has the special iova
> region requirement.
> 
> change note:
> v6:a) base on v5.11-rc1. and tlb v4:
>       https://lore.kernel.org/linux-mediatek/20210107122909.16317-1-yong.wu@mediatek.com/T/#t 

I've queued this up apart from patches 6 and 7.

Thanks,

Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
