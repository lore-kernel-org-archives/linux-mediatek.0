Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB878C12002
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:49:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0F861106
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 23:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0F861106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJz7xXSl63Zcy0fITqVuzqV8MzS7bMe4SuC76nDCRGI=; b=yTooIXQZKPgjqS
	bd5ppA6jgnlwIdc7tlEIe3endnjh0xFzcR2aO/AsDQ6QftvJWLSCyedTPnDWu4DOaY974Y9JpH0E1
	9F583KB2XmPNYGijBgxYDNwq2mRi8itpeeVDpRUx+rG1zxCVu5OJAWnUQ9qIwziJOpk+tO0zzv7gi
	5luHmWnPYovM4pMegmdjOD6MuWa7Nq9P7swlKp9OT4E05Qp4NVIrxeJt/xoq63qHQkCQacMcRMu9R
	BdoUH6VqMRykJXYawqeBEIxFrEBgOV9D+eIUkaH5w7xdKAB5xwtz8qMLKKcq+/Q8BJ22eb81NGNzQ
	b4/jOVcTI4BdrnyHiCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3occ-00GQS5-DM; Wed, 14 Jul 2021 23:48:58 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3mAp-00FJ6d-Af; Wed, 14 Jul 2021 21:12:08 +0000
Received: by mail-io1-f46.google.com with SMTP id u7so3880539ion.3;
 Wed, 14 Jul 2021 14:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u0T8yxk3ADHwBjHH2WxpSHI7hYdlroWexCd530t9WFM=;
 b=LtgRYETtv2Rb5XsJFAsO+cZ+xzir93fdP3TdrykBgxtts1Qwms8shtKY3NNwyQTAx+
 0tMIGNxL5pvU10a5d0/R8Zq9caC45jVfD1XvYAM5ieentJstPwKYv0v9cHzAr86W6GcX
 U6taxGNwZdq3iCbauUMdlyn3PiQ045KuKBMR7inSvJhrTUd2LidzNADk0MCFeFDoly8Y
 5Ue+dZThtNzlGig8SESXHeD5ahW96bTzhgmsAkiE9/WgBD5IcPKqYVi+e0FP7YUZEdz1
 W1MI0mG7GjdivFckcs0hyCRfoQ2wU8rNCrW2gAQsJ7wfMAXi4Z946AERQG/FN5cMcr1Z
 trKw==
X-Gm-Message-State: AOAM533lXgWlM5X+h3Ye7q7UNaG77NPOivXmX5/Q9SRKdXL69JkItYYs
 IRH2oRtl6gonXajT0F736w==
X-Google-Smtp-Source: ABdhPJwZWyyb2dpNruY5IFtlfTSV040Z1vLqwIxyzwYdK/m+mJL5npLfz6lMrc/RXg+/pntDInkeoQ==
X-Received: by 2002:a05:6638:218:: with SMTP id
 e24mr227669jaq.38.1626297126510; 
 Wed, 14 Jul 2021 14:12:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id w8sm1732316ill.50.2021.07.14.14.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 14:11:44 -0700 (PDT)
Received: (nullmailer pid 3531794 invoked by uid 1000);
 Wed, 14 Jul 2021 21:11:38 -0000
Date: Wed, 14 Jul 2021 15:11:38 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Evan Green <evgreen@chromium.org>,
 linux-mediatek@lists.infradead.org, anan.sun@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 youlin.pei@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Will Deacon <will@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Nicolas Boichat <drinkcat@chromium.org>, chao.hao@mediatek.com,
 Tomasz Figa <tfiga@google.com>
Subject: Re: [PATCH 01/24] dt-bindings: mediatek: mt8195: Add binding for MM
 IOMMU
Message-ID: <20210714211138.GA3531732@robh.at.kernel.org>
References: <20210630023504.18177-1-yong.wu@mediatek.com>
 <20210630023504.18177-2-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210630023504.18177-2-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_141207_419537_AA1DE46A 
X-CRM114-Status: GOOD (  19.10  )
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

On Wed, 30 Jun 2021 10:34:41 +0800, Yong Wu wrote:
> This patch adds descriptions for mt8195 IOMMU which also use ARM
> Short-Descriptor translation table format.
> 
> In mt8195, there are two smi-common HW and IOMMU, one is for vdo(video
> output), the other is for vpp(video processing pipe). They connects
> with different smi-larbs, then some setting(larbid_remap) is different.
> Differentiate them with the compatible string.
> 
> Something like this:
> 
>     IOMMU(VDO)          IOMMU(VPP)
>        |                   |
>   SMI_COMMON_VDO      SMI_COMMON_VPP
>   ---------------     ----------------
>   |      |   ...      |      |     ...
> larb0 larb2  ...    larb1 larb3    ...
> 
> Another change is that we have a new IOMMU that is for infra master like
> PCIe and USB. The infra master don't have the larb and ports, thus we
> rename the port header file to mt8195-memory-port.h rather than
> mt8195-larb-port.h.
> 
> Also, the IOMMU is not only for MM, thus, we don't call it "m4u" which
> means "MultiMedia Memory Management UNIT". thus, use the "iommu" as the
> compatiable string.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |   7 +
>  .../dt-bindings/memory/mt8195-memory-port.h   | 390 ++++++++++++++++++
>  2 files changed, 397 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt8195-memory-port.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
