Return-Path: <SRS0=GsAT=ZG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE26CC432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 23:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2335206F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 23:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="InmHhelV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2335206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNXv3+YK1BxYt3PAwpKuBsNIg23uERh5A+Dl3eJ+MV4=; b=InmHhelVidIlnG
	kJprmTIxaB/2lZkM9uAH8Ua/HYxtCTCgbyI7fFFLPmasu3XDy6D9+TbSxQtczytQyyh/Q4HH1y2Xh
	zzUUvYrsg2e7momATJbGDqV2w1Kxa7Sm9hWneJoNKDaTGrVZUjhuISK7uX+YQyRez2AvCUDV60Z51
	pj/HBZ6tWN2kHUaw60JPjUUcOQH5Z1HMuvTAiRn6TU/ww9u0PYvtuLkNsrYruzAmpLSh+YcMHhrF1
	Vwg7J7M0Fscxrwdo6iXwC6DDBU9pcHg4XmVKw/+d56Csx9hQ/4EYOMO/94Wiqt+Ei7wRaGO9TnhSg
	GHV4f5h07/pRu81yHJaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVOJJ-0008La-S3; Thu, 14 Nov 2019 23:13:57 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVOJ8-0008Ar-86; Thu, 14 Nov 2019 23:13:48 +0000
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 6FC1014AC47DD;
 Thu, 14 Nov 2019 15:13:41 -0800 (PST)
Date: Thu, 14 Nov 2019 15:13:40 -0800 (PST)
Message-Id: <20191114.151340.735858877920708489.davem@davemloft.net>
To: Mark-MC.Lee@mediatek.com
Subject: Re: [PATCH net,v3 0/3] Rework mt762x GDM setup flow
From: David Miller <davem@davemloft.net>
In-Reply-To: <20191113023844.17800-1-Mark-MC.Lee@mediatek.com>
References: <20191113023844.17800-1-Mark-MC.Lee@mediatek.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 14 Nov 2019 15:13:41 -0800 (PST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_151346_287050_B3DDDFFD 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: mark.rutland@arm.com, andrew@lunn.ch, jakub.kicinski@netronome.com,
 devicetree@vger.kernel.org, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, john@phrozen.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: MarkLee <Mark-MC.Lee@mediatek.com>
Date: Wed, 13 Nov 2019 10:38:41 +0800

> The mt762x GDM block is mainly used to setup the HW internal
> rx path from GMAC to RX DMA engine(PDMA) and the packet
> switching engine(PSE) is responsed to do the data forward
> following the GDM configuration.
> 
> This patch set have three goals :
> 
> 1. Integrate GDM/PSE setup operations into single function "mtk_gdm_config"
> 
> 2. Refine the timing of GDM/PSE setup, move it from mtk_hw_init 
>    to mtk_open
> 
> 3. Enable GDM GDMA_DROP_ALL mode to drop all packet during the 
>    stop operation

Series applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
