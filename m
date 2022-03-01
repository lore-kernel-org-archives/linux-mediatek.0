Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC82C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pyn2WqWP/UjeCpnYY8EfKg4Kg5W/7wKSwanScr1tK6s=; b=PqeK1Cb8zMokOl
	kqp5OYw8PzNfXp5dpkqtqSSiQ/uI+xtnhAoD5G0rdxfYYQm5CIzM9grnXJU2pFaVl/Q7vw6qZYcBu
	JBhIAjXSIxklH+GI/qPRJKTQpjxx9dWB6A5UVpkmrb/yCSI6bBHU6QFAxaei5HUN6bSeXSPToyw08
	6iO8dwDBVgUzaMFVe9SbvXBYNTcZnJbcJwJoF0U5kOgGB2Fre6lQylVFNoTj+j046dCLv8SkUEVLc
	gJXJoLgjMPflC7GWWjxZbAuXVAZC4uTfS4jAUXADhEfqJWzqfaDyNdABMWXxVglBxlUOw9mfYuSVy
	+G7L0oql2Kd1z+4wnXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOx5p-00FM0J-1v; Tue, 01 Mar 2022 07:38:45 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOx5l-00FLzF-BP
 for linux-mediatek@lists.infradead.org; Tue, 01 Mar 2022 07:38:43 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2213QXhn024480; 
 Tue, 1 Mar 2022 07:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=c8rdr4DNCMwm6rSQrUZ+fbJ3061HZdI+cLefklpOrco=;
 b=nTCotmt3XLu3/JONPz31QoUZi1U/rFG32wCRXmuq0IEcO45XhzHa8Bia3/uSICk/erWm
 ps1AlsIxWTEl7hHYNJVnkRJNDSdxHDAn1NKMrhr2/WwiYCVfMQ3TcfJMKkJX0zEyEnIq
 ouYahbes6I8Ba+rUwx7NoGfaDWRpOIxY83vN4+uIJ4rKFc7IxIUknI9FZardHdst1MbF
 +2/qLUSVBCLptNMJiIpndM7fFVju9e4ajBvD3Ai9VVh8uoJh5vD+U+rSjvUsLg7mSqYc
 f+rr7HtTRL6dA/wtbWvBbNgVCeCRYmBYa4qByc82ejCy6i+QlEIz2ShQTz/jICAUIGJp PA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ehbk98du0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Mar 2022 07:38:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2217ZwiU031219;
 Tue, 1 Mar 2022 07:38:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by userp3030.oracle.com with ESMTP id 3ef9awn9e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Mar 2022 07:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0dGgqyaQVZOrKKUzIG8IroHhBR5A2ZZG6XFY09N9EUAvRNWwrpYtCm4Uxs0wNy7NOhoipP8Yk7GMP9XxmH9uvDkymXW65LZjGDwC0YNyf0GpAlFKyP1XXY6SQ5bRU2J0Gukcmex4xXSgVl86POUquSXntcezIOCRuZkG976q32NKbnxsjsdWTKSTM/4hkhGzMWkSU3E6VcDIaWTfAZX3hpVB8CHgKCJOb9ZNP1+xcxClRXJhtVoCCZNYuJY1WNqXEQQt1lHkm/OKdTOc96Wra0Hmuw9xYhvnycysAbEu32OpewKhLlrsEfGmkJcV5aA/r1dyOtmSb2CmateJsrBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8rdr4DNCMwm6rSQrUZ+fbJ3061HZdI+cLefklpOrco=;
 b=UymE3Fl0TPgYLBDCmg8tM8epdgOi0QZG7A6fn2Piuma80ASY7A0TTvIg+GchhFaxsciBuMPQo0enfoQ6aT7AwKuAC5cSJL8fDGphq8UgsMIDa7M0kasDmI1F1ArJJlW6Vkysf3xjvEUAE0M3J2QNZy6esD/t26ivuTCbbzGLcCPTSOmxpDlisRz0UzWXUlhz2FVMOKnGrmqscpJGmGiAOJ96abQItE5IRpzZM51qVRg3e3XJkzo+3uj49halhPc4cEHTcbrLD4ooNBkXazSNBCZvl/lNYzmulnU6tpr8HlOse1qYZkFBCYmBumpNYJP9E6p6KagPwy/m1L39YLcYQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c8rdr4DNCMwm6rSQrUZ+fbJ3061HZdI+cLefklpOrco=;
 b=drqVgj5CRpttM4ab+I6aLNMa2K7ZyeoVtsUaeCI0EqQ+WK+bdMzHXbxGN9nzwHlXezb03JEGD8uGPR2iQHGeTcJHDMmO0UzEUqdpG7ssWUH1iX1PUv2wrAOPICllm25m+jQP2xlar2+w2pdOe9jH2hZJkC9A8IOIFMw+dF2JqsY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB4208.namprd10.prod.outlook.com
 (2603:10b6:208:1d7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 1 Mar
 2022 07:38:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 07:38:29 +0000
Date: Tue, 1 Mar 2022 10:38:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Bo.Jiao@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] mt76: mt7915: add support for MT7986
Message-ID: <20220301073818.GA12168@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0066.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59342b02-a856-4fe7-8383-08d9fb567a85
X-MS-TrafficTypeDiagnostic: MN2PR10MB4208:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB42085FD956A3AB96E992D7CE8E029@MN2PR10MB4208.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WCCUEwGuGSHK42e7Iu1mqgitqNGwJQGBgPeZC3t+KDcycScjZBB5bVne09YrLZL8UVp2fyL6FTiStZEWVjbPU/EoQGcr/EKWUtlcIRLmTdPGyGOSnK99OU/eJMyEIAtCMzwNHjZ3oHyj5DeK3xSGYqP+k3iRCIkHe3ElF4rGQFHYNXevhfUoXwcAxblt581G8buEJ4wPkzRmXrxT78KMOhlH4o7sE/0sw0LYBhr7azUyd2800kLZ838MLMV9eDD2/OHtErFd3qZgxsQKr4CoN4LEHgxXPFFvA/pG9OSB8B7oMtQZ+IjLqsU5nJ2zMWxA/OktrYlEbqtDsLxMdrqsWJDi4pXJ0C+qY3fzbjcPkZ+KJNsydls2yXy1T5kjQTSazY2Ma81xtjcbSxMjFjEd7uf4moTYw9HqJ4ehb5NJZz99a83noNnhAsnD3Gbcv8VJX0zR1jg+q2qnEMDzI6Ku6ktDbIp5xPhQfgDGImTZGW7Eb5gsyP1BvEY3ceEjaJRQ3uCke5y+9d5E/caPcOz5N9HOkbgT/ChFWJGPgyRRxO67oNNZ7k1BQav3SeMAGtwVRs7sdlWdD47U0g1+JrlDVk9bHKcQsVUYMpiuS/P2PvBSP3pHB2f7yHPJTEawsDBPM2Oa6kRXhZSjnmMfFYGHFebDmgrtdPxqshCpDbSiyHpWaEUSzZte42dfjZMJG+c2mYbBpE+0ITQ0JjLrNIP9yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(6512007)(44832011)(6506007)(9686003)(38350700002)(6666004)(33656002)(316002)(52116002)(5660300002)(1076003)(26005)(186003)(2906002)(66946007)(66556008)(4326008)(8676002)(66476007)(8936002)(86362001)(38100700002)(33716001)(6486002)(508600001)(6916009)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DG8IHpXoWyIvp7EuNuo3yZa80oGVcp7GZweRS9Q2dcrCUabZU80Lvz4ahPqX?=
 =?us-ascii?Q?m1o3L/zibfuF11jKTKLoJf/ozgdpuhW8YKqpxh5JiTe+sKih7DcMMCz49ACc?=
 =?us-ascii?Q?tA8QCqR+VNblguARu6SsvCUI2IWUXIw4F9Q7WX17HI4FRMWT3WwnSz/DuepI?=
 =?us-ascii?Q?YyHPOw40ubIsT9fCUcB3PGL9RoBSQ9IeaTLAG+M1WnvbPOMRLtT6/a12Kfgv?=
 =?us-ascii?Q?z4V5D+gIXOVJXZNKTnD3w+g0xd5l7plJG+jObCuebatKLsUJizxiEqJIJ1Se?=
 =?us-ascii?Q?NbdzynZDR1ztyNGtTLxO1ajjqfqpOhxq3yzxY5mRvQfAHhR7qLZCa83eHd3W?=
 =?us-ascii?Q?mEdDf2vrVJ5qA3HQ78etXLPpXfhSCXhJ8NkKmdK/vK7vmuxZlmePGkQXOcDm?=
 =?us-ascii?Q?kDGNyJ6w11fzDD/A2mazVnOc+oYYOSxZ8fCfh8R9ZUApsAxxK6/gc5Ic+UKx?=
 =?us-ascii?Q?ZdZlJHbTcg+tN0oqUKZFHOgsiwQZe2h9f8orAqgzYBbZJxELXHYboXJObVDx?=
 =?us-ascii?Q?vB0+HipEkCCW/slcOEVgAsMtPex81aeDdJT8WFYhB7U8+Bq7cM+Ajkaz25zV?=
 =?us-ascii?Q?HPBDk0nZ1jtAhz1DAVxvvgsoQywhJh+Ix47OLh1egBYLcd1a+fxZ3zK7C2OC?=
 =?us-ascii?Q?/K8sl4deCku/oWN/I8FTuzbQC2zoVXm+8pVqvoxW7MWckhfH9PWBR/uTQ8bO?=
 =?us-ascii?Q?d9GxLDJngQROpY/4iA5lM7FsCMsu0wviH/RXMvurm6n+rmMyd5uWCAzCgvTI?=
 =?us-ascii?Q?hYpnMOzLc1H958pUXL0XFeVFIWrb7+ak69BYug9buKT1PSDYiElNd58jKd7t?=
 =?us-ascii?Q?6g+PUaeTmNXMa+E3g3ahhbxAWCFWVXNltDmj/Qt+l14Rg3ecWBRLnXVTFLKG?=
 =?us-ascii?Q?cMRN1TC+LBO5jvwH/JA416X+er9DFK9UI2RscB0rP8EW/0cmkBYIfbn9l8Cl?=
 =?us-ascii?Q?57xizqymNWy4IsZFvZCkrRrQ6rYhVXqBNtMe9xRJM0vUL54Iz/pFSGElNl+E?=
 =?us-ascii?Q?gS8x07uNNC6ss0EOPOhhNRsy+kd5dCtwNeurjHUt9mKWH/QE9oVcO22op+j1?=
 =?us-ascii?Q?+ampYozaMnQydPlgMN3+11zxEpFuqMvQAcrkHo6LHaORBWA60tEAlDDLPqPn?=
 =?us-ascii?Q?Y2rQFJfBiO6ccCdW+3NBDmkF50RyrYnr2AX6La+bx8GE1Gk+Lu2doQbgcJLm?=
 =?us-ascii?Q?VAZvgUfE8XhUgMoQHeivb6LEjj+7GtUB3DLs4HwcSEucGYhaz8yWM4riLMdn?=
 =?us-ascii?Q?jXPDcHhme6GjDgE/iFYzWPvwY5hSrWNMGtuNt0CsEOuZOhL1ofDFFJewD70u?=
 =?us-ascii?Q?NTHtaHpEqqNVgMcDnwPJqNwWWNgpPLUCtKZQyLCHFLPvn78zNnJGNGf87KLr?=
 =?us-ascii?Q?cbRb+9c3wY+vIHGSeq3FhwkLfdCs+pBzTv1pvcOOGadTE9namCkcT5X0XzUJ?=
 =?us-ascii?Q?Uvt2B7w3N/uExOjAF55df8UpyjqnpjznLHonLg5BTGWHsV8F+PlcW1OgdwWy?=
 =?us-ascii?Q?LBN6OuEBRWR4evpjtRglwT0uwzvZb03eYQhaplSf4wBXYQCN1HlTSHlwnpDK?=
 =?us-ascii?Q?XUS0O5yI99LLpoBQirHbdd3q5/LluBfFKHsrH2sZT8vXE5SmkmY9z6m9p4l4?=
 =?us-ascii?Q?Qs0l0CK3bW+DAEjVBHEkEGzd4jBWYi23BbNQzCImnOabDVt9SWRS2URavQCh?=
 =?us-ascii?Q?YpKeZQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59342b02-a856-4fe7-8383-08d9fb567a85
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 07:38:29.4558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MpB6CDbxDHstOWELIBXEqHbul3LkowsbFCF9Efi1cPKQBQ90bi7lmbTj7t6l1g7TU+xeDMo4veF2NhOSEGxuK9ASqMUu5ijNtFzwMf3hDXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4208
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10272
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=969
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2203010035
X-Proofpoint-GUID: MNYh1CzTigjo42FPDQnNdQGqhB_d2P3q
X-Proofpoint-ORIG-GUID: MNYh1CzTigjo42FPDQnNdQGqhB_d2P3q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_233842_429619_300835FA 
X-CRM114-Status: UNSURE (   9.91  )
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

