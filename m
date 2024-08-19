Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305A5C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0+OIEN25NHHHr0CCl7NuFmNlsvu4aPfi+XVI+Vm7J+s=; b=Mlr9xgtXI2PIZF43ZhsKMV/yJf
	Po2SxIwNYL1MqYVhlXAwKOnFmo/NDCvsN2XU5+3RYgdcrs8TwEvCoR/NWX5aB9aU3ZJTwQrzGNk4E
	x2+AiQ/yh3NGxmUb4A8bnQ3knZN6MsJ1D8gp8S3MKd/xxOKVOmYpu5gg2cd4hFvQlGayxG0Rd9lI7
	Uw87rQ00KWWCqTe8oI6sVowMGuMJcFrQkl61/s3OeTtmf9V9T2HSdt2vdIFlowFtdU+IpRJguc9oh
	WymPLRPNYGBmFTFoulKEaFfqjZFbTax5HU+d7Bz2fci6P3sNyZ7QwKCww2XGwfiHBxtPI6ye4B7CD
	qnIW8vow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4mM-000000022rs-3cxE;
	Mon, 19 Aug 2024 15:58:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg4la-000000022da-3bs6
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Aug 2024 15:58:00 +0000
X-UUID: cc8e9c7a5e4311efb3adad29d29602c1-20240819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0+OIEN25NHHHr0CCl7NuFmNlsvu4aPfi+XVI+Vm7J+s=;
	b=e1Leuocss2Yp6NI/Ftq1ewrNASEPaLk78cN4lxmOcqaCK5Jx3IuNE9RlQoBPB4/RInB8PgC/MSmBkUELFY5WoHeuhYrPGWyoU2hLJsnkoppRyYrJ+dQmTTaAu8T4Cgl2XBHoEBg0lL4fYJNKa9thXd9sx2eBRHkwEiZUkzCOhT0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:f94cbee3-1de4-464e-889c-1805cc9d3d91,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:1f3498be-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: cc8e9c7a5e4311efb3adad29d29602c1-20240819
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 496095645; Mon, 19 Aug 2024 08:57:55 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 19 Aug 2024 08:57:53 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 19 Aug 2024 23:57:53 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislav Fomichev <sdf@fomichev.me>
CC: <bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Tze-nan
 Wu <Tze-nan.Wu@mediatek.com>, Yanghui Li <yanghui.li@mediatek.com>, Cheng-Jui
 Wang <cheng-jui.wang@mediatek.com>
Subject: [PATCH v2] net/socket: Check cgroup_bpf_enabled() only once in  do_sock_getsockopt
Date: Mon, 19 Aug 2024 23:56:27 +0800
Message-ID: <20240819155627.1367-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_085758_930640_5A00B178 
X-CRM114-Status: GOOD (  16.51  )
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

The return value from `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` can change
between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
`BPF_CGROUP_RUN_PROG_GETSOCKOPT`.

If `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` changes from "false" to
"true" between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
`BPF_CGROUP_RUN_PROG_GETSOCKOPT`, `BPF_CGROUP_RUN_PROG_GETSOCKOPT` will
receive an -EFAULT from `__cgroup_bpf_run_filter_getsockopt(max_optlen=0)`
due to `get_user()` was not reached in `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`.

Scenario shown as below:

           `process A`                      `process B`
           -----------                      ------------
  BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
                                            enable CGROUP_GETSOCKOPT
  BPF_CGROUP_RUN_PROG_GETSOCKOPT (-EFAULT)

To prevent this, invoke `cgroup_bpf_enabled()` only once and cache the
result in a newly added local variable `enabled`.
Both `BPF_CGROUP_*` macros in `do_sock_getsockopt` will then check their
condition using the same `enabled` variable as the condition variable,
instead of using the return values from `cgroup_bpf_enabled` called by
themselves as the condition variable(which could yield different results).
This ensures that either both `BPF_CGROUP_*` macros pass the condition
or neither does.

Co-developed-by: Yanghui Li <yanghui.li@mediatek.com>
Signed-off-by: Yanghui Li <yanghui.li@mediatek.com>
Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---

Chagnes from v1 to v2: https://lore.kernel.org/all/20240819082513.27176-1-Tze-nan.Wu@mediatek.com/
  Instead of using cgroup_lock in the fastpath, invoke cgroup_bpf_enabled
  only once and cache the value in the variable `enabled`. `BPF_CGROUP_*`
  macros in do_sock_getsockopt can then both check their condition with
  the same variable, ensuring that either they both passing the condition
  or both do not.

