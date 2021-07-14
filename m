Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DB4C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 16:52:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E3D613C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 16:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E3D613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nhfhp1eb2ctuNiNDJtR01c8PiVvguYJPL+sET7i3QBc=; b=aPTMIAKTW6BGdY
	tzEq5vJ85ylxZ5TItjHofWydCRBZVGW3lGPW6Y5Anq5p5DJDMO1vvMZm1uJvXmNvYRH95EgvFir+3
	3sEvK6plitxlzMIai8EipRnSb+YDi5bIuJa/CmK/G91fz91fKruOwgIHGDOtd//fwmXUOS66XHJJh
	VcdqfYKAvsQiibSWi/z9HnHd3eBPb1yO2YGwMEg8s+K8WaWopKqWsmJPSAyUAPJRD0Hh7SjRRMizI
	gy1de5lRpeICfVz0IgLHUWG5Wi0zzAFmBDlg07wmJBwY/vZ2aj5p63DVKzlGik2FDy85EntyamvWq
	Hj8VeOlC/cVEV9kuKXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3i7i-00EAnV-UI; Wed, 14 Jul 2021 16:52:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3i7Q-00EAhw-V8; Wed, 14 Jul 2021 16:52:22 +0000
X-UUID: 570090a2a7154d20965f37b0a0aadc3f-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ey8cJk5ISuGc+g3NenQXgcyYJsjp0WhBllLkNYonH2I=; 
 b=d6ONB0/xqDw3DD3BR92zb9WWt2HM3ITYjyYKEJgS06FSCLRMhIo/yJ/scMyJkSnq7kRZP+AkLBnlYrahCLWf6xA+s1u56QvciM7wN/slC9XTO54LGEuSrIwNKFvXv4Im0pT0wg3A6pR3zyWUmirw7CaPB0dyQaeJbd9jmmH628Q=;
X-UUID: 570090a2a7154d20965f37b0a0aadc3f-20210714
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1424090845; Wed, 14 Jul 2021 09:52:15 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 09:52:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 00:52:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Jul 2021 00:52:11 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 4/5] mailbox: cmdq: add mediatek mailbox support for mt8195
Date: Thu, 15 Jul 2021 00:52:07 +0800
Message-ID: <20210714165208.2841-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210714165208.2841-1-jason-jh.lin@mediatek.com>
References: <20210714165208.2841-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_095221_044001_1FE0F006 
X-CRM114-Status: UNSURE (   8.90  )
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

Add mt8195 compatible name in the driver data of cmdq mailbox driver.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 5665b6ea8119..fc67888a677c 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -606,6 +606,7 @@ static const struct of_device_id cmdq_of_ids[] = {
 	{.compatible = "mediatek,mt8173-gce", .data = (void *)&gce_plat_v2},
 	{.compatible = "mediatek,mt8183-gce", .data = (void *)&gce_plat_v3},
 	{.compatible = "mediatek,mt6779-gce", .data = (void *)&gce_plat_v4},
+	{.compatible = "mediatek,mt8195-gce", .data = (void *)&gce_plat_v4},
 	{}
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
