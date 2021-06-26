Return-Path: <SRS0=XU5C=LU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1134CC49EA6
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 16:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A800161C20
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 16:34:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A800161C20
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZicOz4f7f2TNaYiZf7wURE+TQCdNHkhbYOdbVJKe3ZY=; b=rjU24y4bPxJd1f
	bBKhgyK2UaQ3BxPRgj0gbbvnhEiJdtL8rT/iq2qGmyNm2awHQw6fJpiY4p0SzhHCORm60VQYQgIlc
	KK/KfF6QJ/rNr5wtzqHdELFcg/sdwOVbGBPKHHNfqllK8sYXtEnzm4bMD/NllTY8PE4Bkd+S6z3YM
	CFScRD7tnIXO8aLo/+Zw3Q/CaXR4LOyLZFb0UsnmAUyeOk9qd6wH97+8vdgbNz59fZYaFye3hsJ2x
	1TpPpkCDMiK5KdXuYNiQig4iP/qdUJdmHsjn677K2sra8BkpqfMQ4vNYZMQTxvXXEMiUN4H9iwSlp
	YFebZd7fiHCt8ZzH6hdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxBFp-004TXb-Qj; Sat, 26 Jun 2021 16:34:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxBFm-004TWS-Et; Sat, 26 Jun 2021 16:34:00 +0000
X-UUID: ad83a92420ed4ad39c9c8753809fb109-20210626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mPESVXQFfqEkBUf6DvrAY2UULdJC3Sw1f7zR0Cv/Qls=; 
 b=BT+7EDo0VoL9sxV93Mb9Sdx32GXvGbRsgxKTxu1IFRlWbH9LDN2CurY1giID86+7PLY97xHgwP16OF1zpMpLHvgsxQsaJaQRF+ssrJ4HfexKiwUj4ucDrpH5O+qQ/KJ4ZNJ61wiDZEMz2TTSufTF5eeFRWNlRS1/4UrTeiXJ2qg=;
X-UUID: ad83a92420ed4ad39c9c8753809fb109-20210626
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tung-chen.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1991650905; Sat, 26 Jun 2021 09:33:51 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 09:23:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Jun 2021 00:23:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 27 Jun 2021 00:23:47 +0800
From: TungChen Shih <tung-chen.shih@mediatek.com>
To: <rjw@rjwysocki.net>, <viresh.kumar@linaro.org>, <matthias.bgg@gmail.com>
CC: <wsd_upstream@mediatek.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, TungChen Shih
 <tung-chen.shih@mediatek.com>
Subject: [PATCH v2 1/1] cpufreq: fix the target freq not in the range of
 policy->min & max
Date: Sun, 27 Jun 2021 00:23:25 +0800
Message-ID: <20210626162324.8236-1-tung-chen.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_093358_551758_268876CA 
X-CRM114-Status: GOOD (  13.42  )
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

    The function cpufreq_driver_resolve_freq() should return the lowest
supported freq greater than or equal to the given target_freq, subject
to policy (min/max) and driver limitations. However, the index returned
by cpufreq_frequency_table_target() won't subject to policy min/max in
some cases.

    In cpufreq_frequency_table_target(), this function will try to find
an index for @target_freq in freq_table, and the frequency of selected
index should be in the range [policy->min, policy->max], which means:

    policy->min <= policy->freq_table[idx].frequency <= policy->max

    Though "clamp_val(target_freq, policy->min, policy->max);" would
have been called to check this condition, when policy->max or min is
not exactly one of the frequency in the frequency table,
policy->freq_table[idx].frequency may still go out of the range

    For example, if our sorted freq_table is [3000, 2000, 1000], and
suppose we have:

    @target_freq = 2500
    @policy->min = 2000
    @policy->max = 2200
    @relation = CPUFREQ_RELATION_L

1. After clamp_val(target_freq, policy->min, policy->max); @target_freq
becomes 2200
2. Since we use CPUFREQ_REALTION_L, final selected freq will be 3000 which
beyonds policy->max

Signed-off-by: TungChen Shih <tung-chen.shih@mediatek.com>
---
 drivers/cpufreq/cpufreq.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 802abc925b2a..8e3a17781618 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -544,8 +544,23 @@ unsigned int cpufreq_driver_resolve_freq(struct cpufreq_policy *policy,
 	if (cpufreq_driver->target_index) {
 		unsigned int idx;
 
+		/*  to find the frequency >= target_freq */
 		idx = cpufreq_frequency_table_target(policy, target_freq,
 						     CPUFREQ_RELATION_L);
+
+		/* frequency should subject to policy (min/max) */
+		if (policy->freq_table[idx].frequency > policy->max) {
+			if (policy->freq_table_sorted == CPUFREQ_TABLE_SORTED_ASCENDING)
+				idx--;
+			else
+				idx++;
+		} else if (policy->freq_table[idx].frequency < policy->min) {
+			if (policy->freq_table_sorted == CPUFREQ_TABLE_SORTED_ASCENDING)
+				idx++;
+			else
+				idx--;
+		}
+
 		policy->cached_resolved_idx = idx;
 		return policy->freq_table[idx].frequency;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
