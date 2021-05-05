Return-Path: <SRS0=WaF/=KA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD920C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:52:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D9FB613CB
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 May 2021 16:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D9FB613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5xmlX7q2SbIaiq3HuiYALA5VeTfzfA1fmr+7PAybDjg=; b=pToi5eaHzBd5PFsx0lTV/aFtw
	3nntMCC97VGwPbW/ctaX04UTEoHfr0i9bua/9/NtrA58dqEHyDCGm+z8Dau8i4sY8HcEC2iFlrBUD
	Svj1LTHY9LtfX5vSxTVNjOTRrKmIpNSv9EceaqYu8PZ1KdC4LOiH5rO7odk+/L7HObSUc+2oMH8ec
	R5H7HuvM5Xi9xMKgTiytu1/Naa9P69UCVkijxjOhHJAo8StjtWRQ6SyKCFQuzRcl27SoetAZ4+NON
	uGCzcZKoxI1vDsheOxBdYk+rfUiKN+ZFu3/3MQxuSUkq5Ss7J8kl2awYZr+rnRFUJ1gyqlDOcGw0C
	NQ9ypfGGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKl3-001mAQ-EI; Wed, 05 May 2021 16:52:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKX2-001gfz-KZ; Wed, 05 May 2021 16:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=SxU9701kadJK7GxjxTpOsTj4GxOKcprKXF/9Qdtt09k=; b=w7D1AasdCdjfptPee7TY1KJlJP
 J/l4uUnGSBEDlGU8H49Te/qbBuj1GOmn4/KSE7XJtbBrkWJfVVFWYqd+6ZW91tymIduECOv+QUn8U
 hqFDAP63udzvmjdrOSQIePaHfDM9/LwigHi6boCN3JMCoxnhrODDHJtuduXe9vwEUQpmIKMu1fT6O
 CyT7ZqeHG2pb4B9N/6ufhCC5PECCmpp8PdpATFC1z+IZNzr94LbcKJskGfBoBAmSkDVr6dSLSoDmA
 nYk72rGoy7lOJoNByr8PaKcfv3n974vAgh6eVWMgCGYfIEwiow/grYOWey68qliZYSqyauIMYb6ck
 D6o4KbmA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKWz-004xZF-Ve; Wed, 05 May 2021 16:37:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5647361973;
 Wed,  5 May 2021 16:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232669;
 bh=PYEZy+o/d4XEqCxocBCi/YNgBQBtU3X4yF0Be6Eo66o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RJX880rx0iwxtzGahorW7m1h0RFnWagvKiSoDuxEFPqdxvm4VK+we2aB0XU9Y2xuA
 YxUrq06/Vh6UL7fwSO+lStcC1YBcbhtAwadZfnBnOwbkWW9SYJFqqkKB/0jBdDbZ8O
 v023KSSX7frzD8tpfU5SBUOWosv2ymQ/OUNl3EP7x2jo3iPwYO0Dct6Ccv9xzd29lP
 aUXazPuEicT02FI+xnWIPS/VwPqQj8uen3b6Ssktbxz1JunWgCl3G0dHV66yamufCg
 Jsyz/t81RECsmQMpzkSqpyhDWP/3CKSo4Lz1FGnOyaIOLPmIIdg80grY6IB4nsLXt+
 w33RP5ZRPTaeA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Sander Vanheule <sander@svanheule.net>,
 Georgi Vlaev <georgi.vlaev@konsulko.com>,
 Stijn Segers <foss@volatilesystems.org>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 41/85] mt76: mt7615: support loading EEPROM for
 MT7613BE
Date: Wed,  5 May 2021 12:36:04 -0400
Message-Id: <20210505163648.3462507-41-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_093750_090245_BB89164F 
X-CRM114-Status: UNSURE (   8.99  )
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

From: Sander Vanheule <sander@svanheule.net>

[ Upstream commit 858ebf446bee7d5077bd99488aae617908c3f4fe ]

EEPROM blobs for MT7613BE radios start with (little endian) 0x7663,
which is also the PCI device ID for this device. The EEPROM is required
for the radio to work at useful power levels, otherwise only the lowest
power level is available.

Suggested-by: Georgi Vlaev <georgi.vlaev@konsulko.com>
Tested-by: Stijn Segers <foss@volatilesystems.org>
Signed-off-by: Sander Vanheule <sander@svanheule.net>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index f4756bb946c3..e9cdcdc54d5c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -86,6 +86,7 @@ static int mt7615_check_eeprom(struct mt76_dev *dev)
 	switch (val) {
 	case 0x7615:
 	case 0x7622:
+	case 0x7663:
 		return 0;
 	default:
 		return -EINVAL;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
