Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51C1C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:22:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4F16198E
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D4F16198E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xzcssd37LVfdydJYZx4LShcplzHkhcVRmpkSi3FrjVQ=; b=lyLz7j+Xu2gDaNB1fNykC+i/j
	Ga7WR0mlim0r9KjVfIVIC2GHsiaNaQ6koyvFL09RO+mJtLa5HOdN+uwUf8z4cy6/340qGGD3Ix8/b
	mTonCWWFxT4J4HGPoGd+TUjM/EyAGMzcbK9/GRgLp2AJDKACwpLzZ2caL8GPyIQPPHl8GIhCz88+O
	FRcL6UCqg3FU4bs70xPG6ofcTMNZcXqjiQ6N1BcyNBGb8HSwBW0xYEjzVJsPQMpjsqPjGPQjC5bl5
	i4NBO6DzlwAgC+EZj6/4yHWEhZU0OdQ5eqiZ2x0bXvGgrYe/A8QmIcS38WVTOI+ZFP+Fhvpx/cET4
	1pM7aJ0WQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOIdJ-00BQm4-Ee; Mon, 22 Mar 2021 11:22:05 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOIcw-00BQgE-Q6; Mon, 22 Mar 2021 11:21:45 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout3.routing.net (Postfix) with ESMTP id BB1DD604CD;
 Mon, 22 Mar 2021 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1616412100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TuB5JOSUV2Mjm5gg71dyaHF7i8Fm6qxQ4YPT46nvR3Q=;
 b=loqjsueuK9GN1cOYY9FEVio5w/ZHhVzTwHZkU6dxdX6V1LcohctljMTCiyBiz5W6g9tRFs
 8iSAu24hIENojEdunvVN/cGBI14I0MT8fu8/CJ30uASCwvRxUkHz+vWuQ/h4M1GohzVWNF
 iwIDnHeCnHwpP9Z2/FfN4dUZnaKlcPo=
Received: from localhost.localdomain (unknown [80.245.73.88])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 00FC236009F;
 Mon, 22 Mar 2021 11:21:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] net: mediatek: add flow offload for mt7623
Date: Mon, 22 Mar 2021 12:21:16 +0100
Message-Id: <20210322112117.16162-2-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322112117.16162-1-linux@fw-web.de>
References: <20210322112117.16162-1-linux@fw-web.de>
MIME-Version: 1.0
X-Mail-ID: ef0cd896-2961-4f04-8e14-c2c83bb8fd6e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_112143_116890_AEFEAEE8 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
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

From: Frank Wunderlich <frank-w@public-files.de>

mt7623 uses offload version 2 too

tested on Bananapi-R2

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0396f0db855f..810def064f11 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3202,6 +3202,7 @@ static const struct mtk_soc_data mt7623_data = {
 	.hw_features = MTK_HW_FEATURES,
 	.required_clks = MT7623_CLKS_BITMAP,
 	.required_pctl = true,
+	.offload_version = 2,
 };
 
 static const struct mtk_soc_data mt7629_data = {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
