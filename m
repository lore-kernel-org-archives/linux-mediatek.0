Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1B3C43327
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=; b=geousRuOKhYvhfqZ75pLNUorOn
	c4dTlNnBOwuJSVNhU7FskAYbF2spFG6cNpIt5jZj7ZsTWiBxMU3zUsJOGS1/kOJSX6HlfmSH16B+v
	xvl94HFc1Tq4Ny/7o/4rKyGQTqkFu90vHoLRIzfzOAfCJzznsLzVaJmVgPrlIWq61BHKKn02ZgO6I
	mHeNZsVCRdg3z3Tv3dvsIQTsSxiiVCE0UEJ+A8R4ofhld+pvtWTWbdh2L997IawebJdVoi/lnqk+I
	0qWfPd7DrCuuzeVq9ko9a7ho0dMzYMWP+CFtlHxsUOle/13jTeOFnxvaqMB0wV8pfyuHewOIhelfg
	hkwEM0nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQ8-0000000G30C-2fUf;
	Tue, 30 Jun 2026 06:58:12 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSQ2-0000000G2v9-0QVD
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 06:58:07 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-475417f010dso383406f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802684; x=1783407484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=;
        b=qeZObdv9bR5jFStyNV7SnMfPY2upVeak1TMZnpdeXP8fZ+HLDdc/ThdDcpc1D7lTFR
         8uTjj7UIFVUStJDg6zi3cv6PXHnBAHa2j6DLkHFpA6PlWdINTUBGaZCevJHiWR/9lCPk
         FanXN8DK/Xnh3OrOzsVKabMA75Mkbz4nU8RMMLlR1QGXlBJq9keXeAb3XvhUYoFyNEHt
         ZFg9bBX6Yn1rqbCzoDW41LeZr4YuUonqHv2uqyr6bG4hIDmTD0EILuiWNNSEi/uJWzKj
         n7LIhGqp3aP6t/VOXdqJisXohfYa4UWHojDFZFX1SHxjx35tIi4EedIjoPPKxczqLPw4
         gT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802684; x=1783407484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B0BtFT/DLMwlAC+IMAnaYdEaIQ9JUWZrSmMLsMhq+s0=;
        b=YEE/1fRaJSu/uK8aWo6IS+H8u6EWPgyaxwvLd6OTN+G9MRRlaCo34D21eZ+8A6+NK5
         cRNp3tFyacDPuzMYv8XhCQg9FaqYVND/edIfgIjPgIL8K2eK1BSfV/u+qW7pTfZa3ReF
         08bQeK518BOJMLOFeTKKOOyk+2l743b3dD8ufTKXGcFoxPk6yCo2h3PKafsb1q387k1I
         30kqf6EzCKwpfAYzca2KEDGD0AOFtWpPfFnqNQ+Z84pYGTs4hCSQ8C6dNlgO5VHol0S+
         gQjWO/o80wfD21H6u0QvjLYNTAdutMBApp32bNUV3Ln/wRDaJqDu/pUcrGOgmAeV7gBr
         OsuA==
X-Forwarded-Encrypted: i=1; AHgh+RrRsmsEjWiPNmgHzziDbfeh9UH6Yx+CdPTEKgb2/VSMPyzBKg48YuwOyYo5RMAdtaSNQVENLf6ygNGCYr901w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzoMBEq4gAIGMXPvwejaxX+tN8SOIJIyBf81OEMYACoYWk6jlka
	1FOUJEPiYUGjEQ1jKxKBfj0LioBm8ObCH1I/dwgon+wMXvChlPRiKjvb
X-Gm-Gg: AfdE7cndueG1bFQt9rA9YlyVLzNrE77mtIwe8uAt6GzslpoFvjbFVFWhVUfMyNAcziS
	SbylbnM/q0DF4JZSdkPPEL5My+VW8O2Zst1BLwFQwR8EaL7dC4EQ9VGkzKXfR75R4q+cVFdNn20
	tm3PRlAS2lOqZ3traY3Ry+JFAX0CBRnlz6ML4ztmZZYTNkYKJxwoqXFNSdy/5kKBwkD+920BvHi
	AKKMiLLujhKr8CeazcN8ibiDkxQmg5JQXMVoTcqIbAa5NIWAYcevtFBT5jOlO+1VBCF40/y4Crw
	KCpXFV8CgCAodX9CsFHJfgUgceN7qKA/dXkEIkOB/GLaeDaIVm5QP8FtsKZXQBY+4B14u0Rei3C
	dGpepG3i7TrE6xnEfcCYYj3o5oPrdGkJA02a6j0U1qmnT7V05l0YhIVWxNy7wg5SChaCOB1Zwei
	AtYUvudzk=
