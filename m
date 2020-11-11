Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FDCC388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:31:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 140D720825
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 21:31:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WpnDWhb2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 140D720825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0dvS1EkHBZoZeMyrWxT75b3nzXYxSthpk7HzbRLZfSI=; b=WpnDWhb2LtH+dtImHe4mm8TuU
	fWm3sWaWJ5SMEaIJvonbQvx858nIFNxKEpw8KRUe/I0p5cIkPuQEHB1VSy53he0tqmLug1BymFJxA
	0chZ382CencpYJm5wN/TDesDb70ND25bpbxvKoN7x33yVGCgO9t2sUHXWd/omrk23kFS2GDGvUb58
	AdbAHEXGKUonJM80ZjuIO90S6L2WDXD8RJDZF0XCmDXTpXAe8gHa1zskCZjwEkX5Q1m+sAsNmVhfD
	HrRIPvLrKBb891MkFEa5GuIV7Ek906hT+vOv6IFEDQJ7bjG2mxQqyHX+FUXRjyuw+jTEHMlOAqKvp
	vdU82ucCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcxha-0001Lb-Oa; Wed, 11 Nov 2020 21:30:50 +0000
Received: from mail-ej1-f66.google.com ([209.85.218.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcxhW-0001Ji-5g; Wed, 11 Nov 2020 21:30:47 +0000
Received: by mail-ej1-f66.google.com with SMTP id o23so4727370ejn.11;
 Wed, 11 Nov 2020 13:30:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z+ETELXno+NvRIRsDlBueAlts5jLlnpIbWvTkKx52dc=;
 b=WSQ2tSsoSuTCgL3c8XZquZEodRDrIk9ewu2h3T09vo+00sM89CJWMT+LDfvMLC0UsA
 n2FclPdQb8PGkRjGc6OIlx5iLjwzv2Iw2tfMDBdCz9NM5Vw5BbIV1p0i2uZWxAIUrDHv
 DHC/t09BXqJR/6dWfuvEH2C3dEIlcsB8OmH6m6EUnOCOwrpd5z+ddUfY5SiZjnKLWw4v
 21oECvdSJPKFQDhonLuszPj2zITVZZyV70vTjxnE9XFt45VRL24f3xBATBcy6/MG+RAn
 EheAyoYNxcphJgB+jWu53YIMP27e8iOwkRfaR/HlPE/rIcNQzRzTNMXF6dbkIbU6xo4y
 XjKg==
X-Gm-Message-State: AOAM533beimIJGJ1cb8ns6hIBxvoDvVD0nMqJ0q3L68eRBD+LiKOMm6L
 3CuegX0t/n/oxLfeiWPlaUk=
X-Google-Smtp-Source: ABdhPJyhZPk3FplV/r7GELuT8+cAZX7sxSAYu7E4SNmzzETHkXyXKEmJuKnrqs52+PR3B57lSpkvkA==
X-Received: by 2002:a17:906:f186:: with SMTP id
 gs6mr28257486ejb.171.1605130244772; 
 Wed, 11 Nov 2020 13:30:44 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id c11sm1421524eds.62.2020.11.11.13.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 13:30:43 -0800 (PST)
Date: Wed, 11 Nov 2020 22:30:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 04/24] dt-bindings: memory: mediatek: Add domain
 definition
Message-ID: <20201111213041.GC287176@kozik-lap>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-5-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_163046_266624_7B76D16E 
X-CRM114-Status: GOOD (  17.16  )
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
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel-team@android.com,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 08:38:18PM +0800, Yong Wu wrote:
> In the latest SoC, there are several HW IP require a sepecial iova
> range, mainly CCU and VPU has this requirement. Take CCU as a example,
> CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).
> 
> In this patch we add a domain definition for the special port. In the
> example of CCU, If we preassign CCU port in domain1, then iommu driver
> will prepare a independent iommu domain of the special iova range for it,
> then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
> range.
> 
> This is a preparing patch for multi-domain support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
