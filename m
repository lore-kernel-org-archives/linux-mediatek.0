Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8EAC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:18:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72ECB6101B
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72ECB6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZY6xJBtU55X6quD3/A909qs9AKmdt03lCh5Sgi422As=; b=nh6IY9yz7QrlVl/C9dBoocUpd
	QdaMMvNWszNszpXf6Vc2krem+H0+BBxbktk8OgkY0G3mQvv2hjMHeX0e4MLt8EyC/kE53M7g0MFCL
	YOSfMNxGCv19LLnesQke9gDKvwpEsOJ8+9a7ccihIoG/xsa9lZjCw4rPGIqwrXDpCgLM2MYVUHD5T
	Zxw6q+p9bZ/QLRA7fLIf3zOiUZQuueLvocQ2u9HC7UL0kjeM41v3MvXAffH4LKiuUSZ73of9RiIWm
	ZfdtqIvWtwVg5JUgcNeKvZzUyL+fSdKi4yX165r/NUqAEYqx8ZSKEQKo0sZf6x9EXeNvjNI4Ls8lK
	WeO04FO2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7g9-00Elv6-1P; Mon, 10 May 2021 15:18:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7g7-00Eluj-B1
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 15:18:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=DmRvMDY2k8k26zx+jt/S9pkJMFjpFtKIY0EDaYaPOoI=; b=Bp2/YvVy5OfpSevm3hUazSKyUS
 pcAbWh4wuRwLALua2BTuyFaFlkPpxdlF2WmOSt+AZQZ8PuZEpel1A2GFkI1j5xHHSSYkMXTD8B7Tr
 oj1sUqCeG5fz1bX/JPsveMAl32jdUaP2rDJh/AwEpUSMVnyUrQwruJrQph1gyrcTwSHJ5aQ3VA+M7
 pNXEOvMU1krVFJAcA305HHlZpZKHERlgL5fD6r8RNGVpytvktmD5n+PyZ7WITvqPvO5W+1Wwzb+Tr
 Faj1ZYBN35sGCznU1NhY00e7D9csrjOXwR15nceP+UZqc9P/P3FxWGLSpEagmYJ2SzlAomBVB2rjp
 18ahcIFw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7g4-008rUZ-F0
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 15:18:37 +0000
X-UUID: 51665c4021e741cb8973b3baaa25fab6-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DmRvMDY2k8k26zx+jt/S9pkJMFjpFtKIY0EDaYaPOoI=; 
 b=RwXGxP675pnrDSdgdsLIUGUBkyxtABLL/8mfwxvnsnF6OtlS04gF5IxvBPEteMY8kv0JpOokZ6EngjWlenRxwzzVi3Y4JxHIF3nEaYB+fHJtgC65WK7om0RrrdG0+waaYcD9M4SMAnL5RL1gqvNVdIQhXyadqloaEALIj3Ftwjk=;
X-UUID: 51665c4021e741cb8973b3baaa25fab6-20210510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 462482650; Mon, 10 May 2021 08:18:34 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 08:15:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 23:14:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 May 2021 23:14:58 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 3/9] mt76: connac: fw_own rely on all packet memory all being
 free
Date: Mon, 10 May 2021 23:14:51 +0800
Message-ID: <1620659697-12048-3-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_081836_530209_4F40099F 
X-CRM114-Status: GOOD (  10.05  )
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

From: Sean Wang <sean.wang@mediatek.com>

If the device is MMIO-based, we must ensure all TxD/TxP on the host
memory all being consumed by the device prior to safely switching to
fw_own state.

Fixes: ec7bd7b4a9c0 ("mt76: connac: check wake refcount in mcu_fw_pmctrl")
Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
index 2b1150bf8d3d..a588d2c39870 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac.h
@@ -133,8 +133,12 @@ mt76_connac_pm_unref(struct mt76_connac_pm *pm)
 static inline bool
 mt76_connac_skip_fw_pmctrl(struct mt76_phy *phy, struct mt76_connac_pm *pm)
 {
+	struct mt76_dev *dev = phy->dev;
 	bool ret;
 
+	if (dev->token_count)
+		return true;
+
 	spin_lock_bh(&pm->wake.lock);
 	ret = pm->wake.count || test_and_set_bit(MT76_STATE_PM, &phy->state);
 	spin_unlock_bh(&pm->wake.lock);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
