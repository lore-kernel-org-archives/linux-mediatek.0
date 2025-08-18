Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C91DCA0EF1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c2psIv9qKbiJ6YLrBPsU39p5+TEb8fUSSv2gD6HEML0=; b=cfZ7d/4wELJAld6kgfNPw8DbPG
	9U1p8Kzm9zMkYghbmsmI2xIDoNbmBnzGoQe/imSzj2isxQTB56xAmX1CQ6oTgmYc9zWb9z9goOhqx
	K+cP8HkvYr/fUqdn7eJG2g79wCo8FBQlWzMnvK+6senL4BGNEw4LNViQOjI7HTDW+Ewz0/Owi+OAu
	fZPrAknJfy1nNF4MoDMcJPahKxaNl1gfdWF8dIs7q8MZQzMLU4N3DSC+/Nai8BNAcrEgtWHiZXBzd
	jqxWAYMgbAVknCHm8cAvLlOPHY//lfVNAfNtUyl2eBwYLe0t9TDvYCUeOUJPUmDY/8lkfVFIRLrFi
	7sZl3YCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07E-00000007aTj-0S2c;
	Mon, 18 Aug 2025 13:41:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwdV-000000076rG-0ZUt;
	Mon, 18 Aug 2025 09:58:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 40BCF601D1;
	Mon, 18 Aug 2025 09:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446B2C4CEEB;
	Mon, 18 Aug 2025 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755511119;
	bh=IVmYnonridwoQ6jxBvPZC4yerBdgroDgBZFPopy1r4g=;
	h=From:Date:Subject:To:Cc:From;
	b=Nb29xwR4T10F6R7bKovgIT+ZChFem4oFqrrSeKarqu8BltJfcqsKclZEQmv7Hih1X
	 JWpstzx1AnSCQ1wur/mxxVwjheTkLnXd+DDywd4XnNzbUPqAemGb+/PQKe9Ez3SuwQ
	 +2fsH2idrkM2Ssw9zcAS7ft6fl5x4P+UiXcgbM2xBXH1kkRkWJEPFKyn4T6cDczVvL
	 mOP5pnQ4m2HBG4jtSv/15lT4lT07wjOT7LcHQIpGQANBwaEsyY5fOMU4o/jp00TMut
	 7Bkn07TCGqvEKxhLHASHCWBDre+/ev2Dpcm3weav2nLhXG5WMusdSBTvhilIyqxqaf
	 aYYMv4h5bKBjw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 18 Aug 2025 11:58:25 +0200
Subject: [PATCH net] net: airoha: ppe: Do not invalid PPE entries in case
 of SW hash collision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-airoha-en7581-hash-collision-fix-v1-1-d190c4b53d1c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAED5omgC/x2NUQqAIBAFrxL73YJKpnSV6MNqzQXRUIggunvS5
 zyYNw9UKkwVpu6BQhdXzqmB7DvYgksHIe+NQQmlhZUWHZccHFIy2koMrgbccoy/iJ5v9F4N62j
 MLoyCdnMWavOfmJf3/QAi4fK4cgAAAA==
X-Change-ID: 20250818-airoha-en7581-hash-collision-fix-ff24b677d072
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Kubiak <michal.kubiak@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

SW hash computed by airoha_ppe_foe_get_entry_hash routine (used for
foe_flow hlist) can theoretically produce collisions between two
different HW PPE entries.
In airoha_ppe_foe_insert_entry() if the collision occurs we will mark
the second PPE entry in the list as stale (setting the hw hash to 0xffff).
Stale entries are no more updated in airoha_ppe_foe_flow_entry_update
routine and so they are removed by Netfilter.
Fix the problem not marking the second entry as stale in
airoha_ppe_foe_insert_entry routine if we have already inserted the
brand new entry in the PPE table and let Netfilter remove real stale
entries according to their timestamp.
Please note this is just a theoretical issue spotted reviewing the code
and not faced running the system.

Fixes: cd53f622611f9 ("net: airoha: Add L2 hw acceleration support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 47411d2cbd2803c0a448243fb3e92b32d9179bd8..88694b08afa1ce232b34c64f605a151aed137b6d 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -736,10 +736,8 @@ static void airoha_ppe_foe_insert_entry(struct airoha_ppe *ppe,
 			continue;
 		}
 
-		if (commit_done || !airoha_ppe_foe_compare_entry(e, hwe)) {
-			e->hash = 0xffff;
+		if (!airoha_ppe_foe_compare_entry(e, hwe))
 			continue;
-		}
 
 		airoha_ppe_foe_commit_entry(ppe, &e->data, hash);
 		commit_done = true;

---
base-commit: 715c7a36d59f54162a26fac1d1ed8dc087a24cf1
change-id: 20250818-airoha-en7581-hash-collision-fix-ff24b677d072

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


