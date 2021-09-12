Return-Path: <SRS0=wX2S=OC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C49C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Sep 2021 12:12:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3232610A3
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Sep 2021 12:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3232610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObRVc7bEl/3w94xXta1fQ7K4aUQD0J8es5/tFUvlrEw=; b=MzG2tJH+k4WGyi
	L0TYS88CbyhQgg8wGdemiEnjE+b0M8R3Z/tbadzZHKd+Y64CaPYvBz+XHhy5hRB5iLNdb2O9/f59p
	8UJxB/nYEnm2WU2vq5m1hpUuniZXXN4Y+twH6GFhD7jQOF6qqXAFpiPDvOfkereVhWtqoZlwwzUO7
	YeL34uks7SOc+3eZAlRMXLaTTNdw1Uul/EaAni4QU9Ebu2QjPwxHum4Cm1iNBIJ2yJWLC+VhivgOA
	Xv1LQn9WP0STUtgVpvgmBFXjfrljRlW87+PYy5k1cLaeGTgOANQWCtiPdFSSredeBK3X7r9bYrq4u
	1ySOY/4lfZRsFsU2GTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPOL7-00GM2c-KZ; Sun, 12 Sep 2021 12:12:05 +0000
Received: from mail-eopbgr40057.outbound.protection.outlook.com ([40.107.4.57]
 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPOJ7-00GL8k-8v; Sun, 12 Sep 2021 12:10:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3YK3QmUWW/ZdSnR2VpSfhs+H7XiIT/wAmq2N7CnB2WmWFEgADSma+ROrn2apLCUf4Uh+LYV8f4j3vX0TciIor2bIvI1CbkP8+2aH4HiWUtfWnim8kTB55ZznaOtrSvnmTYuPjttN1OEyubxC10R3na3+SsE2L+vZY9PDgVySutx/tW24p7u/s5La9ax2l0TsuSCn9+7UcwJVZRoWB+qmoE1b/VkTOoo4h+zYsJKMbvgt4y8geSmc6/huiLnunePl0Z1HalhfGQoGE59h7t2O2dgBPWaa7g91roYhmZQ6HscfMiQh2C4fwaF6E6tuI8FNBR++JsRKpaSK2p0Hi5Rdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=zF5F8yiEmAkVyLfvd9FwoYUgxgfsVgMi+4/IluAypvM=;
 b=k36pMVaUm+Lhe4Mnq5+n7/I1RwPqzxQ799xIngxoNWctfpi47T8YQVwQmubnMHWynZ+VctM8ZQp0fiigFKsVwl7YKVUOo8Tlb3v6saGMilJVm+iu1ZHd+HSX5/m+2Giq9IhuVZskYjT0WP3w3pqCTPAc8xlrN5w8JvV+/lyT2EHGgTMVZiq4PsX35RIXZLb0qvB9UczGGPlLRatCcs/DmObV5qtb/YfI3E8MawxyaBDozF82/YIYyy8Yv5eNl2zvOwWTlqygvEcVu8n2heh5V9n//1n5GNHVHeVkEDFXrcp+e931AaVc+u3jk1N78wGM187DUMgFmtK5004zxGHxvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF5F8yiEmAkVyLfvd9FwoYUgxgfsVgMi+4/IluAypvM=;
 b=RSUQ8wz0EczcfJWt2JsgqAb0crwO4NdLydxcp6Erg4SocP5sw9i0CTlWFYkRB3n+La+WC44TcoqJyBoHwu7pWvBFahH8ZtJ5F3958x7c8Q7D2ikcrUjLEimih6rB9mAcIxXVsVsOcH+0+0Unqi6TUD+sM8MYWHI9f9ubB2ghpqg=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR04MB5854.eurprd04.prod.outlook.com (2603:10a6:803:e2::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Sun, 12 Sep
 2021 12:09:49 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::109:1995:3e6b:5bd0%2]) with mapi id 15.20.4500.018; Sun, 12 Sep 2021
 12:09:49 +0000
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
Subject: [RFC PATCH net 4/5] net: dsa: microchip: ksz8863: be compatible with
 masters which unregister on shutdown
