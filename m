Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46748ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 14:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AHCaaXWzbxesliyKKoF70GAEnaOTkk8T1/JwqqOA8PE=; b=rajzqgWQjYK1P6kGGeVZhZZF8H
	4z0VReMBiCD/mrfJv3FDsK5TlAPf873prUySOK0hk85dwHRAQyCpUgJwnbWyfGyR9EseFici6YEuD
	VjaT/Zy2qBHupr9bLokXq7NB5ul9xVS6YwY1W1FfNzN6YxWA5KWLhHNjFLDiMkrV+HahrFN0mYgbf
	H2G/0GDPxHuVD1IobKj2KpmXZueH6NsIDWk3QZPw/xUQRc2N9g8VSwM8VMJj3PHCKQdZWPJ9z6ahM
	PBDX0pZvUTMBvEOilwKTfI9iUdh7LT4rHWjqZ3PHVNp/Fgc5fAvgBTw2jXQ8A0Sj3XowzIFVY5Hcw
	tB3MCwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTlUL-00CbZR-1s; Thu, 01 Sep 2022 14:48:13 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTlUH-00CbYO-Vl
	for linux-mediatek@lists.infradead.org; Thu, 01 Sep 2022 14:48:12 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 281DixWl006304;
	Thu, 1 Sep 2022 14:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=AHCaaXWzbxesliyKKoF70GAEnaOTkk8T1/JwqqOA8PE=;
 b=R/PLVr2vgtHG7hKYUfcF4c087C5t6YMUdbqPCGZTRaUpAAGAfdTJkT08VSRIr7xj0DW/
 EPzPQY7da0x6IJfrIPemCbWU1kSmthXZlsXwRg9xDDc628qSDCHortKCYROY9JnbnPRO
 8rKfcJgrJDiKXJhcCl/hFQZMo4BlQ+2RT1AefTmpnsw+SAUtAoo8iyGPh8jwhK6XT8uO
 sDfFJXHrOqgYSeMZ4r+rfyaeuLHHvASUYkxmWFzrTJEqwQq0629Uq0GUTjCByO4BZUma
 Z7oWBRzm/6QXWTyXGhbMJJuAGzTzS/QcdxJOhm5DtvikdM546z9lcAG5KR52uNE48QBV 6w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3j7a22cgs8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Sep 2022 14:48:02 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 281E1Tij036799;
	Thu, 1 Sep 2022 14:48:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3jarpb4yp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 Sep 2022 14:48:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9budWHXmIF4Q/c1S9AfyQMLF/nsdw0Cu+pAoAlOstu5Mv60zxrjrXwieN5UFpvymCYYF1OlR/RfF5FBzPGLEf1f6PEl1sXOVxKBXqIxYdzjhKZGyO+0jKjqteZnbCnVcCvbOnGYYvrhXVi0jh40uk5ET5HQjoKVzIMb/j9kbaUS+tbyn6Y7xklLFqh+xa+HJHhKoUsrZ4scNbwaflWp4upyyEBDg+RKuc2R6jD1tZ/8Bbadzs53fUMZjYB4pT0G8o5YfujleLw2R/Pm7L0Xlm7qjzdjmpP5xEPuO3WtF6upHDM0BYUfU8+4gwhspLRq+DSnjA75oDyLrkPf4NXWcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHCaaXWzbxesliyKKoF70GAEnaOTkk8T1/JwqqOA8PE=;
 b=WX4kM3UHDB5DNjiUivXOyvlHGpK2M2cBqZiQQ1z9i4CEMQB13H1ebNvMLHQZOEIWlKqBVmkYYUkQZA0NoVsHgNBOxNrFJUNGPC4EerOWnxQfLT1tO1Olw6Yn+i0ee1nDySO2AmrpO9SBaiNvOH9+8ZeFTghLh0e2bFL+p+OMROIQhaMjpJ7LIIs1eP3SP9cwvUr9fkl8eXcWYjEVywJDzcIEFOIcUnpx9Z/J+GstNGCzmIo98nnMfSYu9Y7s+iR0uiIiPtDAHgN5I0CXA+XmJG/s9Ef7p1piDcf7kjkPQN/CZV+Voeg+LJ7fzOxPMWn/7ueIan6oPPMPFogZpJsZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHCaaXWzbxesliyKKoF70GAEnaOTkk8T1/JwqqOA8PE=;
 b=eCXIOkOj/ts/BMdILSrM2RFsZlXAUioZdArzZJ5LHUkvZxlR0ou/mK4nPWKzRc5SEpiaD1bEfyVNEh8Vc5HtbBArXW11Z/yZBGP074TgNWLpQWexS9n3OkauUz7EoAeMGSxZg58XqxpRYTiWBkcQorAlsD65YPPIyd8DpZ1OLOQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4467.namprd10.prod.outlook.com
 (2603:10b6:303:90::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Thu, 1 Sep
 2022 14:48:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 14:48:00 +0000
Date: Thu, 1 Sep 2022 17:47:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Moudy Ho <moudy.ho@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        daoyuan huang <daoyuan.huang@mediatek.com>,
        Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: platform: mtk-mdp3: fix error code in
 mdp_vpu_dev_init()
Message-ID: <YxDGFMwyeNXFPaig@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0194.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ece0ac7f-0e39-4945-cc98-08da8c28f750
X-MS-TrafficTypeDiagnostic: CO1PR10MB4467:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	SS+b4JWXbh/eN1Z8hyxKSESUG6yQw2emP+EeeLRczAm12ptBaLkN8nn26r48z1HjW+dYHwP+1L9iftOQHGUUx8YLAwQAW+/4dKIjERtlO0dyuRNTSHhMeASd0Yh25FSfZEYy6tYxa3b7lP4cfyG2XfSuFek+P+be3eUhyRbeKorZCke6ejACM/jUVJsLIT6Xgcf8mdDVouycZ/xI7UNzrgzsvCFQ4iRoDm4wDmMor6VUMct5xa+FcDALvnrRkfuQYvhgna5cCIq3Va4GRVnP5vAe0kqMSlJtQDst/zAUK+0CozJzaHRSOkFxpKJR9uOiqGmcfQkkqTDSp+oejo9FsNc9rT0PS8TsUmXWq5+LQMPIRb5ent4lJZZ2UfSF07KQ6FgQhRs7aaqEiDucGeOhbaN8HQRvR0NcDuSdzQYHIgKfyC8ngfke3n5Jk7ApHVp5mS9PuR/xdKI7rmMIUPdnwyPR/SloWFHBOOLdArA+EORt6sP5DQFEjOM4V4d7VyaMdHSgiM6bt/0aecFxFFXVeLysdaSVboRQwngg3lS/ciOtyPP5Qw6reRrnVEebykJ9DvVmFFTPQtsisfQG5yNd97jn05dqsVSH62K4Hmt/LVbcLXlSTe+QwrnrRgAms/echLG21vr623u87z3XA+a3Vuh52EKXNV3g0U1XtAmELyVmCXpwT9BI/B9hsoGqtzoxP84nLcVb1U9pF+A5R/EAhh3B966sVJq7nRr146sREYJwizLYhWkmjZpyY+6yXoYj9KpVQdNGMPuYHgL+9p1vXw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(396003)(136003)(39860400002)(346002)(376002)(86362001)(83380400001)(186003)(38100700002)(38350700002)(54906003)(110136005)(316002)(2906002)(8936002)(4744005)(33716001)(44832011)(4326008)(8676002)(5660300002)(9686003)(66476007)(6666004)(66946007)(6486002)(41300700001)(6512007)(26005)(66556008)(6506007)(52116002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/iMI0v6MXrgD4P8UqQw9fow6rl7145J4G07WbF8r+E3lIom71HZQRdUGbkXG?=
 =?us-ascii?Q?dVbnD51ZV9v8OFFwY/CZ+1eNMCbieFPNeAb132Ysepin3jarXv5EygbA3ndl?=
 =?us-ascii?Q?d6+6GnN89OUHz0iMV6P84G8Y8RpViiEa5kxMwS3WyJAV8G7CFwDn3jaDOc6x?=
 =?us-ascii?Q?crg0vSBZYKOErP51GLPdu6brvJJV/G2FODMzyusklMfkQqgk6ZqCz0PINtat?=
 =?us-ascii?Q?arItU4Mxm5YgH211E5u826ED8BUfFwP/BENG8EacLwcrkKJn4T+mr2I+IChB?=
 =?us-ascii?Q?7TnpJ3sh377IJo51sHqj6eCQpxpMs4sM1PJQ2z119VL5Jy03EIONzNR3Q1wH?=
 =?us-ascii?Q?aPDlTgJu2tGcyc6R4xkRTEiOBMdAfeLlLkpHCa2b97w1shw1S3a4fK6AtW6G?=
 =?us-ascii?Q?wB10kg2ASV3rXTxXXZPFacV4Gn6kcJgyMGrBOelCxKOLUwVTywEEor+k7sci?=
 =?us-ascii?Q?Jvf0eYYl2SddwVdimKuIJ5h/o6SAfr8TXbtsxucxBZi1SgwExroPsIoapYiU?=
 =?us-ascii?Q?tVggIx6mAcsua+1/cQdVzH6Iu+44d0nnlRF1Mrfk4xsYt88bHRBSIRtf/Tqt?=
 =?us-ascii?Q?p/koqijY3JFfiJ8Jb6NxNZSoOasjBfBm1dNXtmcKVtxeDEhSDJq6tgGi1kRk?=
 =?us-ascii?Q?haGhiX0/2bw86d4733jJcqG6KshbluXqTEkPMGrY16pKVewCQZVoc3FOqatj?=
 =?us-ascii?Q?YeLbXcWHy9Y8y+Hufw6tnFCTNnH2y5Twkq04umyWKvITeQyPMpwnA6LkRFth?=
 =?us-ascii?Q?2IzBTNt1LeMeslDjh2BmJoFNFuNPPn6LMN0gaNsFsumtqhz4u5Wc2Vg+RKI2?=
 =?us-ascii?Q?p8hpcJHRuZ+NhNdW4GRDeOoKqLi+95TR5P9onYXslH+/DbVXidM8N+wVzrf9?=
 =?us-ascii?Q?pRyvXnM3aS0dxczrp4F6fQu0Ea6AFgC7z0yWgcRZ7ykHvgG1O59FG+fN7yhp?=
 =?us-ascii?Q?zIyaMWGR31A57ajuDF4cxA3x+y304vuIuFDPgldWwjW/9bQwYOiXgg3cq3MB?=
 =?us-ascii?Q?D2Niw0kvnh57QhnawuJxoWTMXM9H8mIHH+FqvUMXzcGEJtqBk1g9t4xoGm8M?=
 =?us-ascii?Q?g18C6zyYGvTVGmjYR75gBYP+0vDxq/U97b6aiDurSFOmqEW1DGaGgkinKuJg?=
 =?us-ascii?Q?AVIVowp35DfQimklpObNye8XJBhnokqUGqs+dxV8b1reS7zIFf4vmyIx/mu9?=
 =?us-ascii?Q?n8OLjBWcypHRcqb/wUs+daGzzJ/Rz0WFLhXyoX1iSGypCiByKvHWBi31Evfk?=
 =?us-ascii?Q?NRGKckxdN6+ngbFyGlEs6XKxjOIQzmBgDiHmeQysCt35Ahgn/vIKBqbOO0sk?=
 =?us-ascii?Q?NhA09Iy6bktF/4eVa6/J2WYxOA4pdFslRd537RXgG6nsGhHMYqIOGKI4W0At?=
 =?us-ascii?Q?SZ+4z58rP5ZxKviUOE+LNI9vTaLjz1oqvcsau1CcKBpMJisFn0ZiNjHs4aHm?=
 =?us-ascii?Q?fcFZET5/u2E8t+Mg5WNHGCVhwT6ChgjgUKgg+Wm11Zi4NM4I8Gl+CnE/mits?=
 =?us-ascii?Q?TPpZ5nsicmq0nWJtRQya4efGlIyauoFjolcfE9ie+6tJN0yDwMNQs9zw43ai?=
 =?us-ascii?Q?q5H+AawyP6BfeHF4KNqtu0NRq/1Fo2tf8xVwOjiS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece0ac7f-0e39-4945-cc98-08da8c28f750
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 14:48:00.3600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tjzHV7QD/A5o7K0iczQxtVW270K5FmwdcUFJm00LdGb1CZ5ubIC0i0ejJzVigSviRcTnvuRU9FRtTiZBZJumO8JXIOjU0szqdyW3L4sODc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4467
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_10,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010067
X-Proofpoint-GUID: gatllhOMopa69pyxr316g-_iZ9bIe0ed
X-Proofpoint-ORIG-GUID: gatllhOMopa69pyxr316g-_iZ9bIe0ed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_074810_765672_A76A75A2 
X-CRM114-Status: GOOD (  15.67  )
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

Return a negative error code if mdp_vpu_shared_mem_alloc() fails.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index 9f5844385c8f..a72bed927bb6 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -173,7 +173,8 @@ int mdp_vpu_dev_init(struct mdp_vpu_dev *vpu, struct mtk_scp *scp,
 	/* vpu work_size was set in mdp_vpu_ipi_handle_init_ack */
 
 	mem_size = vpu_alloc_size;
-	if (mdp_vpu_shared_mem_alloc(vpu)) {
+	err = mdp_vpu_shared_mem_alloc(vpu);
+	if (err) {
 		dev_err(&mdp->pdev->dev, "VPU memory alloc fail!");
 		goto err_mem_alloc;
 	}
-- 
2.35.1


