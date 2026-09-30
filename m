Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECB9CC9830E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 06:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=; b=2zzTEEibGOmSt4HgI7/BOfxAFe
	K7PLiUjRZdTW+Ym627G71S7wXg7H8R7OY+Ro/1iLBR21HRq/9QV0S3lsu/CIfcRB9be3H0IWmjuIJ
	jfZ3eQ+Z+pMci1czLjFU6Vqk6LCruDyfV+6GVQOWf2ayG5UYMjUEW9cCqlWtPJKiMHZ0ExGJ0Kwen
	kqMvN44sr2QolfY3HXNasws6w+paw16/EXiIH8+SwMC3uxqiig2OHqUEIN4W7trUgqKSP3esBmN1h
	/CxkVZ/QU3uJQmSCcqLAfa33bcUwvZ5t90fOa343mJ9QUtNJ5Hk+EewT1lb+c220NXytSs3TozS1o
	ymBeDGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoHZ-00000005CvU-2dNn;
	Wed, 30 Sep 2026 06:59:13 +0000
Received: from mail-wm2-f12.google.com ([74.125.225.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoHV-00000005Cum-3R2r
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 06:59:11 +0000
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso51981755e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2026 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751547; x=1791356347; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=;
        b=q60OalJ0xpm6AzOZj9m+MOunIIS1lIp+6aBkMK0NLX+5Fyof5+2BcGPqkn/Bm/CxjW
         nVoOLNC2Mh2juWm8pUMKBW42Qm5FrNcES2LCu6dr25VKWTdPvN4Ozu6z3QFEWmotev0j
         ls1spL93lJMWvycUfR10+F+1AEWs1H09kfyNKG64VM/HewjNku+4YIC1124EfLpIo+V+
         BPnaNtotIrZHy91HJDOareLJHD5PmLLK0uhUACIyr194AHw0tD338LAs4uR+q01irVuB
         w1kiZaUSyoPWagPsGBLBV0ady3+uBkZgj3ivMqqC1wl2e8GlSe3qdb6LzALNgI2dgOs3
         JmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751547; x=1791356347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3hIjYJMajezV+sDqkSmD0y2RNrwAHxMDlFZcFTj1lfM=;
        b=Z89UNOD8wnLogSyWANQEXEID9BLU5vV9jD9a/3KfMn7VkWWHhunuMFsj6souj8y2iq
         Uky44DUtNseAAyRoC65Psapyo/5r0VWkUvaEH7QUaTIFZOMYfOGPMGy9bQoMjSRgVmP0
         JkJ0XRyBCGMh+fDHvrXjhHo12AylQXbpnnYuZ7Zyy2oWlYlDTMMyvGjhiFQMWuRhW/2k
         KarsxyZ+RZLL6ih0VhFGXU4PLPqb2Rm4yszsu2wE8jrLS1So0oxRyrv7cn88XMhiMAKC
         1ygGS6SpLrwnvt9zVh3Fjyag8bobyIxOoIibuf/0u5tSdtkZJgWySY+4Vdd99+jF1nca
         dXsA==
X-Forwarded-Encrypted: i=1; AKwUvBwIfCmfssyH01Ama14sPfGDvarjX0D8rYAFp0DTgX8A17ykU2uF1zrxz4hNfbuwdRQWMxecLa7gQz6YF0xHSg==@lists.infradead.org
X-Gm-Message-State: AFuF++lgsXWEEVfSdW2d0c7ogAof5yTM96LPVv825wqwcxRLvMPQzS2u
	/OJtMd38l8DWzFj5Ex8oNWVdOr9wEeVWkbv3X0DyPpSP8csm8fP/QR7s
X-Gm-Gg: AYBFou3PRkedot1P6jJBVSvh4u/Q+PB0davyX2X56XGDpn98meR/WqEUusIrZ741huC
	UW55jX1uw2PrDAvRJWUciLGNXF/px1+ZQm56GnM+UCGc/cdBvnWi48FSXiy0fCs62NAGOwGx5mo
	uN5bG6/bb7mSdWmbsA8g/7XgAKc6wVd8qqBG90n23UyNrSVjfC4lPF/dsjxPx8kFy2c57Yoflr3
	xDfENrnv31HuOkmqUCSDDNCQNzmzIhGRfcYej7RigRNGVkZklhKgWbn5B/jQN14pivoP6tWoRV2
	LShEPAMJLTWsfmv5vR7/pbbPbQIEMNCbX9Tsr1SQv2ZdGSBvwfU7ant3xb9EMmi/BUIlOTEXvV2
	7p2p70iCac2Mifq3pzdnyvVrZsw30Yawh9t0TZL+Km9LvPE1NgLSEdJiaZ2s5HDkacrT4bvNyhZ
	a/dekhkBjdRD9HprjWuWQHcs1eK6Fgq7Q5kfyx6cx6Re4CXAR8IbQEPyzrkEUnADrZznywjNZQ/
	cxvYaEOTXLJhYnnpgQ6Zf9i17eGETp8y/fT+/eubVRVYBr9rpnu0YTU3EMTrMAt
X-Received: by 2002:a05:600c:1f8b:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a01addee56mr5091765e9.7.1790751546607;
        Tue, 29 Sep 2026 23:59:06 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a0174fb304sm27802115e9.11.2026.09.29.23.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:59:06 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Leto=20Liu=20=28=E5=88=98=E6=B6=9B=29?= <Leto.Liu@airoha.com>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH net v6] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
Date: Wed, 30 Sep 2026 08:58:48 +0200
Message-ID: <20260930065855.46171-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_235910_308585_73352ED6 
X-CRM114-Status: GOOD (  18.25  )
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

From: Leto Liu (刘涛) <Leto.Liu@airoha.com>

CPU accesses QDMA via the bus. When multiple modules are using the bus
simultaneously, CPU access to QDMA may encounter bus timeouts and fails,
resulting in QDMA configuration failures and potentially causing packet
transmission issues. In order to mitigate the issue, introduce a retry
mechanism to airoha_qdma_set_trtcm_param routine in order to ensure the
configuration is correctly applied to the hardware.

It's enough to try a second time for the TRTCM config to be actually
applied to make sure we are not in the middle of bucket handling as it does
operate on fixed time slot internally.

Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
Signed-off-by: Leto Liu (刘涛) <Leto.Liu@airoha.com>
[ improve commit description, drop memory block, apply better loop logic]
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v6:
- Out of RFC
- Fix to correct Author (confirmed by Airoha)
Changes v5:
- Drop memory block (not needed)
- Loop only 2 times
- Improve description
Changes v4:
- Rebase on top of net
Changes v3:
- Init data
- Use continue instead of negative error for poll
- Add memobry block after CFG_PARAM

 drivers/net/ethernet/airoha/airoha_eth.c | 32 +++++++++++++++++++-----
 drivers/net/ethernet/airoha/airoha_eth.h |  2 ++
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 21ac80bdd084..b164a78ddac9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -3120,14 +3120,34 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
 		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
 		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
 		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
+	int i;
 
-	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
-	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+	/*
+	 * HW might be in the middle of bucket handling and might
+	 * require an additional try to actually apply the new TRTCM
+	 * config.
+	 */
+	for (i = 0; i < TRTCM_CONFIG_RETRY_MAX; i++) {
+		u32 data = 0;
 
-	return read_poll_timeout(airoha_qdma_rr, val,
-				 val & TRTCM_PARAM_RW_DONE_MASK,
-				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
-				 qdma, REG_TRTCM_CFG_PARAM(addr));
+		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
+		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
+
+		if (read_poll_timeout(airoha_qdma_rr, data,
+				      data & TRTCM_PARAM_RW_DONE_MASK,
+				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
+				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
+			continue;
+
+		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
+						mode, &data, NULL))
+			continue;
+
+		if (data == val)
+			return 0;
+	}
+
+	return -EBUSY;
 }
 
 static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int channel,
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 286f73e2e1e0..d270729e22ff 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -184,6 +184,8 @@ enum trtcm_param {
 #define TRTCM_TOKEN_RATE_MASK			GENMASK(23, 6)
 #define TRTCM_TOKEN_RATE_FRACTION_MASK		GENMASK(5, 0)
 
+#define TRTCM_CONFIG_RETRY_MAX			2
+
 enum airoha_dma_map_type {
 	AIROHA_DMA_UNMAPPED,
 	AIROHA_DMA_MAP_SINGLE,
-- 
2.55.0


