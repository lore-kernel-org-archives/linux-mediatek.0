Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821D7C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 06:27:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A0DC61D0B
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 06:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A0DC61D0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nEnJByEWTJFOvtjhX9OUXeHHytEPeVonyHj5mhhsiCA=; b=h8FcqILEf8RTBuyoQ15n0VTg/K
	9JJXQJxySuhREkQfMaEJwXsBTUMCX59GnE2x6Y9im6vd31WXaV9Fi+MhD4RebzhtgQh/PVNmu2X5Y
	qVdyspvfkRMmq9P9ffE2i+1BSYTS4qoAfKDwDG8pMSv9643mBvGcswfNAw4sSfzgqAfci7S9Lyt01
	KLfhCOygAZCu3q17xGVGNbn5nPmo7fCMd6qCT5OfJlGgwwtEiNrXvHQHi+BVqvAsxr6cm/bREBxir
	qvnRC0oMsm4KxDfk0Cs20n8NJwDsfbvLFk+0YJOv3T2V/NrtOk9n7jRNMuA0XR5tXwLe9X7+wJLQj
	6MIaQtZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyTgQ-00Cugq-UX; Wed, 30 Jun 2021 06:26:50 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyTgD-00CufK-LS
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 06:26:39 +0000
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyTgB-00079y-4N
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 06:26:35 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 n13-20020a05640206cdb029039589a2a771so599503edy.5
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 23:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eyemzYiirXr0CnEJTypFgf/3fRZK1QJimxbVNA34t0g=;
 b=asNPEGowCODg8j1++sfnoNsS83dE1dmCiVP1vzIkGFZG628TgdQxPyTX7LzUCtIobX
 1TRkMIjMKGvmDTAdcA8g44tvmS/w4QO1Ppz0EdGEgcDRuEcPq/SqgHqIjIaKsqBFu5pi
 79ovrXi1Y0fCekhee9SaP9CYqNNSteCggUv5h89ik/j0YZueNa6JSGUoQQN/rvZ/PvLy
 kvSXXzlykhwK6Hse3QNyBJNvITeQcebLzmRbnAGNmArAp4BBaP7oa5SVbYM0msW/Rony
 ieFRRmF1+6mU31dxmZa4n4JiaILYfM/Ujc9WWogRb7RUbuUCdBATEkWdgDkLa/ANVjpf
 5bAw==
X-Gm-Message-State: AOAM530k5Phvj5gnshzGcO3dJ5PESANQdNu+ZfH1+jrMFosaHf1jn/yO
 j+F7v/c02k49M1NEIUsomfWhEvTw8BSzmnkRLveW/f7UX0xd6w9NRK9iqGQYDOoxpA2F1kFJZ+p
 Zg73oQv8o2g756McZK9GBxsUVeBGX+SVhiaQRKgD465LfexMs9g==
X-Received: by 2002:aa7:cd13:: with SMTP id b19mr3967852edw.45.1625034394754; 
 Tue, 29 Jun 2021 23:26:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFojo25I4HBBB+CxEut1LzXiJF0o/oIA/Lz3C0qxx65dhOyBiZgSqkJ1gbWex0mUY7C8o8FQ==
X-Received: by 2002:aa7:cd13:: with SMTP id b19mr3967821edw.45.1625034394573; 
 Tue, 29 Jun 2021 23:26:34 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id c14sm2792126edr.27.2021.06.29.23.26.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 23:26:34 -0700 (PDT)
Subject: Re: [PATCH 01/24] dt-bindings: mediatek: mt8195: Add binding for MM
 IOMMU
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com
References: <20210630023504.18177-1-yong.wu@mediatek.com>
 <20210630023504.18177-2-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <41809d87-0f1b-13fd-b565-26a17626aad9@canonical.com>
Date: Wed, 30 Jun 2021 08:26:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630023504.18177-2-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_232637_756302_51D3DFDF 
X-CRM114-Status: GOOD (  20.93  )
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

On 30/06/2021 04:34, Yong Wu wrote:
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

I understand this will go through IOMMU tree. Do you know about any
further patches for memory controllers which will need the header?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
