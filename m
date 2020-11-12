Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431F9C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 07:52:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F4521D40
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 07:52:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1iFp8B/M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JeRwuKhm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92F4521D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CRGA7IKqBdPRxRNb8up3kpFsbL8Hl92WRcu21gwsfhc=; b=1iFp8B/M+T0MwyH0lR2BjHt0w
	n1OYyBAoZZwGTBHCtseEiFpTxE8wtKM/ahOoncUAEYc5lFN6EpMxw6Z4K235CMl1EBCFnhB64nxsb
	WMvizqElWFo32RZC/ShW2vYKvksCKTKHHW5R03gxt+kG3fGo9EHffTMo7WaXBwyIV9f4xx6kzaA6G
	Vo8FBGoTyZMKgHpzGwZgvZ5QxtEQqY+I3h7JugtgtzfHjW5teDiiIUqehEUlDTvVx+yC28QdPzBwY
	1JSH/AL/LpqOoFEvQ2AKCHday+jLNkU4gd84Ry9C3KZhHjDRRhOv3tDdH0DYUw243KNk0MLBIXB7r
	g2R2cW3/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd7PB-0006dH-KS; Thu, 12 Nov 2020 07:52:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd7P2-0006am-QJ; Thu, 12 Nov 2020 07:52:22 +0000
X-UUID: 668a6b4404c540d9a18df543f174dfd2-20201111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BFW4SlLa9Cysl3JQCNnH6syHd84UbKke+hFKkGLqkw8=; 
 b=JeRwuKhmGF4g7E7PIafk8rIa65kcPTXLkj+FG4StdjJY7E3O08iH5j1biNC6N/X4qX5SjNNjKPWw6HwQD0f+aelDFHTXIp6YPNGnCcDfw2kUtWNtEYpoiGGVDFgiK5fsV1Px+NKAwi2QfRKuZDjgdGdXE/fvGMq8yIz4gkpKNQA=;
X-UUID: 668a6b4404c540d9a18df543f174dfd2-20201111
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 884757598; Wed, 11 Nov 2020 23:52:08 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 23:52:13 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 15:52:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Nov 2020 15:52:11 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 2/3] arm64: dts: mt8192: Add cqe off flag
Date: Thu, 12 Nov 2020 15:52:07 +0800
Message-ID: <20201112075208.28183-3-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201112075208.28183-1-wenbin.mei@mediatek.com>
References: <20201112075208.28183-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_025221_060846_5EB8E0BD 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Bradley Bolen <bradleybolen@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Baolin Wang <baolin.wang@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, irq-linux@rere.qmqm.pl,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Ludovic Barre <ludovic.barre@st.com>, Krishna Konda <kkonda@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add cqe off flag for MT8192 mmc nodes.

Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
index a4279fa87c2b..0df78e4ea0d0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -41,6 +41,7 @@
 	mmc-hs400-1_8v;
 	supports-cqe;
 	cap-mmc-hw-reset;
+	cqe-off-in-suspend;
 	no-sdio;
 	no-sd;
 	hs400-ds-delay = <0x12814>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
