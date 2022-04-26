Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63EAC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3aaOjyUdN+aDTYeIHD7IvSQs1spJWe5ZnENduS1IJb0=; b=kGSAccTq8XQ+qT
	y5e/rAmU0ewF6tHw793sR6yGjkldKl6vkPPwm9Abi2z2R4thlqTqmN+WFAvVAUmhpbiG6BE+tw520
	TtOn03kK//2p8VsSHq+Hv6A6MZX4vYOa8F99JK2ia+VxIlYTUTlAZdPweoYmt9nhMcazVx8h2dBlU
	3YbF3qPqgNufNTB2tNilftOpZKZQMwZeQUXKx22zc/sMWeLrJ/TZ7UTcebVjsnGG2EL04iuwfODXO
	yqHqr63dL5rotp4j8RH2o0dU/1+b+LSnGXIAPoJdFPd7GROP+FXUGg54AQ2uDAZ1UP4yZtxtPKafF
	Nzd5B4XlpfkyJSVKq6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njJCh-00E4FQ-T5; Tue, 26 Apr 2022 11:17:59 +0000
Received: from mail-psaapc01on20704.outbound.protection.outlook.com
 ([2a01:111:f400:feae::704]
 helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njJCS-00E49p-4q; Tue, 26 Apr 2022 11:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8M+DXsAN54Iv9aoXlDWtrML59boJVyn+oI+jJK6a4SnRYJWRSWeX1Xw6h+iavXw4h2YMZzgzIE3yGO1gCaUKsZ1HgFWmLZ8RrDLsz48UpMiMA7KWP7R6dUMlkTvBrIAkmURiiHsEc10nzM9khqDMA8PgJFeQex/iLoD13z9by4svrTAjjcP9PV08JNVaD6a58jqL2zRvTiqn5j88/CTWvpcXozm+fh4ytl86K5GCtmmDw3MmuVcAuzXfhUahjC8yQDI37aHGNJe8SmP6QjSvt8dkoFNSLSE6quiYNy768So1oQqjmmtQexY+vCVzvA2ymWYoqSmfdU/pAoxA8oenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nH8lfn/GEabTIC1vo7b0dFnlSGaji5zPki37qA5r6yE=;
 b=AzDDWycExg2Y5Ea/Le35kHnwwINHliiWtnx3iKFKXWV325PJB2rFHfMI4N8G1jMhuZ8mkyX7QMM2BD85+wUdmMegmXDv9YbtakHxVVA+uzINmrYzXdvUuaeyyOv8SaYP1NbEJy5avyjJYBSk8t8fsOc7cXLQ5zBElE9hcb+IOYjsX8i+dRND9mGsnlSq1ozDiTqeHxYQ6MpRTQAIFahn35rXcMRhtk8OU6DzwNp5U3uuyDVANpkjWYIMjlcz9bWegl+YQxoSFa7iW98wfVFK6S71UC5W43EyFv5bEgV7zw/LDdAFKd49aVGMWFkKyTIXR2FwNLG/MxRuqGmEgIwn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nH8lfn/GEabTIC1vo7b0dFnlSGaji5zPki37qA5r6yE=;
 b=GzLkrOYOAGSWWKESR7w4LAGhNrXfo8vsA3hKqSt7a/e5um1lDKe/RWZlMjGZHQE2ebCsMmsOCgRwSeTHVb+YS5a5IObDzhUkHXUv2m/TLmRMHJt7VHLO83RxNxAKycFHKKA//lKmBvsEQNAufVYRnT1z9qB3KnaUMGaJt3IYOTY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 PS1PR0601MB3660.apcprd06.prod.outlook.com (2603:1096:300:86::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.16; Tue, 26 Apr
 2022 11:17:33 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::4591:4f3e:f951:6c8c%7]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 11:17:32 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] cpufreq: mediatek: Fix NULL pointer dereference in
 mediatek-cpufreq
Date: Tue, 26 Apr 2022 19:17:14 +0800
Message-Id: <20220426111715.627609-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.3
X-ClientProxiedBy: HK0PR03CA0120.apcprd03.prod.outlook.com
 (2603:1096:203:b0::36) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54084a91-fa42-4b39-7881-08da27765b6d