Date: Sun, 12 Sep 2021 15:09:31 +0300
Message-Id: <20210912120932.993440-5-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210912120932.993440-1-vladimir.oltean@nxp.com>
References: <20210912120932.993440-1-vladimir.oltean@nxp.com>
X-ClientProxiedBy: VI1PR07CA0173.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::21) To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (82.78.148.104) by
 VI1PR07CA0173.eurprd07.prod.outlook.com (2603:10a6:802:3e::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.9 via Frontend Transport; Sun, 12 Sep 2021 12:09:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1487b7ba-c3d4-474d-bd4d-08d975e637b8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5854:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5854BB4A1A3A6039B0E1B395E0D89@VI1PR04MB5854.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vtDQxE8lgs8cbBE3peJ1JT4j9C0u+7ldt7EiUJS5y1B/taaCwgg84ZH+XKvtfbx9t1RVGogmRBjXT6XQ+7kR7lKRFnaqc7tAu96ZX/K9+/QHdh5ASUQJHX+AToy3/hqigMLZizi9EG75ap3cFngnTNARzvYoIZYsN+WunkvIHJ6fORh6RfhdkeSiGAKSzDKKEDqlJjoI+QZLEGT8q+7hl7d76Krdc4BMWrd9GwwnjAx6N6h9AbrfB7qBfhEAgy6lFByfnuNMxH33bjJfW54Z/H1Zp7P+emlQaihmQ6AYRhNG+5OLEnDE0lfyp8Jhhf3+lrypJ12MioMAZ+8UgT4lrSZisUrT97AKanhFrFQnaddGMX6SfpduZ93sQbaVOif5Re1vrOH1wAWWUEekeOXKNR9YE8aCMsRhNAf9LBaNDdzH5Cm/IVM0HcuQOW/za32WURmPCWGyeGxEfW+H7EFdLzIh0q2yftX/cjWvP+3E/WIpafJDFarN4yQ9IwWzBwpZ2gHQr4ACU8bbu+HerfrSGJ9K5wCmAX+WTnERszOvPbRw2/Rebmwf3dlQd1OKpw7XhwrobERV9WHMlCDjIqHDqCJ79WZEdVyEb2+rURPXk75/pfIwAJMGoJTFVYsrbo6lPw6fbTvL1Z6RzyO7Vrwj0wSJX8Kjvo7dDbmkhX4dhwA1OuQmrRI0+/7tMMCpEswlwbbYKpmz5EtQVw+PqfdukYHFPBRt0Joy535zNKVBX4xw8LAdvmVsc4IfjLD/8M0Tncv+AQ3EJK9/30ekuulQbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(966005)(316002)(83380400001)(4326008)(6506007)(86362001)(6512007)(26005)(44832011)(186003)(38100700002)(8936002)(5660300002)(478600001)(54906003)(2616005)(1076003)(7416002)(36756003)(6486002)(66946007)(2906002)(38350700002)(8676002)(6666004)(66476007)(66556008)(52116002)(6916009)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Yvm/pZpu/smrgsIsbPXSzfSIGMLbm3/CTlz6/1lUds8Ghcvt4Ms7CaJJqyzM?=
 =?us-ascii?Q?+fshQa5btGVKtjGA4qdFLuIj8a/oriNvYiEzkhECHljO1ceKKGRs+ZQ+mt1h?=
 =?us-ascii?Q?BTErLNt6EV5FOCDBcdUZnI6gz8xP77Cp3HfAp/TqED0RliOfLOwgYnuISrtQ?=
 =?us-ascii?Q?fbV8z4cWxLbr/rY+u53RDHQyBultOM7vZooRGaYz/K997WyXYLpcB1f2gOwY?=
 =?us-ascii?Q?9eDvptTA0cJ15LRRdiO7ivFXnBGM7IhdrSsVHSNVqrA0A/qdE+lC41QfdgsF?=
 =?us-ascii?Q?KUk29KJ4qtJnwou+kn2oZH9axEUxEjl4I3UhAwBufPzBxY6TPu+dU7lF12k4?=
 =?us-ascii?Q?mPKSF1QbNReME2XDJYMk9pJZysOm6SxQ8b63cuKbqRq4eDLOZyMD0vfEyLd8?=
 =?us-ascii?Q?+E1rXkwIY6GH6xA7TRWCzpihloIq1U/w7oxk6u89s3vAemGOop5zTpWlcLCM?=
 =?us-ascii?Q?L0QXlyRnX83FwnuKSBjsxbWMWmJYjNjX/M+0OiA/DkTfIvaDXbloq636JHu8?=
 =?us-ascii?Q?SjURKARsA+Sn41nZQOFRNaOz+vAdPJd+wlQlSKZKZDzCdkqewFgtd5XjAMII?=
 =?us-ascii?Q?dVmFRbXTEy8QyfuwcN3D97ASCcAFPvxxhVj+gfS8hXEaKtqcEfBNECHJR1S0?=
 =?us-ascii?Q?8u38F1sXgPoqy+4jcskr1pCAz7BpR+z0iJLuXXV4IoROY0SQC4xo1aVwWCHq?=
 =?us-ascii?Q?WIKdIyB6UmjXRwqqBYNJCz2+521sXsJUi4WflXSLXnlj3bdWzY9Cqhz77T58?=
 =?us-ascii?Q?chgaXkhUSQ0ZXrgdLjCYRQ8VpfiAwNtIzwV5bPFr/Iqwpe0piQRJg1jusbdd?=
 =?us-ascii?Q?hWeagHcXeZtDz82j8UieQ/BDOgrWRzpk29NNmkz17dRwyyMsznWK6fNqduQU?=
 =?us-ascii?Q?AkSuUFJTjtHLIke3lBM25HXthuB0PbIkE3kSBG/SKueuGzLXyofaMs+JJdYG?=
 =?us-ascii?Q?ntPX72gLto/xehL3Uoue1veq4sucGXm6LhHde9tmLh83mqhUDb6RWOVj3arZ?=
 =?us-ascii?Q?W35KwElVcaPGexfT2XrHcQlcJMw6WDuhmgu0dkub4IhU0Mb2LD/gipT5s68J?=
 =?us-ascii?Q?f4eYM/x0fUonMZseeA9uKsQ7Be/JB64/kA2+54W6hMjqZaxit6DFtmzjtqI9?=
 =?us-ascii?Q?7HCDntNn0MuLIhyxaLwrVkIrmGvXrEnK4WwyvrD9CavO0Il4ZR6UNMqwUrB2?=
 =?us-ascii?Q?aAAyZ+MQK99ma9FO7kKqtPWzBA2ohiP7tmZtdV6yMB4OnQKy0OL5xyXv8UPT?=
 =?us-ascii?Q?5l8FAUzLmJrUth7zrqCXxXRjBud7YhV6qbMpv1AbEDg5Y+w/BVqXs5UajR5O?=
 =?us-ascii?Q?OqKZ9Be9xzZvfEC84GjNLzA0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1487b7ba-c3d4-474d-bd4d-08d975e637b8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2021 12:09:48.9256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvSY1Bo3B5xHQxS+Gl753wlHzrHjjquVuBw1Hvgt2QCx/LTqSBMBdgnEwzSv7IQjIxreYG61zIgLaMyKKG+ONg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_051001_364986_CC23A3BA 
X-CRM114-Status: GOOD (  16.91  )
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
