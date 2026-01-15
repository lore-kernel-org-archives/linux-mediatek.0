Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D3CD44C5B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/GYuhAPyxh2VtKR9ECrwYwGFXjwcnfw71zewQTg4IU=; b=ewCry/Ny4RZnbIaPDoFcQZGnrM
	mqIRbazm5BD71EpKHnw80QPC+5pQVuELNYpfudvL1tWk6v4+gw0orBjocQWBI0UGAZzinicTeo+9/
	G8ZwrkpYQSrrU1pos8sNmFq4cvmhWquD2ZxhWl7o/Otx/t0W2UG6P04Wb6kXQbgDIc/A0k0PNOfik
	8RbScJ6TDSGAKlHiFsikYGhj+XJL8AZ41lqBrFJJ630Nqf4JExgWc0BN3WcWrN/cIxVefBN9f54pT
	0R4h4EX90ZWXVATWotyEJYxOnKVAh0uv8fUijLAwnHXTmzDCvHAyGFnHbLJMFmalSNtIKRvv8ItrV
	YBkFwQww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUc-0000000CVII-1wDA;
	Thu, 15 Jan 2026 14:38:34 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOUR-0000000CV5H-20Ph
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 14:38:27 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4042905015cso659877fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 06:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768487903; x=1769092703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a/GYuhAPyxh2VtKR9ECrwYwGFXjwcnfw71zewQTg4IU=;
        b=Dq1LsCX/hE6vu6vmmNI/ss6eeEyDwNyCthiEUDAm//MZJuvr9OZUYlsWuk7HgMisb5
         yRRSUemCmig+CXoeyFCiZ6ILbNtdErAdyKxzzit38aWh/yE12o5N7MkDZq6laH/ydP3w
         wSZGHDYUeDaPU6S1+uut78GO2tVl0ZovTUgB/gywYVRnDsChJWEOd99O9m5JarO+ENjc
         cCblGBObfBL71RJWbEF5XVCpe6oJbjX4uWX2rIjbx97fdsH+gy3ZW+sY6G64C3hwht76
         okvd9gLEgj8P/v4U5XePe9Qnapytt2vVSfWuKz9bqn+0nF56tgtQJjPT+idreasXCdhl
         Mbww==
X-Forwarded-Encrypted: i=1; AJvYcCVILGJdk1mFPNOXzyUbW/FgSll1R6oh9PLY1QMldgG+2IDMPcRn1W6razYZgks9jjM5E8JkxM2ynhJ+eW7hVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWT5tTjMteSU/caAMoUj4s9fhp+lzbKfk/UyTY0iWQtuzCHmcI
	FPny/Xx/1/UATMnODxiP3qjvdfWJmo/MICivzxWy+I9260+CYeAyGMwt
X-Gm-Gg: AY/fxX5TCU7drfksHCaeuot2xYjf8kSrNoY2Jpofx6kqTbzqLFzNqMS72QcE+BxN7x/
	br5qwmEOEGbhuwCNVZ6kX0p10jPHAy49L7imKi7LCt2Jal1wYL6BqhTMuIwwQyr82Vp9PjLii9W
	r1VyoAgEGfmFpgAVkP72xURiLmnwGUfVclPxbdTy1MKDXIXFm3evTNyhZMcFX0ygZWjLPkhpr3F
	LswT+zVsyBjj9h6OiifdY/FSDPD706qiVpGRar6LtRedB8DgISZi2sLLte2Sdnd6u2wSBAq31dr
	G7tsTQKTc3ccYxoKvvRj82PaUpfB9eDWBj9l8UqpWAQgdqSvGB1xG9NUx+cp8KJspn/ySU3W4oM
	c3zPO+qJlUCTQVG8jYD9V8ItI1TIvFTJztTpc7eff6zv7ozxJe6o1jhn0cf9zZECQh6Xae9FYqa
	6wrRLOhhjh7M8=
X-Received: by 2002:a05:6870:864b:b0:3f6:2118:2d37 with SMTP id 586e51a60fabf-40407155e60mr4009310fac.42.1768487902673;
        Thu, 15 Jan 2026 06:38:22 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:3::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4041a20051csm3187622fac.17.2026.01.15.06.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:38:22 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 15 Jan 2026 06:37:56 -0800
