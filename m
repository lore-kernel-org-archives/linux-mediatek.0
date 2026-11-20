Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9A3606A325
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 04:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D8zamDUQ;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=OrU4uulI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tFpneUizoP2k6EcNeWgw19+Hao6mDA67IHJ46MPsbIE=; b=D8zamDUQWOMPAGL1NGVz5/JFQp
	zffGmKEqFypvloNtHct0sV2u5grbb98KpiR0Mx5i0N2VTAjsShHbv5tuf+6VwhlgY9UgVCDkk3fww
	2xWYWU8Izo8VfnnB6RsujQOr8edXTr0koS3jFIa+79DjlA6o4P1XwlnXYC+Ocn/aj+3i9ja1hQEIn
	NEXTVQm3yqQt7G60Hr1LVC3z+8RXk1w0wyocKUOTIdrOB4uJm8/r4rV+LewUEPrpFlYuy5zmjgZT2
	+hHKTioNplv+MjbiuYJxvg2umJdxFisCDLz9ihnvtqGBmJzvxKiZIN/FtqhKj1hyqunGUumjJ9/WO
	wqb8fo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGRd-0000000E2TW-3P80;
	Fri, 20 Nov 2026 04:41:53 +0000
Received: from mail-japanwestazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d406::] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGRb-0000000E2Sj-0IKm;
	Fri, 20 Nov 2026 04:41:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nje2Nhm5R7fEQOc9zHvy7Y807h9kbn5t8OSRg/DDWxmZjuvL8V0KAQuqGlYyRc/ag/PEXM2gRYfv7TO9BBZ/OtBkOVmP8le8DwWkYgS4ip+dfTDpg41vuk9QpU32tQwLH5+YTmNHbX1Ep0lAiHsr8GAOE6c+jsFIqJePTpf5S6aJ0bHhecR2O/aL8haIpHVtWvzk+S4OuhPuwwFdhsg7NarBRWzkfxh/UDwAPVIH52oU1ANrnWDge1gLbo5j3jHyOwh+vF+M2yZTAenLclKrsmffNVHpq6S0EHX9TZXKABCFWnbGoRECX066PTiQs+jpuamChDo2b0Wcx0I11R3Qxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFpneUizoP2k6EcNeWgw19+Hao6mDA67IHJ46MPsbIE=;
 b=vyWoqMBsBl0+lQffpgLdX5q3k8mfFCh91uEId8f0AgQNgfpHEIMsbzMvF7zAMu1Cw4Y/9R4+3r87QBHa3EmJV/GPZfKrlkhauIBbMWlE6AJJEVWXh41tHgOll4pA3iTANCOJslzolw+An0mIFkPyTA8YrtvfqDKj7e1FhB292WX2vdgQl9QF5l8H/4LxpsBPQlTP2gdtqLt+3+MEKaKthsHgnJ4gWOPwIkVsH4iwZHwyAFI7IVY1Fa94qwAHHQ9b1Ie1LYK7TEwZ2pvFZlAzxX1ZoYQLkqfcQg7VzvXDJjZ0v8ZTTrIwG3po9+4WoOO/HQnVgD8u4BdvMHII93/Lhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFpneUizoP2k6EcNeWgw19+Hao6mDA67IHJ46MPsbIE=;
 b=OrU4uulId0qSKbtfp9AiwV1ghlj0MFma5cS7E6QK9MH62vzMa6ztjvLU3c7t+7VBCx4V84CAdjzwNoS9RTvrPzM/s1crq8qNkz3XUPZHoU1Op8WYHMRehgUFtsIt0oy16MEIj3Q/w3a4Ufyyr+8cgTL2SqqhrQSmdCzBLYOuYBarMC3etDMKnHxYUmHQwFvlx/4YRgoD1YuWW26bjEd/XexuiN8ts9bmUpuKqbn43T1nJ/H/kyGt+a/5M+xrkshHYATpCNquFVpJoz4Jt2GYjDfXbhsqY9yJcIhbrZVTsLuxQXHIZg85tVS44tYvnyTkiNoASxDx1YQ8LxMtzZpI1g==
