Return-Path: <SRS0=QZHK=OH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 13:37:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355A2611C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Sep 2021 13:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 355A2611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3wYWkIDp9BS0zjWn5igo2j/Pg2/4xj9RWfupQgdVxQ=; b=PZLLKmhP080tUH
	k6O23fP/Hvcqa+Z+FoDiQ3pdx3crKo61PpCXwH9xpjeROMNV9rnqoR2WUQ0U4LONIOg6XCDcIQw28
	20K/JegkutbmdVsk6f7bFphqo8PgAnpM06Ulczs8l1dLGTP3cE1CKXr9MMwGIgyxgnX5/knUHWQcI
	cUd2Mbcd7TNFK113WWcROGbH7VuJxi0kYk/B+SYwzdYysqJAMC9KnGl2arV6QnWZclgab3No1A468
	62IrKpN9kvcMnnMnDWRO05XGU/WruPJWo5zki3k9Vy6lYljbFyZW+aI39LZ82iYT9HcHAmkTafUCN
	TnrS/lzZoe1XjAQ6FbNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRE2s-00EK2W-7e; Fri, 17 Sep 2021 13:36:50 +0000
Received: from mail-eopbgr80047.outbound.protection.outlook.com ([40.107.8.47]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRE1B-00EJEg-LK; Fri, 17 Sep 2021 13:35:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1MTbzM6nGPSCRpGYJ1SMhGOLSvbW5Ao4On0eCzXl8nwVkdind6s+ha4INTut3NAqkeJL9Mqn7ephJlvbJ2AZ6o5Ju5eKOHqdfN+6xfeGNX138Va/CENyAh/9PxwaMPIOMXc5VRtqhthIR5YvRBPBjF7nZfsdRCcC9w6WDKjciCFrNJsV1Vxi5f3xGcQz0AKT1Yr9Rb14vYtr2pqleJtor6YZzV6rJVPcheCeh5PQmNX0bBRCwoqoRFeu1b7Po2XO3KL2eH2gtgn6z+yNI5AsSec7sG/ENQ4xNvxlw1UmkhGCj8aOCmt0aJSgABV27Wt7ruOVn1CtgTsIavl69msnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=fm/3z1GGwH7cntLPCftroJbrorEsUqgDkRilX1FVpBc=;
 b=WT8YvVk+TXi9/p25BkngVB4IRVoxjG1sHOlQVfFVKtpaHQJuUN5QYSyZkyaXjJFcE0aoERuLWqQ3fqemK8GefVM7KkLTtdz3Cy7pjWDZZj9xjM5CreFF+kojksP2aPhMeGuVETsVvGsN81dUNG4qXUJEu9NfBoEbBC1jBpzrhIeL8q7RjbqnAwZNS6UaOw6VMA319asvuyfNbTdDwkTMGa/0hchgKg0uWqL2QZdFTkwpYyRzDInGAqtq+KSWG2d4BnAqdqzFnltmQy2qoiGq26PcVQirzjV3Oa/NvODu/x9mvaVsT65Wal43VIyfCBY0lwxdliYSE/u8m6WeS/k2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fm/3z1GGwH7cntLPCftroJbrorEsUqgDkRilX1FVpBc=;
 b=SG6hmLtW8RxkLB0cpTrrvzoaLVQwcA1j/eQ6cfz99mQEnWmX8IBuyaKvPSHM46N30+eJ30pyaAzU3VO0pKs3yx+OjW5gnaTbpl4z+9pjc1fZctJvC7Be+cgSGfoMqqH8FppxReOJAolThZ9P7XsLfkVD/Sy0IHFg/nM/EBhbqxg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VE1PR04MB7341.eurprd04.prod.outlook.com (2603:10a6:800:1a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Fri, 17 Sep
 2021 13:34:59 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0%2]) with mapi id 15.20.4500.019; Fri, 17 Sep 2021
 13:34:59 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>
Subject: [PATCH v2 net 4/5] net: dsa: microchip: ksz8863: be compatible with
 masters which unregister on shutdown
