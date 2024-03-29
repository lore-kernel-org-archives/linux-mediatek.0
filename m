Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C01C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXHIauoDWL/5l0Ol6gp+zJaj9iLJuqlHu2AgyBNf8Gw=; b=QT9bJc65WSZQc1eHQHsEdgCvfK
	QbSPUnN57wKCPmCzxE5S4kAtKddBeg6OHSVCHmjWy0tSSXBpEfYml6PWCrvUWMrBchC6cENttLI5b
	4gsmCX1oxlTUpg2ysM3wA/ks7xeguz7dI2njsi3Wmt9T4cUmnwbp1rmwEh6hk3kJlTi0IeryqCxtJ
	ad+5udie3HW0Cz7LGQfsqG2m3VV6go+dMF2PPeyNkcUJGVP33YuLsu8Gy2dOwuYP9i2Yl3GpbUPjO
	lDxo55hzACa6043y52x8IunmTmNty2RGIQ9wokgModxZ1JVgPdEacuh6baKCS/EHR2RzA7HEyOE4R
	HqTuTgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBPh-00000000NGB-44WB;
	Fri, 29 Mar 2024 12:33:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBOo-00000000Mqs-16Kr;
	Fri, 29 Mar 2024 12:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wXHIauoDWL/5l0Ol6gp+zJaj9iLJuqlHu2AgyBNf8Gw=; b=TMWKShgmpzhzod0g9OHVof2i/H
	53sEYSGyVeXpgpMmtL/zi1jRKnWouEHW6Nr/g01twhQh2tgS4oGiDTqgj/jjA7AhFnR5wUNX1qAoG
	F7h33XHa+pkzUEHYbeFUhOPh+ZkFncN7tVGD8/s1qm1M6bIF3LQrUcIwK2YojE44B1jDYEWXnw+FV
	ERqmZ3h115wWS9owQzLLtigKlGWpN3hSxtvmZGg+YfeldLrMYCa91qCuJaqQDaF0LtwKfHF5AfTTk
	4o5Hf83gn6P6QdIMUmfe6mvP8m9B24xcEDiQQzPXBDGe8mAMpHqTaMwoKRfnDfsB/M1k6nBe7dlXy
	AQdB3gig==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBOk-00000001YKD-3T5J;
	Fri, 29 Mar 2024 12:31:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 728DF6192A;
	Fri, 29 Mar 2024 12:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0290C433F1;
	Fri, 29 Mar 2024 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715506;
	bh=kCYlsjnjhRCFwW3ooyxlXYFDVmS7Q+NdhjZM27HwCFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E7iFq4x7oD4/JWsqdONnz4T6IxIagaN13WoTq2yENRA7rtBb+HJLnrrjGH/9Ri58i
	 SeEFEfkiFWStt9PyC5Sl5ccPLUfwaMfDPC60f4AiYsXYtfzUTL/9kRJhWzqNScqUMm
	 13uvqeoyjgZYL4GACkqSVrHnO28sIxWtpVMfApdqZP6O4WYQM34gvqEjpp4IpjF62H
	 JDds9kiyTsEscDcj23Lb6EnDbR4f0eIpLfDTtD0aFenN/5URlPiui7Ewg593gtQvkn
	 B+oC3+HmuLpIa3yb20J2wj4quxwYxx/jbTKR5DN4yQuXNA9MgqwihypQvPIYLqQiOM
	 0qeqVl8F6U45g==
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
Subject: [PATCH AUTOSEL 6.6 51/52] Bluetooth: btmtk: Add MODULE_FIRMWARE() for MT7922
Date: Fri, 29 Mar 2024 08:29:21 -0400
Message-ID: <20240329122956.3083859-51-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329122956.3083859-1-sashal@kernel.org>
References: <20240329122956.3083859-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_123155_077695_F7982CF7 
X-CRM114-Status: UNSURE (   9.92  )
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


