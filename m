Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31669CF2579
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Oct 2024 19:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6bOSx9F0JYNp5qomZcy7h/raSRvVGKNY4mEoIJa6U4=; b=NZ+VSPNNnnz0kWi+pgfikNXiBa
	9U0lXrs6MsxzqQ8gY8qQYopH3DZ8WcIQlAINRWS0ThON6i+8VCRpmSOsNVFIJCK2n1m41MfA9OkS6
	1/eYd0KaiHFcojItJ3oRAXDSQhrHwJv785qKAyDaraYlAH/YOSOvzFwfcbc9CJegiDjhdqnDAdWDf
	ht+VJ/327OqXcum/pKubjKeqas1jNVxULYP+HGLLRuX6+6CjRRAefYSkSgQmbvCKEU2Alkv+W0U68
	9N1KJ6nA3WSJjOJnyadZ2puoXdVmVmeT8fQR0mVWn+gcknsNaPJxjxE/tYvctL0TQV1QrUVZis1PM
	BHaXyJEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t03wq-000000036WE-07xB;
	Sun, 13 Oct 2024 19:08:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t03km-000000034aP-2m1u;
	Sun, 13 Oct 2024 18:55:46 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9944c4d5d4so524628066b.0;
        Sun, 13 Oct 2024 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728845743; x=1729450543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D6bOSx9F0JYNp5qomZcy7h/raSRvVGKNY4mEoIJa6U4=;
        b=nndX1SrV8ZBYB72JLjnQjUIXx31Mp7yLJUI0XSNVSaTNZWkwm112SnmOWHWc93DUlF
         WauB8NsvTxU0oTmROhzusztHSiiY5Y7YRA0pBb5kHK7UVXHdq0v7zNgd1s0l5EDMC80u
         nFc2kRWtn6cHoSC/eG5oq6ZTycLzDAYc9u12mZf/kisahwO1r9lWI8DyllozLhGXdJDt
         rWoJu4nu3we+ka6Ydk6LQDUx9jDQrysU3i7Dpnj2NyURriLkNxG43isZ625UZ5GUnI+0
         1+plmyH3KBh3y0mvzE0b0V52NAeOF9U5IEOTr5Zx6XwG/Rzfa89PRo8aCKGCwlzUyb3l
         h1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728845743; x=1729450543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D6bOSx9F0JYNp5qomZcy7h/raSRvVGKNY4mEoIJa6U4=;
        b=LriJnrxEC0d1PIvCRVjlMpVbMvbCDyz97QwYZcf/xYdNzqhQCLFikQZXzmB7Mhg50v
         zvHnlEka8dyT1VFCv/ezhUNUsJz4+dLUBjsp1ZtNjeVfII2pdhtjr4zJ8uKRe98HkmEK
         pa/t13e4ODjqKatoGQENjRhJVg1uqnbL8CaFB5h96DcKXGx8ND4CY3dxZeA4g7YceYtg
         hVj2rA22pczSuleOLbwTGu0gsqdrrVF/W3psYz2Gilb3dYqRRR0EKq3gm4hkxFzQ/1WW
         BI/xfp+IRuukD9FE7JyxNGn6gr5D7T9euw2zO0BS16uI2OO4K+Hvp6bvIxyTGGYJM1wh
         RrFg==
X-Forwarded-Encrypted: i=1; AJvYcCV+nlN2aCGwmfaZoLz0qZwllH1YO62C5UqHKVJLG3EcjPiljKmfn0G4lYo9eKdowPNHcAr/hOpJh/Md1ElIWzs=@lists.infradead.org, AJvYcCW2eIO9h4GWB4j0eTKoU7kqhodS6vAPNG/pY7WcD2F3KUeXUUZjB3KjlW+51rpdV4Pk/ZCfGc4+NBHMxAZsicWc@lists.infradead.org
X-Gm-Message-State: AOJu0YxHZ774/72b4bfCJjq/svuTtPVzlhfmtYxYu3LDAqshPae3oxn5
	4WSzZIdfSzdPSWBHdRPQ43Ly6cSIUsev4XhO8m5SuIW9PNJbnHgk
X-Google-Smtp-Source: AGHT+IHvTGJJwOKJ7kLklzvX+Gh+CAxx5/4phzgEMN5pvFmXb1du5QSwwE/bUW/IN4TfeZh8VQTOOg==
X-Received: by 2002:a17:907:d01:b0:a8d:6648:813f with SMTP id a640c23a62f3a-a99b93239cemr785241466b.3.1728845743054;
        Sun, 13 Oct 2024 11:55:43 -0700 (PDT)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a12d384b9sm13500866b.172.2024.10.13.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2024 11:55:42 -0700 (PDT)
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
Subject: [PATCH RFC v1 net-next 08/12] netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
Date: Sun, 13 Oct 2024 20:55:04 +0200
Message-ID: <20241013185509.4430-9-ericwouds@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241013185509.4430-1-ericwouds@gmail.com>
References: <20241013185509.4430-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241013_115544_749260_C05432C5 
X-CRM114-Status: GOOD (  11.66  )
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

This will allow a flowtable to be added to the nft bridge family.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nf_flow_table_inet.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/netfilter/nf_flow_table_inet.c b/net/netfilter/nf_flow_table_inet.c
index b0f199171932..80b238196f29 100644
--- a/net/netfilter/nf_flow_table_inet.c
+++ b/net/netfilter/nf_flow_table_inet.c
@@ -65,6 +65,16 @@ static int nf_flow_rule_route_inet(struct net *net,
 	return err;
 }
 
+static struct nf_flowtable_type flowtable_bridge = {
+	.family		= NFPROTO_BRIDGE,
+	.init		= nf_flow_table_init,
+	.setup		= nf_flow_table_offload_setup,
+	.action		= nf_flow_rule_bridge,
+	.free		= nf_flow_table_free,
+	.hook		= nf_flow_offload_inet_hook,
+	.owner		= THIS_MODULE,
+};
+
 static struct nf_flowtable_type flowtable_inet = {
 	.family		= NFPROTO_INET,
 	.init		= nf_flow_table_init,
@@ -97,6 +107,7 @@ static struct nf_flowtable_type flowtable_ipv6 = {
 
 static int __init nf_flow_inet_module_init(void)
 {
+	nft_register_flowtable_type(&flowtable_bridge);
 	nft_register_flowtable_type(&flowtable_ipv4);
 	nft_register_flowtable_type(&flowtable_ipv6);
 	nft_register_flowtable_type(&flowtable_inet);
@@ -109,6 +120,7 @@ static void __exit nf_flow_inet_module_exit(void)
 	nft_unregister_flowtable_type(&flowtable_inet);
 	nft_unregister_flowtable_type(&flowtable_ipv6);
 	nft_unregister_flowtable_type(&flowtable_ipv4);
+	nft_unregister_flowtable_type(&flowtable_bridge);
 }
 
 module_init(nf_flow_inet_module_init);
@@ -118,5 +130,6 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Pablo Neira Ayuso <pablo@netfilter.org>");
 MODULE_ALIAS_NF_FLOWTABLE(AF_INET);
 MODULE_ALIAS_NF_FLOWTABLE(AF_INET6);
+MODULE_ALIAS_NF_FLOWTABLE(AF_BRIDGE);
 MODULE_ALIAS_NF_FLOWTABLE(1); /* NFPROTO_INET */
 MODULE_DESCRIPTION("Netfilter flow table mixed IPv4/IPv6 module");
-- 
2.45.2


