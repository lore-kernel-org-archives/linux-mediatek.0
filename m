Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB151CD6E5D
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 11:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6xafbRXrQYJcQWI35leRcnL8SW7t3QtBe6w0y/exT90=; b=jxjoOtOZV2foqg74zRUgdnpJW7
	iZ0lDh7RX1deavcw/WsABOqatJBGBEfoZnB2na2sMF/8144Rcbd3XX5yGI16Rr1nAtapIIEcv2G6h
	5MfKi6o5cfbmha+n1OAbBdRyFGogd6zPsxJdVIg9HLLZ5JpjtHquKgbShRUi5SSoy9U7u3J4Fziyy
	JknnGbj7X423GeS4/5ZVG9woNyHIaaGvoW0+909lniDHndomYY5FLe2n2z3qQTKg8wJS+YGyGmxki
	2VQeMRqOdSBEdGxXpUSjlTDRJHeg/GNHG0dj/ialxKm56pU374RAl1Uzd+SZIHP02tv01m50PeeJH
	5uD3MVIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Bt-0000000Alxi-389h;
	Mon, 01 Jun 2026 11:52:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Bs-0000000Alx3-3dJe
	for linux-mediatek@bombadil.infradead.org;
	Mon, 01 Jun 2026 11:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6xafbRXrQYJcQWI35leRcnL8SW7t3QtBe6w0y/exT90=; b=hnXooslvkm+hCeCAfQh+c8bj5H
	PAll9OXdDfFoQgg8gHqsEBatWt+vzv/2x5kJrmbeDSs9pajUe4QzWLmutZ1uHyqX1HgLZmSgwWoEm
	/nq8kSxzr9oihKAJX11oOMaoYfU6OMcu/LGq0TRR4g41XoBy3NF+8Lc+O1hWccLn+R63G197Nr4DE
	02/ZY8FROAA/GCU8qd/GCOOs75anBldvfU4TGNpmbdnkVnT+DdX6YRrfEDlHDfWq5PO9FyXyRHZlW
	jN8vED9bqzb7+aoUk/pZZBqUyc0T/JWoFQm17EgdcF9gSrY7WJsiLVWzD+WlfGwG9ZzmmX3Bgv7RC
	meZO1ZLg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Bo-00000006Zzm-2grE
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 11:52:19 +0000
X-UUID: 318fd4025dae11f1acbe4559397dec65-20260601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=6xafbRXrQYJcQWI35leRcnL8SW7t3QtBe6w0y/exT90=;
	b=gVfesZXjsuuiecNsZdi3yt633qkDMQq/HsOZdc49LiOO4rWe/R6x0gEj+1zxqNnO4JQldUQnxGupD+nD9obJ61Rx+5lz1jc7+r+LbFH8GWfdrFSi1BeC3onZCBbwzcJsMbH/B+mn4h2l75ffxMXM4LwlN5TYGMS+aTN7gWNjQo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:f4267ebe-09eb-41d1-b037-d25ac09a5be2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:4db0fd9f-d1e2-4782-856f-c727ae10217a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|836|865|888|898,TC:-5,
	Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 318fd4025dae11f1acbe4559397dec65-20260601
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jianyu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 102851695; Mon, 01 Jun 2026 04:36:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Jun 2026 19:36:53 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 1 Jun 2026 19:36:53 +0800
From: <jianyu.li@mediatek.com>
To: <kuniyu@google.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>
CC: <willemb@google.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<black-ch.chen@mediatek.com>, <ivan.tseng@mediatek.com>,
	<jianyu.li@mediatek.com>
Subject: [PATCH net v3 2/2] af_unix: Add test for SCM_INQ on partial read
Date: Mon, 1 Jun 2026 19:36:40 +0800
Message-ID: <20260601113640.231897-3-jianyu.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260601113640.231897-1-jianyu.li@mediatek.com>
References: <20260601113640.231897-1-jianyu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_125217_644728_A6C7C813 
X-CRM114-Status: GOOD (  12.42  )
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

