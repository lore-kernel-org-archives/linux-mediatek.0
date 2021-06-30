Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A72CC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 06:27:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E85261D07
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 06:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E85261D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0qZZZuj7X8Nfi/Jmx7OFBQB73KBGSgqwJFixmrdDxcE=; b=atHbDwxjhU5zhQlEcr+crpOYII
	jFRDfCrB/8fyDmCUk3xe0clmTY5vW7je/dQW3R9FBnCkVYfECpy4Knpvyds4u8kHwdz3hu7tvbuWY
	qsuRp1plIyoDL8Czy688XAiTd7FY0vf0bTyZMefBSgyXevY+/teUUUq0stwhhbSMLqWK7GqNsLkVm
	dIdZSDf8j6jbmQu/cT3tsOQ5suARe4ecUMPVqg4tyt55qGteGXU6L5Uzj0FRwV6Frm5hzHP9Gv1pb
	1m5mjOJYs9Gfne2Pj0c71R/4V8cQjRLdubRP3HH/P/6wzZtyBqQg1st3sbnWnbagJmHPSakhakkt5
	Ec3J/C+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyTh3-00CumJ-LU; Wed, 30 Jun 2021 06:27:29 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyTgq-00Cujo-JA
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 06:27:17 +0000
Received: from mail-ed1-f72.google.com ([209.85.208.72])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lyTgo-0007Fc-Lm
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 06:27:14 +0000
Received: by mail-ed1-f72.google.com with SMTP id
 p23-20020aa7cc970000b02903948bc39fd5so585329edt.13
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Jun 2021 23:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2nkD+uJbpxO3bUeNVNJ06+nPXq3al3hbepVix2nCh4U=;
 b=WDWquF4wHB4MUUc9GDA49ZX9lV/XwRtvBb1NO9Ozq4+HsOHLoH2kX87QN2HcuIBe9j
 +jOfp6BxVoitpUKy5w2YbHUKAYKlDxTOSmmr/SoiT91hPbb14+aMZs3asyhEmi1In6tz
 v2QNANKE50e2bKG86OWrzKro9Gblp+8kqqGPQ9MtkEr91n5devx8FnMl5H6DW9PuVraZ
 nglkowCkSpVLtOMOqfhoDu17Gd3F0rMwG4IAC8pxiD0+xjrE4XgtTr6Q0eygHwKxQzrB
 H/jkHtLZwZBzMVxqJbIkOJRKoXNRGk5FsB0hLqvsJ0hKDCX+EZKtmY3O9aF93DCjPB0J
 QAbQ==
X-Gm-Message-State: AOAM531ZCyKObeB8uUPOd+lLFGYRnT84/4y6BBrDmXjLgAWnO0wS27ZR
 YT41F9mCt6K4K0xUpVjG2ZCJYP7jyecVlKDKKDHZolsFzAUYN6Z3CubN8D0cpuqoUClYB8Jkbyy
 EAUTYckU9Y5zq9DDaqYwT2YIlTNUbca6JltFRl9gisk3d4Hdg4g==
X-Received: by 2002:a05:6402:10c3:: with SMTP id
 p3mr42666269edu.175.1625034434336; 
 Tue, 29 Jun 2021 23:27:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHQKqehToed8G/oeR4lBx7PzBHYBfu1zFW0rHyBt6DYz2r1CNwHTzMzCDFt1S6Up8CIq2JSA==
X-Received: by 2002:a05:6402:10c3:: with SMTP id
 p3mr42666243edu.175.1625034434224; 
 Tue, 29 Jun 2021 23:27:14 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id g8sm2791773edv.84.2021.06.29.23.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 23:27:13 -0700 (PDT)
Subject: Re: [PATCH 02/24] dt-bindings: mediatek: mt8195: Add binding for
 infra IOMMU
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
 <20210630023504.18177-3-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <24f3e157-da9c-d353-e5ae-5dac9e7d9c1d@canonical.com>
Date: Wed, 30 Jun 2021 08:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630023504.18177-3-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_232716_660975_67B52E72 
X-CRM114-Status: GOOD (  17.46  )
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
> ---
>  .../bindings/iommu/mediatek,iommu.yaml         | 14 +++++++++++++-
>  .../dt-bindings/memory/mt8195-memory-port.h    | 18 ++++++++++++++++++
>  include/dt-bindings/memory/mtk-memory-port.h   |  2 ++
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
