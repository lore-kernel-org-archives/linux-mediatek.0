Return-Path: <SRS0=KhaQ=L4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DDBC07E95
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:39:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD02B613C2
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jul 2021 23:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD02B613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/VD7KR9MFAdyj/v4zl//te2J+uTG8NJopzCSyLx3Js=; b=3mAOCLbWx1pUht
	IE5S77lhi6qP5TrM0WBPudoFzJ4GgEmGk8bWMd9/0czoGFhu+wPht2g5/9jcKhZ0QnzK/po6DeLp7
	UKAl9lOc0Qkp3wjRM5aZGnchS9q1FYnqShHMxXg0CEaUe7O8PLKbdcSEDcdd5YvoJPl8N4hxiM/D3
	i6KTBHi5j+ZuxkR5uylEF8WeSExGgrQTfGTMPp8Q1oTydH4eKgR+KwKUR16mNAvLbwlIgOASPEyqH
	Dk8kERD5megz/cCvVXV6+0ONPRKDpbMLByxJmPiQTc7qUU74pTM5zZvoXDyNTxzYBCFUKh1VJiKtZ
	i00VNdO1d9AmzkHYnkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Bha-007AVx-6A; Sun, 04 Jul 2021 23:39:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0BDU-006uwk-Gm; Sun, 04 Jul 2021 23:08:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 733BC613F6;
 Sun,  4 Jul 2021 23:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625440080;
 bh=Auz1i9Vu8ZGHbO+T/8MnQgeUUVcxEUmWz8KkWj4sn7s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i+ApoUgbUn9HFYnfG2jgb6/X8zWWMBG8zXypTyLFS+LDpck6IrK09BD4mh4CHDMdL
 Dj7AMBiadT5a/fMJaCxcKNq24crhWinfNbuEaPKiqcuN1BXqc5tO/O8nhRkcWR2zrf
 rRSAPGzgnRNUs3A4O9ZI8bSLMyyNQs07N0i8WQmnfxASnw+aqvIUBKqSsR7hnJeTDf
 3w6EqSNi3nY2jZHI0Drsg+Mb68ayfSmjlwfcLhKCvQ9IrL67DM5qUAst6NqUqHKDu7
 HgZxYYcIPkSjdArMNroQhNiKR4gbUvcjSZeJ1BL3ee13CAI3BVH8FeVRlcg9j+cYkH
 XTCaxbfK14PJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Axel Lin <axel.lin@ingics.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.12 78/80] regulator: mt6358: Fix vdram2 .vsel_mask
Date: Sun,  4 Jul 2021 19:06:14 -0400
Message-Id: <20210704230616.1489200-78-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210704230616.1489200-1-sashal@kernel.org>
References: <20210704230616.1489200-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_160800_593207_A8E95DB4 
X-CRM114-Status: GOOD (  10.61  )
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

From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>

[ Upstream commit 50c9462edcbf900f3d5097ca3ad60171346124de ]

The valid vsel value are 0 and 12, so the .vsel_mask should be 0xf.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Reviewed-by: Axel Lin <axel.lin@ingics.com>
Link: https://lore.kernel.org/r/1624424169-510-1-git-send-email-hsin-hsiung.wang@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 13cb6ac9a892..1d4eb5dc4fac 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -457,7 +457,7 @@ static struct mt6358_regulator_info mt6358_regulators[] = {
 	MT6358_REG_FIXED("ldo_vaud28", VAUD28,
 			 MT6358_LDO_VAUD28_CON0, 0, 2800000),
 	MT6358_LDO("ldo_vdram2", VDRAM2, vdram2_voltages, vdram2_idx,
-		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0x10, 0),
+		   MT6358_LDO_VDRAM2_CON0, 0, MT6358_LDO_VDRAM2_ELR0, 0xf, 0),
 	MT6358_LDO("ldo_vsim1", VSIM1, vsim_voltages, vsim_idx,
 		   MT6358_LDO_VSIM1_CON0, 0, MT6358_VSIM1_ANA_CON0, 0xf00, 8),
 	MT6358_LDO("ldo_vibr", VIBR, vibr_voltages, vibr_idx,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
