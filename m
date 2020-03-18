Return-Path: <SRS0=5sS2=5D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BDCC5ACD6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 12:41:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08CDC20768
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Mar 2020 12:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h9zzPrUU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0zoBC4Dj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08CDC20768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWk70ASr6w0qe77m7yb6hBa4VGn17L7pfm7XyHj7lvY=; b=h9zzPrUU560WzQ
	r5wUOvWOZ/0nzxMdMSB0mTyhds9EgoLA6AYglEWhuq3lN8soYADf6tIOJvCXtQ645B9fvNFpLpzWT
	PFrv9HZGVQC5f3IQFog3b/80/IrejoBjjACbjv93/8+TTLvaZecAgSb3utn69bDhxltzjRvmygMjU
	oZpwAohpiVxHAk55rcLZ3ecTnjrab/m76gN/Soom5kFYodOltpb0YeXIwfqUXrBTjcJBLokke1zBN
	eIZ3CWeXyfNbjcWboHyUwbtnxtfYqNQOkeFmo++KvQdxEAjNKxy6kcVZGq0Zfhg6sNBRjps/aIbai
	piHNSbIaN7QLw7CibkZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEY0w-0004bR-Tn; Wed, 18 Mar 2020 12:41:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEY0u-0004aX-8K
 for linux-mediatek@lists.infradead.org; Wed, 18 Mar 2020 12:41:37 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1798B2076D;
 Wed, 18 Mar 2020 12:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584535295;
 bh=lqF7zlnVf6/0NevdwimAGCK2mAe+Unj/eKbq5AcaaTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0zoBC4DjueVAsTH1srqDMn38jdGTE4SiRcKHsMtsXubaswhnNf7XuRfJm3+Ev9+yP
 26GoqgwOgzN7A3K8NI/iV+ZyamvzjPVGJ5hlxoSx/68xyM72pjsedpDiZNMQ1cdWXz
 tEvPl9SidP1UsqG/jyTs4MkcJvXjmsD8zFCSz4p0=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: kvalo@codeaurora.org
Subject: [PATCH 1/3] mt76: mt7615: fix mt7663e firmware struct endianness
Date: Wed, 18 Mar 2020 13:41:03 +0100
Message-Id: <d14dfd7cd91a4dda8c5dcd03e8a70ff11314182e.1584534454.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584534454.git.lorenzo@kernel.org>
References: <cover.1584534454.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200318_054136_315662_868AE99F 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: ryder.lee@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi@redhat.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert fields in mt7663_fw_trailer and mt7663_fw_buf to little-endian

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 50c98913d81d..9978f6bb22ab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -44,16 +44,16 @@ struct mt7663_fw_trailer {
 	u8 reserv[2];
 	char fw_ver[10];
 	char build_date[15];
-	u32 crc;
+	__le32 crc;
 } __packed;
 
 struct mt7663_fw_buf {
-	u32 crc;
-	u32 d_img_size;
-	u32 block_size;
+	__le32 crc;
+	__le32 d_img_size;
+	__le32 block_size;
 	u8 rsv[4];
-	u32 img_dest_addr;
-	u32 img_size;
+	__le32 img_dest_addr;
+	__le32 img_size;
 	u8 feature_set;
 };
 
@@ -1896,7 +1896,7 @@ static int mt7663_load_n9(struct mt7615_dev *dev, const char *name)
 			goto out;
 		}
 
-		offset += buf->img_size;
+		offset += le32_to_cpu(buf->img_size);
 		if (buf->feature_set & DL_MODE_VALID_RAM_ENTRY) {
 			override_addr = le32_to_cpu(buf->img_dest_addr);
 			dev_info(dev->mt76.dev, "Region %d, override_addr = 0x%08x\n",
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
