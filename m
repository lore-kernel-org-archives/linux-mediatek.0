Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33ABCD6E62
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 11:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXZ6VmHATIDJF/ddpM8O023vh0Uyqhny6zlESoVEa/Q=; b=XP3DlTCInvIZv5IE30reZerd5a
	5Q+wbVVE2WK0N22radyGkhrrgDsFv66cXIjPltDIsNCf7lfrRHc133SjZWxqevuvO/olq9IP3T/5r
	N2ZZg9kHW6oKSvcun1+GVjrazlJIUJ32Lex8Dg9FT2jjgVIwGZ2kfaf8Z4zP/Ks6265vnIZiByPS8
	JFqy2k+/W1ksxxAT/TFJAAwt6/wrA2iOeT7ikdQdacF/+s6avO+gezu2h7G6coKPTuqNrCeeHSMar
	leNiuTpU9+bs2wFQD0OACyRBlu3iinCsrCpX9zV1wxAVGZlDk4QkcPVyw+54Sh2q6zm6L8YB4FNlX
	dVEV+Pww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Bu-0000000AlyJ-3Qjt;
	Mon, 01 Jun 2026 11:52:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Bt-0000000Alx7-0iUE
	for linux-mediatek@bombadil.infradead.org;
	Mon, 01 Jun 2026 11:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gXZ6VmHATIDJF/ddpM8O023vh0Uyqhny6zlESoVEa/Q=; b=rKW5r/awO3w9Sl1QpuQg1+enuY
	IapJ1Lg2qLLmYGpadBd5Co1g6iAKp/nmNWN5WAfEF/TaqTkmAY+RhMw6TQaLzjW4Vk4ijQIBPuW15
	DxV+d9DIlg8cvsGh5qSNyuZNkg/Vim5zbHLribMa3iYDGaWLyLBTibCtZlbRQF09V92ZUw83q+gPG
	J3dzu0YevDxn0i70gjLk1YY1gZp3Q6cxD9ndWEt89fv9WgUCeJjbFyKvvv3I1OW91b1Q/3mn8QS7i
	Hu4Dqod1AF5jkxUY9glRTKIhDflxiTgPiVQ5SPfsY1cEGZp8rM2MGi5c4OmNpIGLncKn+TmRsaeBa
	cXQTP0UQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Bp-00000006ZzP-353E
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 11:52:20 +0000
X-UUID: 30e2aade5dae11f1afed4741b24580c9-20260601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=gXZ6VmHATIDJF/ddpM8O023vh0Uyqhny6zlESoVEa/Q=;
	b=Iacons+NOdz7PadjIgTmFnkt+2J6X/J4HC92c6YvqL2EeYvwnlWps8MyLmNoU7YvCfS8d8p67qrJjzOfJ5SXigXu0+r/M5gebz4alD/KdKokeBAgWZTqfRgLoCDoDmqYCVGjA0d+3iV+PnoaLNGvOqC4JQ4BXt0V1gANkL0ZJFc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:e7d11521-4f72-435b-8810-46c97019e5a8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:c3bbaec9-9273-4096-a0ce-fc7a6a4f85f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|123|136|836|865|888|898,TC
	:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:
	-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30e2aade5dae11f1afed4741b24580c9-20260601
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jianyu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1940443124; Mon, 01 Jun 2026 04:36:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Jun 2026 19:36:52 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 1 Jun 2026 19:36:52 +0800
From: <jianyu.li@mediatek.com>
To: <kuniyu@google.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <horms@kernel.org>
CC: <willemb@google.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<black-ch.chen@mediatek.com>, <ivan.tseng@mediatek.com>,
	<jianyu.li@mediatek.com>
Subject: [PATCH net v3 1/2] af_unix: Fix inq_len update problem in partial read
Date: Mon, 1 Jun 2026 19:36:39 +0800
Message-ID: <20260601113640.231897-2-jianyu.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260601113640.231897-1-jianyu.li@mediatek.com>
References: <20260601113640.231897-1-jianyu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_125218_446150_78CD7EB4 
X-CRM114-Status: GOOD (  11.10  )
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

Currently inq_len is updated only when the whole skb is consumed.
If only part of the data is read, following SIOCINQ query would
get value greater than what actually left.

This change update inq_len timely in unix_stream_read_generic(),
and adjust unix_stream_read_skb() accordingly to prevent
repetitive update.

Fixes: f4e1fb04c123 ("af_unix: Use cached value for SOCK_STREAM in unix_inq_len().")
Signed-off-by: Jianyu Li <jianyu.li@mediatek.com>
---
v2: Improve lock usage in unix_stream_read_generic()
---
 net/unix/af_unix.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/net/unix/af_unix.c b/net/unix/af_unix.c
index dc71ed79be..0d9cd977c7 100644
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@ -2886,7 +2886,7 @@ static int unix_stream_read_skb(struct sock *sk, skb_read_actor_t recv_actor)
 		return -EAGAIN;
 	}
 
-	WRITE_ONCE(u->inq_len, u->inq_len - skb->len);
+	WRITE_ONCE(u->inq_len, u->inq_len - unix_skb_len(skb));
 
 #if IS_ENABLED(CONFIG_AF_UNIX_OOB)
 	if (skb == u->oob_skb) {
@@ -3063,11 +3063,12 @@ static int unix_stream_read_generic(struct unix_stream_read_state *state,
 				unix_detach_fds(&scm, skb);
 			}
 
-			if (unix_skb_len(skb))
-				break;
-
 			spin_lock(&sk->sk_receive_queue.lock);
-			WRITE_ONCE(u->inq_len, u->inq_len - skb->len);
+			WRITE_ONCE(u->inq_len, u->inq_len - chunk);
+			if (unix_skb_len(skb)) {
+				spin_unlock(&sk->sk_receive_queue.lock);
+				break;
+			}
 			__skb_unlink(skb, &sk->sk_receive_queue);
 			spin_unlock(&sk->sk_receive_queue.lock);
 
-- 
2.45.2