Received: from OSCPR01MB15019.jpnprd01.prod.outlook.com
 (2603:1096:604:3ab::14) by TY4PR01MB17473.jpnprd01.prod.outlook.com
 (2603:1096:405:354::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 04:41:40 +0000
Received: from OSCPR01MB15019.jpnprd01.prod.outlook.com
 ([fe80::d06:4844:6b2f:9fa2]) by OSCPR01MB15019.jpnprd01.prod.outlook.com
 ([fe80::d06:4844:6b2f:9fa2%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 04:41:40 +0000
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
Subject: [PATCH 1/2] wifi: mt76: connac: remove useless tx_power calculation
Date: Fri, 20 Nov 2026 12:40:56 +0800
Message-ID: <OSCPR01MB15019FDE88A442FBC74081EAABC782@OSCPR01MB15019.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR03CA0006.apcprd03.prod.outlook.com
 (2603:1096:4:297::8) To OSCPR01MB15019.jpnprd01.prod.outlook.com
 (2603:1096:604:3ab::14)
X-Microsoft-Original-Message-ID: <20261120044057.1841-1-yangshiji66@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSCPR01MB15019:EE_|TY4PR01MB17473:EE_
X-MS-Office365-Filtering-Correlation-Id: d8a277c0-a3ff-4f56-ab01-08df46c091c6
X-MS-Exchange-SLBlob-MailProps: 9IecXKUgicApcBHgIkF1u3SRiU/lhwt0qjlkpM1S6fyiBGePPMgX6zTxLwoiXaM+BZR8AuNsP8ULe1kkVOcTGnCEFwDBx3ZMD3LCgnRlT21PXnGP30o4/KX4kfHlCdg28vKbv/pOAFi6dSLbtn1gWVdNfCr/JunkVenjwhNxjADqGRkopvcVv9cIBAlt2EpRA4Kf+tQIG61463B6ecVHn2rUxA4lxRA2qjZjWplPNPhWSh4BN0Upd0bo/i09Iuz9nwBVu/qzdcXPZJ1ZS9aBMK4g9resTzq8mohA2tZuvtHSEWDMEGU3A2jwQ/py+XOXwrNlKEWNsghOwGKMioKVa/xsbWPA3XulauLsaokQk7rJRnDKgiZGM9O5fzlLoWObNjahCs1MEw3+lCRDY7i5e5zouCbXwDueB0qIWn6NgMcMg5YhPwhoZK0QQRTx8pbeJ5ePd/oLvL6jFTeboKGKpUVA9sdzddcqRpm88y3AImgyvJ6YsUTImRajpYwGobc/85u6rKJrxH0UMhmMEtvMZM8NSfHNdhugZySbSrkKAajhHYpKcprPvX6VLMl6NXs4RPYhcRba2E4Yocb7s+vCq2zmJp9bqJCEx8bI7DTqezUFbnDClnoaPu2kW8W2+kvmoZeNY9QgwvXpLIET3AgR7ZhzVsfGq/GV9xxa58s89ymyCBu4Gx28QSky3MHB9kdlKy4paeU4HBF0V+Dn1CX1qok3NDsI2CYXZwKo0JWb4RWA5HFWndAiTA==
X-Microsoft-Antispam: BCL:0;ARA:14566002|260925184616899003|4140399003|25010399006|19110799012|24021099003|23021999003|8060799015|24121999003|15080799012|5062599005|22091999003|5072599009|41001999006|40105399003|52005399003|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5iDUPuJFmLxVGANob88wrslzERJGCzmIl3DK2PdtT+EHuHZ1CgZSM5Z+hs3U?=
 =?us-ascii?Q?NhVazUkKEr763RaiQnaOJA8I3Fk6dD+srd6Ekyfo8gCDPFV0Jm7W7icyIPpk?=
 =?us-ascii?Q?8zYnykd7tKRuUasZ/BTd2XZAEkFNE6EzTleRTHjaQ2q/gV7YvzlILy7KZ5WZ?=
 =?us-ascii?Q?gpzesXYFID8xzjQw2ml538BXyMBTebNj1WPI5EtcWTRq1YawCs9YKYuiHHdr?=
 =?us-ascii?Q?i9wH+N4cC98DCVnFlJmOPyRU7SuBBkN3bmR/rNwVKR1FB8YY40ho0NSFGdI5?=
 =?us-ascii?Q?Fyh5gZov1zVsuF0totllJ2umN1pDE8/+1qbGvSn+yvKPFEIRmG1rAe9PpoMp?=
 =?us-ascii?Q?/++IIs6qSMat+NhoULoDs9VKADqYV0BtpePihgK14wamWj3fPK7zH8Q7A4DD?=
 =?us-ascii?Q?OLVXtz29+ZduicXWU/JbezTW7GSxH+U4XT76IV6vrAm0Uf9g/+7myaeyoNHA?=
 =?us-ascii?Q?z3hJYy0nemprQO05ePKeyxawJELS/E68svkgWY4FD2UcuWwGIcF44dOmlqVq?=
 =?us-ascii?Q?01Itic9xwESVYmKkisuyYsSTZLT8PhpotFg58hVSwhhMUidkeCI4xP3OBrv9?=
 =?us-ascii?Q?V7Xx18vAPhmrOnb9xppcKL+/69SpHckOLdE/arHMDhmYJTrqT3Szdqy2LKHH?=
 =?us-ascii?Q?VCifSaj8eHbKq8Pi4IFXoGQx7jRvkGEqLDDpUK2RhskbJmY+Efr62NlgOtLQ?=
 =?us-ascii?Q?AIhBfB504xOWRkMDKCR1VaxrfiZ3aXMO925IQrhfkZ0icOpkgHgBTZTPbupQ?=
 =?us-ascii?Q?ZxNnz9fRJWEWmnSXC8PTN6o/q+J1+Oyo3GW7D7joaXlKgQ9L4OsSvkGuWks9?=
 =?us-ascii?Q?nm5Nuh/bEfHWu9ru/HU2lo0cvwI1HSyCoMVhK6jcxLRMNt1UFoAkSKnmeKGP?=
 =?us-ascii?Q?S9X6S3zsF3CddlHPrWJUUMzyK1dQwjcahYHmY+sTDnwGOao4YZNHTp9QZMUt?=
 =?us-ascii?Q?DKXTYnA67lr0dxiKojW/BHHZSYRHTsIvOz8dxzghGAppq5ky0W5Ue3AZpaId?=
 =?us-ascii?Q?0R8F6+oYRPExofgDNPmhxrMzU6dwIH/sgrhFlySe4gsQZzW8Ct53ZDhwvLkL?=
 =?us-ascii?Q?NEg3BwrGPLBidlyshoviJBi/r53waQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cGOPUwAqlOzpjC0IXwQVfS68SOb4yH21QBNRk14ON/mNiQg8ovmi2MXFSUVx?=
 =?us-ascii?Q?82g5h0wN8Qsn+/ldkiqCHpTgze6QCfC2LyLFslyHVkJ9RDV0NXZp5yNC6DgC?=
 =?us-ascii?Q?FabeftESm86EQUB8qz9xI5klZ6DE2OLYPbAQLf7mKtpyghYLHXGxnM8Z3ZQE?=
 =?us-ascii?Q?yriV27C6y8oayHSB4TMZUH3l1HUxwFkvWQBzIczWSsU9C5sCDSWDxFJHi/HJ?=
 =?us-ascii?Q?Gu2YWCKex+97w7FmNxhda2MdF29PXouTFCL/9WGysn3CVh//uAhHzkLIrjNa?=
 =?us-ascii?Q?tcwWHyVfaAjcA8hv7qRswHMtw9+jR4CjOXbMR7IqVBJxDZ7dqvs6+q2NDH96?=
 =?us-ascii?Q?KQEXLrPbAWeBCQSz4qNjWA0qavrFxwCY8jW7bYtafNGn51KMaJfVWZGUpMzX?=
 =?us-ascii?Q?D0q2fzVBFYzX6M5H58S/6LSiGl5MpIIHN0r24W55dFiBfU6xPhCu+7dElnyr?=
 =?us-ascii?Q?fGee3rlwWSD+NtU/2qJKYt0glGFK8YYCfTPsfWBAi5g0eg7UKytP0gjKkdlP?=
 =?us-ascii?Q?/uvpQnMU/KA1DOtmjAYbnidwcD7XvAVgFq9N3oi+n+cKYgpXY4bbFTB5dlf3?=
 =?us-ascii?Q?BSk9LuC5g1NPCIrlGGasdi41dhU8JPoi4Wj6u370aa1pl6olly/Ju4rIGMDM?=
 =?us-ascii?Q?qeGWHXqOEZBaS0YyBZTGkeyzCSD+loGsZ/QyBUJOJq0r87tb8FD4i9LCfxlj?=
 =?us-ascii?Q?WKzzXDh+S16sWJZFNhk2aQjpgU+8SV78AM3XkfhlOiy0k7nLNE0cA2wCiKFw?=
 =?us-ascii?Q?KTU6OCZ7dAg8XBlnXNWH5wVzQ7hNbZTRN29kgbd35oLUpBV/KYuZJqd+lzR/?=
 =?us-ascii?Q?JaFITHy8Ul7v9dNvPpk+094K+oPROXm1S3t1yqFXvY2qQqUIk2K8PGIImWpi?=
 =?us-ascii?Q?+bYMDAMuVVxjGn893ePtnXs9xcHXSJSbJb5UDiFfPgTgf1Vx+QF/Z/HIzVF4?=
 =?us-ascii?Q?Q6iX608Z260rOdZI4Mdcfg/SHxTZMC/ks571SgUYCIJ0V103uzNwkeuIr8QR?=
 =?us-ascii?Q?fOalZyTH+USoWrG6D2lP/hzV6izMa+NThDvRH6UyOfQVeqkvaNpsoSctzsD3?=
 =?us-ascii?Q?OQtseDJEqCCQ0R+DU+4MZ2mmzFDUtelaS2AoSCBJc9Pl0NsWRcVO6y8XAjiW?=
 =?us-ascii?Q?kIcuAP8K58LZW23j0gbu/3r3lOEtD6Y7mJKbN+1VSONkMWq4o7FDJDngK2Qp?=
 =?us-ascii?Q?7HtvBN81fPBPdKPkuSWg1HH3t/HFCU1WsmLc8jR/m3A1B1cELldppcizysD0?=
 =?us-ascii?Q?V4Dblm2GpGYHyMMvOMoYVPIxPnyCRhI1BhjLR18Yfw2xLG0h0IS+cOinPtWb?=
 =?us-ascii?Q?QKjIaCg3njXj3wwOHs9sx0BSvCdsqUdSEXqI4XchHzShVcFOlH48VDYI16v9?=
 =?us-ascii?Q?cl3/rYxOYttO3WK0IEE0yTtPyrQx?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8a277c0-a3ff-4f56-ab01-08df46c091c6
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB15019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 04:41:40.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB17473
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_204151_109380_269C6986 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The variable tx_power was calculated but never used.

Fixes: 317bc1a0590e ("wifi: mt76: connac: factor out rate power limit calculation")
Cc: stable@vger.kernel.org
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2f925d22b9aa..2ac3b757942e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -2225,7 +2225,7 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 		209, 211, 213, 215, 217, 219, 221,
 		225, 227, 229, 233
 	};
-	int i, n_chan, batch_size, idx = 0, tx_power, last_ch, err = 0;
+	int i, n_chan, batch_size, idx = 0, last_ch, err = 0;
 	struct mt76_connac_sku_tlv sku_tlbv;
 	struct mt76_power_limits *limits;
 	const u8 *ch_list;
@@ -2235,9 +2235,6 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 		return -ENOMEM;
 
 	sku_len = is_connac2(dev) ? sizeof(sku_tlbv) : sizeof(sku_tlbv) - 92;
-	tx_power = 2 * phy->hw->conf.power_level;
-	if (!tx_power)
-		tx_power = 127;
 
 	if (band == NL80211_BAND_2GHZ) {
 		n_chan = ARRAY_SIZE(chan_list_2ghz);
-- 
2.53.0


