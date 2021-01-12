Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A5BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 03:20:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC49F22D6D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 03:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC49F22D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+EPv/ZSeh3EsNsgkFIj2ZCgR+HcVfBBW1YNNwu02EoI=; b=07/2+lRaGUqSn8OhhCE0+5dZav
	obgPX2mxjT5rI0F3URAH72XO1w4c+oFCe99yxfg3/dUkGHqfFvu2mDirP6u/XumQ4fvxtgBOBrqE0
	GZpb2ODERBUcBpvDHcuLFRkuZWqskvGfliiBcTcIJw3f+mnX4R4Iw6ak3TW2izsDx9iwVFr78/ncQ
	u4WGsghpxyQeISwwsbuY19Jyw8aQwTOKkTRvCxFFcMuF0obAP6NtW8UfDhHc2GnVW+HW9DKogjF6E
	kmP8dBbUKGkW+CSwZ5Iybab7zqxm3bEbXiOqviZ424cZnNEcs0yzFxcXfs4hvCAemAMNYOB9eut6H
	b8fQKV1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzAEf-00022H-CD; Tue, 12 Jan 2021 03:20:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzAEa-0001zz-Sa
 for linux-mediatek@lists.infradead.org; Tue, 12 Jan 2021 03:20:43 +0000
X-UUID: bbaebf63b4dd472da0d93798be43c467-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=B19bzf/fhV+41v5NBjkGCoeBcXyytkZuk+GcKSbJ95o=; 
 b=MLVofCCGPoAjeaT9QVf212KCNd2MNAUY8dGIq+ogLmINRwHvun7sOIuHsw/M1t8L/jzEXHVD0wdXPn1xKyqpAI4+SmVfeDoWypKfaZIlnJWwB3SecwR7GKz2xSANr1YViDqw156wOMmdxbNJCMBQ3CJQDaXMKDi0qiz69OYC9Q8=;
X-UUID: bbaebf63b4dd472da0d93798be43c467-20210111
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1266299775; Mon, 11 Jan 2021 19:20:33 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:20:32 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 11:20:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 12 Jan 2021 11:20:30 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
Subject: [PATCH v2] mac80211: fix incorrect strlen of .write in debugfs
Date: Tue, 12 Jan 2021 11:20:28 +0800
Message-ID: <20210112032028.7482-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_222041_126402_D5B32E1A 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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
---
v2:
- fix r/w buffer OOB
- put buf[count] = '\0' to an else
---
 net/mac80211/debugfs.c | 44 +++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
index 48f144f107d5..9e723d943421 100644
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
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
