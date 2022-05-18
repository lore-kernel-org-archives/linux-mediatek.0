Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CE3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FzscsGBbecZ12HTEw2GztpWCWDWXN9ZuCDDKvl2X9cs=; b=Wwn1gjZ+XyvHrK
	fSG/U3CNXZPQRFcyWO6/l92kjXJa8JVJoO7meIv7xuMUDN/bWqWxSVno+Y4/LGG4gAt0Au8nJksQd
	rOzLm2HwKt05bOMNI/X2lkKYyXvb1NpvVGMADaMPkmqWdsDB/sz6qAkWnrhv54rjylbeIciWLxtGa
	g4y9a61ZUkbipFzWx62Ba9JLTmlJhPftMYeyxaYTZiMCEk48csJy9JidHgeY1JtsJjgnnct/KGEyE
	Yr0Mjn2Raj5psMRtOM3Lid3fllSRtfW/X3UyD5LDB81pvDfFmZv9WG2GG4IKccfRthsHbiXsb1ghO
	81krTfl3l415smFVP46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrJH4-002CJg-Py; Wed, 18 May 2022 12:59:34 +0000
Received: from mail-tyzapc01on20711.outbound.protection.outlook.com
 ([2a01:111:f403:704b::711]
 helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrJGt-002CGX-A9; Wed, 18 May 2022 12:59:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msQFGqk5fm8b73HydytZTB4TeDkU06/L4DOsL+Rm74D32BIQO8Fyjwuqqwv1LTujOTWBKSeid5jUx948qq8pFcBu3nr2foAun4lBAK9p+k1ARD8Sy+XRyWeaZSNVWxVeYDHX2JwYcnsfjaN9hVMrXbNm1qALkgOuYEXkmlFeBlIUUqnCBcnsuLVaLjweXljcfiDKBa7i+bEbEbiO7jw9AUhz69l4JjljQ3TjOli132Rqjvr/5sb2S2f8a/biFERjWgUWOhgboM0/aErCSxb/X0FD/3T/SRwKfHLTbDkKsPNsWGk2x2G9NldmhpNrMeyJUWVy7NYGgkXmJMmEJxS6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cN+tG7KiWIffiBFA9/zPKliSX4KfaHSClX2aTbie5I=;
 b=gaZWpbr9keaiojicGzaam8HzkqYjDlYbL5uY944AhG/AmO03auQmLy19GnZi4Up0WlXzY5GeGkrA8LWgzXV4wMnEGuMZQRUyejlD33VzflyCXMsPGPoYwJ0b3DnNBgSbBnw9d85rEGBzmHpaw+9oh4rA3mlvZCQejbwqtcH/gQfBcWj4YGW/nTEfIj8DFtokAsrbcU5P1/3GnV2hrrxDGq5Aoh7ptlBd4RVYmLF/hDopdWXRk+4ehulofhNoeMqcv15CYnDcHYXTn47twyg4Rfp/fI9wJZef5XxnMdBKb2M8FHcO6i/z7uW16aLhk7b7zAtf+M3DjWXp5Ir5JJN+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cN+tG7KiWIffiBFA9/zPKliSX4KfaHSClX2aTbie5I=;
 b=C2Fpp1Qt2pgwMURUByOVHOBLqx/b//zidg4al/fJmmrsSHcV/90PV+7pSaZNK86GJnvtkgDEHI/h1RLS6mIxdvA4BKhjMe/3zqWzVJUzJ83plSuKlGJ9/gr6N1D+Abti9XRMNokc2uMmyuQELstzy1sUfSkf+qa32k1Z0b5VpwY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2425.apcprd06.prod.outlook.com (2603:1096:4:d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.17; Wed, 18 May 2022 12:59:14 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::ccb7:f612:80b2:64d5]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::ccb7:f612:80b2:64d5%4]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 12:59:14 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 YC Hung <yc.hung@mediatek.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] ASoC: SOF: mediatek: remove duplicate include in mt8195.c
Date: Wed, 18 May 2022 20:58:57 +0800
Message-Id: <20220518125902.13407-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.36.1
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7dfd6e8-c82d-43b2-ea84-08da38ce351e
X-MS-TrafficTypeDiagnostic: SG2PR06MB2425:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB2425AAC0FFAD767D77F00946ABD19@SG2PR06MB2425.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cXLZXvJ902TBwLDdnn17Rkf4FezaX0iR18DiMGDQ9iHdyWxPIMzjZU8oZ4T3H5vjukp/0qRhpCfK0JUuZVCzshAcuovJ59DplmDYgYX78clXR13z3iqVKKvK51U7MNikA7NO9CEMD5FlHgx3Z0q8oxsf15CJiBt1yF2cJusl8ffc0t5HTHxw94FPI52JOhnuGvw7ftB/yKyhyPw6MGAv7IheaJNi+pYdP2GsnwuWuHjcwNys0gyaWNOH/IaHO5VtElupEWqJiVDfkwbhj7qIKoVKP0W8QrDapSG/PMoN2nDTprT3ztqn3/eFOXtEYbn0AmKgoShA4q8b3PPN8ccUFWgBxbNG5xhw2NUa6WcI41TRA0DHGBl8CUZtkZ0HaUtXlcg/5fvBPf0MU6zQNgbVqOl/oyYnh2R7mkM6PInWz8R24K+bq65GnEewoHnyy1Pn0SLYtz2FBwvPf+GaprDuJOT0WgDCXB0HZCRPrGwWAvnMOdDkq/PZsJgFCjyHz3unG5wHdli1+b/ZitVUDy7SjTYV9ybKABQpnxfe0K+GEPW94mTjNsidATp6ItkWSWgcF8ZANHOvgGpZUSZ8KEhkydFJkmnAqCnIEUxXaRBd7JRP/oYrA4rmOJ9zWfddT0rfVuK2j2YXhf9t9OGasgx03bXLiRL1tch5Lxa/7g5836f2W+AfcwS8+iC9ZAerdNUfJjO/ZYmbHxaLrzgXQ6UcBd1QrY1qcGsCDOQLp2jKep4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(7416002)(83380400001)(316002)(4744005)(66946007)(8676002)(508600001)(36756003)(5660300002)(186003)(66556008)(66476007)(6506007)(38350700002)(921005)(26005)(4326008)(86362001)(6666004)(6512007)(110136005)(52116002)(2906002)(1076003)(2616005)(6486002)(38100700002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MnLzxgCgKKyuBNNl/V0B2JzIrn0CWBD+CpJGNNVUnFvln27H3Lq5LxiD2sT5?=
 =?us-ascii?Q?KPEKMrafSWgS2OiGqEUrX7Xzh7QHPs/VkqAGJt+czQGvnTL5/bFlQwncBSQH?=
 =?us-ascii?Q?PaQ3sYWaG2Z5xgHF0Z6ZJB+oyGufnQ29IVx/j2dEPchmrCaXPKw6yS5OdVxO?=
 =?us-ascii?Q?uCcZGakeJyf3uEz7OHmx9aSGXIPsurOcY7yPcJishJk8P6nfnHBftTIfMYX3?=
 =?us-ascii?Q?88gC5yt2RbI71ZlmrlqOHnAle6bCAkD41aHldzN93MhUobbDqlYmfxPZFHMs?=
 =?us-ascii?Q?KeK/V66g+wUqspYeIFRysodP7MN4oEIglGC0JU+NIFbfB1ADvqAwYWNXXe3g?=
 =?us-ascii?Q?l0ojpQx83XM4PAYIsGrChRmI2UL4vFVaTVJaX0lAd+3xXI8Fji1XQ5pmCBV2?=
 =?us-ascii?Q?KWfyHxQq0sCkFomHmPsfFnmOCf0Z4NePErx+zQNDjKTFuiYM10P8rzVQk30S?=
 =?us-ascii?Q?B68S21jkfw8liWEQm7tLp2rgHj6B82sFNIFsHh5AnPJ7BPJJWyr81XBFzDSk?=
 =?us-ascii?Q?sPdnixie/9gNxKyQ86Z81hsQFUQ2/sxaXMXBlEKwU5Q1CzmGudX34kPxDVN0?=
 =?us-ascii?Q?Jj3/MgsG/c1QBF94T0p8uWXfbqVZr9oHp8VsAN/kJUmi4zHW+WGOPBSdUYVH?=
 =?us-ascii?Q?TfNKGuo0qVKAl/ppR8EX9xlfrP3pUceFv28Ti2pVjpjOyD5kShwNZUJfWG07?=
 =?us-ascii?Q?SYTfzrgEEqMpEd+KiG9AUUAIdxawhAzvOAd4t1IjGazKjsC1xl1KE8ebrqZa?=
 =?us-ascii?Q?SUnpQ4irli3qXG8mVXjDqrZGm2HMSLP7LPAc3OwDL4lDACgRAmBmfAgYNfGE?=
 =?us-ascii?Q?exp2WK8B3kx7jiSspSpfCHX40hAu3rx7sRWG8cItJNvrKb6DfbQ79wLFr7rF?=
 =?us-ascii?Q?Ou8+TSiLBI038D9S/3jnkmip3Nx51Ud54Jr0POacTUMoMDTZ9lcCvyL77RJI?=
 =?us-ascii?Q?TD1t3YMWDNNgbsjBFxdcHWinOhSaFeKMgtnBuVHEO1L6alz3KQs8GgIhTc1p?=
 =?us-ascii?Q?owB0WJ/qBP0ZHyq3bXu+fhI+JOR/RpBRQkCCqN/Tk33e7mTwkp+ARMQPatNF?=
 =?us-ascii?Q?oShQbPmpptakCm1zx6bgkuHGXHh+FUnTDqpMiuRNMNIkcj33SZm4ppjWYE9E?=
 =?us-ascii?Q?PP2jVPUADH/gRmK9ygHyifR4phMtCVrLA7Qq0CFsnfNWqULX/D+Gw84OfvpO?=
 =?us-ascii?Q?CEOvRm7rcm9dcOu3PRmGxFge5VFUBSIDGf9Uc04gospBErR0VBcIculC90m9?=
 =?us-ascii?Q?oC/9hHS8QzUA+IlR/Dfm2Q9NLmmJBNFYz+ogbkiTqmBX6zNMVivArMG/WIlk?=
 =?us-ascii?Q?QTDUkcWTeJQ1Bb91PT2vi93y8AF+GEE33RFyOKHj6FWS7FPkjGJQ6NwxIu2A?=
 =?us-ascii?Q?y0t6x4z593xbkXEQmrx9zSogXnGwJCfSpie4rvbBYijMOGAiNy9ic8/Jvs9f?=
 =?us-ascii?Q?lDM8oXdgE82mYieNod+Vw9iGdFuIcV7KPfqgm9oKEm1kg+aI8uoPQxdoVkw/?=
 =?us-ascii?Q?QA5o8ru1BduyH1dTRZPJ/Br492ON3IG95N0I7kKP76bQDS4K2i4lF5IctiUr?=
 =?us-ascii?Q?86hG4Prt/26fBOhJhzRKyZHWy2N04zN/kfhUvYqWc3YMYoBH3npnGgOHuLsc?=
 =?us-ascii?Q?klq9GiIn7ryzphs1l4q/2jeWdt+ZVPYGNEfRPPcgV6N/yoI5v1sl8tsNCnMV?=
 =?us-ascii?Q?Avds55O8e69Ux/5D8TEn2cRve+QrTs8vOjbASrewWxFsDtqbN7cN0yjnmG8a?=
 =?us-ascii?Q?HQYG0ipZ1Q=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7dfd6e8-c82d-43b2-ea84-08da38ce351e
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 12:59:13.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzbsw6AeUc2GS7XvtCAi2Q861pci+HNQJPZkrSeBJU/F4tMeGOXokGAheh6Ok37+wktRhLyTWjBv89XysjOgEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2425
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_055923_397474_17CE262B 
X-CRM114-Status: UNSURE (   8.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix following checkincludes.pl warning:
sound/soc/sof/mediatek/mt8195/mt8195.c: linux/of_platform.h is included more than once.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index f4b24afb6f75..7278132300e0 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/io.h>
-#include <linux/of_platform.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
