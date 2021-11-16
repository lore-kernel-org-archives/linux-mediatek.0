Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F371C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 11:34:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47FF761A4E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 11:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 47FF761A4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HGWxev6ND8AGWRo9jP/49Wfv0I+7GfTa0jHC3fl5jaA=; b=iNXSG3uxUAUzw3
	Hv2TFIjwD9ZkQad3f6Jw8UKeyk85BXJIGinKH2YAarmWLAVCc+pZhCDTQDHmcVyh0wb/zmZsgjl26
	NYBjiQKFh3++G67gYTW3HFBkfKQRQkqGJeuks6Vp7RRvAoR1BSIlMu2bR3Xy6nJkZ/2tO7fBR91JN
	muoTgdMeCTJzLwE5BDWc52UmRzFsHGQD3gwnv1iIBiaatapOKxldpYb5MlfiYJL3HlZ/B1KyX66Ls
	sjnfHE3KPLxrSGEoDUuLmMZO4WOR/gwI+EELifHeZ5/fEqhliGQFd17k82nW/gxdQJn2QfU+HGYer
	uZ4y+nAMhTr2kDDrOPQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwir-001TBx-Un; Tue, 16 Nov 2021 11:33:58 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwiZ-001T45-FH
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 11:33:41 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGBDb7L016946; 
 Tue, 16 Nov 2021 11:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=QTQCm+Wmv3wMxn9iqxXB/MJwex5Tmx+KHGPgOg/jyQE=;
 b=Zb3j7/lduRjcRVLa2McLR2uopfUrN+RbkX5shzvt13GuCuWc4z03zHlW2wTZm+p/5ZEK
 ZtrxT//gsvu21ag4CrDKkcpEDF9Nw5baexMoFEKFXCJ1IM+W81k2V4BAB766f0bnOk+P
 n0WHoXW5v0PesKyOYhrrEl/Ng5LLrk3+/nLneU32yQnt7+ShKSj3jDs35jtcY42eEqPH
 ZwFY5l5s61mWDz4VN9IeTPVqYCnVRu/rDXuX0H4uF6Dtj951z5vg2mrHiRUHVih7qvIm
 Ylbalb2YxYX8+DNqc/0+f3B7l3uJ9178CncXNUQQIhXcSRPesGmfzIcgWR/Y78eFRgy1 /Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cbh3e0pur-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 11:33:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AGBGdif104123;
 Tue, 16 Nov 2021 11:33:34 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by aserp3020.oracle.com with ESMTP id 3ca5659m18-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 11:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=no5or8bDFp+KrJDbDMio+LZCTTzor/2aiKRJzW1hM9c6C8Sy408qLNtxBYjBhTSA4Sf89Q5tv9avYLgAM6UFV7SJ6QmMirIWa5kKl6kV5zD937LnYnav4Jv08KAoYRt723MBcnFMaNkIKpy87rm4vPhgrpWpbjna8MJa7z64uIujaqLuuRqTNYLF1Z7v3lG9sVJ+3cpnoFbyBWMDOBgwwSSFmAYxEchPtA5Iwd7UMURifcnZunhKeqFq1owm7qUncqG31YgI2ARUahRmBKiJDxHuzKnu/DAtYccdn0jHIHz1bdAV29IeSRyPv/o0ya/q4VQmdsG4l0PtcC/BzwPtSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTQCm+Wmv3wMxn9iqxXB/MJwex5Tmx+KHGPgOg/jyQE=;
 b=J0rZg5oqf7oHTWsc8/Jit7n8skQSKuRfT3cXjbSdq+LT/syH+fFWbvUN0+CMZCFzWMy1m1oPkpaOprD2xM/IbM4bP7QKG5ynMNMEZrgyeTQ4oO8eWGZrvdMTBu4fHCfXP/L0VshbK0V2iZzwvsLISoyy6EWNK/kgRIOkyn0hwPsA+XptJ1aSi8b+Gw/laGTym1c2xdzxj98W9T4prfVUpeB+yD7ITfqqEvGba1qAtzs/Kq13R0ZyqhaxyRGM5ouUu4wVl8pdD4Tfal26pU4fl8u097q3LBKE7h7nN5wBj0DF4mHoHXsl2KsSIxVcSPSH29W3lOod3KBQ7fMlA4VX7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTQCm+Wmv3wMxn9iqxXB/MJwex5Tmx+KHGPgOg/jyQE=;
 b=lhtFpahQtB4PUAQFdyAhKAEVZduGFSXPuimYd7SLp3tJCdtmiNOTpF3+Tppwv41bDcjwIG0flciT6287xuQ8niZrUp+yWWqiY61r0hlDJFUcKI2EDj73rvQoqoLac7h+ixdcdv2onpCdsYMP7mHqPiz36NYMaJWm87IgnEoKEoA=
