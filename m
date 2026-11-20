Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B361606A331
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 04:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qyaWOIB5;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=iOKJLGRM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OOOIpm5ozwa0+odOudtoeZ1Hcuxpdb+FHu4DsIuK8mE=; b=qyaWOIB5fYLeFGPPlIIJSRbnRQ
	noUfZtVPqTx5bemfdwRe1fNcwi/rcMvxJWozfzTsBiUzJbaRBEsnI34TO1999Kp2zvXrsg9JVdpKc
	LobY+rmUqfF/LPVwvNVs0g6Ff+XhuHTQkdufidAaz+KUyVUicgVwHcIBc+PiJvZ/KOIS+QDLLvqVK
	qC40+1VxUKkqzhIonpCQreLSqSNUilwWYcC99vu8KSYhAJHDDOcZ5NeMBuZjIAWHHmW8W83hOSshs
	egwQNKDeCh3mBIzUQ4ISCbr210Ma8NGRTpR1X/XIby9EZf+vRce7/kOqF79z3Dm0BegyoCjamghny
	ZyyyOQDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGO5-0000000E2KW-11VB;
	Fri, 20 Nov 2026 04:38:13 +0000
Received: from mail-japanwestazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d406::] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUGO2-0000000E2Jj-1z8O;
	Fri, 20 Nov 2026 04:38:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+ADtDyAOfQytsvE5z4dIv5mFQKwz/Q3fz7l0CanZan3Rm5kdLGo748FsTXBlAn1P4CCt5axUfy/EtZmecZGgCbmhjOTnUXkf+TQ5ibevhcaeKaPtHC5tjSigOSp0ETfdMV+ovzqD+/NoO6I3L5iyOBRpAoLHdZuoUKgsw0fO2Ika4DdInXWNwLTOLNNg6yPhHipW/9qUFrbToib4juwBTHbOWYTwVGxEchHN/dKkGSB0643k4GT8dnGuQqtKC6hADMqPShUQi1XwGlmHwDJCAS0e2YVtApIO8cI0jD1r+LSfbFKTkEwxuVG9K1Iy6QRTn+grvjRHbzjvV08uhu5aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOOIpm5ozwa0+odOudtoeZ1Hcuxpdb+FHu4DsIuK8mE=;
 b=tnS1uEr7jf1zMc677YQg4yJFYyn5fngaCMO9NJUTfILIAn8778GHYTikNQua6I7tPYa9Df6nVqGm2XkQCfN38xDezceZu3jWroq1h7QOx3oTB5696nUbpWfFzLguqsyLpEv8axQBtSMpP0wvujF2/shTxKsXywf34Vowf6T4OH49vamC4tKcSrl3gUYTqt5+eR3hxhcdYWQETOcnYnXDqmdVZU/aOWmDwsX3x0+JPFSgt0/tg8naDhrgErXxD5L2SsC7N/221e/f3GaFk9mwIXtaqvr5sOvNUxlvNmGaNkqxTwlbIvzfECiq9rj2KziTvj65tjI+7Hsg28qsf4MVBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOOIpm5ozwa0+odOudtoeZ1Hcuxpdb+FHu4DsIuK8mE=;
 b=iOKJLGRMRBxDpeYwQ+/Lb55uYuusJjT3yyb0JSPB4lOXFI8Oepllr3KQp75WQbEZRWf3wBlaZx7HgpUzDdrH0xE3m2lge3HYVQsS3/MGLApyLJANt7kdTozvgaBYQIfaN+cJh49nUwoWVvwjd0MD7RPP1lAyB/dTir2mGL+W4DCURyKy6fC//whzY9jb+FguTfiAuJh0xcV19joLG58H7SL0xECsAlM3hqMP/4E/GQj3J9Iw2fdxPFzrwMMoE9Wu9yO7O0jMaOjGh9ze5Oz6WE/Yosl8GtLhWmMRgrtDygdotSfALLeFp3eK+TmZao0RUQwDYLyQ3yYi/nxr5VGMSA==
