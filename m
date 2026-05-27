Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DDDCD5BDE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyU1KHVzJ6bwcUISFP29L+piSWD7813hehG38DU0KTM=; b=pqjCCFDUYcWU6hq2gsrDm0SqQ0
	AbtlQIkHFnTSJo8U+7hMNODN0A+j/gG9jyH/c0dZ7rH9pCECMC/Pmz5q9TCSOxzhvfoZHlrukp9Zp
	CV6VtirWnN4MeQWPAjGwDmVUxx9LPojHxrt9PNwqfMz2Mj+oFYz12uC/UwqISl4/rrMcc/Nyi08sy
	isbwzHQpVYgjLFC61W1nCGEhpDYUTwvpfjemnawBjlfAal3dBT6RyksOlm59uh53bp9DjFPwPK0SC
	+B/NkA0rOFAoH9+jql+Xf24g+txouQsE/WKpWW/vIXIvN7tToxiv1zwqfcxxx5aaLUj3aF22OJpWS
	iPp1Uv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8nd-00000003TUS-00Jq;
	Wed, 27 May 2026 07:35:33 +0000
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8nN-00000003TPc-0NEc
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 07:35:31 +0000
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 3DA5C60551; Wed, 27 May 2026 09:34:50 +0200 (CEST)
Date: Wed, 27 May 2026 09:34:49 +0200
From: Florian Westphal <fw@strlen.de>
To: Adrian Bente <adibente@gmail.com>
Cc: pablo@netfilter.org, netfilter-devel@vger.kernel.org, phil@nwl.cc,
	nbd@nbd.name, sean.wang@mediatek.com, lorenzo@kernel.org,
	andrew+netdev@lunn.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, daniel@makrotopia.org,
	coreteam@netfilter.org, linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH net] netfilter: flowtable: fix offloaded ct timeout
 never being extended
Message-ID: <ahaek23tB7D8tQUe@strlen.de>
References: <20260526060138.3924-1-adibente@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526060138.3924-1-adibente@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_003517_269995_361BC31D 
X-CRM114-Status: GOOD (  14.32  )
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

Adrian Bente <adibente@gmail.com> wrote:

[ trimming CCs .. ]

> OpenWrt has recently migrated many platforms to kernel 6.18. On the
> MediaTek platform, which supports hardware network offloading, WiFi
> connections accelerated via the WED path were observed to drop after
> roughly 300 seconds.
> 
> After several debugging sessions, assisted by the Claude LLM, the
> problem was narrowed down as follows:
> 
> nf_flow_table_extend_ct_timeout() extends ct->timeout for offloaded
> flows using:
> 
> 	cmpxchg(&ct->timeout, expires, new_timeout);
> 
> 'expires' comes from nf_ct_expires(ct) and is a relative value, while
> ct->timeout holds an absolute timestamp. The two are never equal, so
> the cmpxchg always fails and the timeout is never extended.
> 
> This goes unnoticed for most flows, but a long-lived hardware (WED)
> offloaded flow on MediaTek MT7986 eventually has ct->timeout decay to
> zero, the conntrack entry is reaped and the connection breaks.
> 
> Compare against the current ct->timeout value instead.
> 
> This patch is sent as RFC: the diagnosis is verified on hardware and
> the fix resolves the drop, but review of the chosen approach is
> welcome.

I guess we need to open-code expires, something like this (not even
compile tested). Also see https://sashiko.dev/#/patchset/20260526060138.3924-1-adibente%40gmail.com

diff --git a/net/netfilter/nf_flow_table_core.c b/net/netfilter/nf_flow_table_core.c
--- a/net/netfilter/nf_flow_table_core.c
+++ b/net/netfilter/nf_flow_table_core.c
@@ -506,7 +506,12 @@ static u32 nf_flow_table_tcp_timeout(const struct nf_conn *ct)
 static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
 {
 	static const u32 min_timeout = 5 * 60 * HZ;
-	u32 expires = nf_ct_expires(ct);
+	u32 ct_timeout = READ_ONCE(ct->timeout);
+	s32 expires;
+
+	expires = ct_timeout - nfct_time_stamp;
+	if (expires <= 0) /* already expired */
+		return;
 
 	/* normal case: large enough timeout, nothing to do. */
 	if (likely(expires >= min_timeout))
@@ -524,7 +529,7 @@ static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
 	if (nf_ct_is_confirmed(ct) &&
 	    test_bit(IPS_OFFLOAD_BIT, &ct->status)) {
 		u8 l4proto = nf_ct_protonum(ct);
-		u32 new_timeout = true;
+		u32 new_timeout = 1;
 
 		switch (l4proto) {
 		case IPPROTO_UDP:
@@ -549,7 +554,7 @@ static void nf_flow_table_extend_ct_timeout(struct nf_conn *ct)
 		 */
 		if (new_timeout) {
 			new_timeout += nfct_time_stamp;
-			cmpxchg(&ct->timeout, expires, new_timeout);
+			cmpxchg(&ct->timeout, ct_timeout, new_timeout);
 		}
 	}
 

