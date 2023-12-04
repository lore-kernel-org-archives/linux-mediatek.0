Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4A8C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 20:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iywuclnxe4qXl01hiCvvjwRQnwH/F5YS1yrsGvDLij4=; b=HWlMSagUhZY2seJf2SBc+2uo2Z
	6ZVbtpJOZ2aHuPRYij0xw8jQ8dC3DG3nvy5V2/IPm725ok3JSUkhssbCKopKttubK/Owy6JGcZORp
	A1MxdNKtkI5GMEufxz+ET9OoU26CvTgp1A11VaQERL47wpvbcM/gz7s5zACiRdgKgptB3cNRlteJq
	dnVoQciZ6B3zgIzrIkH/oLnYVXXa3SsYMcTBDAwgU8k7tcxq1d9nH7i837rfBukPlKnibiaIWS1Nb
	Lcg7DQhiMwzLx+1f1yni6Emqg/2iWpQ03bm+ZdrvMBu7JbCbSVFWqxsVAdJCxOKKelsyuthWU1Etu
	nNCGqMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFdb-005Yqu-0m;
	Mon, 04 Dec 2023 20:33:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFdW-005YpZ-2p;
	Mon, 04 Dec 2023 20:33:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00D9D61284;
	Mon,  4 Dec 2023 20:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D0F2C433CD;
	Mon,  4 Dec 2023 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701722028;
	bh=Oe/XzUk1VemmFJ9zSC9J3wWmOiOIwp2Vd4qep/nEW4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y1+Cq7vZZnfn8FrP6d4qzjKbHTW14/3YfgI67YrcoazmugWsMl28CFVUG7Lrmtu8o
	 D1DuJIQ7iGf3LvAeX7LwH3O59ZAExBcFPWLb04sA3v6oJwbcmpaBXfjf1AM8WdC7sm
	 +KJ6zkbez7o1nvQDOeJldh2d8vpZJkSitD21+wUnt2NX7Blzz0wW8Kko6/RxrxUKVD
	 WWlP/bdqdUG39LY3L8whXj3gTv6SR8wMTizT3Gr2HF/v80/6FeX0v00+LhW9BIIUUH
	 Atvb67AYnNoM/TI3xZTiYZnBpKzGL+MKN5Tyi1TBXP7yolpiHpZp8CsbZqCgN/fyoi
	 7P7jCKDgf8PCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Michael-CY Lee <michael-cy.lee@mediatek.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	johannes@sipsolutions.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 12/32] wifi: avoid offset calculation on NULL pointer
Date: Mon,  4 Dec 2023 15:32:32 -0500
Message-ID: <20231204203317.2092321-12-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204203317.2092321-1-sashal@kernel.org>
References: <20231204203317.2092321-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.4
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_123351_039736_F632ABDC 
X-CRM114-Status: GOOD (  10.32  )
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

From: Michael-CY Lee <michael-cy.lee@mediatek.com>

[ Upstream commit ef5828805842204dd0259ecfc132b5916c8a77ae ]

ieee80211_he_6ghz_oper() can be passed a NULL pointer
and checks for that, but already did the calculation
to inside of it before. Move it after the check.

Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
Link: https://lore.kernel.org/r/20231122030237.31276-1-michael-cy.lee@mediatek.com
[rewrite commit message]
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/linux/ieee80211.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index b24fb80782c5a..6971bf16031f1 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -2790,12 +2790,14 @@ ieee80211_he_oper_size(const u8 *he_oper_ie)
 static inline const struct ieee80211_he_6ghz_oper *
 ieee80211_he_6ghz_oper(const struct ieee80211_he_operation *he_oper)
 {
-	const u8 *ret = (const void *)&he_oper->optional;
+	const u8 *ret;
 	u32 he_oper_params;
 
 	if (!he_oper)
 		return NULL;
 
+	ret = (const void *)&he_oper->optional;
+
 	he_oper_params = le32_to_cpu(he_oper->he_oper_params);
 
 	if (!(he_oper_params & IEEE80211_HE_OPERATION_6GHZ_OP_INFO))
-- 
2.42.0