Appreciate for reviewing this!
This patch should make cgroup_bpf_enabled() only using once,
but not sure if "BPF_CGROUP_*" is modifiable?(not familiar with code here)

If it's not, then maybe I can come up another patch like below one:
	+++ b/net/socket.c
	  	int max_optlen __maybe_unused;
	 	const struct proto_ops *ops;
	 	int err;
	+	bool enabled;
	
	 	err = security_socket_getsockopt(sock, level, optname);
	 	if (err)
	 		return err;
	
	-	if (!compat)
	+	enabled = cgroup_bpf_enabled(CGROUP_GETSOCKOPT);
	+   if (!compat && enabled)
			max_optlen = BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);

But this will cause do_sock_getsockopt calling cgroup_bpf_enabled up to
three times , Wondering which approach will be more acceptable?

---
 include/linux/bpf-cgroup.h | 13 ++++++-------
 net/socket.c               |  9 ++++++---
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/linux/bpf-cgroup.h b/include/linux/bpf-cgroup.h
index fb3c3e7181e6..251632d52fa9 100644
--- a/include/linux/bpf-cgroup.h
+++ b/include/linux/bpf-cgroup.h
@@ -390,20 +390,19 @@ static inline bool cgroup_bpf_sock_enabled(struct sock *sk,
 	__ret;								       \
 })
 
-#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen)			       \
+#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen, enabled)			       \
 ({									       \
 	int __ret = 0;							       \
-	if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT))			       \
+	if (enabled)			       \
 		copy_from_sockptr(&__ret, optlen, sizeof(int));		       \
 	__ret;								       \
 })
 
 #define BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock, level, optname, optval, optlen,   \
-				       max_optlen, retval)		       \
+				       max_optlen, retval, enabled)		       \
 ({									       \
 	int __ret = retval;						       \
-	if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT) &&			       \
-	    cgroup_bpf_sock_enabled(sock, CGROUP_GETSOCKOPT))		       \
+	if (enabled && cgroup_bpf_sock_enabled(sock, CGROUP_GETSOCKOPT))		    \
 		if (!(sock)->sk_prot->bpf_bypass_getsockopt ||		       \
 		    !INDIRECT_CALL_INET_1((sock)->sk_prot->bpf_bypass_getsockopt, \
 					tcp_bpf_bypass_getsockopt,	       \
@@ -518,9 +517,9 @@ static inline int bpf_percpu_cgroup_storage_update(struct bpf_map *map,
 #define BPF_CGROUP_RUN_PROG_SOCK_OPS(sock_ops) ({ 0; })
 #define BPF_CGROUP_RUN_PROG_DEVICE_CGROUP(atype, major, minor, access) ({ 0; })
 #define BPF_CGROUP_RUN_PROG_SYSCTL(head,table,write,buf,count,pos) ({ 0; })
-#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen) ({ 0; })
+#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen, enabled) ({ 0; })
 #define BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock, level, optname, optval, \
-				       optlen, max_optlen, retval) ({ retval; })
+				       optlen, max_optlen, retval, enabled) ({ retval; })
 #define BPF_CGROUP_RUN_PROG_GETSOCKOPT_KERN(sock, level, optname, optval, \
 					    optlen, retval) ({ retval; })
 #define BPF_CGROUP_RUN_PROG_SETSOCKOPT(sock, level, optname, optval, optlen, \
diff --git a/net/socket.c b/net/socket.c
index fcbdd5bc47ac..5336a2755bb4 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -2365,13 +2365,16 @@ int do_sock_getsockopt(struct socket *sock, bool compat, int level,
 	int max_optlen __maybe_unused;
 	const struct proto_ops *ops;
 	int err;
+	bool enabled;
 
 	err = security_socket_getsockopt(sock, level, optname);
 	if (err)
 		return err;
 
-	if (!compat)
-		max_optlen = BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
+	if (!compat) {
+		enabled = cgroup_bpf_enabled(CGROUP_GETSOCKOPT);
+		max_optlen = BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen, enabled);
+	}
 
 	ops = READ_ONCE(sock->ops);
 	if (level == SOL_SOCKET) {
@@ -2390,7 +2393,7 @@ int do_sock_getsockopt(struct socket *sock, bool compat, int level,
 	if (!compat)
 		err = BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock->sk, level, optname,
 						     optval, optlen, max_optlen,
-						     err);
+						     err, enabled);
 
 	return err;
 }
-- 
2.45.2