Authentication-Results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5680.namprd10.prod.outlook.com
 (2603:10b6:303:18e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.16; Tue, 16 Nov
 2021 11:33:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Tue, 16 Nov 2021
 11:33:32 +0000
Date: Tue, 16 Nov 2021 14:33:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: ryder.lee@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] mt76: add support for setting mcast rate
Message-ID: <20211116113321.GA11194@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0085.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0085.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Tue, 16 Nov 2021 11:33:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a11b4d9-2bec-4043-f44d-08d9a8f4eb79
X-MS-TrafficTypeDiagnostic: MW4PR10MB5680:
X-Microsoft-Antispam-PRVS: <MW4PR10MB56803156B985EC79381C45708E999@MW4PR10MB5680.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hW6VVV0ASLtFK8DUuZrydcM/Fdpn+8BE9kuAYphX2D+MXHBKX/W9S+NQtNpK76cKtd34lkyz6GhGxSytoBxJ8SeuTStwoaqzhWeLpKpD8UKQPfTlXZ+MwKhBSHoh7qjWuXNLHaxtKf/OWeSMY09AL8tXOhVRbwiUGdwyb53f9+lvLnBsfAKUcfM+fQWQ1FSKV0BO9P3A+9AijN3YgP+L/xCCPtXxkaYmxMmvc9FCf8QT2Vy9K2bTsB8PIJsdHby+E1y8GKgjEot/vsPdgL4sr092rnsiLtNgTnUd5fW0PsfTiIb4mNWBHdEJmb0TGU3yB8/ynWhnAW49FqbOEJKcQAd8HGIQvcouMtjamYXuqFPcF+2RndOEdCj0tDt2le60BgIkZW8EVvdDXJRNbDR9PJmxp2mghF9E3mOR7Megpq3LZ8hnvF4okXuoiY15xDWwbj+c+LdZgidyOxwYy5IcPNSHNRkjh3YTaJsjqHkr6jy14580vpZ8IMcQg+GLbDeeATbLm63PdGwQQGFbvwpz+t2sFPPGyXNmM001JEiWsTv0xlzdBvbecSD4hPCHOi642RVgy0pypNH+m8nFZOO1XKa6dORA1cmWfMHSDXpYKiU/M6NJU1T8SN21eoNF+/Scrt/WvMIuG2tiXh+XFWFLbxwTMof1ZRpc7QqSzdjpmgNBFcZjeucq0420jIdAH3wL7r7VQ5HYB3Vy2Ui0mKwCxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(55016002)(316002)(9686003)(33716001)(1076003)(4326008)(5660300002)(2906002)(52116002)(8936002)(6496006)(66476007)(66946007)(9576002)(66556008)(186003)(6666004)(8676002)(33656002)(38350700002)(38100700002)(86362001)(44832011)(508600001)(83380400001)(956004)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1KoTQQb7SFTt0sJ91IWnO/FlpRICrqkzwXRKlExAioZweGKkqQWEUb4g+TrI?=
 =?us-ascii?Q?fDZ1x1pq6l8435btQM+Pw2ncCb/1FyQ99hFshvkOQbcsu+J7mmA3nocqJfq/?=
 =?us-ascii?Q?4GbJT9GdMCUjqWLcXnuY3C4bHDBxYwsNxw29KcUJOmFgRP6YH0yY+HcTmGT4?=
 =?us-ascii?Q?AM2n1+4Y8E0Ah1szoBpa6iAJ46hA9ydF+89POrHWwWdTBrB+N+JTqvr1LoX1?=
 =?us-ascii?Q?QSloVixj959XWl/uj/fHD4m5tnyXteQ5VIb/3QbWYMowsAyQo5N6oaTpnTHd?=
 =?us-ascii?Q?6MRtzGHQypQOUNPBDmnrQjvemeiU6Ysi78lKW2Scm5iy1+H7303KIvTpczau?=
 =?us-ascii?Q?2/Y3lf6mEElI7xa0LHk23hjETI9z/egplLCBtJwERiQNA+SseYLw41H033a6?=
 =?us-ascii?Q?SpV9JxR7cOLDMUfZiZE7mlqvOZ3zXGY9ScPGyKdzEU850aTUwh5+e4/y0Ntc?=
 =?us-ascii?Q?SxoZXQOHNjzuqndH5XU4YQn9G239A7aORzSe7dcaUcCzNzgCbZaSwtlSUrIZ?=
 =?us-ascii?Q?5s7UfNIoct9UoLepBR0J+cassoPliR34A1YrURqtWVct+ly4U+N3KIjS6Kcr?=
 =?us-ascii?Q?4JqI4d0lfNtcH0tPijEBgfYoFrovdT8yZobCiqlwuT64nZVH0RPHF9X1tLTs?=
 =?us-ascii?Q?VkuYP4/vUagM/Ll44X1HsI+9YFQPo/pmG6SYVZz66Lw67p3NHW/0VptUPuYG?=
 =?us-ascii?Q?rQBNZqPM6Zsbtn7Hnw0v9eEYJ4esMJPcqAMt2QFUd0NAwAHbDi11bh/AY0iA?=
 =?us-ascii?Q?1AQJAp4EEWnsipo96Cdudg8vbKhI4eY7VMMJri0slRfJIancDIKrGpXs/qp/?=
 =?us-ascii?Q?N607/F/TE8lLVr6zjrFvMz7BT6/90i6AXz5m4jHTOKd3L6tT9VhSPKpp9TMN?=
 =?us-ascii?Q?mMlVRLoCpjWzU3R+unm4sLvahnTk+soEK/nQS4pQ0HI9PhygO9Z2FTXZLPyQ?=
 =?us-ascii?Q?mk1UvBqmpYb3CNh/maMdW5pv03jFq78blDUQxl//mV6om9Opfrk9P09mN1/o?=
 =?us-ascii?Q?BDdPUWn5TVugAlPQp2GtIgq2jp9DwHFW18c9Pv/Zbm44vARu8N21g8/MIZms?=
 =?us-ascii?Q?WTevNYr4gO6FsFWQiF+Xw7DHats585BOQ5mLQcplIe+YdFAqQ3H8gkUhgRgf?=
 =?us-ascii?Q?TngwGV1gMWJoRa4vzTRu9WrnmVTtOe+L/2zOX0IuZB6jrYsxzqvGqt4geOKq?=
 =?us-ascii?Q?/7XfQPLKaWOyFPrsuy10/xM0/w00yNDAbBUUmrCbmV4C47wxd//s5UqsXGef?=
 =?us-ascii?Q?Tg5b/W/kTsVqHtm3lHmXJ2TM7TCdZwxe5ng9+vPf9SoYURpqrsLkI771T+45?=
 =?us-ascii?Q?SYr55QffLZJafGjHZYYLCDV7AVY/1wvQTr/RL5dDZzmT/H+maMd1I59jKabM?=
 =?us-ascii?Q?BqtMpz4G6c8aLLRFLniCfpnyuTdXRRb8DEM/KYZ7WgVWmI5xVVY+7T8KB9eQ?=
 =?us-ascii?Q?cQayPOrJeAi37sgQpooh2wt+vEf28ubz5Mdtk1wwbFQ9Aoj8I9bDm4pqTKg8?=
 =?us-ascii?Q?v7gOVB7WYNTXr0eEsTwEZh0ArotVLewzpL/DTW3iLwE+7C7NHmgNa4mLYIyH?=
 =?us-ascii?Q?2JaclrQlkZM2eLs/I1Qwvwb8SZ9WXZvAUk0Sh7a3tk6nPc/N3/ZWDq7dpRZB?=
 =?us-ascii?Q?dHAjQf7q2EAnw+JjSV/LfrrSEfvSQHqR/cUvfIzNaveG05Ur0LGymk+5XMYS?=
 =?us-ascii?Q?uzbxsC0/ByY0FQ3WB5bgy4feL2I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a11b4d9-2bec-4043-f44d-08d9a8f4eb79
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 11:33:32.7289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /aalXy7ZS4WPeESG8FYgW+BQs+bGQqEK7UU1AJG0vD/iinrw2bUi8hPDeKbXYwDH+ao27JHpPw6vIl33DiFNATmQ3xCvdHJd7II52i7qWGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5680
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10169
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=775
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160058
X-Proofpoint-GUID: tf3u7MXp3nM-_AsOyntCtAAbjuTIRHZG
X-Proofpoint-ORIG-GUID: tf3u7MXp3nM-_AsOyntCtAAbjuTIRHZG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_033339_747942_B06AE335 
X-CRM114-Status: GOOD (  12.09  )
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

