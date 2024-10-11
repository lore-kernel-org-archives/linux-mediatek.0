Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE387D0EE30
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 20:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kCdDB4FzZCs+ONnQuY+4pTxcyDhIhs84SvGVwh2KpEw=; b=nxxmmcUlFEE0ENJu7PGNhbL1dG
	VGDoCtSd7EuOiV+PUVyONTgfOiZh/PbW+8kZaju3dn+mM1KuPPsGZZRWVmgYTzkD6D/kcfKJ/BnJL
	Y7z+7nL0hDvSQaPu9PTsOKfF7Mr31bR97TXzCUHPJzTw/dtlrZudM3/0OOdV7eWNzKf/Tz2knveOb
	71jnY9xRmsNwObJIPckfrw3230NmAlH7hYM+EccBHTqXJyOaE/t0TqacfjaOHcWvKW1ZvTW7JR9UO
	4NN0XzLcMDLLVCCCqR5/ZOwAmJ/6Uh5DMv1oYG0Mjf8dMlvWHJUgh5YDOI2TOhwf31rd19aXCnkwR
	VCux5iMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szLsZ-0000000HVHL-3SOh;
	Fri, 11 Oct 2024 20:04:51 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szLqI-0000000HUxW-0XMU;
	Fri, 11 Oct 2024 20:02:31 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7e9f998e1e4so2028122a12.1;
        Fri, 11 Oct 2024 13:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728676948; x=1729281748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kCdDB4FzZCs+ONnQuY+4pTxcyDhIhs84SvGVwh2KpEw=;
        b=BgPza5wOc5KFvGQdIraMl72Ut9g0iT+Jx7FB1WVasT5/rBvzcj5U7BuLAlAXlZOMd+
         I2p0WSXgrb0sZkUxg6rClYWYVnF4nt8tyGOWXRG7R7hPNwhiFBIsnKzUIH+3gtw755SI
         RZ5qYGgejncq3IiD4z/0xPm6v78ScNat+NMf+pamATdD5Vawjtj+oxY/DN45X22E6aIp
         21GwopQlwi+3s/OkXdIXU9wWtb6ERGlnDIXdYQ6wC9i+e+W761CUyKWJ+egscMkvFYYs
         JQ7iV0Y4uFmz/DoIdnm2yNDJChzx8uHgTaFTZGpsolDdxeN0jCbYqsHjFPsMqIdLu4Z+
         QQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728676948; x=1729281748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kCdDB4FzZCs+ONnQuY+4pTxcyDhIhs84SvGVwh2KpEw=;
        b=ZFbuAP59/KT6QFToEkkES4M7ZC2Ad1EBV9HSQOf+l2znAuiAa0hYGH+yw5fxjkG5eL
         /LOq6nkV6Mk8xYmVeaVjPanhi7cIWZVpRS7Rx/rl2t3rhcRPYKbLHpwA5MHDceRBlseY
         JfG/5gfFCpulkpgryPQe9iD3W4J0r51449E+AifjRaUWXUV0ZviPoly4i5XdSCO4mN42
         N0VCTnXNqTBbarbjh+gpzlEnNaqf4nqXSymfKKmFNfwktZ6/e7f0IvkISshQ71Mqyefa
         F2/BH/lcJqIGpjUyPz2lCMMzRhEwsL7xApYJGIgXLc8jqqnWGZmI7o9dz6NwFNyGyKN0
         n08g==
X-Forwarded-Encrypted: i=1; AJvYcCVgHEoM6s1/wdckQX49WnP08vWO4XeHbuN6i1rIY/VWiU9eFzx9i6dyxQZqULqgsEcXTe5OpPXh/D8wkc8Z7UGg@lists.infradead.org, AJvYcCWeYIInPC6u7Uo81gEN2gGRxw3KyySspIb7KA9TMJxtjcZl6IKlzXEAcNKbOi50TJSUiml1e3/GU/4JBTpd3MM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4I+FHlepSVk3b29i1HGMchfc4IkrchGl582+eHhlxPvKKJPa+
	lM8UrVVuW7H0qeZa5ufGA7knPUZmDTOgPavQCnSOdKseU95qrnG/
X-Google-Smtp-Source: AGHT+IGOd18eKj1hzHPwpzvr37oGJNs01DKuB6aPDA1ZxRfgwjuNN7VeD7FJwmq1zYNaqdVBu6/G0Q==
X-Received: by 2002:a05:6a20:b803:b0:1d2:eaca:34ca with SMTP id adf61e73a8af0-1d8bcfb608fmr3684844637.42.1728676948064;
        Fri, 11 Oct 2024 13:02:28 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9f5271sm2966376b3a.56.2024.10.11.13.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 13:02:27 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] net: mtk_eth_soc: use ethtool_puts
Date: Fri, 11 Oct 2024 13:02:25 -0700
Message-ID: <20241011200225.7403-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_130230_186527_509DA2A6 
X-CRM114-Status: GOOD (  10.08  )
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

Allows simplifying get_strings and avoids manual pointer manipulation.

Tested on Belkin RT1800.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 9aaaaa2a27dc..6d93f64f8748 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4328,10 +4328,8 @@ static void mtk_get_strings(struct net_device *dev, u32 stringset, u8 *data)
 	case ETH_SS_STATS: {
 		struct mtk_mac *mac = netdev_priv(dev);
 
-		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++) {
-			memcpy(data, mtk_ethtool_stats[i].str, ETH_GSTRING_LEN);
-			data += ETH_GSTRING_LEN;
-		}
+		for (i = 0; i < ARRAY_SIZE(mtk_ethtool_stats); i++)
+			ethtool_puts(&data, mtk_ethtool_stats[i].str);
 		if (mtk_page_pool_enabled(mac->hw))
 			page_pool_ethtool_stats_get_strings(data);
 		break;
-- 
2.47.0


