Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171BAC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 12:09:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD992087D
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 12:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KsROjyk0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g8U6mJG2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACD992087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cBgK6eMZxGIPKKCU6RGRmUvqYYUkE7war5W4Xh2RqRo=; b=KsROjyk0BgmelVNjo4LtWutf6
	vvq+mf7zW6bl48KvOj38ObQ1uUco4lIfwYlfWb3/FBvtacDFFQR97IV/bGVs3LL1Omw1Qy6o22Y+x
	D1LLNuxdpmUG565etqY10qsQxzDHey+ohOoxldzkOELi4xN2lmi3OyofW0wvsBd3iPCPOLbr51uDp
	6h9tQySkciaDF6uMyqrlNCHz1Nw6NUrRmtgZJdZREnyGPXaGJudCAYEQSMdUH+qdbSI/ziQSr0u0b
	gN6UGvibvvt6aQ2vFLB/5JuUZDYyRkwIQKYB2YZcPClNfzO41Ka5HffI0OajaztBZPfJtsObhBklr
	NZ4G4JWEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIsiZ-0000S5-Dy; Thu, 17 Sep 2020 12:08:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIsi2-0000AJ-5m; Thu, 17 Sep 2020 12:08:19 +0000
X-UUID: bb4392cccf2d45aa8167ed83b469d689-20200917
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rQ7X5ZN1ihMFTytakUDsBP4WZCCDHdxE3OsuojPLzkQ=; 
 b=g8U6mJG2Prbq+P9NVP++MJN9xXYwiqepvdx1CESu5iNI/aRNegWhyk0JKi+ySikEVCdl5R0YxtX7AQKxbkfg44+VFS+Zh3DH7qR8FH+2s9TWprGTB9U5k476AHKAwsewgw3KV61aOKtCSKmMD1/QbopUSoIPq60pcGCQ8PmCe3E=;
X-UUID: bb4392cccf2d45aa8167ed83b469d689-20200917
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1576685794; Thu, 17 Sep 2020 04:08:05 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 04:58:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Sep 2020 19:58:01 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Sep 2020 19:58:01 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH 2/2] i2c: mediatek: Send i2c master code at more than 1MHz
Date: Thu, 17 Sep 2020 19:55:42 +0800
Message-ID: <1600343742-9731-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
References: <1600343742-9731-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_080818_368014_EDF6EDE0 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: qii.wang@mediatek.com, srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The master code needs to being sent when the speed is more than
I2C_MAX_FAST_MODE_PLUS_FREQ, not I2C_MAX_FAST_MODE_FREQ in the
latest I2C-bus specification and user manual.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index a1978eb..0cbdfbe 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -759,7 +759,7 @@ static int mtk_i2c_set_speed(struct mtk_i2c *i2c, unsigned int parent_clk)
 	for (clk_div = 1; clk_div <= max_clk_div; clk_div++) {
 		clk_src = parent_clk / clk_div;
 
-		if (target_speed > I2C_MAX_FAST_MODE_FREQ) {
+		if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 			/* Set master code speed register */
 			ret = mtk_i2c_calculate_speed(i2c, clk_src,
 						      I2C_MAX_FAST_MODE_FREQ,
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
