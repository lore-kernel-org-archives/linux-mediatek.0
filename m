Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92001C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 02:49:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60B1522BEA
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 02:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TRnUuCWb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YsY0oMaq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60B1522BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x3OSyQI9iVQGhn6r/eCM8pkb/JT0iQ1B3M/ZoNfd0ko=; b=TRnUuCWbjp++Tjc1mqeTOJKbc
	Q2+lVxkwMbbd+YOxbT6v2bTdY6L1L9MbrrgYQiErIOyeyUfnFO7hlMwTqxcOiVq/hzrhSo1ry/32S
	4NpfaH6BgcH36xHc+M9JN4ALzRqjNnFRmU3UcqqDRmIIHJoAzz4BNRs506ZRck0oowj//WG8rCpiA
	39q0R/tVPNMbl5sQoHmoIrrMAIUh9nK4PUs+/cwo1/wvI7I0Z3W2/+FBgxgX0O1Slq24QLobSJWIu
	b9SfeeCDvByLb9jW8/zSWvl1BFrMJSgAiSHL8fjuId7Bcp1vpJfxtDKZ9rLi5jDD/EbwempZzBiT6
	9ST/UKduA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0ydL-0004KJ-5c; Thu, 30 Jul 2020 02:49:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0ydI-0004JX-GA; Thu, 30 Jul 2020 02:49:25 +0000
X-UUID: d88cc763e43d484c81b2f008f2e75601-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=X1UadCFz90FbPm5aWCk0xfL4ZtGAfS8oTL2vDHMeIS4=; 
 b=YsY0oMaqZSq5i4rn32G2cf4decDUejbZSjAhbUAOXagl0JeTkPOTr/itiGphda6KzixNFkqg8IY1bWR2omXdxeYGlYyJ5Ro1y6pxPm8Te8HUZ2B5kODghh3HiY2OHAoGUuVjVzVjRmXeKO2vC9QmUWW4RZdla3P/Z76Ska9pv4Y=;
X-UUID: d88cc763e43d484c81b2f008f2e75601-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1014472314; Wed, 29 Jul 2020 18:48:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 19:39:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 10:39:00 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 10:39:00 +0800
Message-ID: <1596076741.11024.4.camel@mtksdaap41>
Subject: Re: [PATCH v2 2/4] i2c: mediatek: Add access to more than 8GB dram
 in i2c driver
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>
Date: Thu, 30 Jul 2020 10:39:01 +0800
In-Reply-To: <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
References: <1595939446-5484-1-git-send-email-qii.wang@mediatek.com>
 <1595939446-5484-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_224924_781152_B345F2A7 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, wsa@the-dreams.de, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-28 at 20:30 +0800, Qii Wang wrote:
> Newer MTK chip support more than 8GB of dram. Replace support_33bits
> with more general dma_max_support and remove mtk_i2c_set_4g_mode.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>

Qii,

After you remove I2C_DMA_4G_MODE Matthias mentioned, you can have:

Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
