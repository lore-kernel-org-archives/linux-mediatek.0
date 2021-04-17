Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51702C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:48:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE108611CD
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE108611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C9hFfRLQUlBGjgld5HvmYteS8dT5/TlsCJvZ5dK8i84=; b=jZRBN0FU6R85F+sWG2tfXr6ga
	IQPa+w+qLdEsxi6tGtbe4OuFWOZKTufY0sUoSdjFKIJJZvDMJ9ZXRVNwi8+XIswbiQWO5AgCIG0i/
	F+Kk+I8plHLRt3aLH58RLPZAPnbTwtF65RuYNwabgDEOuEzOQ4XstoJeliVs0TBYYq+AEsQnCJMd8
	B/ZHUx/S2buuOPOmKNaQ178OemteeGj0WvDFN4quGxARS4HgjUZ9Tw5WdEyC0cJunUuScF0DzRhDi
	EBmP3YyP9L3ugFAyCJuLj2l01H+36bUPWKukYOuTk+vDjhhLlfOZ7HcP22K9vdOOhFElxNsthTpjE
	F70n64w4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXekm-004ZgU-7W; Sat, 17 Apr 2021 06:48:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXeji-004ZWV-RR; Sat, 17 Apr 2021 06:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=qZkrxvNa252+LIXBrDoo9Od1VPYm1om3lvK3oDgLiRc=; b=t5GJUH7/XqbcO1T0pV4JtrVpyQ
 lVtZJMre52bJMVSuAfKBZE02frfrciQedr6AfWSIdGV5GR912K11+s53T9n3Fqm2wFljF1wo/0RkF
 cprva7qTgE4P2Dc0M40j+07vBXnKJWyZzl8Gua7FUgPuv1FuH9gPZIbMlAJ2LbkXdctXgeYxHFRcS
 w8IvUshCPIUgrKfWbSGabPI52jvOWpiLoN/P7P2WlT2tNB/9glfh1e/lwbmki4GCEgSL7jSBw1Mhl
 tA1qvKbqEXBURCXpx9copqoIS6NVwRVUHAObCJjYJIsS8lbxJBle22Au1VZ0I3xlyK8f4reMRD9Na
 Y8mRKwxQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXejd-009uBn-P9; Sat, 17 Apr 2021 06:47:20 +0000
X-UUID: 16383276c4534387a24578c08df4f84b-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qZkrxvNa252+LIXBrDoo9Od1VPYm1om3lvK3oDgLiRc=; 
 b=mRAXgljbubTI/ZnVMb0JtojMIrz/2F7LCm43u9Mf9Lh+1NG2CPWAIXddmo9G5wZC1rPPZClCwSelxjMt3BsNXfQNMxEv0WeC00BNL7gPwxW1pcdTcG7KIbCOg55EYMNZ9dPgndp5YoYF+QZH6YP7o5Ykvcr8nNZ/wepJef5Om8I=;
X-UUID: 16383276c4534387a24578c08df4f84b-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2010867623; Fri, 16 Apr 2021 23:47:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 23:47:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 14:47:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Apr 2021 14:47:09 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>
Subject: [PATCH 1/3] i2c: mediatek: Fix send master code at more than 1MHz
Date: Sat, 17 Apr 2021 14:46:50 +0800
Message-ID: <1618642012-10444-2-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_234717_848976_0EC9B564 
X-CRM114-Status: GOOD (  14.15  )
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

There are some omissions in the previous patch about replacing
I2C_MAX_FAST_MODE__FREQ with I2C_MAX_FAST_MODE_PLUS_FREQ and
need to fix it.

Fixes: b44658e755b5("i2c: mediatek: Send i2c master code at more than 1MHz")
Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f3..3e34261 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -564,7 +564,7 @@ static const struct i2c_spec_values *mtk_i2c_get_spec(unsigned int speed)
 
 static int mtk_i2c_max_step_cnt(unsigned int target_speed)
 {
-	if (target_speed > I2C_MAX_FAST_MODE_FREQ)
+	if (target_speed > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		return MAX_HS_STEP_CNT_DIV;
 	else
 		return MAX_STEP_CNT_DIV;
@@ -635,7 +635,7 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	if (sda_min > sda_max)
 		return -3;
 
-	if (check_speed > I2C_MAX_FAST_MODE_FREQ) {
+	if (check_speed > I2C_MAX_FAST_MODE_PLUS_FREQ) {
 		if (i2c->dev_comp->ltiming_adjust) {
 			i2c->ac_timing.hs = I2C_TIME_DEFAULT_VALUE |
 				(sample_cnt << 12) | (high_cnt << 8);
@@ -850,7 +850,7 @@ static int mtk_i2c_do_transfer(struct mtk_i2c *i2c, struct i2c_msg *msgs,
 
 	control_reg = mtk_i2c_readw(i2c, OFFSET_CONTROL) &
 			~(I2C_CONTROL_DIR_CHANGE | I2C_CONTROL_RS);
-	if ((i2c->speed_hz > I2C_MAX_FAST_MODE_FREQ) || (left_num >= 1))
+	if ((i2c->speed_hz > I2C_MAX_FAST_MODE_PLUS_FREQ) || (left_num >= 1))
 		control_reg |= I2C_CONTROL_RS;
 
 	if (i2c->op == I2C_MASTER_WRRD)
@@ -1067,7 +1067,8 @@ static int mtk_i2c_transfer(struct i2c_adapter *adap,
 		}
 	}
 
-	if (i2c->auto_restart && num >= 2 && i2c->speed_hz > I2C_MAX_FAST_MODE_FREQ)
+	if (i2c->auto_restart && num >= 2 &&
+		i2c->speed_hz > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		/* ignore the first restart irq after the master code,
 		 * otherwise the first transfer will be discarded.
 		 */
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
