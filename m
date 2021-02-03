Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFB5C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 10:43:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665DE64F53
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 10:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 665DE64F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=an1JHmy2CjuJolOFe03PJhD7jDWyh61A/xwxSHJAqjM=; b=v+bqH2eYs8YoHaprdtd2la7ptN
	fOUIZ69rwXctvT4DBZUv0c39kiRzv7zf+hQE3KwEnpHa136BHwXUweq/mDktM3Xil8ESFn320jqp+
	eL07llOzvHAOFNJj10hM8xSeOqRFD5tv4eQypzmeR+nro1X06EOEcrvDVSrkw79ySzSVWN4/tjanr
	TPJmgB2FpvFjQWT5NzKpQlbqfNbiI4/b6PoU3VpbLUsF28bwv1uYyQCyH1be4cChr8AolSg/fLcuV
	t4izw8y5Ro4O0SLSsnrE0fVNd407AwV7uWINg6BYhgJbRxHLpU55fCX0YUSVeVg4KuHM4Sahd3UCV
	xoyEV93w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7FdB-0005fE-5g; Wed, 03 Feb 2021 10:43:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Fd2-0005cJ-Oc; Wed, 03 Feb 2021 10:43:23 +0000
X-UUID: 4326550ce25d48a5995de0f0f9e1cff2-20210203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=rJr+m/kmIzVPILQqif4baN3fSWnSDOj1UIMjYFwaVPI=; 
 b=M32+DP9oCIZ0W2AUXoG+jzUB8oWEMrCvQvihiPR+rHSAGn85wM7G64sOgGbc0kxDOyGCcT0Fz6828zCXJGBJ10GdcOFGgNQXBqixIkzUV2P2MHWjPVwhiAbM2GdJu+Q/kHoZ0kAPIgsLmPJdzgXxrZqxzkpHmKz7gXnS/Mm6ax4=;
X-UUID: 4326550ce25d48a5995de0f0f9e1cff2-20210203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 879947945; Wed, 03 Feb 2021 02:36:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 02:35:30 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 18:35:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 18:35:28 +0800
From: <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH] i2c: mediatek: Get device clock-stretch time via dts
Date: Wed, 3 Feb 2021 18:35:25 +0800
Message-ID: <1612348525-13364-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_054321_005140_E54E2D05 
X-CRM114-Status: GOOD (  13.08  )
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

From: Qii Wang <qii.wang@mediatek.com>

tSU,STA/tHD,STA/tSU,STOP maybe out of spec due to device
clock-stretching or circuit loss, we could get device
clock-stretch time from dts to adjust these parameters
to meet the spec via EXT_CONF register.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 2ffd2f3..47c7255 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -245,6 +245,7 @@ struct mtk_i2c {
 	u16 irq_stat;			/* interrupt status */
 	unsigned int clk_src_div;
 	unsigned int speed_hz;		/* The speed in transfer */
+	unsigned int clock_stretch_ns;
 	enum mtk_trans_op op;
 	u16 timing_reg;
 	u16 high_speed_reg;
@@ -607,7 +608,8 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	else
 		clk_ns = sample_ns / 2;
 
-	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
+	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns + i2c->clock_stretch_ns,
+				  clk_ns);
 	if (su_sta_cnt > max_sta_cnt)
 		return -1;
 
@@ -1171,6 +1173,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	if (i2c->clk_src_div == 0)
 		return -EINVAL;
 
+	of_property_read_u32(np, "clock-stretch-ns", &i2c->clock_stretch_ns);
+
 	i2c->have_pmic = of_property_read_bool(np, "mediatek,have-pmic");
 	i2c->use_push_pull =
 		of_property_read_bool(np, "mediatek,use-push-pull");
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
