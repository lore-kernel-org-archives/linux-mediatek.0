Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B91AC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 13:21:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9AE61A0D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 13:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E9AE61A0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4iMHH8XZyFnA+Y22V3h5l7WpRvqElzAtgJSVul14ZI=; b=aYhWcckqOJyvU+
	fZIifUtcyhCCaQceYdTx4ealHHx1uyJJGVz+Vl6vgKMoCPSgcf8LwibbKYfpt05xMC1RnRXAfLDTc
	pzOl2M6cARJ80SafcMAU4gxHhpcBK0KwcWAGPUeIqY6veAQRKLUM8NTkfTKXNxpf3WmPwUurCxfjs
	EooVAsUCR8JuRVz4eJkYgWGII9o4wB5Bvr/IFHVD3IrzobsNoQN+ugg7GGx1x6HREuiohds7yxU3h
	uJ9I46FzY+YNqSihtr3Hj9pm8fNSG7hiaX/lRMpeXX4KMcyoSQo1THZGjOiD4ZAAKVbKMCkuUk1ic
	Gc2484pnm+LhqpDxouuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8N15-00ErWX-Ll; Tue, 27 Jul 2021 13:21:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Mzu-00Equ3-PS; Tue, 27 Jul 2021 13:19:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93FCE61AD0;
 Tue, 27 Jul 2021 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627391990;
 bh=CpHqBJMBPLIIkdTz32VJBiNhwoL6EL3dIb1W5UgcNEY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hY9vxGSK7FUetwYUn6u6PyA45Bb3siYEZ1nC3AOtrQl+LQ0+Ny27EvHHHyiRVoiTj
 Yuzu8YI0F2V5b105VJiff1WWbf1nfs8jYqbFSMYZuT6YDE7o+X/NtLDHhirbcVqB25
 x4ItWoviSzMnii9XA3604JjtEd/oQY9knjAVLy916nnFUqV1fV12dojpbyeh1yyKcE
 QRj+ChfEldmGr/RI4ppma/lFcyIJ1jwixVkrqcap/ZE3eyhUVkz7o7p+eCOqMa/OJn
 rgj61uwCQ9AYOdkEkg0wyVd8l/zEYSY0wFzCVL1ZpK0ODF6gUaQjcUwJx2KMJnyeCf
 sNQTrVwzhi+Lg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Sasha Levin <sashal@kernel.org>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 09/17] mt7530 fix mt7530_fdb_write vid missing
 ivl bit
Date: Tue, 27 Jul 2021 09:19:30 -0400
Message-Id: <20210727131938.834920-9-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727131938.834920-1-sashal@kernel.org>
References: <20210727131938.834920-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_061950_900666_13216FDF 
X-CRM114-Status: GOOD (  13.29  )
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

From: Eric Woudstra <ericwouds@gmail.com>

[ Upstream commit 11d8d98cbeef1496469b268d79938b05524731e8 ]

According to reference guides mt7530 (mt7620) and mt7531:

NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to
read/write the address table. When IVL is set, MAC[47:0] and CVID[11:0]
will be used to read/write the address table.

Since the function only fills in CVID and no FID, we need to set the
IVL bit. The existing code does not set it.

This is a fix for the issue I dropped here earlier:

http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025697.html

With this patch, it is now possible to delete the 'self' fdb entry
manually. However, wifi roaming still has the same issue, the entry
does not get deleted automatically. Wifi roaming also needs a fix
somewhere else to function correctly in combination with vlan.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/dsa/mt7530.c | 1 +
 drivers/net/dsa/mt7530.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 190025a0a98e..f6af1b6fa83d 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -359,6 +359,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 	int i;
 
 	reg[1] |= vid & CVID_MASK;
+	reg[1] |= ATA2_IVL;
 	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
 	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
 	/* STATIC_ENT indicate that entry is static wouldn't
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 9278a8e3d04e..319a4d86bea4 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -74,6 +74,7 @@ enum mt753x_bpdu_port_fw {
 #define  STATIC_EMP			0
 #define  STATIC_ENT			3
 #define MT7530_ATA2			0x78
+#define  ATA2_IVL			BIT(15)
 
 /* Register for address table write data */
 #define MT7530_ATWD			0x7c
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
