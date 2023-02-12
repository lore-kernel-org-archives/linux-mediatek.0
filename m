Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43505C636D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Feb 2023 21:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ELPTqr0flg6eLS2gqZL14mjSQhkb34cWDqGpoC6+CYs=; b=t/4Ju/+TnAXcW2rKDJQHbU2Yac
	Dk/gHVfNvFsJSLn1zhwqNLih4hy4tLs8U5k0kSYg5/7c2LcjzzT8Qd3qh9Y+J4wDXgK0Z01Qyr4Hf
	k7Aw1HYD5gVmg2cSk8KaKM6L/NGbHrfJS6s5zyh+CBsN3dHkfO8OM28L+Xkj2SluMU+rG4MP7sRzj
	zsfaokbIRyRocmbo2ysztSyA5OknWaS11Rr9pqbdo87r9cTmpjWGgzLLgg7XftxbsyBEj3U8w8Jrm
	Vv8qooNFzfpKlbAXlRgmHgY615YJJf6o/kiVpM4HNHcEB95C84vMbJB50jlmHrv+tyt71G58hVLT/
	xe6NLLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRK7O-00COxf-8W; Sun, 12 Feb 2023 21:42:42 +0000
Received: from mail-he1eur04on060b.outbound.protection.outlook.com ([2a01:111:f400:fe0d::60b] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRK7B-00COuZ-P6; Sun, 12 Feb 2023 21:42:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRpmBd2qVapIYtaNAqZeiRTi9AYtX3wBLULbl4g8ObIDZmSgd3LRv3nCYAdbG9IjtwGvbKbBjhdSIiIU7vi3Qne3EUceYIZ+4oMDi0hJsoEK69kRdgPYaY5oOKsCupfQOGowa9cnm4FHvzGufFmEyH1204gzQJ51SjPrnxS2h5MkrMoTm2sqhasm9xYrpmvWIPfEblPfx/gwTtppDUm+CUhR/1JayCPC5d25jW8PREjai/jChM1PVBaTxlhFFu+jb7hGyoJUXqyBYt0FgYr8XNb0O/tZg2kntcMDS50FDrElmmH9QO5OlKHwGkXfQXBDkfcZfXmi44y8tRY6D93Imw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELPTqr0flg6eLS2gqZL14mjSQhkb34cWDqGpoC6+CYs=;
 b=UmbfJnh5S8FFSkF+aBJRfYa65d6fyGcq8q6VoX+fYrMgjIpoL18kKUzUO9hhfKb+6H31ahc/Ot/N+hqYNFZBXCI1WVNWAHN2mh4G7f34vEhruwjvYC0gw1j3M77sWjCtb31Xnwac/VYHhvfcAPKnPMXec90xS/eUzkWS7yEnlwgxrdHhSCLcUmsTmpPfSbZmM1KKMcEB7KZ/lmB3KMvbY5jier6oDl9X2x9wAo+nSvlJ3iwtPQgB3djKj9CsRIU1WVOm8hghjzxR39FKdbReuI80DwAOZMxqdSH2iG2gLAUe627pngj7YThxveaW/8WMLRVO+JbJIKjkFxBdWV3q7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=routerhints.com; dmarc=pass action=none
 header.from=routerhints.com; dkim=pass header.d=routerhints.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=routerhints.com;
Received: from VE1PR04MB7454.eurprd04.prod.outlook.com (2603:10a6:800:1a8::7)
 by AM7PR04MB6806.eurprd04.prod.outlook.com (2603:10a6:20b:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 21:42:26 +0000
Received: from VE1PR04MB7454.eurprd04.prod.outlook.com
 ([fe80::e4a3:a727:5246:a5cd]) by VE1PR04MB7454.eurprd04.prod.outlook.com
 ([fe80::e4a3:a727:5246:a5cd%9]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 21:42:25 +0000
From: Richard van Schagen <richard@routerhints.com>
To: Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arinc Unal <arinc.unal@arinc9.com>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: Richard van Schagen <richard@routerhints.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Fix Flooding: Disable by default on User ports and Enable on CPU ports
Date: Sun, 12 Feb 2023 22:40:27 +0100
Message-Id: <20230212214027.672501-1-richard@routerhints.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e3::9) To VE1PR04MB7454.eurprd04.prod.outlook.com
 (2603:10a6:800:1a8::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7454:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c41f16-a007-4cd1-380f-08db0d4207f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	No7duK+6UnjUBUGDfkcNarcEDMM+tZiPjcc4eRDst7F+/e3w0hO16gj8+oxEPR7Alc6erzD4YlNEZcmF53dZYLPJXxwfYkyn7eVSGHci/t6v509eJH5CGcD+d2/o0AaA9u4gih3lFisJZFaQwbQnLhfOkExhfrD4VXNdX+LYq3jstajcYnGjKKUpZBw1s8psHaOGjE/dTYaTt6nhrGRBWqIYd2zFD8AxQn6H5ihDYxjtYjZ8sO4h5pKerxnf5K4ClVZhLlm7u4wvz3tiSfU9I6S+Oh5PkOZMS/eGByJTJMi8SkMyiCfO3BcgirWEchpW+6omA6ilXERJTbJ4neqnBR8v6+YJva4Upl7egSyGsUoutkq2YOGhHPXCSNJNzQhVBF+3GFlBgN+Hksc24Tgf+fsotbhFVCrwbP0PWfAYnquk86QjEU1ORS9Qclok2ng+yRetlsckMYVs5qT1FPwKRuNDQCg7flqojmFyt75TVfCEWdzYn/4mnn8bYd4ICwdzVnYHW/s3uSSWABcejte3WfU53frbrobPbl9KLXlpvZ7diDNYhzAIzTXyoYFF/1usiad99Hc8onm2fpEuQGbkpbABqWcOXF0h+DQX2PDd8z2ibjpfnQpg2PfG5sI8OtdZftwv4+mWIfJXnn/M3b26Og94MJL+rPX0BuADTLOKa0FVqenXeA8zP+wJ/9OcgaQr
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7454.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(39830400003)(376002)(366004)(136003)(451199018)(41300700001)(7416002)(66946007)(66556008)(110136005)(8676002)(66476007)(316002)(5660300002)(8936002)(4326008)(2906002)(52116002)(6486002)(478600001)(1076003)(6506007)(186003)(6512007)(2616005)(36756003)(83380400001)(86362001)(38100700002)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xsj4Qbv4xaD7Xd11IaugSvLst5NPOQzm70DDMs4goTZbq0GAVgjOq2JtbdD8?=
 =?us-ascii?Q?ayfjMPGyKoEgflI/4t1X//e63EEzQxyhrD1tghDZVe5fbdKpiX3BS0q6mU73?=
 =?us-ascii?Q?O6xj++VTDsDO7TCSkv9ld9EN7kE1C2g2d4Eaaf7dSfb7JWLPOgk6p5bwEVhp?=
 =?us-ascii?Q?RjMYrpA5hwFh0JhNvZmjIeWkjK2Jq9GHzeyMAyVnz6wPA1vqF5aEpNP0+1bK?=
 =?us-ascii?Q?rfIVMp7Zs9zh2iPaUr2BZzrF5UybL1RxRi3CM+L9U6i0JEAJsmhVI658knns?=
 =?us-ascii?Q?NpxVAZIiDB8899nXFu3yPa/fVBbyiXqhZOpikSSOC63BmIYjAMysdlvSPqxz?=
 =?us-ascii?Q?rHIaPAR6QcTws8oh1C/0xAJNpiG9Jez2226/FD1sJzVCrTKaFDA0pPA3Zyqd?=
 =?us-ascii?Q?3MIH1aC8wbXJagWf5V/CwLtHi0PbdjPRW9sxMdSdvwkDU56k+gFoHdCfgxC4?=
 =?us-ascii?Q?dglGGJ8pfSDx8rDHtLQiZ1aPNWor9BVjUMEMqGrp6VjiM7tc6c18pYbVvjig?=
 =?us-ascii?Q?u6gW2apyea/D8qTPF3MJeBL1Spu9k/qzntV8/IGRl8JZdm8JpCVGZuuTbn+G?=
 =?us-ascii?Q?+b6Nj0K4gbwLZXlDUYr0IycT8KgiIg6suHNirY8czk3YSfJrkWsrmq9kzyAx?=
 =?us-ascii?Q?2USBa7vlCHMGLkdo5VnIdRiJncoxT8ZE7171bDykVFAKKdoIFpv1SQ/PjamZ?=
 =?us-ascii?Q?fzHk5VV/zTPWvnHl4GY7XWP4FqaB3ZmKVioQ6Dp2igIghBKo17xTzOUXOjBS?=
 =?us-ascii?Q?2CsyGJBGd5DIsOBSaKm3Sd8/6n7/BwpxDcnZuUfjMzpCQTR2iejTdPxzFp6V?=
 =?us-ascii?Q?MbNYfZOOkIWLPvZoxqP3oD7b+ggYS7AU40+hw+8arVY95CO4qLiHzyUX+VAh?=
 =?us-ascii?Q?do8P4/pqNi6a+fbmuzRYn6ZLeEu6uj4JEwK79gKUFEuswyhGL2FEHdVvfzFn?=
 =?us-ascii?Q?YEXzN3Md+VU0ZX8DpJM9tDW53jFdRNSJtd/OI1gN6kF4NQ/uGcuMy53v2O/a?=
 =?us-ascii?Q?ha8A+ulEh6PPrZee3R0qaztTs6H/Du17nqB07ulZDmlyupDbDzvOTe6i2Aza?=
 =?us-ascii?Q?IRKdDnuFPGBX+SmENPYQUMn4NUTtTqMzxED49aVYYNw0q5LGW6CcUeFQLkku?=
 =?us-ascii?Q?Tx1S0WVXlferfS/es8rxxHhQyDMcin5A3uB8wtfW89D7uw069W9rbK1BEhvm?=
 =?us-ascii?Q?pXJ0ZsVdXIkbNMLnMx/5CFs8aHYgF0iJf8zzvCl3n3fjdAP8oEksXyZFsMbH?=
 =?us-ascii?Q?NVNhFDPm7pajUHqlYZuYtRxry3mOfV+4UDiWrRn+VERyYdWt5DvVTRDCW+wa?=
 =?us-ascii?Q?qXasksAvjvaJaWHZGOfNnccSnAvvTVRyOpc5r09Da8/hNqLxamx0MvXbHFdL?=
 =?us-ascii?Q?oO0EuI0ri2DRojm3hYm6LTkgfwM5jUP1E9uOyy7rLuTpLab3kWJlXRGgeU32?=
 =?us-ascii?Q?NBF7omCXmKWaub6+/etcY+MS6X9TE0cYt8GvX3lrajgjaSmJaihfG3jwgNcK?=
 =?us-ascii?Q?RS9GkJs3ygXX/xNO7eVllNUrvXtOOAtPMbAWWG54odRb7/oTlGeCFizWCieB?=
 =?us-ascii?Q?1o4GNSorcYH2X/fcak+mGxZeUBwHl3TwwE3MpCi17EJ1xEj9Dkp3QtNoqEgJ?=
 =?us-ascii?Q?67vxGJQUer6tq8EQY3GoI7M4EuLw1wpBOugaNd3dCF+U6liLXxONp8+r3vaT?=
 =?us-ascii?Q?jMIM4Q=3D=3D?=
X-OriginatorOrg: routerhints.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c41f16-a007-4cd1-380f-08db0d4207f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7454.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2023 21:42:25.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 28838f2d-4c9a-459e-ada0-2a4216caa4fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EX/JfSD4vWf82my4CLZrKb6gf59S5lAtg11/5omaVGzPLmHEGmAnBAuGbGwqjm5u/RxdzEh1wz5qpfuIGY7mZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_134229_840996_1B64754B 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
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

---
 drivers/net/dsa/mt7530.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index f98a94361c84..f456541a68bc 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -997,6 +997,7 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 {
 	struct mt7530_priv *priv = ds->priv;
 	int ret;
+	u32 val;
 
 	/* Setup max capability of CPU port at first */
 	if (priv->info->cpu_port_config) {
@@ -1009,9 +1010,10 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
 	mt7530_write(priv, MT7530_PVC_P(port),
 		     PORT_SPEC_TAG);
 
-	/* Disable flooding by default */
-	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK,
-		   BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
+	/* Enable flooding on CPU */
+	val = mt7530_read(priv, MT7530_MFC);
+	val |= BC_FFP(BIT(port)) | UNM_FFP(BIT(port)) | UNU_FFP(BIT(port));
+	mt7530_write(priv, MT7530_MFC, val);
 
 	/* Set CPU port number */
 	if (priv->id == ID_MT7621)
@@ -2155,6 +2157,9 @@ mt7530_setup(struct dsa_switch *ds)
 
 	priv->p6_interface = PHY_INTERFACE_MODE_NA;
 
+	/* Disable flooding by default */
+	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK, 0);
+
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
@@ -2346,6 +2351,9 @@ mt7531_setup(struct dsa_switch *ds)
 	mt7530_rmw(priv, MT753X_BPC, MT753X_BPDU_PORT_FW_MASK,
 		   MT753X_BPDU_CPU_ONLY);
 
+	/* Disable flooding by default */
+	mt7530_rmw(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK | UNU_FFP_MASK, 0);
+
 	/* Enable and reset MIB counters */
 	mt7530_mib_reset(ds);
 
-- 
2.30.2


