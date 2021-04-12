Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66181C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:05:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1612461220
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 14:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1612461220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BIOYJy/PHcyPExy7dwifl/GtiElubYU6ni7/SCsPsmE=; b=fMx+PIW941bqT9ZJESdfsFB0q
	QFm9hGwcPWrt1OXVnUJZWD0vKwB6yx3NkIMTTUCMN4ntu1Jnn74C0pyJrlg/klOUQe54Vx3fyBm9+
	w8tKldTxdvJwd3B5wWi2DepLZ5ug+1dyUfMIJN/FcTqgGPUjU3WkaeWUaR6W4SONzLZzgtQ6DVfsv
	+wlqs3F5qkNZzW/G6G/+II/QuKbuFdf/4rwcgZzZd10geWvj4yWYhDrRXs9dTvj67T/txH5rGJxLk
	lzobJwS51Z8120sgsvA13KGMlbgYL2ig7E2ObM1J45wFbAc2iHtLWtpoHC0POlapNvx4ooivUIRYx
	fTZpmhVUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxBu-006u6z-ER; Mon, 12 Apr 2021 14:05:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxBU-006u1c-TI; Mon, 12 Apr 2021 14:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=7RCA/IAp63K4JdvBEAurGyCgj5cOF+ROANfBST6Wss0=; b=pMewC8XG2sDWfKvm6uPIypmaZJ
 p6g/l+SaAlQBq/U/KbHiB42bgxfXADQ1Ij2YKBUBv0qRNJBFtwaoAI64AJbR6rVFYyXxn6GgWEro/
 4jawIVYntLeCpDp+W11MvjzaTn+axw459f0e5P66VQxqpVnw7FuEN6i9xpL1yfKPvzsfcfDxAew77
 Z/hl0AqgCdgBsny2B1qQDWI59D3SZIhgSjG0Al9T+0bId2aEjuRcA/eVrW8YFNCy5Ba9I8jJUJYOC
 rMQj0kvJ6uQWjZPOVxeW5tCCfTIiL/trU2/ftzJN9wG2T/JT/eoxxGYPlaX0hSItq6zn/e1qamw9a
 TtUm4BaQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxBS-006HrG-9h; Mon, 12 Apr 2021 14:04:59 +0000
X-UUID: ef945312118b4495942ed87589a3dea1-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7RCA/IAp63K4JdvBEAurGyCgj5cOF+ROANfBST6Wss0=; 
 b=aHLrRC3FiKE28i71giDnaces9m9XRK1e2Bq587kHsUwqHfJlca8RvN8g8IQZX6DMZAoYeB4saki1p6ZGmmbIpnXk3jr1Xk6j+0PuCYy2rz6O8cych+2uVHIJKQmAG/VQpAlzUe0c8aQ/rBpyoJEITY/4IyqTr/ILlNOZTfcozDA=;
X-UUID: ef945312118b4495942ed87589a3dea1-20210412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1210503442; Mon, 12 Apr 2021 07:04:55 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 07:04:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 22:04:53 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 22:04:52 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5, 2/4] soc: mediatek: mmsys: add component POSTMASK
Date: Mon, 12 Apr 2021 22:04:46 +0800
Message-ID: <1618236288-1617-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 74E9DC2E925A1F3481C4DAEEC35137487C230FA8E678EC80B082C72A2A5EF2972000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_070458_363522_0D6DB868 
X-CRM114-Status: UNSURE (   8.96  )
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

This patch add component POSTMASK

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 include/linux/soc/mediatek/mtk-mmsys.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index f6b58f9..7718cd6 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -31,6 +31,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_OVL_2L1,
 	DDP_COMPONENT_OVL_2L2,
 	DDP_COMPONENT_OVL1,
+	DDP_COMPONENT_POSTMASK0,
 	DDP_COMPONENT_PWM0,
 	DDP_COMPONENT_PWM1,
 	DDP_COMPONENT_PWM2,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