Date: Fri, 17 Sep 2021 16:34:35 +0300
Message-Id: <20210917133436.553995-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917133436.553995-1-vladimir.oltean@nxp.com>
References: <20210917133436.553995-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: AM0PR02CA0199.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::6) To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (82.78.148.104) by
 AM0PR02CA0199.eurprd02.prod.outlook.com (2603:10a6:20b:28f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 13:34:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f2b4ba-4282-4b46-affb-08d979dff1f7
X-MS-TrafficTypeDiagnostic: VE1PR04MB7341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7341D2AE95B03DD502C029E7E0DD9@VE1PR04MB7341.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36ZryUgOY2Ckl5Zjx/CWeX3QnIi+k1cGJm9wsCLE9+wOJ6g/fyGd+F3Nt8dREzLWhpfWWKOTDHviGB06ZUpD1aYfPOMKYeIyAv0vxAH0v4NCMoO6/9urB8MNtkCpt+3wZrEuPuRbhZc1aDPdjDH/q6BtRJrjtHfjYih1awTRxN5UZ22XDj5icQlJTshBUPwLKws+V/5AorKOtUiqjEky+bjykECeh575F28keSk5Jh/18kxo8ypALcJuADHN7XRF2r7iHwDItgVr0bAdkmzOWvyr17OB/l1br7+5B+v1GIa9uqa9FlKe3c8wMetDiDtjpToytubfWrIPevrasdCEu8Go+yK4pj6psKfaoUFPbrXjLq2EGb63toNOZryA/GgBM71qP/eXCsnL4XzHbfFRpixR4/pmlzugd9n7eQL+pRTy9djefvIKtPFG3xPfrnEL7jjxQwC/Is8Kjo6m9mxt6w12Lma5cAB2yN5cpRlyvu1s01idU+Z3u+tfbJZVaAtDDaqjSpeGzqVYPLEHkGDUGn6k+iXJ077CJeYva/6Oxz/+479cJgWBspMDYc8M9R2j/HIwSJPH59iitFpNAgC9/DprYAFIeDiZATEcbptuvUSTosbrhauGZxXk/fDxCFvhCMfgmPx/RvkmYtbh7VGimAqqt09WcdIofYMfZGwkH8gR7c4cHksSfj5wGiZz0DfHykE+KmJaK7QeakTaddWZNR1u9SyCv2IZyoUNO8HdKeoWGq2Nw3Bdo4rFqGehhO8aMGbY3jin6Z8jOvE7wAE4Hdmjn2XZyPtvseMjzxPtcic=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(54906003)(316002)(38100700002)(38350700002)(36756003)(44832011)(2616005)(86362001)(6916009)(66556008)(478600001)(6512007)(6666004)(966005)(6486002)(8936002)(8676002)(26005)(1076003)(5660300002)(6506007)(52116002)(186003)(83380400001)(2906002)(4326008)(7416002)(66946007)(66476007)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K365jBnbagEs1OMvINCJDFB1X5TLS3tLsG7Lmkr8hug97BDE4eN2ukWhxO59?=
 =?us-ascii?Q?u8pddxK0oeAZ9dcejP27xprJOf05QOkPZ4T5SmvYFYzBABHQ/xbayKC1kmrF?=
 =?us-ascii?Q?2k2Psem5l9FSlCqdDYRsydv2BnoSrRnV+dECdGRqyuloxjo8ZV5+V6M3+QxK?=
 =?us-ascii?Q?/NPM3IAbeHZvCwK3taxnZnoACzmzLKSZZ2i9kZBXoAoGDI9N8umOVxRD9dEv?=
 =?us-ascii?Q?WjIeFBkW1qfMu0Dykno1d3OpOMiBxpuAbjSnJ1yq9cTyezxZQxAOYxlZZVYA?=
 =?us-ascii?Q?yPBmYgeW7kNC3sHcLrksNk3RbaTlW3/Ev3B9K4ipsaSNjsK/AkHN18rnuunZ?=
 =?us-ascii?Q?WSnf+8RfyAm8x3pRnB4gAFQk7kA/9WWX1Ttm/KsCC+9dMl+Ug5yw8AB8XAUl?=
 =?us-ascii?Q?vx75akWWWZRS3gg+ZGXD2eu8g2DR8j+94R3i6hvKEQaM+4pbrndLaM9RqD67?=
 =?us-ascii?Q?uEgCMkjXPXFe1uQiA0gKHuuxKbQEVpRau959GW857kkzJA2rkk0gxwG7I+JI?=
 =?us-ascii?Q?9WrPJobRwO1qh888/FkucQ6wP6/TgIqy08wOXMFdonng/pC2kjEe+0STYdm0?=
 =?us-ascii?Q?WF+VVY74gGEEOdXEqzZzzE4boT3E+3OtUlLKup2rVp3hIKS9MbR9gqHGdR4V?=
 =?us-ascii?Q?u1UVIjTrPgnpZnSvEyrumJso60f6T1xA0AR+TwA8BnZjlnFL6RAl+ravmnNL?=
 =?us-ascii?Q?qydSdVJrjAyeOPAHaQyDX25iaYdVllzNVZWAFVdZg12ynZq67g0zfN7EPB+m?=
 =?us-ascii?Q?tKaaDHnOnjOQlcrezOqnBVafYYbQZU7SpQuctJUTYQf2oSYQAODSKOJpRMUm?=
 =?us-ascii?Q?p9buwAxEXzZCtZBqdfp5ubqB5KvSlyrq/AdKSrtc6JUdepFPsA9HhUeQFOek?=
 =?us-ascii?Q?dgjSPKJ5RbexkzUZSSI1J/Z+4i4FUZI/zcS1+aDiSOAx2Y13JXdUz2twiv8H?=
 =?us-ascii?Q?HQj72Y/IvnsWK1PVCi4ugk7EJySOcfJgPihW+9ToW/A3OfLLxES4nvvvMRC5?=
 =?us-ascii?Q?d/tOubXI336IrR9A1aSWKeZSVvR+UlnmvPBYoib5Rdk9eJ9sJvMlKXDhI+ax?=
 =?us-ascii?Q?QfQlBDkdJha4o7HWfA6pgFacEKwLS8dH70E3f60/m4i0IEA3m5zGRwG8hSaK?=
 =?us-ascii?Q?vW9kkbqxBAak66XZdNtqo8jRl8pnsyuP1f+oOWbOz66keFXIFhEa6NV7WTw1?=
 =?us-ascii?Q?wWk2HGfSsbRz/AkwEwik9eb6bSZDj3bTx9NM153ftny1PrX54MQmdqRmDDFt?=
 =?us-ascii?Q?Lkf+4h0ek+fu5t73ydUW1JW1lp5QSG2EpQ2H/lYOReGJMbqPthRRmwBvuTXU?=
 =?us-ascii?Q?IC6pQaKegiFut0E/9tQIFcpF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f2b4ba-4282-4b46-affb-08d979dff1f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 13:34:59.5534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFjbW5pHkuCy3JDUexrgGNAM+2MdpxAUHfctZfmWQn9O+pk4RLa913gny36ozu/rG9+GV0GPPylSM3GZcY1wnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_063505_733323_FE3A3AFF 
X-CRM114-Status: GOOD (  17.28  )
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

Since commit 2f1e8ea726e9 ("net: dsa: link interfaces with the DSA
master to get rid of lockdep warnings"), DSA gained a requirement which
it did not fulfill, which is to unlink itself from the DSA master at
shutdown time.

Since the Microchip sub-driver for KSZ8863 was introduced after the bad
commit, it has never worked with DSA masters which decide to unregister
their net_device on shutdown, effectively hanging the reboot process.
To fix that, we need to call dsa_switch_shutdown.

Since this driver expects the MDIO bus to be backed by mdio_bitbang, I
don't think there is currently any MDIO bus driver which implements its
->shutdown by redirecting it to ->remove, but in any case, to be
compatible with that pattern, it is necessary to implement an "if this
then not that" scheme, to avoid ->remove and ->shutdown from being
called both for the same struct device.

Fixes: 60a364760002 ("net: dsa: microchip: Add Microchip KSZ8863 SMI based driver support")
Link: https://lore.kernel.org/netdev/20210909095324.12978-1-LinoSanfilippo@gmx.de/
Reported-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/dsa/microchip/ksz8863_smi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/dsa/microchip/ksz8863_smi.c b/drivers/net/dsa/microchip/ksz8863_smi.c
index 11293485138c..5883fa7edda2 100644
--- a/drivers/net/dsa/microchip/ksz8863_smi.c
+++ b/drivers/net/dsa/microchip/ksz8863_smi.c
@@ -191,6 +191,18 @@ static void ksz8863_smi_remove(struct mdio_device *mdiodev)
 
 	if (dev)
 		ksz_switch_remove(dev);
+
+	dev_set_drvdata(&mdiodev->dev, NULL);
+}
+
+static void ksz8863_smi_shutdown(struct mdio_device *mdiodev)
+{
+	struct ksz_device *dev = dev_get_drvdata(&mdiodev->dev);
+
+	if (dev)
+		dsa_switch_shutdown(dev->ds);
+
+	dev_set_drvdata(&mdiodev->dev, NULL);
 }
 
 static const struct of_device_id ksz8863_dt_ids[] = {
@@ -203,6 +215,7 @@ MODULE_DEVICE_TABLE(of, ksz8863_dt_ids);
 static struct mdio_driver ksz8863_driver = {
 	.probe	= ksz8863_smi_probe,
 	.remove	= ksz8863_smi_remove,
+	.shutdown = ksz8863_smi_shutdown,
 	.mdiodrv.driver = {
 		.name	= "ksz8863-switch",
 		.of_match_table = ksz8863_dt_ids,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
