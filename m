Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71177CA0EEF
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 08:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Sk5Sg+UsvXBabUWD0t2h9fPmHSQ3SzTGN9UHM5S6Mn4=; b=Ja1SgYppeQ0r4/5X5ESsbsN82K
	dSKLsYVKuQZnCOyR7fAX1mtrW9yGdUe6EOda/lTVWjms2XdyNctmT3NHeIrE9GuqDiLARpEVswjyh
	izHDzglqodoatudp7YFFiT64TgMhCiVhM3f8YUXeLFbRh+KCaBT6RpnMjtNNbya1369MVq1dB0WaL
	12+c0OEgzuBcOm2sXFgWu0MSGYLGP4iFOPqsGs1zyZxwqUN1azKYBiJePsYHpXV2j12Abq5EMSHUk
	502j9MA2TMdQtRJ3bqDMebCnYGOEpaQxvlCCfHQkzlPInwpOMzWOml6EMvYKLeTYHvPxF/VhaIl2j
	BTWot4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwzC-00000005LXH-3ujg;
	Fri, 30 Aug 2024 08:28:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjwxb-00000005L4k-03QM;
	Fri, 30 Aug 2024 08:26:24 +0000
X-UUID: 87d0e10666a911efb3adad29d29602c1-20240830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Sk5Sg+UsvXBabUWD0t2h9fPmHSQ3SzTGN9UHM5S6Mn4=;
	b=qKStLXdAB2VWE7UmGlnq7MvdYnbTX3F4V7V1lh7UW92Btr6PUimYjGpIU3cgS1uhW8x6UxADYCiWFGTFife0i4/MtboTio3gyJeuzP2c4M6PDtGA1KNXqHH+TL9lUW9NYegaFlqsaTGOJLz/Ym0/NSVFZJJJRW82EIihkszfhtQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:36634a9b-6fb2-4cc0-b6f8-b97a64ad4da0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:b8420b15-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 87d0e10666a911efb3adad29d29602c1-20240830
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 620030097; Fri, 30 Aug 2024 01:26:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 30 Aug 2024 01:25:47 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 30 Aug 2024 16:25:47 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: <netdev@vger.kernel.org>, <bpf@vger.kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	<alexei.starovoitov@gmail.com>
CC: <bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Kuniyuki Iwashima <kuniyu@amazon.com>, <chen-yao.chang@mediatek.com>, Tze-nan
 Wu <Tze-nan.Wu@mediatek.com>, Yanghui Li <yanghui.li@mediatek.com>, Cheng-Jui
 Wang <cheng-jui.wang@mediatek.com>, Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH net v5] bpf, net: Fix a potential race in do_sock_getsockopt()
Date: Fri, 30 Aug 2024 16:25:17 +0800
Message-ID: <20240830082518.23243-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_012623_066385_074B3CD2 
X-CRM114-Status: GOOD (  16.58  )
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

There's a potential race when `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` is
false during the execution of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`, but
becomes true when `BPF_CGROUP_RUN_PROG_GETSOCKOPT` is called.
This inconsistency can lead to `BPF_CGROUP_RUN_PROG_GETSOCKOPT` receiving
an "-EFAULT" from `__cgroup_bpf_run_filter_getsockopt(max_optlen=0)`.
Scenario shown as below:

           `process A`                      `process B`
           -----------                      ------------
  BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
                                            enable CGROUP_GETSOCKOPT
  BPF_CGROUP_RUN_PROG_GETSOCKOPT (-EFAULT)

To resolve this, remove the `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` macro and
directly uses `copy_from_sockptr` to ensure that `max_optlen` is always 
set before `BPF_CGROUP_RUN_PROG_GETSOCKOPT` is invoked.

Fixes: 0d01da6afc54 ("bpf: implement getsockopt and setsockopt hooks")
Co-developed-by: Yanghui Li <yanghui.li@mediatek.com>
Signed-off-by: Yanghui Li <yanghui.li@mediatek.com>
Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---

Changes from v1 to v2: https://lore.kernel.org/all/20240819082513.27176-1-Tze-nan.Wu@mediatek.com/
  Instead of using cgroup_lock in the fastpath, invoke cgroup_bpf_enabled
  only once and cache the value in the newly added variable `enabled`.
  `BPF_CGROUP_*` macros in do_sock_getsockopt can then both check their
  condition with the new variable `enable`, ensuring that either they both
  passing the condition or both do not.

Changes from v2 to v3: https://lore.kernel.org/all/20240819155627.1367-1-Tze-nan.Wu@mediatek.com/
  Hide cgroup_bpf_enabled in the macro, and some modifications to adapt
  the coding style.

Changes from v3 to v4: https://lore.kernel.org/all/20240820092942.16654-1-Tze-nan.Wu@mediatek.com/
  Add bpf tag to subject, and add the Fixes tag in body.

Changes from v4 to v5: https://lore.kernel.org/all/20240821093016.2533-1-Tze-nan.Wu@mediatek.com/
  Change subject, and fix the race by unconditional `copy_from_sockptr`,
  instead of adding a new variable.

---
 include/linux/bpf-cgroup.h | 9 ---------
 net/socket.c               | 4 ++--
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/include/linux/bpf-cgroup.h b/include/linux/bpf-cgroup.h
index fb3c3e7181e6..ce91d9b2acb9 100644
--- a/include/linux/bpf-cgroup.h
+++ b/include/linux/bpf-cgroup.h
@@ -390,14 +390,6 @@ static inline bool cgroup_bpf_sock_enabled(struct sock *sk,
 	__ret;								       \
 })
 
-#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen)			       \
-({									       \
-	int __ret = 0;							       \
-	if (cgroup_bpf_enabled(CGROUP_GETSOCKOPT))			       \
-		copy_from_sockptr(&__ret, optlen, sizeof(int));		       \
-	__ret;								       \
-})
-
 #define BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock, level, optname, optval, optlen,   \
 				       max_optlen, retval)		       \
 ({									       \
@@ -518,7 +510,6 @@ static inline int bpf_percpu_cgroup_storage_update(struct bpf_map *map,
 #define BPF_CGROUP_RUN_PROG_SOCK_OPS(sock_ops) ({ 0; })
 #define BPF_CGROUP_RUN_PROG_DEVICE_CGROUP(atype, major, minor, access) ({ 0; })
 #define BPF_CGROUP_RUN_PROG_SYSCTL(head,table,write,buf,count,pos) ({ 0; })
-#define BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen) ({ 0; })
 #define BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock, level, optname, optval, \
 				       optlen, max_optlen, retval) ({ retval; })
 #define BPF_CGROUP_RUN_PROG_GETSOCKOPT_KERN(sock, level, optname, optval, \
diff --git a/net/socket.c b/net/socket.c
index fcbdd5bc47ac..0a2bd22ec105 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -2362,7 +2362,7 @@ INDIRECT_CALLABLE_DECLARE(bool tcp_bpf_bypass_getsockopt(int level,
 int do_sock_getsockopt(struct socket *sock, bool compat, int level,
 		       int optname, sockptr_t optval, sockptr_t optlen)
 {
-	int max_optlen __maybe_unused;
+	int max_optlen __maybe_unused = 0;
 	const struct proto_ops *ops;
 	int err;
 
@@ -2371,7 +2371,7 @@ int do_sock_getsockopt(struct socket *sock, bool compat, int level,
 		return err;
 
 	if (!compat)
-		max_optlen = BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
+		copy_from_sockptr(&max_optlen, optlen, sizeof(int));
 
 	ops = READ_ONCE(sock->ops);
 	if (level == SOL_SOCKET) {
-- 
2.45.2


