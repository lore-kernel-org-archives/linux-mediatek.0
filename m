Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D7AE64009
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Apr 2026 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ncnpvs7B3KhxlO+WRuPRM3eg1ZSdDJ0ooKbApZFkLMA=; b=E5sdSQRvK0e6V6S3Bx3cRUaVqK
	A0XoVla+wvAyEKkn7D/76IyHEtJCQGwSMVNzWKlWaBRZrqgh0kwLx4lE931jKFbR/TWDDNaZW2Mj1
	0O8CoOyX2Q7F8uyYUYvy3g+xJIfSk8gEy6PkH/bHuFlpNX32oflPtu3xY5HwmbUS8SG39AEGhisud
	cqdM37Z1c0GFT2O895kR9H57IglPe3ouTvRdn42vAoxXxcgopI/tLz74r03d5I3TOKtoItkV3KsMG
	691zHkzvpP7Zn0eT91ftVIgoXbpIHK9N6MD8zd5GXwpUcGJpQvBAotHrA0w6UjrUWn86AOwHVKvMn
	o1FT/qJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBrYV-0000000EDuJ-1Pho;
	Sun, 12 Apr 2026 09:56:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBrYS-0000000EDtJ-3Xxb;
	Sun, 12 Apr 2026 09:56:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20C634402E;
	Sun, 12 Apr 2026 09:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E81FC19424;
	Sun, 12 Apr 2026 09:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775987796;
	bh=bWTAU7CtOZ3is69U6C/L35u5+9IkLvK6b+Gt8sgHq14=;
	h=From:Date:Subject:To:Cc:From;
	b=re+ASIDoyvLcewdruxi3zdzfMhuhe06Y4T2is62zvRj1ZVH706WVGyOBTdaPqO3zr
	 Cb1oh8voTefZCIHL7eYKII+R1xERpT+ZaZhlU1LZZOxwVAeinbNbk6HQwuasK+FNeU
	 6oZtugDtdUwltwLBim44z7H9eYCOGuxCLMV5K8jNlhF4PsLAwM/RV8/9mdPdFHTsub
	 eG8x+1Vnxz8/Znl6H+PhptGdJy5NNO2Oh4Jt+kN0oV2uyEvxCn5HaHn4fAvLeVjQmF
	 QdMj9ubzAxjQSPEYa1AKYP9XyXjAC2RZSxVvV7yZLtkPxqjP9lCl8VN6VdP2k864m8
	 xZLnKUYzFoLdA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 12 Apr 2026 11:56:25 +0200
Subject: [PATCH net-next] net: airoha: Remove PCE_MC_EN_MASK bit in
 REG_FE_PCE_CFG configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260412-airoha_fe_init_remove_mc_en_bit-v1-1-7b6a5a25a74d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NywqDMBBG4VeRWTegobWXVyllSMc/dRZOShJEE
 N+9octvc85OBVlR6NHtlLFq0WQNw6kjmYN94HRqJt/7sT8P3gXNaQ4cwWpaOWNJK3gRhvFbqwu
 3+3SNIpcoI7XKNyPq9j88yVCdYav0Oo4fH3pjxHsAAAA=
X-Change-ID: 20260412-airoha_fe_init_remove_mc_en_bit-a89d7fcc5fc6
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_025636_929824_15E190DB 
X-CRM114-Status: GOOD (  10.72  )
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

PCE_MC_EN_MASK bit in REG_FE_PCE_CFG configuration performed in
airoha_fe_init() is used to duplicate multicast packets and send a copy
to the CPU when the traffic is offloaded. This is necessary just if
it is requested by the user. Disable multicast packets duplication by
default.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 8e4b043af4bc..9b5b677a7071 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -458,9 +458,8 @@ static int airoha_fe_init(struct airoha_eth *eth)
 		      FIELD_PREP(PSE_IQ_RES2_P5_MASK, 0x40) |
 		      FIELD_PREP(PSE_IQ_RES2_P4_MASK, 0x34));
 
-	/* enable FE copy engine for MC/KA/DPI */
-	airoha_fe_wr(eth, REG_FE_PCE_CFG,
-		     PCE_DPI_EN_MASK | PCE_KA_EN_MASK | PCE_MC_EN_MASK);
+	/* enable FE copy engine for KA/DPI */
+	airoha_fe_wr(eth, REG_FE_PCE_CFG, PCE_DPI_EN_MASK | PCE_KA_EN_MASK);
 	/* set vip queue selection to ring 1 */
 	airoha_fe_rmw(eth, REG_CDM_FWD_CFG(1), CDM_VIP_QSEL_MASK,
 		      FIELD_PREP(CDM_VIP_QSEL_MASK, 0x4));

---
base-commit: 3f3a2aefbc661b837c8e344f944982d61c2ae037
change-id: 20260412-airoha_fe_init_remove_mc_en_bit-a89d7fcc5fc6

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


