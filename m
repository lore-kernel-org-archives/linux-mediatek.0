Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3D2CF2579
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdMZzUqlItAKYCipC8R7CKRW4bj0To7qOhyuRvVgeD0=; b=JiR9lEIlb3O6AZSKwxi+Havv1s
	IQdvoy9JyzUNQA5NWdqQvGcQnBCVtz4tOOecigGEWXYWD3y0cdJavXgigb2BnrhKr3ord7W89tNFp
	cQ9m3dImVYFTQV2N5B91zpfcvgx7F+ZBe4SpprOAm4R8vlL5NkOiK8tqFxMVmrQOFDTgaCZ9ZkIG7
	s/+I6Yw2XGMgycEtOMDGWwJIzb0eGXiwCqd9lJILLvKRKqdnDxCXLpC9584d4e/p8GJryO3y6q6y2
	Go21lbtD5n3Fjim0tY3IAnDmGcdhshWSqWjoMb3XuBIBg/WqOK2cTjQi+fYEVV1lEyHRBBMQ9ks/i
	QPHJr1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03vV-000000036Na-33mz;
	Sun, 13 Oct 2024 19:06:49 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03kl-000000034aF-47R5;
	Sun, 13 Oct 2024 18:55:45 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a99f629a7aaso157398266b.1;
        Sun, 13 Oct 2024 11:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845742; x=1729450542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdMZzUqlItAKYCipC8R7CKRW4bj0To7qOhyuRvVgeD0=;
        b=TBfynMoyvolvYPyy9NuXTpLPjJP0AW9yIE4q0aVK6MAlqtbjygMdlc9oEkerBT2P0/
         8g0etae/EL3DjUf0E6ysKibxeuoxM8YhNeTW8wiKXDNSLiXr8iJTPTclPaqF+cak6L/b
         RNUZD+T7eBwV/GHAULezTsLhGYpBUWFtIUgaqbSDaah/VDIDolxcsUlatK7vx/ezbYhC
         BqA/PlAJluxKFyXtm2ZPQZgJfzwjupZG0e0pGpbd7bpF2WT02q81/H245iCDHdZyJFYe
         P8qz/XAIs4JR6wb8XHRyzz/8jtIWC4HXxoLb+c18NTqcwahJRo40ugqXbSJ8SitrnJTi
         wOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845742; x=1729450542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdMZzUqlItAKYCipC8R7CKRW4bj0To7qOhyuRvVgeD0=;
        b=lgHhEZchQLumkTGJWy/RXFgadpqoweKxPOb0kqpeUbfgDSYRgRsyx/mrDNXH/4SIcb
         r5/+fIcrNN5GpEZXrnXb1TlKEAfuyRzECgLngZvAXIKIVQbXJa7d2NMs4oqalaylXqaU
         sc1Qt+pQbl0GrUxSfJcfWB3sLAMzvxxZNzHGVhq/iLjtRGlNpxb/9vxXmA9PURBD9DMn
         EkKggQlHsJPcSvr2Kv2aiIMb6jCAoVwt5N/PtYgcztvLp0jvxKUmJc8HO/1orkGw/ZmW
         dji7XHd3f4T9GOsVtdkdRfxvQmTKkc2IzwNfk83ayKVYqfbkc40/KohFwwrABnbHe8jP
         bkCg==
X-Forwarded-Encrypted: i=1; AJvYcCWAeU/Y3kwYiXlReNhXKOgiiGaQK857qqmlDHlZODP8LJgE4ruYv65rbZs8S8sFQJc7AM0sHPPIGO6+3Prb59Y=@lists.infradead.org, AJvYcCXa5si7wYam35W8/fqUW9LYuPXvApFGuhvz//4aD7qgVnDhGYqD9j2CqtySGeltsvnhaTlL1bp9lwCVzrwSCSfC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg+ptGaARQX9yFzDF2DDT67gyEFWXnGEHCXIHxEbWibMmg3zMy
	o5/wxe2OC62pXBN6DTnoXwbq5FogqVtA8N/00yrDObJzl349dsQV
X-Google-Smtp-Source: AGHT+IFAKa7QLMgLrXfCGsTWPmLzzuX6LnZofD0LKyRsV4PvoJ/AEQnOQ8iMsxyM5aGIRLuo2u2udQ==
X-Received: by 2002:a17:906:c10d:b0:a8d:43c5:9a16 with SMTP id a640c23a62f3a-a99b8775be2mr661651566b.6.1728845741903;
        Sun, 13 Oct 2024 11:55:41 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:41 -0700 (PDT)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Woudstra <ericwouds@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH RFC v1 net-next 07/12] netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
Date: Sun, 13 Oct 2024 20:55:03 +0200
Message-ID: <20241013185509.4430-8-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115544_045748_B9E6C44B 
X-CRM114-Status: GOOD (  10.20  )
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

Add nf_flow_rule_bridge().

It only calls the common rule and adds the redirect.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/net/netfilter/nf_flow_table.h |  3 +++
 net/netfilter/nf_flow_table_offload.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/net/netfilter/nf_flow_table.h b/include/net/netfilter/nf_flow_table.h
index b63d53bb9dd6..568019a3898a 100644
--- a/include/net/netfilter/nf_flow_table.h
+++ b/include/net/netfilter/nf_flow_table.h
@@ -341,6 +341,9 @@ void nf_flow_table_offload_flush_cleanup(struct nf_flowtable *flowtable);
 int nf_flow_table_offload_setup(struct nf_flowtable *flowtable,
 				struct net_device *dev,
 				enum flow_block_command cmd);
+int nf_flow_rule_bridge(struct net *net, struct flow_offload *flow,
+			enum flow_offload_tuple_dir dir,
+			struct nf_flow_rule *flow_rule);
 int nf_flow_rule_route_ipv4(struct net *net, struct flow_offload *flow,
 			    enum flow_offload_tuple_dir dir,
 			    struct nf_flow_rule *flow_rule);
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index e06bc36f49fe..5543ce03a196 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -679,6 +679,19 @@ nf_flow_rule_route_common(struct net *net, const struct flow_offload *flow,
 	return 0;
 }
 
+int nf_flow_rule_bridge(struct net *net, struct flow_offload *flow,
+			enum flow_offload_tuple_dir dir,
+			struct nf_flow_rule *flow_rule)
+{
+	if (nf_flow_rule_route_common(net, flow, dir, flow_rule) < 0)
+		return -1;
+
+	flow_offload_redirect(net, flow, dir, flow_rule);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nf_flow_rule_bridge);
+
 int nf_flow_rule_route_ipv4(struct net *net, struct flow_offload *flow,
 			    enum flow_offload_tuple_dir dir,
 			    struct nf_flow_rule *flow_rule)
-- 
2.45.2


