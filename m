Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDC5C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 20:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CM+VP4JOLOjXHp72OS6W8HAUM38PEnIlFPCcMsrLwR0=; b=d4jlVQSubdYX1Xt1F02WPLrUxx
	4GQkMJz2fQsAQF9kYniBHzPdNhJore970XHdgOrEzeZ7ajq2A3kX6HoJZmwbok/OZoJfWHe9vUM6F
	cbSVnrsRf4sFJVGHBbOcYV4eGsWG5/4AUlAxW4TV+HZ+eTGPYnMZP0gzE3E17dX/mS5HcdFkgp904
	PQLfCRT1raMQRs0R3FDQFMEq3SNguCrxeK8uMAwaXRm8NukOGaeNzgeZ1FiricsL5e9gkiXM+MlNj
	8WsmZVZ2Fz6K03o0Au+KNiRfRJdVPHzyOddF5E8RQm5IOsXT6YZ0ySM6Q5YOzu++0fnrkqPSoivuH
	bDvJgMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFfH-005ZNe-1r;
	Mon, 04 Dec 2023 20:35:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFfC-005ZL6-2b;
	Mon, 04 Dec 2023 20:35:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DDCE61349;
	Mon,  4 Dec 2023 20:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B87C433BC;
	Mon,  4 Dec 2023 20:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701722134;
	bh=i49s+DcY45DOcgp3WZwxJD37Nuiyf9nVIer8Ct53ez0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=crkR8a/anvbWyM1ILL6d2LQFwgvPJkGLuAr3r4vDVcxcXoDQYIBdI2Uqc1L0kTA/h
	 ETxvX+zSepRO6pD4hm8AL4xEB3K2722ZcPkeW79Tufmx66bi0d0hq8G3poJIue/I/k
	 Hrl7/HRTMrqPYUdVuZZ/ylEhDYCl6UVk2y7deCZ/y3qiH8ii4JtZDcgyP1/L4EX4yN
	 QL89PqTK7/3RkhioLHhXlH5hl10sjcM1t5N8h5menRjBZAX2eDIL7sGDLfjVQEteQW
	 slkeCTU5e5UY32mIkb/8603+bRc9arXibLm7+vProgvJKkfW8AYCZEiOxbBs2sBPk1
	 L4q/xUN3IBN8w==
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
Subject: [PATCH AUTOSEL 6.1 06/17] wifi: avoid offset calculation on NULL pointer
Date: Mon,  4 Dec 2023 15:34:51 -0500
Message-ID: <20231204203514.2093855-6-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204203514.2093855-1-sashal@kernel.org>
References: <20231204203514.2093855-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.65
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_123534_921204_C2BB2F61 
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
index 870ae4cd82029..dce105f67b4d8 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -2658,12 +2658,14 @@ ieee80211_he_oper_size(const u8 *he_oper_ie)
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


