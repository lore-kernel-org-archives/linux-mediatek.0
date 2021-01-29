Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1180C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 15:37:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529A664E1B
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 15:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529A664E1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y+SMK5ClWQex3XNWuo1xvx4VixAwKb7NSqi4H/B3oHg=; b=W/Vgf3sSPxjPLv9zOze/6gT7/
	S1y8dJH/WwbdPejatdPXds54TQIDdp+k4wAP39CwAD2ThdCtXRvtJ/U60xfeKhRVQMqzziwNfNdeZ
	KODwxuEjax6JaAI/4ln8/WbfCfR53taMmSbqryRAf0VrJ+CETZMiFXXjnG6VSoPGZAvkMeDmHXzwx
	sifx0tm9Mv/gvXnR5ZeopCrIVuVyyz6SIBR0PXtea5tOx1USiF3RXDt/quFNqkSqtuDsX1B8hJJ9g
	Zq8wfpSSBBHAso9bvSGHPjdN69QB8ZtUbEsZXQ58r0YeN+Fr+dHamFunhYa14uZ7uq22rYTooXicu
	pGnL9MyLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Vq3-0006Om-Tu; Fri, 29 Jan 2021 15:37:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Vq0-0006Nu-R8; Fri, 29 Jan 2021 15:37:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17E1064E13;
 Fri, 29 Jan 2021 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934652;
 bh=qMW7ue19Uwp7HdV1n3mt6+nPLKC9zLXPVm9Mhou7CTo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uZpCNNK/gpA5NiqgqnYd+aiRpazHJcy6fPT0Vfokl+jvqvp1tIVNBFUq5uJJBsAbv
 vAHRko76R6GW2Rjq6NIoKhWNqSDXq47ztf9V2cuqtCc8hUNTpc754Ktgf4hZElgHP7
 ZkwN6aLs1/fr3/14c42yqpjhZzU6fdIaBRbHzMf4bQlwGmVfOV5J/dn81axu9pklZG
 mERAywvA3uAuXB/mkM22ZeUPYX51i2/MaLYvfR3s03romVsjTQO2CgubJNnJNnWk81
 sGIDSjGgEG1+zLa4dTi/B9KvPtNDDllq8/OrrtW29MGgMxxa4vDD6PfRvCldd1LUso
 IUhczYo4fWm9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 15/41] mac80211: fix incorrect strlen of .write
 in debugfs
Date: Fri, 29 Jan 2021 10:36:46 -0500
Message-Id: <20210129153713.1592185-15-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129153713.1592185-1-sashal@kernel.org>
References: <20210129153713.1592185-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_103733_033356_B3A45FAE 
X-CRM114-Status: GOOD (  11.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Johannes Berg <johannes.berg@intel.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sujuan Chen <sujuan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Shayne Chen <shayne.chen@mediatek.com>

[ Upstream commit 6020d534fa012b80c6d13811dc4d2dfedca2e403 ]

This fixes strlen mismatch problems happening in some .write callbacks
of debugfs.

When trying to configure airtime_flags in debugfs, an error appeared:
ash: write error: Invalid argument

The error is returned from kstrtou16() since a wrong length makes it
miss the real end of input string.  To fix this, use count as the string
length, and set proper end of string for a char buffer.

The debug print is shown - airtime_flags_write: count = 2, len = 8,
where the actual length is 2, but "len = strlen(buf)" gets 8.

Also cleanup the other similar cases for the sake of consistency.

Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Link: https://lore.kernel.org/r/20210112032028.7482-1-shayne.chen@mediatek.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/mac80211/debugfs.c | 44 +++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
index 90470392fdaa7..de5cd3818690c 100644
--- a/net/mac80211/debugfs.c
+++ b/net/mac80211/debugfs.c
@@ -120,18 +120,17 @@ static ssize_t aqm_write(struct file *file,
 {
 	struct ieee80211_local *local = file->private_data;
 	char buf[100];
-	size_t len;
 
-	if (count > sizeof(buf))
+	if (count >= sizeof(buf))
 		return -EINVAL;
 
 	if (copy_from_user(buf, user_buf, count))
 		return -EFAULT;
 
-	buf[sizeof(buf) - 1] = '\0';
-	len = strlen(buf);
-	if (len > 0 && buf[len-1] == '\n')
-		buf[len-1] = 0;
+	if (count && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+	else
+		buf[count] = '\0';
 
 	if (sscanf(buf, "fq_limit %u", &local->fq.limit) == 1)
 		return count;
@@ -177,18 +176,17 @@ static ssize_t airtime_flags_write(struct file *file,
 {
 	struct ieee80211_local *local = file->private_data;
 	char buf[16];
-	size_t len;
 
-	if (count > sizeof(buf))
+	if (count >= sizeof(buf))
 		return -EINVAL;
 
 	if (copy_from_user(buf, user_buf, count))
 		return -EFAULT;
 
-	buf[sizeof(buf) - 1] = 0;
-	len = strlen(buf);
-	if (len > 0 && buf[len - 1] == '\n')
-		buf[len - 1] = 0;
+	if (count && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+	else
+		buf[count] = '\0';
 
 	if (kstrtou16(buf, 0, &local->airtime_flags))
 		return -EINVAL;
@@ -237,20 +235,19 @@ static ssize_t aql_txq_limit_write(struct file *file,
 {
 	struct ieee80211_local *local = file->private_data;
 	char buf[100];
-	size_t len;
 	u32 ac, q_limit_low, q_limit_high, q_limit_low_old, q_limit_high_old;
 	struct sta_info *sta;
 
-	if (count > sizeof(buf))
+	if (count >= sizeof(buf))
 		return -EINVAL;
 
 	if (copy_from_user(buf, user_buf, count))
 		return -EFAULT;
 
-	buf[sizeof(buf) - 1] = 0;
-	len = strlen(buf);
-	if (len > 0 && buf[len - 1] == '\n')
-		buf[len - 1] = 0;
+	if (count && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+	else
+		buf[count] = '\0';
 
 	if (sscanf(buf, "%u %u %u", &ac, &q_limit_low, &q_limit_high) != 3)
 		return -EINVAL;
@@ -306,18 +303,17 @@ static ssize_t force_tx_status_write(struct file *file,
 {
 	struct ieee80211_local *local = file->private_data;
 	char buf[3];
-	size_t len;
 
-	if (count > sizeof(buf))
+	if (count >= sizeof(buf))
 		return -EINVAL;
 
 	if (copy_from_user(buf, user_buf, count))
 		return -EFAULT;
 
-	buf[sizeof(buf) - 1] = '\0';
-	len = strlen(buf);
-	if (len > 0 && buf[len - 1] == '\n')
-		buf[len - 1] = 0;
+	if (count && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+	else
+		buf[count] = '\0';
 
 	if (buf[0] == '0' && buf[1] == '\0')
 		local->force_tx_status = 0;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