X-MS-TrafficTypeDiagnostic: PS1PR0601MB3660:EE_
X-Microsoft-Antispam-PRVS: <PS1PR0601MB3660C7CDB35C18D0CFF04BBAABFB9@PS1PR0601MB3660.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1Qz3Bl5bBippvFGQ/xWelpw95NaI7hCeQExmFvyj+/rnbgmUypXq44p1Njn95WKrP1FMqOsSR6NJC9CN/wccyzViV7N1+MT6FowPwULyASxvJVZhM7xrdDR8kyEg5HNA1qdYY0pd7upvk5f6f5WurLHih36zonmQ58yB46kHHjM5XWghTAzOnphk19ENn0EJ43U6ZSLO2E1GPXQS9upMLG7pVO8mJzCyCNiTAkmknXv9ql7n4oyEVRTy3ZiqBHUcY2hmna83ca/bMWMgvnRdtrEZSSXjX5H4pGJ5cX+ffB1ik8uv4ku5TZuBb60JbVs0aaM7Q7vyzFcZceJEQegkgHftvFftc6Nj0ikcAsDUdfLFyQhX655lII0fpmTIQ/T/+2jzYxKeymI+RvCigRb5z1n/t7G+7T1rfj93nzFxPcYGmGA80ccsFXHaqGMb2irlz/QQBz0n7S16HR+eJj/M5jRKnT1JoSxIM37kUewSeZ/s9Nx65qAAEnRfLWZ2iaIXY7L1LLW7Hl5D1O9KyO040twIoOQGyHAO/aF/XMnsOD1Fww+COboWScsFNqil78z65+EzdBAJ/HT66hZigDihpr+qeb4dp+I2HYEIZw351UmCemi8RKEYgK5D/NaMfllgYQmaNsOI0Tj5tBV3qVvjEg4g5mD+a2a3JNw/19RNTAcol6yV7OvKsM3oF1Cl+gYqX0aaw5b+u+5EUptPmhdHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6486002)(110136005)(86362001)(186003)(508600001)(8676002)(36756003)(66556008)(4326008)(107886003)(38100700002)(66946007)(66476007)(2906002)(8936002)(4744005)(1076003)(2616005)(26005)(38350700002)(5660300002)(83380400001)(6666004)(6512007)(52116002)(316002)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yySuQ8qPKnCAAfU0N/7CQuDf35gpro0z1UiVuTN3DLKAhJsjuozEo29JW+Hx?=
 =?us-ascii?Q?xk5s6hZb92XYtgK2b2vaAl84MH1oZJPWBXDLSl2p889yKj3DJUpPm8cNUQOs?=
 =?us-ascii?Q?p9n9XNPh0gYPhKDdlf8KD9mfrHmhLDb88L5xY0MJ/a7l9SmpMELvekWLvhOl?=
 =?us-ascii?Q?6RV3GfTWf95dcSADAB7kcF+HrrVHSlJu14ewWfc2f9Qe/GamCF3zvvsbXUvp?=
 =?us-ascii?Q?D4AaVhUCPvJusXsOpV38+KDNHqMpvzTPWzhkElhCH+omwy3KqYHrIyOvzOTx?=
 =?us-ascii?Q?PatKIwxGyzX9su8Os5CI6tFFgdyqI/mDdVdrL9n8AyJbvAZUfQyhwFQ6yvYW?=
 =?us-ascii?Q?YfzKp80ZPtLMvQQws+uc0V1h7QKBe2uiT743fbfmgkbOEkSzSK7LIbW37gEP?=
 =?us-ascii?Q?BxQSxJLRXVL5a2NP1IKOWsSbrjIFOqHAxf1oLQHltqH2NQkV4eCWU3XtEzeB?=
 =?us-ascii?Q?NEDIwTalDS6LKKtR50VOWjiStbO5NCdDxoPQSuR5ZquQXGA6sEt9I/2iHz1V?=
 =?us-ascii?Q?/kh00s3wciqp2v+dlZISrrunnN9SuCNTixSEGpQbAgA6e4chbSZOp9LQxvRt?=
 =?us-ascii?Q?weWR8lmn85xcWHhgH50A4EYLfwJiPrb/nlHVWduixBTOyBLtRnTQ34Uiq1SD?=
 =?us-ascii?Q?vHenxzrhiE9bbjknv0kgevM5Mz8ZMEkXSGwltfy8cfVWJzZH5jGf8jWGX83y?=
 =?us-ascii?Q?E9JGzYw8C28WJOGa9YBE39b8cKh/Ze/TgtoCnqLuwKcsDEVYgrTdHiBpUJiy?=
 =?us-ascii?Q?60CaYoX424GE6medlNnnqOztdlkJa0zOXB8+fY4QhX/Qe6ZsEsZf8M0wgnIo?=
 =?us-ascii?Q?JcobWKZOBworxXV5v7+UyVOfPcwLozINZVRaNy4K3y+o4YGCmUv87F+EaorX?=
 =?us-ascii?Q?T7jgwlqRpPId9OA2IEOVziUEqxjYKmyFBZqQ0EBIMh+/G1N10I055w8jlV1O?=
 =?us-ascii?Q?ZbjI2xdWWVdqPPIjrk1VtkemnA337VTLIHKze0CKy790aLxxEs/n+zPbVOiD?=
 =?us-ascii?Q?Ys50sSR34nvBjaesIln28eUGsQ2FTtkBvn6deWTr2pCJpIa7b6PKOXpnRmGK?=
 =?us-ascii?Q?wSZz4H8F8UHx2VX/uXsCq1evJ+f76RWUH6t17Mpm9xQJe2wKJMcSAthwGDqq?=
 =?us-ascii?Q?yh9NcWe8QP35gwWv4WUEoWlTjLLGoLPcpuMB/Z8sGS/odyG+Ka5kNVv2Ttl0?=
 =?us-ascii?Q?I1FYj19PKtwcIrxjbxOC5+92dWo4Sdw049l1zSxRR8zONJC9GSDHkmHz8sZ+?=
 =?us-ascii?Q?aiDh/MUzpo+s3pHj2I0tx3prD2N0ecpKZnBzDqxkvmg08CsFNJ4DVs1SBnZ2?=
 =?us-ascii?Q?dClzPqteqc53RpTW7FGCfjWOOeUj2jV0gipgPDam5XOmlUdh50tOyBduYpLN?=
 =?us-ascii?Q?b1zg92idleBYg1PqnQ7CpjMF1dn/kyYSBjSepAx7IAMGtv+UXJpX3f8qqAX2?=
 =?us-ascii?Q?qDd+tFkCu4WTAMmMv9GohBPBNpeQsDm4kM6oveNZPBh+m0G1XRVJqbQ/vXc5?=
 =?us-ascii?Q?DOh6ZmTIvp6S9ZRMgeNAs5qZuCuIvxEQ86eYIi4CV57D2VB006u6SFj2QqWd?=
 =?us-ascii?Q?+n3n2NdCSwY6OBE/L4Q0ve2yAcVezK2rArhoUw+nnZCzW5D9o5nIYZHMcKss?=
 =?us-ascii?Q?3PwRe0nYREhIVzxjTEN/yNn/vqJzkaUaJb33BcFGZ92abdH/ZoonHWvdJAlB?=
 =?us-ascii?Q?+SkWwxqPt0TUbE1LcxxddYJpSFDan8OtoQ+kahJYAbD4s9+SoxfLO6aEjyS3?=
 =?us-ascii?Q?tll5nsdHbw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54084a91-fa42-4b39-7881-08da27765b6d
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 11:17:32.2683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: er/8oIDGQyIvabZJmtQXScLfqdlZP/glH6GGpjNIbKweIljrsWWuFUNMNxbZonZ82bOew2olFKTqhckltWPx+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0601MB3660
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_041744_199550_49CDABD6 
X-CRM114-Status: UNSURE (   9.45  )
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

Fix following coccicheck error:
drivers/cpufreq/mediatek-cpufreq.c:464:16-23: ERROR: info is NULL but dereferenced.

Use pr_err instead of dev_err to avoid dereferring a NULL pointer.

Fixes: f52b16ba9fe4 ("cpufreq: mediatek: Use device print to show logs")
Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index bcabb3726a5b..901042e9a240 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -461,8 +461,8 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 
 	info = mtk_cpu_dvfs_info_lookup(policy->cpu);
 	if (!info) {
-		dev_err(info->cpu_dev,
-			"dvfs info for cpu%d is not initialized.\n", policy->cpu);
+		pr_err("dvfs info for cpu%d is not initialized.\n",
+			policy->cpu);
 		return -EINVAL;
 	}
 
-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
