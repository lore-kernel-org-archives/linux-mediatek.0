Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB81C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 11:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UPpMeKDWJ41aQtWSDjkTb0qnmNGNLK82g3cVw4iMD0U=; b=hjhgXgxq5bJrab
	TjnUE4FAkVInQbEUyvXehznHish59J0Wh2wcLKHcWYwyqdtfy95J4PZdul6mHs1yn88oJ40xiIMA+
	3jHiwP5P/3MU0HMlrAsn2i44mUWP5N73pEUOkvHaPYdohdmLn+rOS8KViTlPiaa5ydoYwoiSJLP/B
	GcX0RGIyGz7/rDi0faKmgewaIoLH4GWxqJN24uRB1qAK/fSTGlHyDF4pG2zhRpp45+1GohhKd5XL1
	fOFwfuzC7agzLi836i1VJuGy4QdiVB9lti1A0jdSmwfoi7U9J6N5IxzVOEv1lBSBRn3NMzF4LLxhm
	HwovX0RTvt6Hv/e3YLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP0ba-00GPS0-8K; Tue, 01 Mar 2022 11:23:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP0bW-00GPQp-P2; Tue, 01 Mar 2022 11:23:44 +0000
X-UUID: 8cf4a3e264d34d6db9c5bed4f9332673-20220301
X-UUID: 8cf4a3e264d34d6db9c5bed4f9332673-20220301
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <lena.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 665749324; Tue, 01 Mar 2022 04:23:16 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 03:23:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 1 Mar 2022 19:23:13 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Mar 2022 19:23:12 +0800
From: lena wang <lena.wang@mediatek.com>
To: <pabeni@redhat.com>, <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Willem de Bruijn <willemb@google.com>, "Daniel
 Borkmann" <daniel@iogearbox.net>, Dongseok Yi <dseok.yi@samsung.com>
CC: <wsd_upstream@mediatek.com>, lena wang <lena.wang@mediatek.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH net v2] net: fix up skbs delta_truesize in UDP GRO frag_list
Date: Tue, 1 Mar 2022 19:17:09 +0800
Message-ID: <1646133431-8948-1-git-send-email-lena.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_032342_862088_2EF84621 
X-CRM114-Status: GOOD (  15.93  )
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

The truesize for a UDP GRO packet is added by main skb and skbs in main
skb's frag_list:
skb_gro_receive_list
        p->truesize += skb->truesize;

The commit 53475c5dd856 ("net: fix use-after-free when UDP GRO with
shared fraglist") introduced a truesize increase for frag_list skbs.
When uncloning skb, it will call pskb_expand_head and trusesize for
frag_list skbs may increase. This can occur when allocators uses
__netdev_alloc_skb and not jump into __alloc_skb. This flow does not
use ksize(len) to calculate truesize while pskb_expand_head uses.
skb_segment_list
err = skb_unclone(nskb, GFP_ATOMIC);
pskb_expand_head
        if (!skb->sk || skb->destructor == sock_edemux)
                skb->truesize += size - osize;

If we uses increased truesize adding as delta_truesize, it will be
larger than before and even larger than previous total truesize value
if skbs in frag_list are abundant. The main skb truesize will become
smaller and even a minus value or a huge value for an unsigned int
parameter. Then the following memory check will drop this abnormal skb.

To avoid this error we should use the original truesize to segment the
main skb.

Fixes: 53475c5dd856 ("net: fix use-after-free when UDP GRO with shared fraglist")
Signed-off-by: lena wang <lena.wang@mediatek.com>
Acked-by: Paolo Abeni <pabeni@redhat.com>
---
change since v1:
1) add the fix tag.
2) add net subtree to the subject
---
---
 net/core/skbuff.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 9d0388bed0c1..8b7356cffea7 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3876,6 +3876,7 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
 		list_skb = list_skb->next;
 
 		err = 0;
+		delta_truesize += nskb->truesize;
 		if (skb_shared(nskb)) {
 			tmp = skb_clone(nskb, GFP_ATOMIC);
 			if (tmp) {
@@ -3900,7 +3901,6 @@ struct sk_buff *skb_segment_list(struct sk_buff *skb,
 		tail = nskb;
 
 		delta_len += nskb->len;
-		delta_truesize += nskb->truesize;
 
 		skb_push(nskb, -skb_network_offset(nskb) + offset);
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
