Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2203C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j6nb1TIJCeC3uXX2vKq40N/ZsCqR/YubqNitkCGWsJY=; b=kKoyCJE+F/HpK5
	oh8kO8OYgAgK9YpJa8FBoZfjmGw0+4kHlCpB8DvEs0RbaC8giGnS5hROL5NxjzYfCIpBEHyFf4xD8
	2Ggp90ucChVEKzI1TeAYEPTeEsEvDF4SO3iLpCL6Q1DemQvqoieT3mO9yecf3rYyFY//d05iQnnu/
	dzfI8yRMAlT/E9J7hfyD24k3ct5X2nMYzxxjzSzLj9KiuecExpTEkAz+swcmVQItrlPK32JSIGwKJ
	t7DEugdKG5FG65j/OCWaK8Vdtt+9ba4OC/IE3xcWs7xuPnhABt/y0BpdO98sjPJkU549uomdCz8r/
	XvABhZVbH4AW7dhxIfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqvi4-00DPx2-4Y; Tue, 17 May 2022 11:49:52 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqvi1-00DPwL-QY
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 11:49:51 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HB1wmW020448;
 Tue, 17 May 2022 11:49:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=EtoenebVwTLXtIK06uEja+aD3BlpmQXvLbaARe5mEwI=;
 b=wgU3ekIHPr2EaPH+z2kdMRdWkHw/+4UvMARU/0WSzc3uEFD7h8L1DQGT7Mckb7afnNbi
 0GbDIPTr8D6URoP59N9hg4JIhifVL0Uzwp3FGHlnV1DA3R7HqYUfch7OLxJDVjd+SBcI
 o+8Sfp/4XmXSku9q5aCibewjKuOaTBwQNVOPaAiTUO2b9/MNrnMkUm/1SobHAesQmoBc
 HC3VC60sB1B/BseqnmH23KjVSoWorEaeifB9b3329HnC3sHhooJG8DAot5l9prrIqccP
 qYUMe9iZmw/Wzh6+CBRr8J+ri02/JQ4CeO0IzYKShrV8oX2tS1f1yxtm0T3DmtmLyHFd +w== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g22uc5v0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 11:49:47 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24HBjUmK018107; Tue, 17 May 2022 11:49:47 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g22v2rspx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 11:49:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BD6Kx3PL4CFBvkV4WWSZ0B1Mja9MkbZhNYRYa02HJ29uZCKSld1GDINDVcDsV5REq4rOoeHNKe5l3MvhPskf+fhZfid1c9Dk99331SA5P8A3oR0CWU5t7qVp0flSG4+OCFerzseRcES6Hfyg59SV47KNIjkievmDtB3zkJNttyXYI0vhinEKXxqH87V25eDv19/rFqmPtUUzvB0Jwob6W8Xl5OoD7eIeOfojTbrqa0S9uOoCtxIBCwZ79+7xZG0U76mkF4mXEnTaS6L7a7nCwzmFShmds5ukym47OrAdYKLB441p1j0CcikiSf3Sby3xW/n7gjOIIq8sR7GVx4xqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtoenebVwTLXtIK06uEja+aD3BlpmQXvLbaARe5mEwI=;
 b=W3kfc+7as71XAQi/OCGt1lLyZRtR3tNHzRXLVVa8S0siIC2JukS+klhcLqjHA9IlQT5FEQGKAoyDjuMtxFFrKDs3/5qTojX8bjQappb9DgnM/QCHxVAjZ0aA7gIpBCt4abOAlxeJlCeki8MfYwm3tTsio+SGVj0UDYrzlhyr2c6oObM4cNtxWCg7C2B9JbBZMk3Q8QBS/PE+7TG0/7Qd/CJ+TkH7/9PcGhscevjlBN6jDcIM7TNzKgxmkifWCiTsKbP8yvOcb3pUwFCgxi9GFhMDL490jYDUkZWqRKouGYyp1c7GboTdble3RXiBtGQlmngXCXY7XjybdGcREUXc6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtoenebVwTLXtIK06uEja+aD3BlpmQXvLbaARe5mEwI=;
 b=m0qTFSljm65ukqNvYkowI8tA+AEVvfIksirs7I7oU6iaBkfBIesW95NE6waQiXz8X1ZiodHnYIeC3GXQY9VhHZH57t7ucFFvFRoHJQzZFNQbOohfdJ8LrOUziNaBNp36R5MMaWjqSXi+X4K7SSdWRXF90pqxT1C5KF4LuqBY/+w=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1770.namprd10.prod.outlook.com
 (2603:10b6:4:c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Tue, 17 May
 2022 11:49:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 11:49:45 +0000
Date: Tue, 17 May 2022 14:49:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: haijun.liu@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] net: wwan: t7xx: Add control DMA interface
Message-ID: <YoOL0NuzeeV/Fn+9@kili>
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fac5d0e-086b-442e-2198-08da37fb565e
X-MS-TrafficTypeDiagnostic: DM5PR10MB1770:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB17707613DCDAA335093EF4EE8ECE9@DM5PR10MB1770.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OCLnYHGJR2JzkhWvE+Zf2ICGpFv64deyGfHnksgi+rkQPmc2407uXDkCI5Vr5nP0/kIsIfjUeHhTCWcXzsXbfPj9oydaLSJTUWLD2QsAJEwLJ2oXw804x3N4GiY5eI9U6SrkXfVls1gPrzq2bhk8LYQTAvSC3iHRl3+1lLLjv65Y6Wl2b+xqBQ6jPbfHRkiAXM6dsjkDdwa+tG5r7N6BvIZqQFvj0qpyN+DOYV9PegAeHXbfwYDYvIKnefb2fwZZTr3ri2eq1mMrGz5IrLqQ/allYXjpiQqR/HmEVjFmJQu1RGAiSLSWagFtIEEAYIyp7j6K30U1FPZUpOGD/778qI0iXEbJCxZMO09zKPK9Yt/heO2HYTB4QKCyRQ+iM1qeUa6ov2GbZbpsTLA2EZAy2y+BjWpqbFzq59Q2bYlw4Npc0tdGqHWutnDhsi+jhRc8hjr8NoPxtp62dERloiAVAkz2ufT9+gBaYKmmokhinoAgHb8f9oHio9S2GzHEt6x3HIGKHe5sZtxEez/tUvUyANiUSqQPD5p9eZJcYFZwkcWwf8E0yOtOQtWLnsGfQ0JP1CNgExVEYRFBoihAccaZO55u1bbapS4p6gjUrs+YuYssQKYyEuExkun36gszV/rzMiELPsDw9ufhzDs49MCmcx4ON1lm11Pw00WFQKDFiZCjwcf49hMyjfVyb+zjXv+ZmE8sLcRFxyefrhXlOTEKOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(6916009)(66946007)(38350700002)(38100700002)(186003)(4326008)(66476007)(44832011)(66556008)(52116002)(9686003)(6666004)(6512007)(6506007)(8936002)(6486002)(5660300002)(508600001)(86362001)(83380400001)(33716001)(2906002)(8676002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xd6bg4CTTl5Ce8Lpryt2REcMQIB5QxTRzJMPK1qgpiq658C5fGUsqfVMfdNU?=
 =?us-ascii?Q?vrjYnIUsHyIE2yXIGQTjUos8TR0je74qUnuoVfI8eYJrWRH2IAWdaPoQ5Hba?=
 =?us-ascii?Q?0hZFOcCoJaC00DcDDfQatDu3pY29uinkX1VnqythN4eszlRuqIXGxIuYP7Ix?=
 =?us-ascii?Q?jCZ4zcPFu6Vmr6L/2FdZCUiEk8aYYTc/dxo/EgeQ1H8ugVvDipUGK0BXa+L/?=
 =?us-ascii?Q?0mpWoeZzGeOpY7Tep8qLS0KDy9ghMMQwUKQm3ImInC2z4+vF17+s264W2n1U?=
 =?us-ascii?Q?TWxX49CCFoSwdraVECR/inCCsA+KqaD+pKJDFr76r/Rmmm8epKM7PTyO8ulC?=
 =?us-ascii?Q?CX1NMsPdFJ3usCoMR8SxBXUZc7iciqsYTzd54fcA3asnArXxos7zJebwlg3u?=
 =?us-ascii?Q?XGWb/SlwFs+ipaW1ETKV50EltQddSZXWxXBf/ecGUXJnPPR/mGF3a3C6av1p?=
 =?us-ascii?Q?/cc1ju/3diMSpfXeqZAfKZlU5RI1WI5tH4G7XHsySskIiEGmmJyKIrjWZoAE?=
 =?us-ascii?Q?2X7AoUxxBmVFIBEFm1IyDalekjpbo6z5q2m7rRlh5BOzZLiUCt4Y+ymELmHs?=
 =?us-ascii?Q?H39/vfllMmEpAwNN7UaXkBlY4ciy9btbByDGmNRYV4h9HVfwEOhRqZHOrxY6?=
 =?us-ascii?Q?zFFwZFe2NFnrccYIQbio6DfWQ2YpmtVsDiyiIPRNR/xrXwLJgKKxoyvGiFfH?=
 =?us-ascii?Q?G/RrM0qjiBW2p0tVCgBPrcmWHO8gQzZgMOcihkD6p8zEwsInKZLd/OZxPB8H?=
 =?us-ascii?Q?+H1yaNETRx7ge/toXKoXGNjdPBZa/nXHrI8VU91IM9k6Eytm92vmuZJvLyHk?=
 =?us-ascii?Q?XFsVjVNgILfVB2YIgq1G3g0nFxPiCZMYJ0KqYEWbbaDJrmNIL18Xd/5y8V1k?=
 =?us-ascii?Q?b5Ah1AM6avsx038+78dKnrYhLyTI+lLqnDErkriVUo1Qzwnqc7wTRVbIVZDg?=
 =?us-ascii?Q?5FBapYtM5LL4RWi/+vS3fR0AHanUFKLFLvthVUm+UOfRcG9Z7+f9UvmuMbLQ?=
 =?us-ascii?Q?Tg7bAdctocK5bte4/ZbRtBhnEZr72ifeXA8m/Yn+FnbCc/jO6Ba5K3GdH9/+?=
 =?us-ascii?Q?f9WSiCBC41NVh+2bYn3v0xV8mjXup3BUn/ePW2Z8dPxeNyIqM0LVthXG0yvc?=
 =?us-ascii?Q?ZKo4cGJ3N+EFK8icAkpRSqv7IWvEKDFjJcdWsHVbwafcQ/tvukU6S5lJTu5M?=
 =?us-ascii?Q?Bmh71K1wyUvEwR2dH2HLzXinws/uVZ12clW+XE0LuKouEKipCTV8RwaZcYme?=
 =?us-ascii?Q?AaM6wMo48NBMqgzngIfGJ2OgFSxElepM1xYO0k49FiyHOUYcKb+i0xgtsAz6?=
 =?us-ascii?Q?XsqGb/n6O9WdAVCyx2g+5mnGF73slXsOL9sr3yQ4HH6OdjfWXJ1gVN8l8Dwa?=
 =?us-ascii?Q?ewng63PLSr1/y8xoZOUhkJCJHejO8/VhMC1ykf0CObgj73oCg7a4pP79c5h9?=
 =?us-ascii?Q?oFDlG/GCsXycDFTrVcOnEzyKD2ImCVA9ivtGZMYwN3udmhJo9b6xehC+ln0t?=
 =?us-ascii?Q?M9/9WqEr4Sr+X99T0qBRT/XwTvozF9RO4HZFndA/l3YowwOJolkpBucgQpOt?=
 =?us-ascii?Q?ocKjz1KqlHmgRs0Gg2TRSn9OZMVIUZ21YmEIB3ZFHo7EJakHVjXZZ9F9Frbj?=
 =?us-ascii?Q?Jei4X678IuZfHSGBUCMFnPCuOEKS/tdmp1anL+r8IjtyElLChiuhkRnxYRFG?=
 =?us-ascii?Q?pZC1dBWG6NFUB3dX8ICrltBqwhsMzQ7i5iF6xlIx9xbPl0bkErJwyEJXkzKj?=
 =?us-ascii?Q?+v1MvDw87jo7VBAkbQOdd6ka0Z2yErQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fac5d0e-086b-442e-2198-08da37fb565e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 11:49:45.4487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y3PETYG7gSb5Cx6ihGv4K/f80y23x31WqhWaqqYn6I/hKHBEyVK6muXNofa5at6UVSwuea/rKxbD5sccmYSBe9/W8uHOUHsCHiOUaGj26C8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1770
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-17_02:2022-05-17,
 2022-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205170071
X-Proofpoint-GUID: YTkgsliY1jmNfT8cLas21s-kj3usXdMS
X-Proofpoint-ORIG-GUID: YTkgsliY1jmNfT8cLas21s-kj3usXdMS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_044950_029122_4B8467C8 
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

Hello Haijun Liu,

The patch 39d439047f1d: "net: wwan: t7xx: Add control DMA interface"
from May 6, 2022, leads to the following Smatch static checker
warning:

	drivers/net/wwan/t7xx/t7xx_hif_cldma.c:805 t7xx_cldma_clear_rxq()
	warn: sleeping in atomic context

drivers/net/wwan/t7xx/t7xx_hif_cldma.c
    780 static int t7xx_cldma_clear_rxq(struct cldma_ctrl *md_ctrl, int qnum)
    781 {
    782         struct cldma_queue *rxq = &md_ctrl->rxq[qnum];
    783         struct cldma_request *req;
    784         struct cldma_gpd *gpd;
    785         unsigned long flags;
    786         int ret = 0;
    787 
    788         spin_lock_irqsave(&rxq->ring_lock, flags);
                ^^^^^^^^^
Holding a spin lock

    789         t7xx_cldma_q_reset(rxq);
    790         list_for_each_entry(req, &rxq->tr_ring->gpd_ring, entry) {
    791                 gpd = req->gpd;
    792                 gpd->flags = GPD_FLAGS_IOC | GPD_FLAGS_HWO;
    793                 gpd->data_buff_len = 0;
    794 
    795                 if (req->skb) {
    796                         req->skb->len = 0;
    797                         skb_reset_tail_pointer(req->skb);
    798                 }
    799         }
    800 
    801         list_for_each_entry(req, &rxq->tr_ring->gpd_ring, entry) {
    802                 if (req->skb)
    803                         continue;
    804 
--> 805                 ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, rxq->tr_ring->pkt_size);
                                         ^^^^^
Doing a sleeping allocation.  This is a bug.  Will trigger a stack trace
depending on the CONFIG_ debug options enabled.

    806                 if (ret)
    807                         break;
    808 
    809                 t7xx_cldma_gpd_set_data_ptr(req->gpd, req->mapped_buff);
    810         }
    811         spin_unlock_irqrestore(&rxq->ring_lock, flags);
    812 
    813         return ret;
    814 }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
