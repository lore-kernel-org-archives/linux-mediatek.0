Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99CEC5DF61
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 13:23:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80F862187F
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 13:23:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QI51MPIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80F862187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q5sH0SeLGAIZPTXml48XbT8fx0XD1UO8buh4YySCvYg=; b=QI51MPIxlZ8zss
	Dfv/h1enHIbAmpD4OKeZ6u3+wKL/OXxwmFpE0ihv162rttu1kcace0DT7PbgSe53tDFOM5yX9rmWa
	2KZEUn6tvKEU+ksLO2cbErWsUjeT8/l1L0ikUgo6OlqHsafC3NhCaQ9u+emJUck28wtAg9vjGu9zP
	oQSAPfBvjxl5I9AMaJiLaU1WwS9POJlylQw4r5VyceM24RX/CQUerYUS6mQSvu62bvVXbBGKtpkb7
	pU91tvfDdzH+PVAWyGwBenurTx3s0vgdY2foH0GGGRnYrGKnftY80W52DzBuhcT8FcPwQMt6CtSal
	8QhGnrKP85vd3s9sCQaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iShlE-0002Fu-AS; Thu, 07 Nov 2019 13:23:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iShl6-00027B-8R; Thu, 07 Nov 2019 13:23:33 +0000
X-UUID: e8c020057f31483a981adc71185ddfbe-20191107
X-UUID: e8c020057f31483a981adc71185ddfbe-20191107
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1487721755; Thu, 07 Nov 2019 05:23:25 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 7 Nov 2019 05:23:24 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 7 Nov 2019 21:23:23 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 7 Nov 2019 21:23:16 +0800
Message-ID: <1573132996.8833.3.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] mtd: mtk-quadspi: add support for memory-mapped
 flash reading
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 7 Nov 2019 21:23:16 +0800
In-Reply-To: <20191106140748.13100-2-gch981213@gmail.com>
References: <20191106140748.13100-1-gch981213@gmail.com>
 <20191106140748.13100-2-gch981213@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_052332_301996_0C622CD2 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2019-11-06 at 22:07 +0800, Chuanhong Guo wrote:
> PIO reading mode on this controller is ridiculously inefficient
> (one cmd+addr+dummy sequence reads only one byte)
> This patch adds support for reading from memory-mapped flash area
> which increases reading speed from 1MB/s to 5.6MB/s

This may not be true for all MTK SoC. Which one are you testing?

Joe.C





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
