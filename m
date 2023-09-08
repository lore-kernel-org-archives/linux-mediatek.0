Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5B0EE57CA
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 06:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1CF4SZe+j+A2vmx7gVT8aOLdHeQoN2UL8CkT5LKTRQ=; b=OaWF7uLHMrT1K5q6c2VSqzqysc
	se/Cr1FMWnI3F19mj2X1/yAz5nlBte5nYF8ZyMSQBT02+dbdqJDLPWfvL6o9NPBPClwFFWhmw+XXV
	PXK5G/CyXFll0cgl+jw9X6FGlRmW+gmjdnqKGbMwrWyUt5fV5T6FaMIGxlqGoQE6wKCzwuxqpPg/l
	DWITc92UqmcZOjyesezxnGetbBRxtQgfFjjWMgZGyyPwszEFJzPEWEfcODa9+Ne/DaIfJTIi0ZF9o
	/Tks0cMvHofAWmOwKSokDsE1jFhrAZ9I0ZM0osnUl57Y/+i/LkfFzCEf5D8J8FnDrFwBiBgdxiWJw
	+qb/KBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeUry-00D9sf-2r;
	Fri, 08 Sep 2023 06:21:30 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeUrv-00D9r8-0I;
	Fri, 08 Sep 2023 06:21:29 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1c0a4333e03so3964905ad.0;
        Thu, 07 Sep 2023 23:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694154085; x=1694758885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1CF4SZe+j+A2vmx7gVT8aOLdHeQoN2UL8CkT5LKTRQ=;
        b=RBipkU1enmNKL8DNqpC3VvQgc2lPZxOdbTYJEDgwtvaaZMKhm7Q21sS6LbImep0+rw
         7AIK8QWpDUxhGU3CnOMReBXLH52VgUn5/Uo4+i4L4p6RXpCjLKr00S/5H18XTINB3M8V
         4toX+wsRfcGRKENWwxaI5y99x+MuhOaPc8K8ywlkDOJw1DUdajvcEPPNgYvraAyubEc3
         Q4GVV8SkvU8zqie+zKp+vRgnQhZxb1PoJ1PUqfPbdcLrvvDIy4jZ5UP1+si/lufbt9Wj
         whuR+mtLZfpyqMj7BnV4VAxo+msw9ptEgn7+QPbDoz+YWz5ggMLpw1VI61m+KTLzBxex
         d6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694154085; x=1694758885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1CF4SZe+j+A2vmx7gVT8aOLdHeQoN2UL8CkT5LKTRQ=;
        b=m2PnH+0n40kDJBurgWifRJLdC+WB9SI0Df30WAXXbpNP42BCjT/8SGOmd+7F1ven2G
         UUnCTgWGa4IXbRum0bynnNrr49LLwG6oJPASmAXDJKz6gPHhsvIUepm/ltSuD7cothDO
         gL8ZUaD9agHXYHwSAHRb9UIvxyQq/b6GiaADi9vSlrHpECwRM2sHQ+mvl12vSoYPGpz6
         Wh0LcLN3rYOoSeBuNnT6VPbIvDuBfNCj8cc6OZWnbbJTy74k41GR8ombfMxAaMdcNeo4
         XXCXExFajdnVZDejwLOjIgTE4+u61wlIpxIi6N5HwcuFi0tDvXQOIaljdcOTySzbSJoj
         msLA==
X-Gm-Message-State: AOJu0YxoJSgObysH0la/2We8jJ4aS3QMdaVbAyChHNC7SRr33JYV/JVO
	3KhscYe59cU/b54IUSamvqE=
X-Google-Smtp-Source: AGHT+IGST1hBLOHOHypmYgCJUMet9wuRE7B4sVnLN++DfxZqbuc1JkMedwhmLrS+9e0Rre5bDpEsow==
X-Received: by 2002:a17:902:e54b:b0:1bb:d7d4:e2b with SMTP id n11-20020a170902e54b00b001bbd7d40e2bmr1895198plf.0.1694154085658;
        Thu, 07 Sep 2023 23:21:25 -0700 (PDT)
Received: from hbh25y.mshome.net ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id l7-20020a170902f68700b001b8c6890623sm768620plg.7.2023.09.07.23.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:21:24 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: justin.chen@broadcom.com,
	florian.fainelli@broadcom.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mw@semihalf.com,
	linux@armlinux.org.uk,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	maxime.chevallier@bootlin.com,
	nelson.chang@mediatek.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH v2 1/3] net: ethernet: bcmasp: fix possible OOB write in bcmasp_netfilt_get_all_active()
Date: Fri,  8 Sep 2023 14:19:48 +0800
Message-Id: <20230908061950.20287-2-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908061950.20287-1-hbh25y@gmail.com>
References: <20230908061950.20287-1-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_232127_133106_3A0FA622 
X-CRM114-Status: GOOD (  14.58  )
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

rule_locs is allocated in ethtool_get_rxnfc and the size is determined by
rule_cnt from user space. So rule_cnt needs to be check before using
rule_locs to avoid OOB writing or NULL pointer dereference.

Fixes: c5d511c49587 ("net: bcmasp: Add support for wake on net filters")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---

	v2: use -EMSGSIZE instead of truncating the list sliently.

 drivers/net/ethernet/broadcom/asp2/bcmasp.c         | 9 +++++++--
 drivers/net/ethernet/broadcom/asp2/bcmasp.h         | 4 ++--
 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.c b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
index d63d321f3e7b..e45e0ae932cc 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.c
@@ -528,13 +528,16 @@ void bcmasp_netfilt_suspend(struct bcmasp_intf *intf)
 				  ASP_RX_FILTER_BLK_CTRL);
 }
 
-void bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
-				   u32 *rule_cnt)
+int bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
+				  u32 *rule_cnt)
 {
 	struct bcmasp_priv *priv = intf->parent;
 	int j = 0, i;
 
 	for (i = 0; i < NUM_NET_FILTERS; i++) {
+		if (j == *rule_cnt)
+			return -EMSGSIZE;
+
 		if (!priv->net_filters[i].claimed ||
 		    priv->net_filters[i].port != intf->port)
 			continue;
@@ -548,6 +551,8 @@ void bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
 	}
 
 	*rule_cnt = j;
+
+	return 0;
 }
 
 int bcmasp_netfilt_get_active(struct bcmasp_intf *intf)
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp.h b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
index 5b512f7f5e94..ec90add6b03e 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp.h
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp.h
@@ -577,8 +577,8 @@ void bcmasp_netfilt_release(struct bcmasp_intf *intf,
 
 int bcmasp_netfilt_get_active(struct bcmasp_intf *intf);
 
-void bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
-				   u32 *rule_cnt);
+int bcmasp_netfilt_get_all_active(struct bcmasp_intf *intf, u32 *rule_locs,
+				  u32 *rule_cnt);
 
 void bcmasp_netfilt_suspend(struct bcmasp_intf *intf);
 
diff --git a/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c b/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
index c4f1604d5ab3..ce6a3d56fb23 100644
--- a/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
+++ b/drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
@@ -335,7 +335,7 @@ static int bcmasp_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 		err = bcmasp_flow_get(intf, cmd);
 		break;
 	case ETHTOOL_GRXCLSRLALL:
-		bcmasp_netfilt_get_all_active(intf, rule_locs, &cmd->rule_cnt);
+		err = bcmasp_netfilt_get_all_active(intf, rule_locs, &cmd->rule_cnt);
 		cmd->data = NUM_NET_FILTERS;
 		break;
 	default:
-- 
2.34.1


