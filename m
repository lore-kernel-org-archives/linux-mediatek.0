Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8B0FA373D
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Nov 2022 05:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OtH97SO/ljmsjkfPCnK7Ji5D6S1qxVROxYqkTo25X1g=; b=iRBhPpsOygzLzjApFsDmdyzsUn
	aM36DOwB2rRZXJShFamsOnJX0JxhcCuFF1OXpZWOa5LhQTGthkmJ77w1m+ZZwzTtFjm+86WHAhegs
	tVDeVUD9ZSDKJ5+K5Cph3B02AYKhZb0x1vRjRRnZD8h7UqGmVolUZ2TfgPc7d0R/h6HrGrayGrnUu
	WaP2XeCmKo2Xth/V0i80W18pipiYbwg9oYs7s2mF8mGprODbVI5WarAzSf0Hy5KWbQDERv39U2Y7L
	YRF5ZYRUlQBSh3z9GqhxqPZLyPCyBAYGzMIuoOzv02po/X0t/+lGwE3oxnMBvx0FRQkx63rAG1/z3
	tNI5Bm5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opkBn-0029r9-R1; Tue, 01 Nov 2022 05:51:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opkBk-0029el-LE; Tue, 01 Nov 2022 05:51:54 +0000
X-UUID: 831c53940e484f158c4f45604fc9cab5-20221031
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OtH97SO/ljmsjkfPCnK7Ji5D6S1qxVROxYqkTo25X1g=;
	b=sMe3qwNQC11dABdSaaf3L7/bBc9E4oJrN1zTVWWQuH0FsAxOLV3T/P7q9K3M4UiR8+iPJnuHYiNL90V4bjTCSYtbJEFIznxrq5VzHwCWWlj9S8VkTg/pjbRuP86XWki3ReojmZSOHQwscMo1+ofgEYnLFz1s1+4zk2ubB+ESmpw=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:84facb24-c0c7-4a95-a0d2-d3f55f7406c5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.12,REQID:84facb24-c0c7-4a95-a0d2-d3f55f7406c5,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:62cd327,CLOUDID:638e3490-1a78-4832-bd08-74b1519dcfbf,B
	ulkID:221101135105DDJDUWHM,BulkQuantity:2,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 831c53940e484f158c4f45604fc9cab5-20221031
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <zhaoping.shu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2110073554; Mon, 31 Oct 2022 22:51:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 1 Nov 2022 13:51:01 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 1 Nov 2022 13:50:59 +0800
From: <zhaoping.shu@mediatek.com>
To: <m.chetan.kumar@intel.com>, <linuxwwan@intel.com>,
	<loic.poulain@linaro.org>, <ryazanov.s.a@gmail.com>,
	<johannes@sipsolutions.net>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <matthias.bgg@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<haijun.liu@mediatek.com>, <xiayu.zhang@mediatek.com>,
	<lambert.wang@mediatek.com>, zhaoping.shu <zhaoping.shu@mediatek.com>
Subject: [PATCH net v1] net: wwan: iosm: Remove unneeded if_mutex lock
Date: Tue, 1 Nov 2022 13:50:33 +0800
Message-ID: <20221101055033.47837-1-zhaoping.shu@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_225152_907046_8CC8F99F 
X-CRM114-Status: GOOD (  15.33  )
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

From: "zhaoping.shu" <zhaoping.shu@mediatek.com>

These WWAN network interface operations (create/delete/open/close) are
already protected by RTNL lock, i.e., wwan_ops.newlink(),
wwan_ops.dellink(), net_device_ops.ndo_open() and net_device.ndo_stop()
are called with RTNL lock held.
Therefore, this patch removes the unnecessary if_mutex.

Signed-off-by: zhaoping.shu <zhaoping.shu@mediatek.com>
---
 drivers/net/wwan/iosm/iosm_ipc_wwan.c | 42 ++++-----------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/drivers/net/wwan/iosm/iosm_ipc_wwan.c b/drivers/net/wwan/iosm/iosm_ipc_wwan.c
