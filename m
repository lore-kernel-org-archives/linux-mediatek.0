Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E31B606A326
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 04:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vcFeoRSD;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=okAunNlg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gB8IValn/e3sx8EBF+QkG01N4rJR3y4+an0+UA7x9ZI=; b=vcFeoRSDvbaF+U
	TNhUHdvr4pmqQoJ8QNU5gFwHzNv3+5WRhNKpSKUiRdI9vO96vyzI7njzwO9IQL3dAyqOmtDCfGryn
	cWyWJniArvOoR+pLMQsfrmm3n0iRsomUmAJaECspki1jeFTR3k5xXutuq7qFLFXrb8YU3VaZcIeCR
	W9Fv8gbhpNrfleDIIXGwfajYZwCFPPkotnFR+aCM/R9tqnAcg/g8OwKyUUfW88kti/yGkyVuRdU1k
	b10BntLeQCYm4tFe3kjhWfWPUFNomRaprLr3Omvz3BV0nLTfSmhwTduKAZB5s238EdYin23MvMuDA
	X9xJ7aAb3a3b/wvkVHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGRl-0000000E2XI-0fmh;
	Fri, 20 Nov 2026 04:42:01 +0000
Received: from mail-japanwestazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d406::] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGRc-0000000E2Sj-2usZ;
	Fri, 20 Nov 2026 04:41:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G4rGLfsT9gWmtrJV51J+Pg8BJzGFazujDUc80hWcTReSFLf370wplTHtRv5Nm+GVjAfZVPqDyIHYC1tb4b3jFB0YE0yBRP/iPFU0BJyv125v1s7H7qSxx4nxzCoakKukThgxP8cbtMpqhm9qgU+0nDf0TWyz+VMJngjI/Lgm7WyPv9LHnwjyw9zOMN9RC2Up+N6Awy6lLHIHDYaIlAUVGEj1gy69KAtHIu46giqMJ1atxdRalueKxWl63PnmOuvmXiw8roqQvTmARPzdb+n9AZuJmdLQBKIZf8dDRTLV23hj9ubKibNR/e/OmFyPuFcOWP+h+Gx+FUkOTL+XarueOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gB8IValn/e3sx8EBF+QkG01N4rJR3y4+an0+UA7x9ZI=;
 b=mto9PWNyTDJhw2zSiuyxC+Ig2Uu9O7ZQbiuEg+Mx7sn2DTddDrS5LWUd10Gyd4bed1KlubAHeR4A3NbagwDRBMPCMnGwOhNL8G+2qrtJgFreAylG2wCQXD2NNSunYnBLHTwuOWSNBRLSOcCStbZhcf54donVvJaURXE0u9K6MGipo57O98lg/OOsM//o94QWz8xVLYrmpXOxhs0Ef0fbmqyV6SX6XXOEq8IbIRHQ+JnftQviACSjj6i+EUgdjLbm4BoBdekRkLXH+FcOdxe5gry8/bVqj4MQSh1dOCflr0o5w6/h4Fpa3Ck74vf7wyxol19DfxuNICO2Y71SD77eWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gB8IValn/e3sx8EBF+QkG01N4rJR3y4+an0+UA7x9ZI=;
 b=okAunNlgZl5T9UBguykEWtK23Og+airILXvezCPXz9pLJ7jIZBiuPlK5afM1vphWlVhVhN42nJJ6fd2+Sy2yd7b0AelDPdjSArzAOaXL2HnSAPahESVbLh98ViAmJhM/mBBTYqSc0Lp+SmO7JAR8sfLsMWCb0CzBpv7L6AaLzS3NGoPh2/2OJN/W9DvYZ0u+JYuH71L0FJ+nfdeMyey3G6gxd6WuzkWFmsYSCPLV3XNT3zUIdYzGcNn4Zb130Xq0lkMaMb423wNWJq3LV/QDQ5rJ4voAcKZUN0U5tWLc08OyAI4xPGUnhGeusMDZtIyzIDiS5tS3QL+uZ4/atvEYGA==