From: Jianyu Li <jianyu.li@mediatek.com>

Add test to verify that when a skb is partially consumed,
unix_inq_len() return correct remaining byte count.

Before:

  #  RUN           scm_inq.stream.partial_read ...
  # scm_inq.c:165:partial_read:Expected remain (512) == *(int *)CMSG_DATA(cmsg) (768)
  # partial_read: Test terminated by assertion
  #          FAIL  scm_inq.stream.partial_read
  not ok 2 scm_inq.stream.partial_read

After:

  #  RUN           scm_inq.stream.partial_read ...
  #            OK  scm_inq.stream.partial_read
  ok 2 scm_inq.stream.partial_read

Signed-off-by: Jianyu Li <jianyu.li@mediatek.com>
---
v3: Align macro definitions
v2: Follow reverse xmas tree ordering in partial_read test case
---
 tools/testing/selftests/net/af_unix/scm_inq.c | 54 ++++++++++++++++++-
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/af_unix/scm_inq.c b/tools/testing/selftests/net/af_unix/scm_inq.c
index 3a86be9bda..6268b5bf50 100644
--- a/tools/testing/selftests/net/af_unix/scm_inq.c
+++ b/tools/testing/selftests/net/af_unix/scm_inq.c
@@ -8,8 +8,9 @@
 
 #include "kselftest_harness.h"
 
-#define NR_CHUNKS	100
-#define MSG_LEN		256
+#define NR_CHUNKS		100
+#define MSG_LEN			256
+#define NR_PARTIAL_READS	3
 
 FIXTURE(scm_inq)
 {
@@ -120,4 +121,53 @@ TEST_F(scm_inq, basic)
 	recv_chunks(_metadata, self);
 }
 
+TEST_F(scm_inq, partial_read)
+{
+	char buf[MSG_LEN * NR_PARTIAL_READS] = {};
+	char cmsg_buf[CMSG_SPACE(sizeof(int))];
+	struct msghdr msg = {};
+	struct iovec iov = {};
+	struct cmsghdr *cmsg;
+	int err, inq, ret, i;
+	int remain;
+
+	err = setsockopt(self->fd[1], SOL_SOCKET, SO_INQ, &(int){1}, sizeof(int));
+	if (variant->type != SOCK_STREAM) {
+		ASSERT_EQ(-ENOPROTOOPT, -errno);
+		return;
+	}
+	ASSERT_EQ(0, err);
+
+	ret = send(self->fd[0], buf, sizeof(buf), 0);
+	ASSERT_EQ(sizeof(buf), ret);
+
+	msg.msg_iov = &iov;
+	msg.msg_iovlen = 1;
+	msg.msg_control = cmsg_buf;
+	msg.msg_controllen = sizeof(cmsg_buf);
+
+	iov.iov_base = buf;
+	iov.iov_len = MSG_LEN;
+
+	for (i = 0; i < NR_PARTIAL_READS; i++) {
+		remain = MSG_LEN * (NR_PARTIAL_READS - 1 - i);
+
+		memset(buf, 0, MSG_LEN);
+		memset(cmsg_buf, 0, sizeof(cmsg_buf));
+		ret = recvmsg(self->fd[1], &msg, 0);
+		ASSERT_EQ(MSG_LEN, ret);
+
+		cmsg = CMSG_FIRSTHDR(&msg);
+		ASSERT_NE(NULL, cmsg);
+		ASSERT_EQ(CMSG_LEN(sizeof(int)), cmsg->cmsg_len);
+		ASSERT_EQ(SOL_SOCKET, cmsg->cmsg_level);
+		ASSERT_EQ(SCM_INQ, cmsg->cmsg_type);
+		ASSERT_EQ(remain, *(int *)CMSG_DATA(cmsg));
+
+		ret = ioctl(self->fd[1], SIOCINQ, &inq);
+		ASSERT_EQ(0, ret);
+		ASSERT_EQ(remain, inq);
+	}
+}
+
 TEST_HARNESS_MAIN
-- 
2.45.2