Received: from OSCPR01MB15019.jpnprd01.prod.outlook.com
 (2603:1096:604:3ab::14) by OS3PR01MB8586.jpnprd01.prod.outlook.com
 (2603:1096:604:19d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 04:37:57 +0000
Received: from OSCPR01MB15019.jpnprd01.prod.outlook.com
 ([fe80::d06:4844:6b2f:9fa2]) by OSCPR01MB15019.jpnprd01.prod.outlook.com
 ([fe80::d06:4844:6b2f:9fa2%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 04:37:57 +0000
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: simplify power calculation for mt7603 and mt7615
Date: Fri, 20 Nov 2026 12:37:27 +0800
Message-ID: <OSCPR01MB1501903E2E380B1E9D1B5CD56BC782@OSCPR01MB15019.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To OSCPR01MB15019.jpnprd01.prod.outlook.com
 (2603:1096:604:3ab::14)
X-Microsoft-Original-Message-ID: <20261120043728.711-1-yangshiji66@outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSCPR01MB15019:EE_|OS3PR01MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3ee0c2-35be-4a1b-0d81-08df46c00ce0
X-MS-Exchange-SLBlob-MailProps: dx7TrgQSB6cUe9t9Fs5HiQGsDL5YS4QszQuhS+QOn0viA4x1VlGsdlUonrWSHsLert3ibLrEU23mAN/7sggLNnm46C6UyMHbxUPDyg9G+3K4iEIbC0PpE0JBXOHMPYJJh6giki2ah3pXVFqQ2MIVr2NIKY+5DYsBAM0W67L65gJt4t28zOGQUrpdwtmAEmE+OIhr7YNkSHeee+uoSSPAcZW7vbCad/wSVYn4P0rA1LoOaBqUrgEom9Og58JdQXgeNyJ5vzuM6Yr4vcPmQL2KaED16oSPDH36xVX/7SlT1qj/lflOjfCzI5HxU9Jc3YlSIBmtWZ6HOpyFdA8HE8ACo7ZCpVHRb7sBtGwfsT8OJlNqjDznVnjVvDIsGOKvjnGUO2WMH0xOpnH2By8/YpBSIuxsmnUCqYDVbfdacwon/v2U/X9piYKyuJIhZW8aptTitt2zt74m8Slc1hDe9RpgkDM+IJ1Gm3aweeO3GF8jDoOkv9MQkLpwu338TLyh2p0VU69P7HtpkPpb53r5iiUK+KnUmXTkunb7s23yfnsZZZwnDOVcZH0SMmIaEtVS7SUPb8hpwBzs/sHYI5+BdsW8WeXGb7j+zkjm/xcIBnGYLUueVMNYl/eF2hwGhgpeBluhYye69wL8srppdB3XEDL+yv6CgXV6hgEdTQbfRvpnw7TDcMjmb+9y67s+HH0jiAaOmUXAuDpzJIUvSH+cKZ2tNprZEUJNEfPdFHXuEtZHcg6U9a0etZ79f/G+cgQ+d9pQDWig32rmqR0=
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|19110799012|260925184616899003|24121999003|5072599009|25010399006|4140399003|22091999003|24021099003|23021999003|5062599005|15080799012|40105399003|52005399003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rtWPmp/yJfamElciCQOyIdEQEzkQC8fSDvqzbJXPGEfvAhTwF+B48oJjSA43?=
 =?us-ascii?Q?tZ7la99Kch0grIx/1QO4qiSPVosSlTQgVXdExWhf7HK3/uqvACG6D8tdVV0g?=
 =?us-ascii?Q?Eak8hnj+XEZVW5+eU5MOFXRZUTSvVR6jhm3kZbp1cGdRSzuS7nueuIjRgnKb?=
 =?us-ascii?Q?3KIBaO/ZmD9YYENM/jyN1F8WLN2tMstDtuTe+Y7SlHJ84jcSDbsFJIFhweu6?=
 =?us-ascii?Q?QelFvaHqCq+9n2/UgoWoxceE65qHK1IlbHuJUp/Z3ImYqU/E2gtYvKlFPeTJ?=
 =?us-ascii?Q?OFFoe22biTV8rmCGsRpv/wsap9g3I3WQ4CziWbknx9mqvkuYzzK63KPVaWcH?=
 =?us-ascii?Q?BEb6draZThSQoV/34juWNjyu2cfonIW8cN531Czo4yM9NleI8MMzpbSEdwZA?=
 =?us-ascii?Q?HO0o/Jo+JueFnHuS86ReWyq95djSEOH+RfZs746LPihYZ7sO82ArpL5W5PU0?=
 =?us-ascii?Q?hwXuykFCpdkGohMLL7X7t4qsO9hyHG0mIgkEk3fRyL/GcsJ1CwFYTDiQCZPZ?=
 =?us-ascii?Q?2VzP8Jsec6HCVaS2ULzZ5UtqNY1dUkvVxOUvplnDrZQQcjbBlpn+NVfIHdlL?=
 =?us-ascii?Q?xx/gwjZJHoiRQOEv9+uwTdFuUcc7G/tXaDOUaUzsvMUWM7iL6FG1Fs02bwTN?=
 =?us-ascii?Q?4fCDz18Dq8UZoCCald8z22o34bC6VDmDGFpaDlX7hvvkJOHyqSmQkCv99MuU?=
 =?us-ascii?Q?41Dl2+EI/einjE6JH27ytOFb1PnMcztaNiV7fbjJAaJk7/gK2uUsT2CHzpJC?=
 =?us-ascii?Q?oPMXvfdZ+UJC9rzXDc6eis94tFi6cYzIKh8PGgJMn/8HmLTE66iA3mMdL4BP?=
 =?us-ascii?Q?K6hOP9uxOCYz7tQvfkiLDxpaGuDmxflMZcTPUUyPt9PSwwkvToNjeTZhZdvb?=
 =?us-ascii?Q?PYBSTd5Fm1UWVe9hXCq4TzSwhmUFsAPr3A2zld4xVeYu4OfeLQ1w5hETzwH6?=
 =?us-ascii?Q?8HaJko4vOZYY9laLjlzcVA3kOTVNGQ1mzScXf4SkHsJLBpPbJyjlyGHO+qbC?=
 =?us-ascii?Q?BGvTWwn1v2y1NCfWuyMPaf914R+IjQ0EZrVTeeiLU3i28Ik0Evu37VO+SRmY?=
 =?us-ascii?Q?qzh6KpOH?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FTSIWi9SC2D4oNOxSsGfZmAgBtZxxQuYjDfpYRm+5ts2Kpkcff7XgV7edWG0?=
 =?us-ascii?Q?z5qFPm0jJEMCX6ZvME5FQKcHtV3Ze7aSa4FlJ38Y28SmHZ++CM6kZlaI0rst?=
 =?us-ascii?Q?hChNAnteuK3ExqlOpddufS8hlxOodwI/vr/JAyXRw4kcOx4Vr2S8PclGqWXu?=
 =?us-ascii?Q?vOHEixjDwhKv6KADHVqpdOKytc7YVAU1+T+mrlYQpknktm39qNjnQOP8V7sI?=
 =?us-ascii?Q?A193CDZYEtTVXeIr6ehzVaVtnI2r3bDalkt0J+8X1syjaBxl8srW+cHEOKHT?=
 =?us-ascii?Q?J1rXkO0Cfqxzkd6y0bPJG/O4SJ64o2wATfwbCzf//uUOWeZVOGYtcGCc8MAN?=
 =?us-ascii?Q?CS2LlaCTxPB3Q7R1HFlvceXhYj47jhf+3JQSMQnPaQA429WW7dAdWC30Jtqz?=
 =?us-ascii?Q?0yWpfbRyCq+a//lzWgnCUSKGjgI2LfGva5c7huF9p/KVfA3t9pjw4vpkS4GZ?=
 =?us-ascii?Q?zf+CdLNT03cSN+VI2WF8swmAPttHirA9F0URz8UmPz6ZZKJfz6C1O9kQ++z/?=
 =?us-ascii?Q?bz1r6t30J4PWU6DCWgREZYlbKqcL5QQ3EmrRjwcnG+jECtp9D5IFWL6rZAPg?=
 =?us-ascii?Q?fF7RYK2f77qI1O9thoGdE/44mps4NTW4pdoYkFButOAYRD3FVdUBMQDrmi4/?=
 =?us-ascii?Q?yXC4Vlez1/zjJr6LTrvFVT30Qggbqb4Wr8vz3DzzboAoNmQiYFvKVAPGPF1Z?=
 =?us-ascii?Q?oOTqGVZgs4Yt9n749VtKhj8PXyv43aeBz/sVGQhW4rmAEGP8t5dYg5L4GRHG?=
 =?us-ascii?Q?FIcLzTzNXtFjDJvweH+QxBAQYZdWlUVtUsLXqfPul4wQV5KWcVO92QOXAtIq?=
 =?us-ascii?Q?7xhfEj2AeD5Q8k3eUJzA3D8VgJ/BK/fRdnGwmmy0Dh+oTvs+Amq/UhoPE3Sn?=
 =?us-ascii?Q?pasrwRMY1M084rhhK7iOTLRrepnRfSPzKDmjsCtgaH7dS1NJuihnK4ygRxNP?=
 =?us-ascii?Q?D489gvnIUniDQyRLRaNHp47ojF3D1rbXBRt0qw15texdAPWdFFue+LpqU5Yx?=
 =?us-ascii?Q?dLpXGd1gunVa8Jod1cIM3Z7/k/I70LnJNWEtZGsl29wCX39wrO4x9d3553jQ?=
 =?us-ascii?Q?EZuleAygvXGW5Lnl95ezPTgzLkUttvorl94ZRiU2bgVa3r353RuZiDRG7X9z?=
 =?us-ascii?Q?MXpGiu/jVQm54QI2PV2nP3Tcp9YLiehHqv3zACVU/c9d9i1kODXlIeSBN/Be?=
 =?us-ascii?Q?o83cgjtb2HFBMV3LzlErEVgDec3BXHrFE1ywRvoLfuh1i4FZ5euCv/9Rxn8x?=
 =?us-ascii?Q?frbeenavsMeXUIa4llHRcht/fHJthq6NlNDK3YxKsM2XmyDsDzsIpPlyXUK0?=
 =?us-ascii?Q?H2o0p6XTowtbXF0/SUBTR5YoAcG7J0DyqMuynq42hcQS70/Hwg8IXbwHxAA5?=
 =?us-ascii?Q?wBVEsO6fcTk9+b9XhHyIeE0JYtk+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3ee0c2-35be-4a1b-0d81-08df46c00ce0
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB15019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 04:37:57.6414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8586
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_203810_523659_71293709 
X-CRM114-Status: UNSURE (   9.27  )
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

Use the mt76_get_power_bound() helper to simplify the code.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mcu.c | 6 ++----
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
index e432cce97640..e921b4956aad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
@@ -402,8 +402,8 @@ int mt7603_mcu_set_channel(struct mt7603_dev *dev)
 		.tx_streams = n_chains,
 		.rx_streams = n_chains,
 	};
-	s8 tx_power = hw->conf.power_level * 2;
 	int i, ret;
+	s8 tx_power;
 
 	if (dev->mphy.chandef.width == NL80211_CHAN_WIDTH_40) {
 		req.bw = MT_BW_40;
@@ -413,9 +413,7 @@ int mt7603_mcu_set_channel(struct mt7603_dev *dev)
 			req.center_chan -= 2;
 	}
 
-	tx_power = mt76_get_sar_power(&dev->mphy, chandef->chan, tx_power);
-	if (dev->mphy.antenna_mask == 3)
-		tx_power -= 6;
+	tx_power = mt76_get_power_bound(&dev->mphy, hw->conf.power_level);
 	tx_power = min(tx_power, dev->tx_power_limit);
 
 	dev->mphy.txpower_cur = tx_power;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index ff57ede87f71..57d7ec8fa49a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -2011,8 +2011,8 @@ static void mt7615_mcu_set_txpower_sku(struct mt7615_phy *phy, u8 *sku)
 	struct mt76_power_limits limits;
 	s8 *limits_array = (s8 *)&limits;
 	int n_chains = hweight8(mphy->antenna_mask);
-	int tx_power = hw->conf.power_level * 2;
 	int i;
+	s8 tx_power;
 	static const u8 sku_mapping[] = {
 #define SKU_FIELD(_type, _field) \
 		[MT_SKU_##_type] = offsetof(struct mt76_power_limits, _field)
@@ -2068,8 +2068,7 @@ static void mt7615_mcu_set_txpower_sku(struct mt7615_phy *phy, u8 *sku)
 #undef SKU_FIELD
 	};
 
-	tx_power = mt76_get_sar_power(mphy, mphy->chandef.chan, tx_power);
-	tx_power -= mt76_tx_power_path_delta(n_chains);
+	tx_power = mt76_get_power_bound(mphy, hw->conf.power_level);
 	tx_power = mt76_get_rate_power_limits(mphy, mphy->chandef.chan,
 					      &limits, tx_power);
 	mphy->txpower_cur = tx_power;
-- 
2.53.0


