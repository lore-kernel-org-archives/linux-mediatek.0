Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB26C52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Aug 2024 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ei/MZnWMSf5WRtVHkVpfjkH2hPuZFQGSKj5kRjWhNkE=; b=o1lXO7Xv/4hbznze7M1Jbs+kyJ
	VGLsXjsauGnpG0vMHF43gxqNbvzfeMr+aOB1f2iCO2DzuIZmk856vSqZZ4O1oJz71bp/Ao4i1RqmC
	78bVrhX8wvDgxXppK/uL22xK3kF5DVeFbKQnwY4sdw6ubl3SiJW2ZL6uL3ew/UgOSlO9JVL5tEWm9
	eQcsSBqY62XuNBiHOMpT2r0yMsZ92rzRqXz/XpcVEk8A8sxacmBkDBRVZC3qUj9ox4iQbKodm9Ztm
	8S6ne/H+b2iHIfak2p59cuiBPPyVKMfBBDw+YfSWc9ISHYGrZnr00/4ILHt1dw99h5n6wsMAdcWuQ
	KqHQFkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfxzC-00000000oYk-1A5d;
	Mon, 19 Aug 2024 08:43:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfxyL-00000000oFs-32fK;
	Mon, 19 Aug 2024 08:42:43 +0000
X-UUID: d69c242e5e0411efba0aef63c0775dbf-20240819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ei/MZnWMSf5WRtVHkVpfjkH2hPuZFQGSKj5kRjWhNkE=;
	b=oIj0YSW9KpY3E+aC5y5tAK5bGTZd5OML4Q3xSA8pEG2XAylg1PYkmV8bSWBJC6vhxPrtqbLWteOOdcMEfJpjDBFyeCIAQ6LWL5DAkDHsvT4SBajJswgesydEIvwDPQMFT0I5m9RQMm5uQap89PAruQ3h3EtJb9qh6gRB6BjR6tA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:3f6e57ab-8551-4ace-9cd8-29d9e9229eb2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:2bb793be-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: d69c242e5e0411efba0aef63c0775dbf-20240819
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1617872194; Mon, 19 Aug 2024 01:27:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 19 Aug 2024 01:27:11 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 19 Aug 2024 16:27:11 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>, Tze-nan Wu
	<Tze-nan.Wu@mediatek.com>, Yanghui Li <yanghui.li@mediatek.com>, Cheng-Jui
 Wang <cheng-jui.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<bpf@vger.kernel.org>
Subject: [PATCH] net/socket: Acquire cgroup_lock in do_sock_getsockopt
Date: Mon, 19 Aug 2024 16:25:12 +0800
Message-ID: <20240819082513.27176-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_014241_778479_594D7185 
X-CRM114-Status: GOOD (  17.15  )
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
"true"
between the invocations of `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and
`BPF_CGROUP_RUN_PROG_GETSOCKOPT`,
`BPF_CGROUP_RUN_PROG_GETSOCKOPT` will receive an -EFAULT from
`__cgroup_bpf_run_filter_getsockopt(max_optlen=0)` due to `get_user()`
had not reached in `BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN`.

Scenario shown as below:

           `process A`                      `process B`
           -----------                      ------------
  BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
                                            enable CGROUP_GETSOCKOPT
  BPF_CGROUP_RUN_PROG_GETSOCKOPT (-EFAULT)

Prevent `cgroup_bpf_enabled(CGROUP_GETSOCKOPT)` change between
`BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN` and `BPF_CGROUP_RUN_PROG_GETSOCKOPT`
by acquiring cgroup_lock.

Co-developed-by: Yanghui Li <yanghui.li@mediatek.com>
Signed-off-by: Yanghui Li <yanghui.li@mediatek.com>
Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>

---

We have encountered this issue by observing that process A could sometimes
get an -EFAULT from getsockopt() during our device boot-up, while another
process B triggers the race condition by enabling CGROUP_GETSOCKOPT
through bpf syscall at the same time.

The race condition is shown below:

           `process A`                        `process B`
           -----------                        ------------
  BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN
         
                                              bpf syscall 
                                        (CGROUP_GETSOCKOPT enabled)

  BPF_CGROUP_RUN_PROG_GETSOCKOPT
  -> __cgroup_bpf_run_filter_getsockopt
    (-EFAULT)

__cgroup_bpf_run_filter_getsockopt return -EFAULT at the line shown below:
	if (optval && (ctx.optlen > max_optlen || ctx.optlen < 0)) {
		if (orig_optlen > PAGE_SIZE && ctx.optlen >= 0) {
			pr_info_once("bpf getsockopt: ignoring program buffer with optlen=%d (max_optlen=%d)\n",
				     ctx.optlen, max_optlen);
			ret = retval;
			goto out;
		}
		ret = -EFAULT; <== return EFAULT here
		goto out;
	}

This patch should fix the race but not sure if it introduces any potential
side effects or regression.

And we wondering if this is a real issue in do_sock_getsockopt or if
getsockopt() is designed to expect such race conditions.
Should the userspace caller always anticipate an -EFAULT from getsockopt()
if another process enables CGROUP_GETSOCKOPT at the same time?

Any comment will be appreciated!

BTW, I added Chengjui and Yanghui to Co-developed due to we have several
discussions on this issue. And we both spend some time on this issue.

---
 net/socket.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/socket.c b/net/socket.c
index fcbdd5bc47ac..e0b2b16fd238 100644
--- a/net/socket.c
+++ b/net/socket.c
@@ -2370,8 +2370,10 @@ int do_sock_getsockopt(struct socket *sock, bool compat, int level,
 	if (err)
 		return err;
 
-	if (!compat)
+	if (!compat) {
+		cgroup_lock();
 		max_optlen = BPF_CGROUP_GETSOCKOPT_MAX_OPTLEN(optlen);
+	}
 
 	ops = READ_ONCE(sock->ops);
 	if (level == SOL_SOCKET) {
@@ -2387,10 +2389,12 @@ int do_sock_getsockopt(struct socket *sock, bool compat, int level,
 				      optlen.user);
 	}
 
-	if (!compat)
+	if (!compat) {
 		err = BPF_CGROUP_RUN_PROG_GETSOCKOPT(sock->sk, level, optname,
 						     optval, optlen, max_optlen,
 						     err);
+		cgroup_unlock();
+	}
 
 	return err;
 }
-- 
2.45.2