Received: from OSCPR01MB15019.jpnprd01.prod.outlook.com
 (2603:1096:604:3ab::14) by TY4PR01MB17473.jpnprd01.prod.outlook.com
 (2603:1096:405:354::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 04:41:45 +0000
Received: from OSCPR01MB15019.jpnprd01.prod.outlook.com
 ([fe80::d06:4844:6b2f:9fa2]) by OSCPR01MB15019.jpnprd01.prod.outlook.com
 ([fe80::d06:4844:6b2f:9fa2%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 04:41:45 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-wireless@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shiji Yang <yangshiji66@outlook.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] wifi: mt76: connac: correct rate power limit logic
Date: Fri, 20 Nov 2026 12:40:57 +0800
Message-ID: <OSCPR01MB150191A858729F9D98B404F6ABC782@OSCPR01MB15019.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <OSCPR01MB15019FDE88A442FBC74081EAABC782@OSCPR01MB15019.jpnprd01.prod.outlook.com>
References: <OSCPR01MB15019FDE88A442FBC74081EAABC782@OSCPR01MB15019.jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To OSCPR01MB15019.jpnprd01.prod.outlook.com
 (2603:1096:604:3ab::14)
X-Microsoft-Original-Message-ID: <20261120044057.1841-2-yangshiji66@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSCPR01MB15019:EE_|TY4PR01MB17473:EE_
X-MS-Office365-Filtering-Correlation-Id: dafc7642-fd83-4e52-c037-08df46c09497
X-MS-Exchange-SLBlob-MailProps: dx7TrgQSB6cUe9t9Fs5HiQGsDL5YS4QsPu0JFnyBXKIjiX78Fbkh3kToagDhzxDW0LiCI46Lujbd9fd+8N+ButzO79RQC4TeLK+qllx9ng4rH/x9XEIrJ6IeYOZb8FAVfZ6un40VIb3/LyTXl26sYltx6ziDDbTNMw20ZvM4eOfKR47wcW9tXSOPXlw8fXSf0uOxhmmKZFySfe1l90hbdIhP2LA6zp8L45FUuHNTInDLGKEqVOJfWcHPCJvb3/sJISN4Cfa/R6hoI8meEbVfKP5oOdh3GWlSKSpwsZigkTrZbuq4vSggMRx7FUGcDIon8VI3qmBUbRuXqQuP8stdj4YVGF8a7GIA7usLfq4bd/vYPnsf/DbzjxvVDa0XHUooaWEJYB5GXOLwOFpmV9tgo7lUakCqfD4dMDHd4uiRRveO7okTZK3O8eO9g+qBoM4bPoQXUjtYUgXG1TY6HLqJowN2HmkkYYsT/LYM7UK+DtDkyPHDzWPQqM4/Y4trt8YCg6eBCI08tTlEaVQBOnBvVhR4XCQEGHASL0Nis6dP0139DBm59537YHGXi4ovU6FIALSJ6twSKaeB6mKxWxiyb+SE3XZL9OhGz8r1NKiRBhvGepJgGDvh3D3f+1pkvnMRKU3lGta3ZXCY5z5OoCFcyWRDn/URtvS2I4PVl1vDBoZiVQBWjlb+b/7Vf3nuND9iDmQr7S0QgTQHo0dE2p9dp3bF5QU+c1IMhJnka4D12r7Esu0BjnM1bubWhCtCICh4lBP20WkETf0=
X-Microsoft-Antispam: BCL:0;ARA:14566002|260925184616899003|4140399003|25010399006|19110799012|24021099003|23021999003|8060799015|24121999003|15080799012|22091999003|5072599009|41001999006|40105399003|52005399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fGAa9ijuKu6/7Ye0BqlqV0oKkByJQFo0eiO2FQylp1cXCbZLedJQHhSJfs/5?=
 =?us-ascii?Q?6Q+cxGEfJWE7mJuqMRpfNG7mJ13OpZu7/N8qn+so/bIca5DqEj6GcEZV4fYQ?=
 =?us-ascii?Q?BSqnA7ltbWp1zh2OEhTFGIea5Mfze07FhDlN2J3o2l9Najd3n3FfOhf6sqXI?=
 =?us-ascii?Q?LwzCbmJ1eekbV7TlLFE5mO71t9RZ6AUIJZNHLPxtbqKga2/Yk2BOstOpo/8M?=
 =?us-ascii?Q?HYzimR/fovzdZ+3gYuBohJ2LPSOfEfGAhhL0WcB+Y+J6FZZRhlzLW9ikVlkk?=
 =?us-ascii?Q?dqInMH5MXV4EB678tiRhjMTplWiaDW+4/lGQnKsMwuJC0CHGDWfKJby8pYmk?=
 =?us-ascii?Q?7ZDQU8pf08EBLj33umH71QAK4gnkx9Xr/U1hsl7lnYYVDlUcAv4oxGK7vCmw?=
 =?us-ascii?Q?2vM4VSImegjD/z1dyMwk5i2MpHDB9BHCpW+Ec6oEht4kBoc3RhvPs69aJSM4?=
 =?us-ascii?Q?ruD91ZlaO4bg5WFzQUOtENKuirYJZI32XEMKnmhKetCeK9hwCiNfii+YuF5N?=
 =?us-ascii?Q?0dPpU3QHoTE3H8iJFjQlV6+IYObaxMCzEWeQgEB7B3rSF5CFG+0i+XKazdvg?=
 =?us-ascii?Q?M/i9Ii3tcwxlUEBRsB77WtM8zTnTVnzA8CSiDnOPLxz71C9Xd79Xtea/Te24?=
 =?us-ascii?Q?EyhBDhATc0zqKxwTjq/JqIxpkR3jd0gqU+GT8FtuFWRLBYXXkzFNhnrAqeUr?=
 =?us-ascii?Q?UxmCAC88MjsF66VTKgOIh0N0VaRSuQf/CECFnGKbPEqgmYWvNCK1UyNaVzrX?=
 =?us-ascii?Q?Mn10ACikYAX+KUQQTprfybgZq51Ww4wpuvkZdY2+Tb0Nx03puPvkLDuETTv/?=
 =?us-ascii?Q?8Rpl8hurWDvfHRGTYCknLkfaPmPGL8HcYHN3PCAyE6GtB43J7ba2QQDgTDis?=
 =?us-ascii?Q?02WHsEei6Kt+T4HPawSil6R/BLc55gp9OqYowxBuc3Ylhe8Jtxfbv9iii62N?=
 =?us-ascii?Q?RHuzRN9eyYqAolB6JmD8eOjerS0bwgQ7vngA0uGzdf2h86tANldYMn8xud6n?=
 =?us-ascii?Q?uwFOP4h80zRpRw8O/B8gAqW1Bqx8Aurajzw8PDcgOb7kBRQV7iBnlRJksqbI?=
 =?us-ascii?Q?yG1ELu2u?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fstn5WEkj/R2vmRMW/54yXCLXwDSH+C6KOFABXcTpH9O1VJRowbS6vJcKSYq?=
 =?us-ascii?Q?I9Aa47buqtwZoHFvS78y7QmBPK2TbQF1w447oVobsN+cuwm2goHmLR0xuAq9?=
 =?us-ascii?Q?XM9rS7w5ACovObaEeGdhI3crKnm+ZrQzouXmKgUnexq7r03rbuJNk12nR0ew?=
 =?us-ascii?Q?BCGZiOgiylm16ZV63lBfWrgbolj7Nz3YAVCiT+C1HGKYjuDLU8FumS/QHQdU?=
 =?us-ascii?Q?vNPj+40K26Ecu1xmVAfvuS4xiGcGIrKHNN6oIfY+NSg0EV/SanMPjJ0ELfCD?=
 =?us-ascii?Q?9QSrMQkPez5yoomIUkBCH4Pb55MtW2CaoRQM8a37/bFAENRtP7hchOvNY6hg?=
 =?us-ascii?Q?S2q8foqK7QXU1NW85E9s5e5wco769Bf11hD0D6cUKWXKFfgzNOesYHpPHkxY?=
 =?us-ascii?Q?LhiORy88s4j3gtaEwvTXHEY4TLtbTIfDzC6XkR1JyCLPTGWT5xkxg4+5clNW?=
 =?us-ascii?Q?4tO2Uo8wc7jU3fZM4+Ucazwwziwey0/ZhQnPR1QSFLhjVXCPh0GYMAyq8Z7u?=
 =?us-ascii?Q?pve0xdaWx+YmygmUpU/Fn6wYXTotdwblPFu9xV68OE/XkkzbtbGghchG9k1P?=
 =?us-ascii?Q?mTiJeVFhHZEJpGC4hV04WlE0XoWGoXiwhQ/q2ocDhUfQKZk6DI9yhl0KCV9v?=
 =?us-ascii?Q?IZz4ZreVjiuRHTIw918tzeto6p6JBtqve8PxvAAJckqHPsbe+IEgUMUt7Q2O?=
 =?us-ascii?Q?6T5Hqt8CzNKsyIiJGRvZhlbVsXRVjJ8dshNN6xpeT4GlDWj2SDC6ulJzDMx9?=
 =?us-ascii?Q?lO2WmSc0edUtiHnFsImTauxpLBMCzPKXIj1ST5TfEj3fm4B4wWdGaNCqFUYe?=
 =?us-ascii?Q?D7q4RELm0dCGEh9OUwt8XdxnjW0x67osRLCPNgVvJRGPhKhi6Q1RwLYuwXw+?=
 =?us-ascii?Q?D1XJPRx45725K4bIW5nwzRMPqtPX9Fq2Os33PpuKt5wl/eHSbbQS9hEpAxqv?=
 =?us-ascii?Q?bOqfTsp6Ec7L3sdknhQJNVZIT/yJoPhTb0iaJH43rd8a5SCm/H6lSB2kknM7?=
 =?us-ascii?Q?USINLgrRxpMW3Sy/Hyh3v12M3tNBCoADe/oPY/S46TYdhrQvfZKT3Wc+6nZt?=
 =?us-ascii?Q?wSxmxHY3sEGEib4W7/OlOs+EWzvlopPR3Bx+MhU2Ow3DV7nYZogZNgYd5PPg?=
 =?us-ascii?Q?is8UYsHWU1+BAC2Y7A6F6gstfifxKCLF5hgdAEahut2F3W0p6UEHbqVc7HqN?=
 =?us-ascii?Q?FgMXk+P4MbcVo57jhYFAGkyp6kQgusaHdgBhflbAFOkwuJs0mFjZWmkCW2a8?=
 =?us-ascii?Q?AksFCqo5gwy4iqJVdlAsZ6xj52iGSvR/u/M/EUsQXcQSQHYEKnxg48Gt2zTj?=
 =?us-ascii?Q?R6Bo1lQeuIgENiAkSOU8robP7pL9QXnERl5MoiCDcGuBugjtVA9PgfUwmaa0?=
 =?us-ascii?Q?kpxAECYZaWFq1ROYRTa/RXQAAA11?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafc7642-fd83-4e52-c037-08df46c09497
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB15019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 04:41:45.4647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17473
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_204152_736271_D19251F8 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When mac80211 sets the power to 0, it does not make sense to change
the tx power to the maximum value. The original purpose should be to
limit the tx power to not exceed the hardware limit.

Fixes: 8225816d2974 ("mt76: mt7921: limit txpower according to userlevel power")
Cc: stable@vger.kernel.org
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2ac3b757942e..931dc550c47e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3035,12 +3035,9 @@ s8 mt76_connac_get_rate_power_limit(struct mt76_phy *phy,
 				    struct mt76_power_limits *limits)
 {
 	s8 reg_power, sar_power;
-	int tx_power;
-
-	tx_power = 2 * phy->hw->conf.power_level;
-	if (!tx_power)
-		tx_power = 127;
+	int tx_power = phy->hw->conf.power_level * 2;
 
+	tx_power = min_t(int, tx_power, is_connac2(phy->dev) ? 127 : 63);
 	reg_power = mt76_connac_get_ch_power(phy, chan, tx_power);
 	sar_power = mt76_get_sar_power(phy, chan, reg_power);
 	return mt76_get_rate_power_limits(phy, chan, limits, sar_power);
-- 
2.53.0


