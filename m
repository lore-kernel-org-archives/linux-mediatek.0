Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CC1C352B6
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 04:33:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD76520B1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 04:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ug1/dNN4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fNbaJMpF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD76520B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RPFgLlT7TiKJoYGeKFeUJbSERWiIhaj3svvt3tGrAa4=; b=Ug1/dNN4rE5pXJ
	zo+3lZvhxu8/++79st/j+egOmCnp7uXdhGvwdjUw5VsHMeKzzmQcp7v80KYgurTGbQQN20KmwpQF1
	VJL4KsZSbJwuCld7VYRmQ4OqmvuVfsl04Tg+y/WzHdgqoLqESHzN72kt+QqpsM9aWpuqo6g19o2/l
	Hr8VmC7VMkZUCO5tQsPbL1yLK31eYwSjN2xdjwALR0yhv8ZT8j8Q7Nc3P1UKUq5BzBuxum3ToRDKK
	PQI8gB88xfj37PTX+LwogYHeGY/2vsKfJuSB1M2GPHgGcIie312/dmFwiF4vofB6j6wM2zyDnkFjf
	XOzByvRGSklFRVGLRvqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMlLq-0004Qi-NE; Fri, 10 Apr 2020 04:33:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMlLn-0004P5-CE; Fri, 10 Apr 2020 04:33:09 +0000
X-UUID: 07320ecd776e4157963cb64e3c706d2e-20200409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oXyxi7IUgBNHR+VYtiCeIx+6ezK7zPDvVd2okeNBTBs=; 
 b=fNbaJMpFO/cnuCk/GkyGsyGISC98jzF228UYLBiRljwq00+vnhPW/4UrBpLv5iheq3yBmWst6DRnSV0Ax774YsGgTX4nGozF729mq1J5kfuEBgkBxVdw7H8SjivcvUImlWIsAdpFeo6vZxx94pnp7d35YGZ2WSSfkxzEeDCQeAs=;
X-UUID: 07320ecd776e4157963cb64e3c706d2e-20200409
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1660490301; Thu, 09 Apr 2020 20:32:58 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Apr 2020 21:32:57 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 10 Apr 2020 12:32:53 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 10 Apr 2020 12:32:50 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 1/4] dt-bindings: display: mediatek: add property to
 control mipi tx drive current
Date: Fri, 10 Apr 2020 12:32:45 +0800
Message-ID: <20200410043248.114384-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200410043248.114384-1-jitao.shi@mediatek.com>
References: <20200410043248.114384-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2F6DC314AAFFE7325705D7A5029BA7AB77B87FFA4ED9EE4DC05F3445E42225E72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200409_213307_426135_785FFC90 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 huijuan.xie@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a property to control mipi tx drive current:
"drive-strength-microamp"

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index a19a6cc375ed..d78b6d6d8fab 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -33,6 +33,10 @@ Required properties:
 - #clock-cells: must be <0>;
 - #phy-cells: must be <0>.
 
+Optional properties:
+- drive-strength-microamp: adjust driving current, should be 3000 ~ 6000. And
+						   the step is 200.
+
 Example:
 
 mipi_tx0: mipi-dphy@10215000 {
@@ -42,6 +46,7 @@ mipi_tx0: mipi-dphy@10215000 {
 	clock-output-names = "mipi_tx0_pll";
 	#clock-cells = <0>;
 	#phy-cells = <0>;
+	drive-strength-microamp = <4600>;
 };
 
 dsi0: dsi@1401b000 {
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
