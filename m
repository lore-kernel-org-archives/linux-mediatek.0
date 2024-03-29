Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43446C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXHIauoDWL/5l0Ol6gp+zJaj9iLJuqlHu2AgyBNf8Gw=; b=tT9NRM2Cgz1VPUH6qfBkTI4moG
	4pSK6VGPUiUBLtCc3JQflN+EEQOzbi+8cGB5XhS6jIykEj3mSa98N0h+pdnO44FLbzGbihpGm0NxG
	e0uLTUzWYu4msIPVOvih7skgZZFkyg+R/FXS+vid4MzZxScVwSBLm8+MmDgqOeXspD1drUzQLePt+
	Kf5xUAup7Qd42U156pyg4895mE2R5iNE1lw+b0S28KYO9vH+9vA/QAevIkhBSX+KVdRKvuxwaahC2
	uFAoULdjqV+1pXDXBHAHOAgETiXlNdru9JOJxR5fMsz2VjlytyEtw7B4PYDPiXY/wKKRdKurgnmQ8
	dzQT0xHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBMk-00000000Lsh-04ox;
	Fri, 29 Mar 2024 12:29:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBME-00000000LZ1-2UPi;
	Fri, 29 Mar 2024 12:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D10BC6191D;
	Fri, 29 Mar 2024 12:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D69C43390;
	Fri, 29 Mar 2024 12:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715357;
	bh=kCYlsjnjhRCFwW3ooyxlXYFDVmS7Q+NdhjZM27HwCFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ajw7rh4xZhctrCu0NfBWkd4cx+2b5z5cSbLe9DZrQ0NKI+itbJhcs7dqbMgvH3p+M
	 6j1iL1zYr71O4/5+Q0oig9d8KH+DVnsR4oc/Db14xEFEy29OAAn6v1sKWaP0AB6S2e
	 gBHMKmq0reeHQS5OIxzduqLPuTqpjHDZgygxKLioNiCbVQurWaQZhm26pR+j0vTovd
	 a6y+NCkC+f1bM41Gus30cha9evPu7/IlIIGwPFtDErAY05QQ2s8sLtEHDvEORBchQ+
	 E8kAgow9OC+wxFtp0LEYs7QGnTg8ZMG9MHm7EKkD1MHcEABOCjtQSC8GPxz8VAzCxW
	 azQFEFHakxbOA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	luiz.dentz@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.8 67/68] Bluetooth: btmtk: Add MODULE_FIRMWARE() for MT7922
Date: Fri, 29 Mar 2024 08:26:03 -0400
Message-ID: <20240329122652.3082296-67-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329122652.3082296-1-sashal@kernel.org>
References: <20240329122652.3082296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_052918_801738_CE2CAAA2 
X-CRM114-Status: UNSURE (   9.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 3e465a07cdf444140f16bc57025c23fcafdde997 ]

Since dracut refers to the module info for defining the required
firmware files and btmtk driver doesn't provide the firmware info for
MT7922, the generate initrd misses the firmware, resulting in the
broken Bluetooth.

This patch simply adds the MODULE_FIRMWARE() for the missing entry
for covering that.

Link: https://bugzilla.suse.com/show_bug.cgi?id=1214133
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/bluetooth/btmtk.c | 1 +
 drivers/bluetooth/btmtk.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index aaabb732082cd..e5138a207f371 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -420,5 +420,6 @@ MODULE_LICENSE("GPL");
 MODULE_FIRMWARE(FIRMWARE_MT7622);
 MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
+MODULE_FIRMWARE(FIRMWARE_MT7922);
 MODULE_FIRMWARE(FIRMWARE_MT7961);
 MODULE_FIRMWARE(FIRMWARE_MT7925);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index 56f5502baadf9..cbcdb99a22e6d 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -4,6 +4,7 @@
 #define FIRMWARE_MT7622		"mediatek/mt7622pr2h.bin"
 #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
 #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
+#define FIRMWARE_MT7922		"mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
 
-- 
2.43.0