Subject: [PATCH net-next 9/9] net: txgbe: convert to use .get_rx_ring_count
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-grxring_big_v2-v1-9-b3e1b58bced5@debian.org>
References: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
In-Reply-To: <20260115-grxring_big_v2-v1-0-b3e1b58bced5@debian.org>
To: Ajit Khaparde <ajit.khaparde@broadcom.com>, 
 Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, 
 Somnath Kotur <somnath.kotur@broadcom.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shay Agroskin <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, 
 David Arinzon <darinzon@amazon.com>, Saeed Bishara <saeedb@amazon.com>, 
 Bryan Whitehead <bryan.whitehead@microchip.com>, 
 UNGLinuxDriver@microchip.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>, 
 Potnuri Bharat Teja <bharat@chelsio.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1635; i=leitao@debian.org;
 h=from:subject:message-id; bh=iHjMCRl1osOPGeWzfnK2KNM/9EoiAxwpcSWI+XP02wM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpaPvS2jwDA4B5OVdm2pYfwE5wwEoA1TjfN+vFk
 Oq4iqdDPU6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaWj70gAKCRA1o5Of/Hh3
 baEtD/0e4jxGdtSnXlNdd3Ym+AmQnqmw+uQARxVH3fvJRkHoecl3Hzt6HnkNMpJ2bHcL+Ykuo+2
 bqDVJi17xCAxz/JJ+E5uhNl7rq1nzJiOdALOcbtS+q0vaAqaZANFIQTUTAtwvr8Vcykq8fnNkr0
 2xiADYMIU5s+WuQsMpxl097cT8oXChiukHlT6HsJ222668dm5nRiPA0evqv/2pWsVDaAywkAi6x
 aeiwdgG4iQxbfanDh2VKer1hvyDYRelxSgXXwz9N4xwcSk8Wfz5aDDHNrzSYqDMGdS+E+kjPat0
 t4kMwgKvDihLCIWfhFIASs4E9SQRkuqb8Jl9NPamj3g0kSm4VqPztopV3u/iPeb9hidjshOk1GS
 qxDrEiy97dK97aot5HKc9ujq+XVUI/Q51g0H3img2C95IaK5r7LWia1OALMEcV2cBy/rbsNPfas
 K0QBWLVLDq2PqiUc25Jxy+TG+ctt4emx4tKPDjc0Pe1pk1H3Tgi06WXLVavvwsW9ksgo8O7Sf6a
 Db19Wi8PouSxa3fu+u38JygBavrl/AFKs1l0aVN5h73ufNH1bOfS1xHmgvxnchF0HmnRm3G+CHb
 KvdDaYueCtvOsJYb1eivSnDKOoF+M7LQRcakwSN6tgiUiFJI8r9TH1aKmpkYtvWyA4rRbcHIk/q
 pdghbi7qVDQhMoQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_063823_537635_2F29C0EE 
X-CRM114-Status: GOOD (  11.69  )
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

Use the newly introduced .get_rx_ring_count ethtool ops callback instead
of handling ETHTOOL_GRXRINGS directly in .get_rxnfc().

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
index f3cb00109529..59d758acccf0 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_ethtool.c
@@ -193,6 +193,13 @@ static int txgbe_get_ethtool_fdir_all(struct txgbe *txgbe,
 	return 0;
 }
 
+static u32 txgbe_get_rx_ring_count(struct net_device *dev)
+{
+	struct wx *wx = netdev_priv(dev);
+
+	return wx->num_rx_queues;
+}
+
 static int txgbe_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 			   u32 *rule_locs)
 {
@@ -201,10 +208,6 @@ static int txgbe_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 	int ret = -EOPNOTSUPP;
 
 	switch (cmd->cmd) {
-	case ETHTOOL_GRXRINGS:
-		cmd->data = wx->num_rx_queues;
-		ret = 0;
-		break;
 	case ETHTOOL_GRXCLSRLCNT:
 		cmd->rule_cnt = txgbe->fdir_filter_count;
 		ret = 0;
@@ -587,6 +590,7 @@ static const struct ethtool_ops txgbe_ethtool_ops = {
 	.set_channels		= txgbe_set_channels,
 	.get_rxnfc		= txgbe_get_rxnfc,
 	.set_rxnfc		= txgbe_set_rxnfc,
+	.get_rx_ring_count	= txgbe_get_rx_ring_count,
 	.get_rxfh_fields	= wx_get_rxfh_fields,
 	.set_rxfh_fields	= wx_set_rxfh_fields,
 	.get_rxfh_indir_size	= wx_rss_indir_size,

-- 
2.47.3


