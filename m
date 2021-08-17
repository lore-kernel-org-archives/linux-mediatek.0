Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DA39C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 21:45:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DAEC61038
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 21:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DAEC61038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRSwu/W+RWyDDGy4alvXXKsckpfaJU38/ZtYCZEBLdA=; b=FQW3jA6rO9Hp29
	b+x9P+OMPp615kaXyfNRuqvk6ecBf57pU82cjortSU8wf0uS2KYI2n/dl7nuVOvD/iyHh0thPyLL/
	3qqqAWc3GSJL5g0QZAm+xDHKlP2avC1anGDQ6UyoVdG9AVjbqmywl6me0Hk/OgFpnEhk8MKkXQ5CO
	vPaHyg9CqCybS6l0PLVtdD3UkiEF9t1hLdqLn9iBCsptxYbAsy9sB8eoSEPNJj9kNGA67CRd9kWYQ
	Odv5GOJ5SeBie44k3E8LkaFsfiCR4lxFrwq3rrOyjqkK3rzB8l77KfNyMgLgU9SfZ9Eh6BD8+YvQE
	304GCqhracpDCMG6fjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mG6tR-003Zsc-G4; Tue, 17 Aug 2021 21:45:09 +0000
Received: from mail-oo1-f42.google.com ([209.85.161.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mG6tE-003Zpt-BP; Tue, 17 Aug 2021 21:44:57 +0000
Received: by mail-oo1-f42.google.com with SMTP id
 w2-20020a4a9e420000b02902859adadf0fso88819ook.1; 
 Tue, 17 Aug 2021 14:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tJbXJaO1S8CDBHolXnG0pNdqRsTOC5L9HS9uoBlFyko=;
 b=gEBHQ59yZ3kqZS4Y4+15qyxA96Hn4Ho9ooG9I4BJoD6t6cQgWib5LB2fYNWGeoOF6m
 SDAfIdk0C9oZiuBFbOrbKuY4FLtOu+g0LjTrhgdhjzCpxqhOiYZxGbFMFyUQ384EqsFr
 Xiekz4eBH7IuPlQBr2l6bGrgRpCOmEGs5JqHL6ajslFuRMZvziccvW8UDL38T6sZI/79
 44CXTkWX9R5UmJPXIlLKopRrOcGZUvjHNg1MPTJnVXC2F74jrZebY8lsi6cVgrVHTeAx
 JRYPaG5B7/APdD6X06IYY3093OJTDK+YQkTCDs7eAd+kDAgfWJvulGG1Qb8Vr5lBPSk8
 k5eA==
X-Gm-Message-State: AOAM532nMtc2YJIOwDNm/rV2W9XenefYGtucbUVQVdDqvFzPtVFWJq5w
 35+Dn3bN46NFk9gA3bo9uw==
X-Google-Smtp-Source: ABdhPJwR5dd5wQ/YDvk31PYwnhKCj+LV9fYj+okbAgVw5jhjaeHzx9gGBJxGwPQRMUTxP3PjUVi0XQ==
X-Received: by 2002:a05:6820:61b:: with SMTP id
 e27mr4117053oow.68.1629236695061; 
 Tue, 17 Aug 2021 14:44:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k16sm668797oor.16.2021.08.17.14.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 14:44:54 -0700 (PDT)
Received: (nullmailer pid 894487 invoked by uid 1000);
 Tue, 17 Aug 2021 21:44:53 -0000
Date: Tue, 17 Aug 2021 16:44:53 -0500
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: anan.sun@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-arm-kernel@lists.infradead.org,
 chao.hao@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 srv_heupstream@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, devicetree@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-mediatek@lists.infradead.org,
 Joerg Roedel <joro@8bytes.org>, Tomasz Figa <tfiga@chromium.org>,
 Tomasz Figa <tfiga@google.com>
Subject: Re: [PATCH v2 02/29] dt-bindings: mediatek: mt8195: Add binding for
 infra IOMMU
Message-ID: <YRwt1f6UBL0zoxF4@robh.at.kernel.org>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
 <20210813065324.29220-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210813065324.29220-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_144456_434641_E0436BE8 
X-CRM114-Status: GOOD (  16.65  )
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

On Fri, 13 Aug 2021 14:52:57 +0800, Yong Wu wrote:
> In mt8195, we have a new IOMMU that is for INFRA IOMMU. its masters
> mainly are PCIe and USB. Different with MM IOMMU, all these masters
> connect with IOMMU directly, there is no mediatek,larbs property for
> infra IOMMU.
> 
> Another thing is about PCIe ports. currently the function
> "of_iommu_configure_dev_id" only support the id number is 1, But our
> PCIe have two ports, one is for reading and the other is for writing.
> see more about the PCIe patch in this patchset. Thus, I only list
> the reading id here and add the other id in our driver.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
> Change note: use "contains" commented from Rob.
> ---
>  .../bindings/iommu/mediatek,iommu.yaml         | 13 ++++++++++++-
>  .../dt-bindings/memory/mt8195-memory-port.h    | 18 ++++++++++++++++++
>  include/dt-bindings/memory/mtk-memory-port.h   |  2 ++
>  3 files changed, 32 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