X-Received: by 2002:a05:6000:8e:b0:45d:3aa3:7f76 with SMTP id ffacd0b85a97d-47552a67d8bmr2211230f8f.33.1782802684104;
        Mon, 29 Jun 2026 23:58:04 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:58:03 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 5/5] netfilter: nf_flow_table_path: add VLAN passthrough support
Date: Tue, 30 Jun 2026 08:57:35 +0200
Message-ID: <20260630065735.3341614-6-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630065735.3341614-1-pawlik.dan@gmail.com>
References: <20260630065735.3341614-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_235806_162636_1069AD0B 
X-CRM114-Status: GOOD (  16.41  )
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

From: Ryan Chen <rchen14b@gmail.com>

VLAN passthrough packets can be offloaded when bridge-nf-filter-vlan-tagged
is enabled. When a packet has a VLAN tag and the bridge does not have VLAN
filtering enabled (passthrough mode), record the VLAN encap info so the
hardware flow offload entry includes the correct VLAN tag.

Without this change, VLAN-tagged bridged traffic cannot be offloaded by PPE
because the VLAN encap information is missing from the flow entry.

Enable with: echo 1 > /proc/sys/net/bridge/bridge-nf-filter-vlan-tagged

Based on a MediaTek SDK patch by Chak-Kei Lam <chak-kei.lam@mediatek.com>.
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 32 ++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 580aa1db3cb4..d15c425c88c4 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -17,6 +17,7 @@
 #include <net/netfilter/nf_flow_table.h>
 #include <linux/if_bridge.h>
 #include <linux/if_ether.h>
+#include <linux/if_vlan.h>
 #include <net/route.h>
 #include <net/ip6_route.h>
 
@@ -136,6 +137,29 @@ struct nft_forward_info {
 	enum flow_offload_xmit_type xmit_type;
 };
 
+static void nft_fill_vlan_passthrough_info(const struct nft_pktinfo *pkt,
+					   struct nft_forward_info *info)
+{
+	if (!skb_vlan_tag_present(pkt->skb))
+		return;
+
+	rcu_read_lock();
+	/* when bridge VLAN filtering is enabled, the bridge handles the tag */
+	if (netif_is_bridge_port(pkt->skb->dev) &&
+	    !br_vlan_is_enabled_rcu(pkt->skb->dev)) {
+		if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
+			info->indev = NULL;
+		} else {
+			info->encap[info->num_encaps].id =
+				skb_vlan_tag_get_id(pkt->skb);
+			info->encap[info->num_encaps].proto =
+				pkt->skb->vlan_proto;
+			info->num_encaps++;
+		}
+	}
+	rcu_read_unlock();
+}
+
 static int nft_dev_path_info(const struct net_device_path_stack *stack,
 			     struct nft_forward_info *info,
 			     unsigned char *ha, struct nf_flowtable *flowtable)
@@ -326,8 +350,12 @@ static int nft_dev_forward_path(const struct nft_pktinfo *pkt,
 		nft_br_vlan_dev_fill_forward_path(pkt, &ctx);
 	}
 
-	if (nft_dev_fill_forward_path(&ctx, route, dst, ct, dir, ha, &stack) < 0 ||
-	    nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
+	if (nft_dev_fill_forward_path(&ctx, route, dst, ct, dir, ha, &stack) < 0)
+		return -ENOENT;
+
+	nft_fill_vlan_passthrough_info(pkt, &info);
+
+	if (nft_dev_path_info(&stack, &info, ha, &ft->data) < 0)
 		return -ENOENT;
 
 	if (!nft_flowtable_find_dev(info.indev, ft))
-- 
2.54.0