index 2f1f8b5d5b59..fa2261697d53 100644
--- a/drivers/net/wwan/iosm/iosm_ipc_wwan.c
+++ b/drivers/net/wwan/iosm/iosm_ipc_wwan.c
@@ -40,13 +40,11 @@ struct iosm_netdev_priv {
  * @ipc_imem:		Pointer to imem data-struct
  * @sub_netlist:	List of active netdevs
  * @dev:		Pointer device structure
- * @if_mutex:		Mutex used for add and remove interface id
  */
 struct iosm_wwan {
 	struct iosm_imem *ipc_imem;
 	struct iosm_netdev_priv __rcu *sub_netlist[IP_MUX_SESSION_END + 1];
 	struct device *dev;
-	struct mutex if_mutex; /* Mutex used for add and remove interface id */
 };
 
 /* Bring-up the wwan net link */
@@ -55,14 +53,11 @@ static int ipc_wwan_link_open(struct net_device *netdev)
 	struct iosm_netdev_priv *priv = wwan_netdev_drvpriv(netdev);
 	struct iosm_wwan *ipc_wwan = priv->ipc_wwan;
 	int if_id = priv->if_id;
-	int ret;
 
 	if (if_id < IP_MUX_SESSION_START ||
 	    if_id >= ARRAY_SIZE(ipc_wwan->sub_netlist))
 		return -EINVAL;
 
-	mutex_lock(&ipc_wwan->if_mutex);
-
 	/* get channel id */
 	priv->ch_id = ipc_imem_sys_wwan_open(ipc_wwan->ipc_imem, if_id);
 
@@ -70,8 +65,7 @@ static int ipc_wwan_link_open(struct net_device *netdev)
 		dev_err(ipc_wwan->dev,
 			"cannot connect wwan0 & id %d to the IPC mem layer",
 			if_id);
-		ret = -ENODEV;
-		goto out;
+		return -ENODEV;
 	}
 
 	/* enable tx path, DL data may follow */
@@ -80,10 +74,7 @@ static int ipc_wwan_link_open(struct net_device *netdev)
 	dev_dbg(ipc_wwan->dev, "Channel id %d allocated to if_id %d",
 		priv->ch_id, priv->if_id);
 
-	ret = 0;
-out:
-	mutex_unlock(&ipc_wwan->if_mutex);
-	return ret;
+	return 0;
 }
 
 /* Bring-down the wwan net link */
@@ -93,11 +84,9 @@ static int ipc_wwan_link_stop(struct net_device *netdev)
 
 	netif_stop_queue(netdev);
 
-	mutex_lock(&priv->ipc_wwan->if_mutex);
 	ipc_imem_sys_wwan_close(priv->ipc_wwan->ipc_imem, priv->if_id,
 				priv->ch_id);
 	priv->ch_id = -1;
-	mutex_unlock(&priv->ipc_wwan->if_mutex);
 
 	return 0;
 }
@@ -189,26 +178,17 @@ static int ipc_wwan_newlink(void *ctxt, struct net_device *dev,
 	priv->netdev = dev;
 	priv->ipc_wwan = ipc_wwan;
 
-	mutex_lock(&ipc_wwan->if_mutex);
-	if (rcu_access_pointer(ipc_wwan->sub_netlist[if_id])) {
-		err = -EBUSY;
-		goto out_unlock;
-	}
+	if (rcu_access_pointer(ipc_wwan->sub_netlist[if_id]))
+		return -EBUSY;
 
 	err = register_netdevice(dev);
 	if (err)
-		goto out_unlock;
+		return err;
 
 	rcu_assign_pointer(ipc_wwan->sub_netlist[if_id], priv);
-	mutex_unlock(&ipc_wwan->if_mutex);
-
 	netif_device_attach(dev);
 
 	return 0;
-
-out_unlock:
-	mutex_unlock(&ipc_wwan->if_mutex);
-	return err;
 }
 
 static void ipc_wwan_dellink(void *ctxt, struct net_device *dev,
@@ -222,17 +202,12 @@ static void ipc_wwan_dellink(void *ctxt, struct net_device *dev,
 		    if_id >= ARRAY_SIZE(ipc_wwan->sub_netlist)))
 		return;
 
-	mutex_lock(&ipc_wwan->if_mutex);
-
 	if (WARN_ON(rcu_access_pointer(ipc_wwan->sub_netlist[if_id]) != priv))
-		goto unlock;
+		return;
 
 	RCU_INIT_POINTER(ipc_wwan->sub_netlist[if_id], NULL);
 	/* unregistering includes synchronize_net() */
 	unregister_netdevice_queue(dev, head);
-
-unlock:
-	mutex_unlock(&ipc_wwan->if_mutex);
 }
 
 static const struct wwan_ops iosm_wwan_ops = {
@@ -323,12 +298,9 @@ struct iosm_wwan *ipc_wwan_init(struct iosm_imem *ipc_imem, struct device *dev)
 	ipc_wwan->dev = dev;
 	ipc_wwan->ipc_imem = ipc_imem;
 
-	mutex_init(&ipc_wwan->if_mutex);
-
 	/* WWAN core will create a netdev for the default IP MUX channel */
 	if (wwan_register_ops(ipc_wwan->dev, &iosm_wwan_ops, ipc_wwan,
 			      IP_MUX_SESSION_DEFAULT)) {
-		mutex_destroy(&ipc_wwan->if_mutex);
 		kfree(ipc_wwan);
 		return NULL;
 	}
@@ -341,7 +313,5 @@ void ipc_wwan_deinit(struct iosm_wwan *ipc_wwan)
 	/* This call will remove all child netdev(s) */
 	wwan_unregister_ops(ipc_wwan->dev);
 
-	mutex_destroy(&ipc_wwan->if_mutex);
-
 	kfree(ipc_wwan);
 }
-- 
2.17.0