Hello Ryder Lee,

This is a semi-automatic email about new static checker warnings.

The patch 33920b2bf048: "mt76: add support for setting mcast rate"
from Jul 21, 2021, leads to the following Smatch complaint:

    drivers/net/wireless/mediatek/mt76/mt7921/mac.c:906 mt7921_mac_write_txwi()
    error: we previously assumed 'vif' could be null (see line 852)

drivers/net/wireless/mediatek/mt76/mt7921/mac.c
   851	
   852		if (vif) {
                    ^^^
At the start of the function it assumes that "vif" can be NULL

   853			struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
   854	
   855			omac_idx = mvif->omac_idx;
   856			wmm_idx = mvif->wmm_idx;
   857		}
   858	
   859		if (beacon) {
   860			p_fmt = MT_TX_TYPE_FW;
   861			q_idx = MT_LMAC_BCN0;
   862		} else if (skb_get_queue_mapping(skb) >= MT_TXQ_PSD) {
   863			p_fmt = is_mmio ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
   864			q_idx = MT_LMAC_ALTX0;
   865		} else {
   866			p_fmt = is_mmio ? MT_TX_TYPE_CT : MT_TX_TYPE_SF;
   867			q_idx = wmm_idx * MT7921_MAX_WMM_SETS +
   868				mt7921_lmac_mapping(dev, skb_get_queue_mapping(skb));
   869		}
   870	
   871		val = FIELD_PREP(MT_TXD0_TX_BYTES, skb->len + sz_txd) |
   872		      FIELD_PREP(MT_TXD0_PKT_FMT, p_fmt) |
   873		      FIELD_PREP(MT_TXD0_Q_IDX, q_idx);
   874		txwi[0] = cpu_to_le32(val);
   875	
   876		val = MT_TXD1_LONG_FORMAT |
   877		      FIELD_PREP(MT_TXD1_WLAN_IDX, wcid->idx) |
   878		      FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
   879	
   880		txwi[1] = cpu_to_le32(val);
   881		txwi[2] = 0;
   882	
   883		val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, tx_count);
   884		if (key)
   885			val |= MT_TXD3_PROTECT_FRAME;
   886		if (info->flags & IEEE80211_TX_CTL_NO_ACK)
   887			val |= MT_TXD3_NO_ACK;
   888	
   889		txwi[3] = cpu_to_le32(val);
   890		txwi[4] = 0;
   891	
   892		val = FIELD_PREP(MT_TXD5_PID, pid);
   893		if (pid >= MT_PACKET_ID_FIRST)
   894			val |= MT_TXD5_TX_STATUS_HOST;
   895		txwi[5] = cpu_to_le32(val);
   896	
   897		txwi[6] = 0;
   898		txwi[7] = wcid->amsdu ? cpu_to_le32(MT_TXD7_HW_AMSDU) : 0;
   899	
   900		if (is_8023)
   901			mt7921_mac_write_txwi_8023(dev, txwi, skb, wcid);
   902		else
   903			mt7921_mac_write_txwi_80211(dev, txwi, skb, key);
   904	
   905		if (txwi[2] & cpu_to_le32(MT_TXD2_FIX_RATE)) {
   906			int rateidx = ffs(vif->bss_conf.basic_rates) - 1;
                                          ^^^^^
But the patch adds a new unchecked dereference

   907			u16 rate, mode;
   908	

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
