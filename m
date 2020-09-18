Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637D5C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:30:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7EBB21D42
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dg9rbRqc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7EBB21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C9SPNGpDeGjkwE0X83jbtwnX089M4Ipvfi1yPIUQXqM=; b=Dg9rbRqcy01mjZz4Sn7337w1/
	92n9mgwy6QqGr+5xpkoDWgunLbAomKgggbpD3LRj0RFG3bBil/S+uavetWsH/UQFOcp1WJHueOM+/
	g1GMqMX1lTdMTxNXNXuClKx5bG+aGwmxVgOpqg9pv18xoIPGKS8bQLqkQzAfDk6FW9tRA4JJhrmuZ
	32b2NDDbNR/4B+m5J6XaptDdtDWi3BHZMI6w5gSow8NiDedV2JMp3zcrIrb71etYh0Mo3v69VJFY3
	5BpjsUkg8pQHXDGbAaYBLEfbP6uBpWEvjmc0Mm/IO3xK3sfZ6HmnX5j3ayy/yD3UUTlzay2UgeUOY
	abYIKgCpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBmJ-0007ez-A9; Fri, 18 Sep 2020 08:29:59 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBmD-0007cI-C8; Fri, 18 Sep 2020 08:29:55 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 068E5396; Fri, 18 Sep 2020 10:29:42 +0200 (CEST)
Date: Fri, 18 Sep 2020 10:29:41 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: iommu: Add binding for MediaTek
 MT8167 IOMMU
Message-ID: <20200918082941.GE31590@8bytes.org>
References: <20200907101649.1573134-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907101649.1573134-1-fparent@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_042953_575659_07C92CEE 
X-CRM114-Status: GOOD (  13.00  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 miles.chen@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 07, 2020 at 12:16:47PM +0200, Fabien Parent wrote:
> This commit adds IOMMU binding documentation and larb port definitions
> for the MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> V4:
> 	* Added path to mt8167 larb header file
> 	* Added Honghui Zhang in copyright header
> V3: Added mt8167-larb-port.h file for iommu port definitions
> V2: no change

Applied all, thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
