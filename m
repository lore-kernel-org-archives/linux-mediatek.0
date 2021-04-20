Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB34C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:27:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4FB60E08
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 13:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4FB60E08
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VX8y5MxJMQVnz4oC8KTac4mCeIynEnvZz+i1lT/HebM=; b=h1ebbhlQTzweyFrm/IK7IxevO
	/j9kyaF4YibUp0U8ma47nPeKzCgc5Vk/dCdUaQHXSmJ5gbRWj5Bw7I9VzoADqHkLD9T0L7xwqCEAf
	0vRyAZa+k0S960hKzyUqHxavE8ifMZlQrlWksT1qRF70I7g6WB1YGI7zJ6FiFRayKAW8A5qvPMPO6
	prtCOqDbTcgX34ps9Gkq5lRExVLeMs1TxVRoikR7y9F+mcq80aRwNfzKo7CHoQF6lMTj/V02VTlHk
	Rqs4c3uhfqojMQFITY1I8s+fuSjgJ64h153Ief0iOzwL9YqvF15V4N5cB0xIVh2iLV0CGYyJDX3S/
	tAnMIIAjA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYqPS-00CD0V-CW; Tue, 20 Apr 2021 13:27:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqOr-00CCud-Qu; Tue, 20 Apr 2021 13:26:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=x4PC10VWjynceWQKGlyruq1xHVfMHe0q+ks95eUDcMM=; b=WPtncAsAui950PHC9F06AqwxOD
 utMklSuvbdW+T9typhnnfrgiLRTAUqJLx+US/OclF6CkiV+45nM4SpImU9iKvBk5KkXNAaYYiZPKB
 T7sRUccOTbALJGZVbgqaNQ+FSuciEalHYX733U8snyhvYXr6z8sI/BT1aBY0zQsh8T44YNDABe2TK
 S6TDufXl3Tp8u0B+kwiek62h1XpbH/3d4wVtrJ7wY4kM+3yEpY3iEiDQ/oX4mwBi6fcSD67DNnahc
 qAonE/jaxHlET2VnMGb0hjdR+J/albgblpWUH5vQo1vxFdXH0GW/e1i31aPlcmCa3rC0ubJdCrDx+
 ShhvcZaw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYqOp-00C91k-C0; Tue, 20 Apr 2021 13:26:44 +0000
X-UUID: 32624907e7b94ba9af384ad8e6801bb4-20210420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x4PC10VWjynceWQKGlyruq1xHVfMHe0q+ks95eUDcMM=; 
 b=h4Amvf4zV4EtMkX2uOL4XqdQaDatxwvRwb5ngk9VPSOOCnHO5ReevrLdvhAn5RpAgTGbB5wpolNxmbFt+WEr/9H2fsGIk2bu9IoBdpwuMGd208bbXNW7Etcr83p6wkRXEVwqERMWhDQH5gSKCjU6igqkGVGEemsietuXaU9M0dQ=;
X-UUID: 32624907e7b94ba9af384ad8e6801bb4-20210420
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 607982649; Tue, 20 Apr 2021 06:26:39 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Apr 2021 06:26:38 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 21:26:20 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Apr 2021 21:26:18 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <yingjoe.chen@mediatek.com>, <eddie.huang@mediatek.com>,
 <cawa.cheng@mediatek.com>, <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH 3/4] drm/mediatek: fine tune the dsi panel's power sequence
Date: Tue, 20 Apr 2021 21:26:12 +0800
Message-ID: <20210420132614.150242-3-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420132614.150242-1-jitao.shi@mediatek.com>
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DE26EABE28240C1980E352A0A7E176B5B54C70B4B01E7B5C108E2A0C6A821C082000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_062643_433508_A7A48159 
X-CRM114-Status: GOOD (  11.34  )
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

Add the drm_panel_prepare_power and drm_panel_unprepare_power control.
Turn on panel power(drm_panel_prepare_power) and control before dsi
enable. And then dsi enable, send dcs cmd in drm_panel_prepare, last
turn on backlight.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index a1ff152ef468..455fe582c6b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -615,10 +615,13 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
 					  dsi->lanes);
 
+	if (panel_bridge_prepare_power(dsi->next_bridge))
+		DRM_INFO("can't prepare power the panel\n");
+
 	ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
 	if (ret < 0) {
 		dev_err(dev, "Failed to set data rate: %d\n", ret);
-		goto err_refcount;
+		goto err_prepare_power;
 	}
 
 	phy_power_on(dsi->phy);
@@ -661,7 +664,9 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->engine_clk);
 err_phy_power_off:
 	phy_power_off(dsi->phy);
-err_refcount:
+err_prepare_power:
+	if (panel_bridge_unprepare_power(dsi->next_bridge))
+		DRM_INFO("Can't unprepare power the panel\n");
 	dsi->refcount--;
 	return ret;
 }
@@ -694,6 +699,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->digital_clk);
 
 	phy_power_off(dsi->phy);
+
+	if (panel_bridge_unprepare_power(dsi->next_bridge))
+		DRM_INFO("Can't unprepare power the panel\n");
 }
 
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
