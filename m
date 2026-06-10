Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB67BCD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 13:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BGHkQNIcnO67qdZeWXWc4L3zaP3PkHtDlFiASvmwoyg=; b=Zg5VU64fD78y0opYROmOjkJT76
	ZV8AfjHKuJ8Fms1ThcRdEm6oYNyBUw84YCuZw8oogxViStDXg9n85/B0Jdqd39BnN0y5hJIbveHbC
	kkY1EZLEAtj59VJktr+EuKoo02isXoAS336j2QE8ck1fp7JlPU/UscoYmkvgNtJ3sLKOT4vrex6iU
	XfAPzrjdcgvIkRJd3XPEJy06x0/n2nkBw1/u9Ddkjta9xkN/UeHU5gOhgLjRveXA9Or427tMWMPu9
	J9p8tYc0hcqZXBqxUQ1cA31Xgr7vXEjNCYe7uhdjLDWh98MISUjC7waTU70xPmDxysQ2fgJxW4a7j
	0VNE0qPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIw1-00000007m0S-2fr9;
	Wed, 10 Jun 2026 13:25:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIw0-00000007lzu-0u3m;
	Wed, 10 Jun 2026 13:25:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC7814406F;
	Wed, 10 Jun 2026 13:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4039B1F00893;
	Wed, 10 Jun 2026 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781097931;
	bh=BGHkQNIcnO67qdZeWXWc4L3zaP3PkHtDlFiASvmwoyg=;
	h=From:Date:Subject:To:Cc;
	b=NESv/YSMug2guyTsmzMnuCCgaUFCkr0wAxYOPF+X1JObiDY4BXiB6Yyeujo8fUF9A
	 9n6eE+JDQf0SUbiIqUoOm+IQPPPe8dEy+WhMTr6vVv+bVbwlQ06hb4d+ieZ9o+Ajg4
	 TAyejcYp5cFMkhncjyk12SQzBV+/bTYcyQ9xjZm0PUxQXvl1WbmRDVGIE+/xl2vgyi
	 9OkAqW0oEWsWRd19ktJIZwcwk7ell69E3SNYcZD6c2hazWQpWT+cQ77N8A9rdIMLZk
	 0bE0AjbQ4nhRjBA8nICiqpfVIZLLZ81AvPYgJUJaBEnw5IOmnhNxjMgRS9KyOlqXIM
	 7ADpHfcoZ10/w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 10 Jun 2026 15:25:13 +0200
Subject: [PATCH net-next v2] net: airoha: simplify WAN device check in
 airoha_dev_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-airoha-eth-simplify-dev-init-v2-1-8f244e69b0d4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQqDMBBFryKz7pRotbWueo/iQuLEDLWJTEJQx
 Ls3eILyV48H7+8QSJgCdMUOQokDe5ehuhSg7eAmQh4zQ6Wqu8rDgcXbASlaDPxdZjYbjpSQHUd
 sxuamH1orVRPkxCJkeD3zb3AU0dEaoc/GcohetvM3laf/7yKVWKJRrWmpVnnP14fE0Xz1MkF/H
 McPMGzOmtMAAAA=
X-Change-ID: 20260606-airoha-eth-simplify-dev-init-5d53c7cc004e
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.3
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

airoha_register_gdm_devices() iterates eth->ports[] in order, so GDM2's
netdev is always registered before GDM3/GDM4. This means the explicit
check for eth->ports[1] && eth->ports[1]->devs[0] is a redundant
special-case of what airoha_get_wan_gdm_dev() already covers, since
GDM2 is always marked as WAN during its own ndo_init.
Remove the redundant check and rely solely on airoha_get_wan_gdm_dev()
which handles both the GDM2-present and GDM2-absent cases.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- Rebase on top of net-next.
- Link to v1: https://lore.kernel.org/r/20260606-airoha-eth-simplify-dev-init-v1-1-f08f8e404049@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 5a8e84fa9918..b333a7b309c2 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2004,18 +2004,10 @@ static int airoha_dev_init(struct net_device *netdev)
 
 	switch (port->id) {
 	case AIROHA_GDM3_IDX:
-	case AIROHA_GDM4_IDX: {
-		struct airoha_eth *eth = dev->eth;
-
-		/* GDM2 supports a single net_device */
-		if (eth->ports[1] && eth->ports[1]->devs[0])
-			break;
-
-		if (airoha_get_wan_gdm_dev(eth))
+	case AIROHA_GDM4_IDX:
+		if (airoha_get_wan_gdm_dev(dev->eth))
 			break;
-
 		fallthrough;
-	}
 	case AIROHA_GDM2_IDX:
 		/* GDM2 is always used as wan */
 		dev->flags |= AIROHA_PRIV_F_WAN;

---
base-commit: 5855479abc796c3b5d7b2f2ca147d68fc56cae1f
change-id: 20260606-airoha-eth-simplify-dev-init-5d53c7cc004e

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


