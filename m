Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33323C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:48:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E107A613BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:48:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E107A613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1OJ9inB6imC60nik784GLCzGV+Dlwgm0+mfWLfT6e1w=; b=CPXSjhBQeqssrvEt1mWjDQoYo
	YnrTb8ezD9sDbp4AUR1HZqE/UdzhKJRrhkkG4wJNAQA6SAdKZ6BW9d85SwUpp1kjFcrtbDcW20rzh
	jid/REaqV0Fl9HxnWTF8bjklRdbD3lMwtECkbPTZrnxhzQu1KKj1+aOlqeOoiBurCeHemMzUjVXHz
	sqeo7YwDwVfaL9VsN2PWIXhH4tjUPpPJOUbL7wbTOUBVQzJiA77SnBirNHZQTvgo4fvPa4Mm1frgd
	Tm4uXFtA6gs31g6zO4FA6BVGnRGa4LXW9dhFnfQZ5Gpmx/Y9VyQUVCZbZoRIHt4i1Or6F5AnJPu79
	SrHFQ4tnw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKhU-001kqQ-7B; Wed, 05 May 2021 16:48:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKVd-001g27-Fm; Wed, 05 May 2021 16:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eGa7MmtUWiQbNNAmdJQyjy7crqU82DrlM074+fjqvnQ=; b=OHZFBd2McOugRWPHwPyNHPAgsE
 88/SDZHzciUqWjO/ghKYqn0wLq0NphBB5lOUOo3arBmrzuDAXodODXA0jmruL6ywUfbXmjbCVDLEG
 /V8+ZLiwoVis38XMqxYFXORPRSoI+/nNw/aX/4rDhqHhP6sdx4bhdGKhT0KQMXdh5aFkJ80pYDrNU
 maUgbnx29+c/MeMaQMVxnc6nHEme7fdTibml2jrX7X8Sqz3NcbuPmZsKGWEQhLiXne+Sjh2P4znk/
 i1n0ehSahQRitfbJTipTjnnRWgXbwOP9lwKhEI30j+fEhu+Tk8zd1BhuUD6XC2eHRO/Q76w1XwHJ+
 CA1NDhfA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKVa-004xGK-UA; Wed, 05 May 2021 16:36:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7783D61950;
 Wed,  5 May 2021 16:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232582;
 bh=9mVVTIyO3GoraZ4daLg8NQq3Rb1A6AFtHrKHAh7LU78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oPi9HIbwX+3x1gZBeE0ljFIt857SyvWaY6OliNDPoPvf6mWcpoYXhFIuvPees+ENe
 bY/ClVxVVv93nNCcg/p6aAXpoTAjTuLSFjUInQSItX5DHw1AXZsRKfYdyUhVGCxQTe
 qe4pY3CD6i6ej61ZeNp0+2HBUnCg4iWqfWwiX+RILMNjjdHtdK9vWjD3V0fSoa7S0b
 uRWYP5lSNK4FV1uVCL3eEE297GwIoLQD1VGjqwXiDl90g1vWnhjAJv0wDieRS3WHTX
 WR72SrC5xdwUH+FdDO71v3iU+93JdH2Y1ZG7PyW39YnSu3OUOIrYVOZ9gv3ANZa4eW
 MvJVtCxwz4BXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Sasha Levin <sashal@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.11 088/104] mt76: mt7615: fix entering driver-own
 state on mt7663
Date: Wed,  5 May 2021 12:33:57 -0400
Message-Id: <20210505163413.3461611-88-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163413.3461611-1-sashal@kernel.org>
References: <20210505163413.3461611-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093623_029346_FDBB928E 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Felix Fietkau <nbd@nbd.name>

[ Upstream commit 5c7d374444afdeb9dd534a37c4f6c13af032da0c ]

Fixes hardware wakeup issues

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index c13547841a4e..4c7083d17418 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -291,12 +291,20 @@ static int mt7615_mcu_drv_pmctrl(struct mt7615_dev *dev)
 	u32 addr;
 	int err;
 
-	addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
+	if (is_mt7663(mdev)) {
+		/* Clear firmware own via N9 eint */
+		mt76_wr(dev, MT_PCIE_DOORBELL_PUSH, MT_CFG_LPCR_HOST_DRV_OWN);
+		mt76_poll(dev, MT_CONN_ON_MISC, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000);
+
+		addr = MT_CONN_HIF_ON_LPCTL;
+	} else {
+		addr = MT_CFG_LPCR_HOST;
+	}
+
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_DRV_OWN);
 
 	mt7622_trigger_hif_int(dev, true);
 
-	addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
 	err = !mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000);
 
 	mt7622_trigger_hif_int(dev, false);
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
