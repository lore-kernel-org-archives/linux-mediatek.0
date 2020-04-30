Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27D5C8300A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 09:11:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 838182082E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 09:11:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kFZGqUFL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/ol0t36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 838182082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J3pTPMM/j+V+9oEath4B/8v8Ql6yDFwV38KX4qsg+WQ=; b=kFZGqUFL762vfR
	Y0G7gpEGwUhChyFxlBH+YqhxdmYw+S33WlOqHwfCACEHI2a3XWvh01gu+oUXKnCEejvQ0uWCv5bcX
	rHItBTOGG9Sl89rt4b9ePtvbXgTdMG7RIKS6AE2t0++bbz8nqro3dTJSmQqpQ66deiZG70FfmybJd
	L2xYQxaCV+bCVMX4ibbUeJ9bys6Rha9hhGOuk+4E7YYNc8fZpKQFktuhXiXTKJoZemwzZ9N2ZxzXU
	6N+KkPLqfNkKJb1g6PbvXjyaUH4cqKWETkYumVTTpDnQx6brE2/BTF9DPX8yaa23zeEXWDMqm3Dxk
	ic17x3qZDb0hUTe0zhpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU5ES-00010C-Ik; Thu, 30 Apr 2020 09:11:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU5EP-0000zO-LI
 for linux-mediatek@lists.infradead.org; Thu, 30 Apr 2020 09:11:46 +0000
Received: from localhost.localdomain.com (unknown [151.48.130.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2824D2082E;
 Thu, 30 Apr 2020 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588237905;
 bh=qYKXVG525kcJYMIpXLoKjSYurQvdHvTSRuEfaeMk4yY=;
 h=From:To:Cc:Subject:Date:From;
 b=Y/ol0t36QSC6XGcwK/CbFwNLDMtMkN4wSRFp7MnS8h4QDE8y0bKxV+emA1jANVzBd
 DkKP/giRlPvc4oo66n1/Jk3Ckkaq4unbfUwk65x9j38YoWtoNICST0IgyYWNGlVJdq
 ofC4LX2hMBjuMqT5E23uwZhMHc0ROLfp8PBHIL1w=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: add passive mode for hw scan
Date: Thu, 30 Apr 2020 11:11:34 +0200
Message-Id: <db966b257f8e19d243bde38a0694a86375a6c9b2.1588237791.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_021145_715939_1C2CEBD1 
X-CRM114-Status: UNSURE (   8.12  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce support for passive frequency scanning to mt7615_mcu_hw_scan

Tested-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 727a55abda69..6d536088f6c8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2737,8 +2737,8 @@ int mt7615_mcu_hw_scan(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 
 	req->seq_num = mvif->scan_seq_num | ext_phy << 7;
 	req->bss_idx = mvif->idx;
-	req->scan_type = 1;
-	req->probe_req_num = 2;
+	req->scan_type = sreq->n_ssids ? 1 : 0;
+	req->probe_req_num = sreq->n_ssids ? 2 : 0;
 	req->version = 1;
 	req->channel_type = 4;
 
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
