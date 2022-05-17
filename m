Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025A7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 11:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZEH1Br5XSfC7o7gySrf6EWjV9BVhV7EMkHfV8xp3Cok=; b=jj0CHuuN/wR6VW
	20miK48aY96rm5yYGOhfDY1E1hjPQzQr0tiUEIGEYLYE31iJxw6Oo0neMAtvfCmTjg/QdqLD02aQW
	WpCgIIdR9vxW+q/GP8lbVgUgmrALwGRX7tJc1IlyZbDZP3GNkF4vs39kdCRKsCqZXgIDunyniWd5g
	TiqNlNB4RX42pF+eO3hjMsddsI7ru320U9Z+UbRMYWGP8IA348Q0v+9XtGpq79x3CGNdNIO+aNNhT
	cvSmk9sBmSRllc+v29t2tnKYgj9ks7Ao62N43ggrGZYEhV9e/KoNDzZpjixEnUASbxhpYL0Fx9XFF
	lYr0cwbJutu+m+AigAbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqvhk-00DPt4-T2; Tue, 17 May 2022 11:49:32 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqvhi-00DPrN-Aa
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 11:49:31 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HAiQw6023720;
 Tue, 17 May 2022 11:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=hYK91miCF3MwdBrJQXpDeTPggOvIAUBIe0qqtO2glQA=;
 b=v0mWIbZL1DOZFcgDrCkD0EUIHm3RXiqefnLX+Ez90g/6IzoYtK2wh5+ySEfuSZFaF6mx
 jtrhN+4ssS/D+HjUEd0UKrYkaGd4zCntJuKLf6xk1PGzudGqlv8K9rW2mX5t7apV3Lfy
 +m6IEslF1Dt6BIbwueI56c6QO7oK8AzKOHbQCtq4fYJ84sMvurYAirOergzVhR/BodZ6
 GtshWk6UrJNLVDFZF8Qcf7elX2qGb/A6mij571g3J+7Uq3HS0qLtUYin2jBDZhfFjFPr
 acdJkNilBUsqxHDYLR9l9NdESQKp+sehdULAoMr/DKE8DnfvS6cC09ZeHvXQjfdozDox 4g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g2371x1v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 11:49:26 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24HBjfXI005481; Tue, 17 May 2022 11:49:25 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g37cp9ten-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 11:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkdT0CNdbgDG4plSDGmfPedN20+PJFDkifaCZmI0DuaVz9Cy8Sr8IFej46aj2SPdzQfyRWcy3YwSBOmrc46jI0bAd3vDjErZX8Zx1bphQE/+g2VU8Fo24cjyht5IzWr2qCGGX9eu5nMRhGPxt2PehvnHz0eFMSwU5xJ06EbeeTPVVtwG9tjQTqEhFJ6+ldTEAxviBwOjP9ZaveOm7wqWoOLy8h1gFZVM/+LsYERUcueFwz97EGuzCehStKzwH9dF1PUXAJGGnTfGizH9EwIB0eIuE5mFeXPRLzxdk8Y595smx3xcGurTzNNR960Qhzw1mtRWDvUMWC+6YUZVShVmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYK91miCF3MwdBrJQXpDeTPggOvIAUBIe0qqtO2glQA=;
 b=jmz+uJC3LsIPb2ogiaXrVb07yv2Wafsfvdr25FyWUR3COE9+7wq9EwsxwqxlQOSh3a5gJN91uVy/4FvpmuRibAZLmBchl08+M85/oFNlZIBev/y6YAd0XvHJCUQMV2guwZpWM5+mHiuIp7yTaYZpU7QkeJ4+mQrwOcpahXlUfKguyMCWm+lTponAh8Vpnl72mP/LYlOTkuuHerh19fmQAWscvSt2U+HEK1/UykJB/pGkXyZ6iSzXaNLOMq4lTc80gVDJgeEhrgg5c3dQ/8mmPSqPp93g8nPTvm5qphOXHn/3croEOPEMn1SVjjEvjk6qAAhvFLdyrvmaYtUKXeW3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYK91miCF3MwdBrJQXpDeTPggOvIAUBIe0qqtO2glQA=;
 b=PV0TMPp3LLMg9qRUcsog97cWEfAwZN6GyqDhYoaTUinJgcrUqq1hkb7pzU4ql1UV1yWJoiYQeYRqxTfQ8yW3YBNaMVr5o5t601Eow8dGqYZBlqaQvNprWA0QBegN3w6Ia1bOAG+NAWne7vC1DM3eSbaH5LzAjigA7TFxaRUrjQM=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5739.namprd10.prod.outlook.com
 (2603:10b6:303:19c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Tue, 17 May
 2022 11:49:23 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 11:49:22 +0000
Date: Tue, 17 May 2022 14:49:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: haijun.liu@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] net: wwan: t7xx: Data path HW layer
Message-ID: <YoOLubp7ZUz4Sngw@kili>
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0152.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::10) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e69ce5d1-a2bf-424a-8c72-08da37fb48d8
X-MS-TrafficTypeDiagnostic: MW5PR10MB5739:EE_
X-Microsoft-Antispam-PRVS: <MW5PR10MB5739F120FFA5F32710A3D8AA8ECE9@MW5PR10MB5739.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OrL7QYdGeR97h5WuzCmtUPiE9okg6G5RAa0yPbdlIfWPf5UG93VZ+jSVNTmLH0cMd05oJkVK2AXzzilTTqFg+K+P9KiyOvDD0i9vsrT43cFfmCK9IH+IdrnlfqdzFOsW2AZ9sCre8XqHMYhkE4lMV2rXrlvYEqAfn0ccQeq3u6LqVjXut0vIUPuSi7ewiYecO6KsBgsK9eOrGWQ57TMsevh7Hmj83UenZyxhT10DYOHRFWGnJy3uC48teqjj+1ceUzksYiqvI6nOjna2N0Wbp/0K/ijl+kIOCCGVAbNXhZzUdjhzgNzhdx+mnFD3MxmFNM5zoCCoIfsy0By1nqdi4e2L1MyMKmh/NB97+7Xdswwglm4pAzqN8IMGafZCS7j7mIUhx6/TvptkcQCefhl1LMsimouc9YUQQAszBECdX/9DK7NcYs++qZlBr+bQVtKk244Ltm4kic+CN94RPyV/NFzHxQAdEFOEss15U4qm8KDbXtp/gCzVNmDVft5tx88EWe/Z2nEitIIXCkyWSJek0Cp8L/LtPvkWkzsI8DipBlCgHvbSJFlCSl+jiww7WJCtGwVVXSkIFPMvc92v5u7umLlAmOFlWQ0b8AC0nLuO6Zdx26ALMa/udgFq0UzxKHQYZAvfSYzqcur+2pccLeQmogBeOe8eBaqPCb2lE+DOLNSXMTjDw1GQKY9WNzJ6F0XOey/Ci7TDKUwf2DrJM6eWfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(186003)(83380400001)(33716001)(8676002)(66946007)(38100700002)(316002)(4326008)(66476007)(66556008)(8936002)(6916009)(5660300002)(52116002)(6666004)(44832011)(508600001)(9686003)(6512007)(26005)(6506007)(86362001)(4744005)(6486002)(2906002)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v2LAtRm5WSIAKDzDLPYnI5LUoSPhtrqzdwRuQjYzAGfnRVDSmsJvL3sptr8Q?=
 =?us-ascii?Q?u47EAUnDY3FheEIrQrJOrKoZIBviF0SFiPd9pszlJmJ6WuJM2xmuUP4Uu7ot?=
 =?us-ascii?Q?zWCAodhNHGwQ1QfrITAdDN73yEhk67HFvgMIyeBdTULYwq/GO33fFS0/kyNa?=
 =?us-ascii?Q?ZVEvrLBXbL1WBrjIVvQLWpdKAZW+R3bKA5GGHn6fF+Xv/pTgSb9MGIXcxbZ8?=
 =?us-ascii?Q?t0k3FxTR/QdFUW6ew2ZLPMRNMaY7O4/zcc4ej2aD+lkXOE/itlmE/pkx+p6F?=
 =?us-ascii?Q?vx0r3YRkL36QlMvTe0zQXIUDMl6p7VLpKAIuYVbBmVled3Y3d1znXXluHclS?=
 =?us-ascii?Q?6egQcOtwMwZSLS1ySf+sisFuGStDGN10/rr7r+Idmr4tkpEulT/8fLag31e0?=
 =?us-ascii?Q?3KI+Om0paxQoaWeYs8geIQg1tTq+Y5fsFkEEHbhI4zW13VOSX8VCK/DQ+5fX?=
 =?us-ascii?Q?wMJbKgMMfOvivt1H2QhDBrisTxWLpHZE9vDDWEN9vysVqoDDQpnDrD6Q4AG6?=
 =?us-ascii?Q?F7Wwkuzlif7ANJXxPnU2wE6HEisUYTVDmZVnhycXBP6PeZw58Sx3WbSDl76D?=
 =?us-ascii?Q?8AaUFkI53nW956Ypjjm3sbb4K+nUTU5gR0f0G0zyeHEWTTpMgEBqNiD865JB?=
 =?us-ascii?Q?SM4V/c9WnqKo//3mmedmRRatBikkoQv1rCITHnvS9Rn/YYVjKSchJh+UoCv8?=
 =?us-ascii?Q?m3ta18w6iPWEIEHr8iEFoE1rPFswvRn+sqFXGj4SJsN+uY43WVn/BNpN6LL8?=
 =?us-ascii?Q?p2HLpyhD+s1tM2WRhp8fXLSEIg2dE7B3lE1SFn98957StVdaI+VfqWK9dFst?=
 =?us-ascii?Q?ATfDqvPdOw02p1+KQnaPS1St2A2iUOVdKO3wR72IL5OfEnJ4rt+wemXyMF/S?=
 =?us-ascii?Q?c45VGchimy9HGfYMjBFSa8tzRog8O7aBhi4BgkdeDQk/UE++O6NRJX+Wkzhg?=
 =?us-ascii?Q?B2vTD4d0ohSRbrGb+xixw+T806uXulva7vPlrjnDnB0Vdc2fYyiPzMEppSbE?=
 =?us-ascii?Q?Y7ZcVEfgHPcP5NyZlzAFq7OwLaae31xiwkfbz9B2ubLGexva84LvKiek8pna?=
 =?us-ascii?Q?iqHYIacHC3QnfHpQTt3Ikpzfcl8aifw3fivctZiaOKWn3VoyqNchzsi0oHQj?=
 =?us-ascii?Q?hOgwC3HYIlury6tEcvxATyiCTNpw/cN92sgy4ucSlmH4WnCsi+GwD/XsKevs?=
 =?us-ascii?Q?5G63qjlOC8wOmKkImmCEHB9MSZ3kBapXqNVfyqlwEDm3kTyGu3+q952NoIMu?=
 =?us-ascii?Q?XD8s5lIRFjTqMLDblqmlLl6a24ZQtKFo+Blc/JGyjjJqEO7aBILhTkBN0Ypg?=
 =?us-ascii?Q?RiKmfRE59PrpgPP9dH5S3D26CzHCZJb/JoXss2SXOddLynSGDutZT3JlSdab?=
 =?us-ascii?Q?U7JeZN9HMasPysU2iuNgDzsvldyjftJyVGeqaNduypxt64GxpVDvR1QFxfE0?=
 =?us-ascii?Q?M2I9fmVfXtOG9OhbROgBDJRJKh3P6Een50qn69p2C2MEytOO7Ncll1njtexq?=
 =?us-ascii?Q?kaDHe/INUs6+J44/r/vjBSb5qSxAAb4B+qpYlYHXTysQyv+Dy8550xj1ZBMH?=
 =?us-ascii?Q?h2m19diQjrt0YXmh6r6fymByXanj4kWbUzYCVSt/SP3mFJLKcVOntStRLiIN?=
 =?us-ascii?Q?OXT3YlCN/4FfxJ5JxMH2A19yI8T3pQNWFha7jy0km14tGRcpNkNsxYyU9aA6?=
 =?us-ascii?Q?v1DkaBzqzfBC9Tcv+uNJTlX1FaOcENAdA6grDghAR7ENbmSnZO7NPCwrySCa?=
 =?us-ascii?Q?8mx+Fe6VGWrmKBvRfZgzk2yDNQX73d0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69ce5d1-a2bf-424a-8c72-08da37fb48d8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 11:49:22.6066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRDSau8YvMVVN4sg++k6RhRWGGST46GJXpTSOs4apX9ZHvvXpFvQFY6tpbU3IWr5FRNbrul5SSYfSpzifYp5EbExoAcyS2RcUMGvN6wsKzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5739
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-17_02:2022-05-17,
 2022-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=558 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205170071
