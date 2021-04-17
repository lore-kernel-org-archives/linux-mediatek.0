Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C4BC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:48:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB306103D
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB306103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VAp9cvq6LoP2eeuKspq7VbgTvj3o3pEG+gO8z4hVbsA=; b=CiMBUIgQIUc6cgaifZIb82C49
	pR2LrKuB0/Ta7gw7Q+ABvw1uSntDNPc9QeZbl0WpjC0H/EDywaqoAiwOh/NBbEFz1mOqy04A4V1du
	E5Gj4Z5ayL43NIU0OfqTMB1TebOviyuAeY48dz3bWPqZkiI9Abm1bj7ZzWoiLQ/oMUlocsL2uBx+q
	PgFyNwWDqDSAuahalbjyx8AuXntLY0i5JOmdVTa8cWb3nbDpI+kJUjb6vUcOoYztKHRv4gEw/tVPK
	ZPofRQEayBYRh72DbiIvNiitCNVjXIikrdAZj4Pk/V3SkKPWFncHDL4iXYeDSRZ2pdJg2PEsGz/em
	hDdRkeMYQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXekZ-004Zcp-Tz; Sat, 17 Apr 2021 06:48:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXeji-004ZWW-RO; Sat, 17 Apr 2021 06:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=jmGHcXz0rhJFZRPeuQ8t3tRpyfSwP9JLPQFhE8oWMUg=; b=Vu+V+LE3bDNU7BVu6LVXE63s/T
 qM1KNpVxNBi38mDWVRNF/Df4GoBqwhWwOFanMZAjzREFu0pjOPlwKoM96KS5Mxc/6gWgxNRBB3GCw
 H51PMOc92z48Pea/IQNq+0uZKfb0irQxTLeN2tzS/7YzAARA+mwKUtE2FugPwsc5Q0LEyO/2GB4Hc
 onu/7FMfIeTimgp/PcEWSYE8QAIgM7qx9TCkGWZSJaKpv+T7mj47ijii2Oo0fJGC856D54Emk8bYo
 20uMGFhryTT1DEYxoW9G7IYTWuw3AhRIT8QgMFF9xMcgI7e0FLPrxOk6rdEMYAoe7OxbqAwlK9CAs
 uTn9Sj4A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXejd-009uBl-Ov; Sat, 17 Apr 2021 06:47:20 +0000
X-UUID: 5e9c8ec20096453ebf85199fff1ac2de-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jmGHcXz0rhJFZRPeuQ8t3tRpyfSwP9JLPQFhE8oWMUg=; 
 b=F6sldxUGeKngGaR5weOTnnV/I6rxhgcxPg1wzs6ryljU+rX6OBJtR+QXHdfLoyggtC0+FxijSIzgo/4qvvp2POoieIr7npwaJ6FqnUwddX0WfXVBLDYi6OMYZ86ZpnxiJt5mQ5+Eer1SsX0xtJrHLnXVna20KFzRCfdyNetOUJU=;
X-UUID: 5e9c8ec20096453ebf85199fff1ac2de-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1305913289; Fri, 16 Apr 2021 23:47:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 23:47:11 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 14:47:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Apr 2021 14:47:10 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>
Subject: [PATCH 3/3] i2c: mediatek: Use scl_int_delay_ns to compensate
 clock-stretching
Date: Sat, 17 Apr 2021 14:46:52 +0800
Message-ID: <1618642012-10444-4-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
References: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_234717_848896_40DDAB1B 
X-CRM114-Status: GOOD (  14.21  )
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

The parameters of tSU,STA/tHD,STA/tSU,STOP maybe out of spec due
to device clock-stretch or circuit loss, we could get a suitable
scl_int_delay_ns from i2c_timings to compensate these parameters
to meet the spec via EXT_CONF register.

Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index bf25acb..5ddfa4e 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -231,6 +231,7 @@ struct mtk_i2c {
 	struct i2c_adapter adap;	/* i2c host adapter */
 	struct device *dev;
 	struct completion msg_complete;
+	struct i2c_timings timing_info;
 
 	/* set in i2c probe */
 	void __iomem *base;		/* i2c base addr */
@@ -607,7 +608,8 @@ static int mtk_i2c_check_ac_timing(struct mtk_i2c *i2c,
 	else
 		clk_ns = sample_ns / 2;
 
-	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns, clk_ns);
+	su_sta_cnt = DIV_ROUND_UP(spec->min_su_sta_ns +
+				  i2c->timing_info.scl_int_delay_ns, clk_ns);
 	if (su_sta_cnt > max_sta_cnt)
 		return -1;
 
@@ -1176,6 +1178,8 @@ static int mtk_i2c_parse_dt(struct device_node *np, struct mtk_i2c *i2c)
 	i2c->use_push_pull =
 		of_property_read_bool(np, "mediatek,use-push-pull");
 
+	i2c_parse_fw_timings(i2c->dev, &i2c->timing_info, true);
+
 	return 0;
 }
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
