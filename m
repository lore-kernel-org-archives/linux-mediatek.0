Return-Path: <SRS0=ptZs=FZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384ECC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 19:11:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E083822527
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Dec 2020 19:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E083822527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qbW7nKyzYKFXnGPSaz8p8dSzhP0VK2pEjI5lVeFHHBQ=; b=rXMH46KmCPplHJT1iZYcqBm5l
	K5XV4BCzyXF3p4Pm/AaUa0tY96pZ4O04xiD8QvNUIukhtoiUYNGWNQfaQl9D7DOYbW2aSoYU2bzDw
	klAh3XWqURt87JaRBpA9dmyB9RUbVfACv/a9nmtpFy25Y1T03rjmlqnyQyDuMBF1YcZvNSXfIP6+G
	ITSB9kWg2MiJpJ0Fs7VNypdFh/Hu+91NFZPulggXSHm2ATQtV8u43a53canZKYlBsT/XaPJyl0SQf
	3Nqkl8cvKxdwn81BxR89VQxrm0T/lnOdebdv/xWpgeMnkllOgQhkksUKv63nLHHnK847QzHK46z26
	qSefbA5xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krQaU-0000tp-8U; Mon, 21 Dec 2020 19:11:18 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krQaP-0000s7-V6; Mon, 21 Dec 2020 19:11:14 +0000
Received: by mail-oi1-f179.google.com with SMTP id 9so12342136oiq.3;
 Mon, 21 Dec 2020 11:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f9rsH3MI3HmxoU3YRSFq+GPxbgSUzkM76uH8mgO+QJ0=;
 b=tWlGF4YQgV1mZQS5t9oS7Au/OokS7VE2E7EvZprzwfKB6nFm6V1nG8tqi64W6T8g4Z
 SwG3or2SDBWilOjzKmkNsUquT9XOVc9TgJLyeSsnbI9lz4axFLHUDStnFkeQZt5GErNE
 DvrTmkyfjSqbsPxnhIUgHJ+cc+5HNlLSGa8BJsEMhPhSG/th77TbEyIp7Ts02Na5E4uO
 uTskBQTFqYIPnFU/MmXlLb0SDQhfNwU0WefqiTs0KThulht/5fa/7Icmq1vJ0o93GHk3
 +UgxcxPL4SdfL8JNEbSS3mVNWPTudSRnGWpgDJj0fYA6ieAyem74R1URVYbYvmoZw9vc
 HhPw==
X-Gm-Message-State: AOAM530bbyo9Uf8fBoKWWLWPSniqTnARE113EvcDD550JKPJh2FXz76r
 2XBzfbbEZ1W1BdZAclmciw==
X-Google-Smtp-Source: ABdhPJykTihmx7a1AWZTQnLaeKbOndEBk8EAvOatAGL9pTLPvCEAQBmw9IQc3TLr1f+WzJECt5AmDA==
X-Received: by 2002:aca:3a02:: with SMTP id h2mr11827243oia.65.1608577873045; 
 Mon, 21 Dec 2020 11:11:13 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r15sm3731437oie.33.2020.12.21.11.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 11:11:12 -0800 (PST)
Received: (nullmailer pid 382296 invoked by uid 1000);
 Mon, 21 Dec 2020 19:11:07 -0000
Date: Mon, 21 Dec 2020 12:11:07 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4 07/11] dt-bindings: phy: convert MIPI DSI PHY binding
 to YAML schema
Message-ID: <20201221191107.GA382240@robh.at.kernel.org>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201216093012.24406-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216093012.24406-7-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_141114_009808_2CBE5AE0 
X-CRM114-Status: GOOD (  13.06  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 16 Dec 2020 17:30:08 +0800, Chunfeng Yun wrote:
> Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v4:
>   1. add maintainer Philipp add support mt8183 suggested by Chun-Kuang
>   2. use keyword multipleOf suggested by Rob
>   3. fix typo of 'MIPI' in title
> 
> v3: new patch
> ---
>  .../display/mediatek/mediatek,dsi.txt         | 18 +---
>  .../bindings/phy/mediatek,dsi-phy.yaml        | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