X-Proofpoint-GUID: zkqgGC35JpzdtCc9HdCOo_5h5yhKevBG
X-Proofpoint-ORIG-GUID: zkqgGC35JpzdtCc9HdCOo_5h5yhKevBG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_044930_534720_3D17C9FA 
X-CRM114-Status: UNSURE (   8.76  )
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

The patch 33f78ab5a38a: "net: wwan: t7xx: Data path HW layer" from
May 6, 2022, leads to the following Smatch static checker warning:

	drivers/net/wwan/t7xx/t7xx_dpmaif.c:1054 t7xx_dl_add_timedout()
	warn: signedness bug returning '(-110)'

drivers/net/wwan/t7xx/t7xx_dpmaif.c
    1046 static bool t7xx_dl_add_timedout(struct dpmaif_hw_info *hw_info)
                ^^^^
    1047 {
    1048         u32 value;
    1049         int ret;
    1050 
    1051         ret = ioread32_poll_timeout_atomic(hw_info->pcie_base + DPMAIF_DL_BAT_ADD,
    1052                                            value, !(value & DPMAIF_DL_ADD_NOT_READY), 0,
    1053                                            DPMAIF_CHECK_TIMEOUT_US);
--> 1054         return ret;

Returning negative error codes to bool is non-standard but, in this
case, harmless.

    1055 }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