Hello Bo Jiao,

The patch 99ad32a4ca3a: "mt76: mt7915: add support for MT7986" from
Feb 9, 2022, leads to the following Smatch static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7915/soc.c:357 mt7986_wmac_adie_thermal_cal()
	error: uninitialized symbol 'data'.

drivers/net/wireless/mediatek/mt76/mt7915/soc.c
    349 static int mt7986_wmac_adie_thermal_cal(struct mt7915_dev *dev, u8 adie)
    350 {
    351         int ret;
    352         u32 data, val;
    353 
    354         ret = mt7986_wmac_adie_efuse_read(dev, adie, MT_ADIE_THADC_ANALOG,
    355                                           &data);
                                                  ^^^^^
    356         if (ret || FIELD_GET(MT_ADIE_ANA_EN_MASK, data)) {
--> 357                 val = FIELD_GET(MT_ADIE_VRPI_SEL_EFUSE_MASK, data);
                                                                     ^^^^
If mt7986_wmac_adie_efuse_read() fails then data is uninitialized.

    358                 ret = mt76_wmac_spi_rmw(dev, adie, MT_ADIE_RG_TOP_THADC_BG,
    359                                         MT_ADIE_VRPI_SEL_CR_MASK,
    360                                         FIELD_PREP(MT_ADIE_VRPI_SEL_CR_MASK, val));
    361                 if (ret)
    362                         return ret;
    363 
    364                 val = FIELD_GET(MT_ADIE_PGA_GAIN_EFUSE_MASK, data);
    365                 ret = mt76_wmac_spi_rmw(dev, adie, MT_ADIE_RG_TOP_THADC,
    366                                         MT_ADIE_PGA_GAIN_MASK,
    367                                         FIELD_PREP(MT_ADIE_PGA_GAIN_MASK, val));
    368                 if (ret)
    369                         return ret;
    370         }
    371 
    372         ret = mt7986_wmac_adie_efuse_read(dev, adie, MT_ADIE_THADC_SLOP,
    373                                           &data);
    374         if (ret || FIELD_GET(MT_ADIE_ANA_EN_MASK, data)) {
    375                 val = FIELD_GET(MT_ADIE_LDO_CTRL_EFUSE_MASK, data);

Same

    376 
    377                 return mt76_wmac_spi_rmw(dev, adie, MT_ADIE_RG_TOP_THADC,
    378                                          MT_ADIE_LDO_CTRL_MASK,
    379                                          FIELD_PREP(MT_ADIE_LDO_CTRL_MASK, val));
    380         }
    381 
    382         return 0;
    383 }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
