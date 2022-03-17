Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8D6C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Mar 2022 11:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kX1d6MT3JGKaE0wmKR3sB2G9KMHJN6rFNLXwq/XJoRc=; b=o7kbMYSCEWXG8V
	W4nvHFgkWWqGB8ddZZ1wArejFywZaMNiOk8VmE7FBFnk2lJalRx87kYEurSOxCtKLk1wHU3Mh55SP
	zePsT11X/XD/dqbloNCso4cRS249b42w7DqYx/cw+4Yt3CowPweZYXJqQ4cK+h1Z4Ah/e1pu5TZ3S
	FVC8WllAmSe0anUfS2bjJj+zRQHiUd0X1H8X2lIDjJcXoA1tRaBjWAHuzJ0jSVgJSqQdllO3ufoB5
	gIp9oNY/bPqKNQOEAINOjUDzKQpcdZ58WSQKUkDh2A1g+mp/m1DdOlZtLXfD/hkhJD5Ri/BY0YbpX
	Vqh7FlslIxGzOX9t5lBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUoCG-00Fohp-Ck; Thu, 17 Mar 2022 11:21:36 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUoCD-00Fogq-JA
 for linux-mediatek@lists.infradead.org; Thu, 17 Mar 2022 11:21:35 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H8Mpw3018269; 
 Thu, 17 Mar 2022 11:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=2iLrhCoIWHrbIyrrM9QkxkzjcwkAoZwJwbAcjWxtguM=;
 b=UuLvgbCX5PJ9sZ2/mFxAxjDLSGQcG9XxWTs/vRunLo7pEHHnA6dyQL7/vszpXV/T4I2X
 Xp1Qj/lqYbS9LmWbDFy6/9I1BiuNkPDGfT7pXoTMeG2ihwau4j5quYIUOn4m750BB6Ih
 mdUORW19a85KSpQ122SJwaDqCMUcJgpVJiFfef0enJgNEdsIAaI+X4WIFViosGleZvXZ
 4dgm5TNpmKYHphsJro1M3ySH4ZCjtJT/lA20YLWHAwjjXZdwW+83BdqjP/thXDzyeu+P
 lN48BdDWpPHo84HO140yyTJ7EtMqHNjOoMPdJfOaKD9eRL93dXakIm/P8caUebougy5m tA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et60rs04v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 11:21:32 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22HBAxhi168508;
 Thu, 17 Mar 2022 11:21:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3020.oracle.com with ESMTP id 3et659et82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 11:21:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6PA9KOGq7FkSRZ+C8tRd4H6lGL+Q6KvSoro35/6McGnGCzRoVVwoUDiz9aanxYOEwas2CpCduP2iBe4Zs0X3qrnTXeZwMqZKsVW5vftVvtsooUhOVky1mXDrx0HprWACP9FnnoGZnSgfRI8wzzgUfyqWUnzaoD2i2C4yXrMHuxG88JD78t/x1PsTGgjkGPV3mDUMcqg5GQTd/VUiqVAlEzcCbvcz8R9Z/JBApGyI9q39T4qmulPceJSc39gHsuXcDPgfVlFWURsnAUY6FF55upaW7nmB80AEBx0VKCyLhsxovETDiIw6sAcE3PAiwrdqtLjx8R5kEgqe60kcdOI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iLrhCoIWHrbIyrrM9QkxkzjcwkAoZwJwbAcjWxtguM=;
 b=SOTVtvHKHw3RS6AjaDrpmqjA+5+Y0rL42ixLTQxgWWgckabVq3q7ADvN3UJSvksFKL4hQ2VMmL36OyZ+JVbOIOuMZjBxSS1K++UUwKlKQA9eLLn5xPvArm6jSqCik2V0g/pOUW9ElMU3p9xZrZN9n/W9boahpwoXOz3XafFiCP8090a8brpgggKAewIHsJGGakpo07L6+KPNUX7Z6/uOxWJqb3mmfS1E7LJ2ORCNFDyBAyXhLdub32lRHlk6FRksDJ+fn18YV1HOXK0BNgZWtCplbzy8sf6k2cbIHN75NDjfn739604ijK568LVH8wTu842xh1R08VaAhJogRA110A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iLrhCoIWHrbIyrrM9QkxkzjcwkAoZwJwbAcjWxtguM=;
 b=hIk3Sht2LrIRwWg322nY+GOdj61E61J02a7yVZ2HCRqnhVhGpE3NmdGxAoP3/fXtvlEDkBL5y5wDZ4I/NTCC+yp0XBlXRwie4b3nMOHpcj1noa7feSJFfMZ2RB5nPPko6jSZsYy3nj7csp8cuFmveNw77R3y4aDKza2/XjpESUk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2416.namprd10.prod.outlook.com
 (2603:10b6:301:33::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.26; Thu, 17 Mar
 2022 11:21:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 11:21:29 +0000
Date: Thu, 17 Mar 2022 14:21:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: rick.chang@mediatek.com, linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org
Subject: [bug report] [media] vcodec: mediatek: Add Mediatek JPEG Decoder
 Driver
Message-ID: <20220317112118.GA29101@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa65f623-1e12-48c7-4ac7-08da08084825
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2416:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB24162A7C61F6176D7508FB818E129@MWHPR1001MB2416.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cmLc99GCNhI2GW5GEHsjan/TCtSM/3dONlx1F5itZTTYXx8dhT+vqtDnG22gxcGVB16OJcPPJp4UPWexK47bcnmZyzmnZz0W55u/0pWzcGWWfF5+dzOgzz5GlR8Y+ScuVuffUGsqh1smG9MX5UpAC82xZLiO/pFdhwyT37po0IKOgb7k+nrr2R/WrXn6E0wFWLQtArmzGtgHchk6yxrjzts5hVMDavnVc1igWezC3x4Mwthi9Rnol7vPchMMD0ydteD634mPzOdNtafPyJJdnF25KtxPnc29XA0LbCLwL66OEVpnq5vCRO3C5nEyXMDZql05OWAvadOGgNxW7n8UguomiOgi3SyFCZRlG7+w1LF/dxKpRuJzra49uCrkTDKlmlcFVuci+UZ9VbJ2DwYoDE/JR+jqZ65eeDWutOy2n52mnYPjF/VKF/g+yNmgeIya/14LNG3Ckt/yCHWtaxUTeq2plcjCmzXDbcd/HgOS0M4mSricCZdChRbPPQdaLsUMmJIA5zpqJWYTNLt/WtvLt2NYAN9q8dMY5ABiDBF629wZufQ5WJO6NfoUU0sCobXuWVIwBz101VvSLmH9m0fPI8s0hcqnePAVBz8tGLXgWNNwPSCee6WDTo3cncv0nqCozXKFn+YEveiYiv7K3ca7pr6I2rGT0B/CBbAqdqkijJQUtZ7hsffx3RDsoG0e8W7S3D7s9uVNKjMTb6Qk3GEtbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(86362001)(6486002)(316002)(6512007)(6506007)(6666004)(9686003)(44832011)(33716001)(8936002)(33656002)(38350700002)(1076003)(83380400001)(38100700002)(26005)(186003)(508600001)(5660300002)(8676002)(2906002)(66476007)(66556008)(4326008)(66946007)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yCQCcYIaMwWhrFEyOzl8HlXwsTxk4Ndlz2q57sZ9OWUVW2AOAYcDcGbHNzFy?=
 =?us-ascii?Q?cP/wyFda2gH/QpECqX8VPxEKnHi/SSXAcmvGoxJmYQBh9sy9sMbhQ5lXhNEz?=
 =?us-ascii?Q?RCbDFfMlpR9ARsDgYQ8FQ83S7yjVjDXTSe0jeOKVgdLjEuI8Ku65uO5PkMk9?=
 =?us-ascii?Q?QnFdRQJZgwJ1UDZRMToKvPeGcszfQBocSlPI3Bs+OgAMTPIw3MmrT2epWKd2?=
 =?us-ascii?Q?Vz2QT6v7mrR7reEGnmVz1hIqzegHdKq0iJtLWyExpvsUg3yz+VvAeEB3ZFs9?=
 =?us-ascii?Q?FPIYO8plDfbw3DGZW09MRyPjeL+XUwhxNLtguJRx5FOfLfiPs0bqhFzlHR+H?=
 =?us-ascii?Q?DW09itJklJkAswyF1oujek9s6do0H7oXz/VLc/hAJBZm8iR64HQQSX+356rv?=
 =?us-ascii?Q?aIm4UCGTWtTtJutYt+vptEY4UEJV2xqfm6V+2ruvcDGEH616l50qo2jREvDh?=
 =?us-ascii?Q?ytYU+YaS2nM675Cd0gPNbQHQtfnFC2qOBZJcrB2VdJiPzn133OTGxxAek+oU?=
 =?us-ascii?Q?hZRu0aOoR6GAY5GZarJt4h4/ijD4XZ1BvML9bX10dcSTOqt1hnzW/D+L3vi1?=
 =?us-ascii?Q?OIHEuMmOpz0djzQT6Lb0I8p2WvVHiBaVhjNJnB+QqR/4e5RIbdtPcHt0YBZL?=
 =?us-ascii?Q?T5DiZ1difwjbw3+WR0A1XCWk7045+m0zOmYmzf6N0OIq8tC/rKEFvlpkfEGw?=
 =?us-ascii?Q?yr/Uz2TT80P235QckkYYIQFPC4ki+tGrA5fiTXXateMDK3hIcXywBNJoMz66?=
 =?us-ascii?Q?e0lLqWTO2fqZpVPtL9DCqICdEs/yvxMU7vogDzgbqHucGEQVV0ZJm+ubeRlm?=
 =?us-ascii?Q?w1TPePrJIPPfqm9bx75EXi+JOFgIoXca/k0IPSwLQpoaEMFDroTqdp0684aV?=
 =?us-ascii?Q?VQAQQ/RmZw00gxFRQlzG24BkVNMIpDhtJJ6oKhJruajIhHW9DPrDOjtR0mGO?=
 =?us-ascii?Q?EJ+jF63cZsllvkq0HAUYzjbSHZ771sj5kRykBYGwd8i2JSenBCQQ/mAIOWjD?=
 =?us-ascii?Q?2ynfHeQDxzTO6ndulagDPSifar77O0NQDMnlUAR+G34gjr/btUmR6vWZtmnt?=
 =?us-ascii?Q?+9vsBskhYfFgWAq77oIo8Taqo3YAKyJw6VOW/1slqmVdi2bmoWMjK1cTMnDl?=
 =?us-ascii?Q?BfYsQnBtQ3vSQE528HMY801dDcHcGcASCrD5LncQ2wUHgJnv2/P4QgXC2A9W?=
 =?us-ascii?Q?PvZoW+nOYCI4xZc/0aHPeRwqRZGWWmwbDtxZmvtI5EIht1Kjp9vsxREasK+Z?=
 =?us-ascii?Q?Ldtsx/iBU6lQraRRnDMAp7wCx3XMMpbpcHT7hQjghU/kJ6QcnNt3H59ORzqL?=
 =?us-ascii?Q?adhLqVUJ1mJ9MOK69QT3a337sgboLbMcOEqK/9xqo2VBZFNJ0nkGCWlM686i?=
 =?us-ascii?Q?YaIVyEX2AvAM+wtH/5k765sFGIex6XQVjBxuOXSOFGZ2gheHXZ1dyNZyuzW9?=
 =?us-ascii?Q?uIDV+RXBOoqKP+Po1WcU88tbWEYHrjNNhscPk4sXA/8/wn1QVPZaOed62Xoc?=
 =?us-ascii?Q?6j12uxS9LqEN8A4gk6jg9EmZ9EUWKhS/ZlkuaQ0JJhQAUkdYjUH3V/3Rwal7?=
 =?us-ascii?Q?Gleymv7DEmmR/V5xq81G36CajYYlLPo4oeW22t/e+eJsXl3HCfIBYAho4edY?=
 =?us-ascii?Q?2mZOi6cY6cSp29C/26WBVrClEBvh2N2qqSbgGfKsc2BR0dBClLUImOXzbo5M?=
 =?us-ascii?Q?Gr4Obw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa65f623-1e12-48c7-4ac7-08da08084825
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 11:21:29.0760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EuaW+viADXa9xeZW1akbiGPGE/EWjtHUfEVxjHGEJXiDC11N/O0K8fI7999LzWHuMc5iEQOnJ5lie2ZBj4spfOHjH9B7uq9htHwpn3jauJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2416
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170067
X-Proofpoint-ORIG-GUID: pVsHSHqHaq6dj-dlKww_aHy9HxJVeeHl
X-Proofpoint-GUID: pVsHSHqHaq6dj-dlKww_aHy9HxJVeeHl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_042133_842685_D0789DF2 
X-CRM114-Status: GOOD (  11.03  )
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

Hello Media Devs!

The patch b2f0d2724ba4: "[media] vcodec: mediatek: Add Mediatek JPEG
Decoder Driver" from Dec 14, 2016, leads to the following Smatch
static checker warning:

	drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c:140 mtk_jpeg_do_parse()
	warn: duplicate check 'notfound' (previous on line 67)

drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_parse.c
    57 static bool mtk_jpeg_do_parse(struct mtk_jpeg_dec_param *param, u8 *src_addr_va,
    58                               u32 src_size)
    59 {
    60         bool notfound = true;
    61         struct mtk_jpeg_stream stream;
    62 
    63         stream.addr = src_addr_va;
    64         stream.size = src_size;
    65         stream.curr = 0;
    66 
    67         while (notfound) {
    68                 int i, length, byte;
    69                 u32 word;
    70 
    71                 byte = read_byte(&stream);
    72                 if (byte == -1)
    73                         return false;
    74                 if (byte != 0xff)
    75                         continue;
    76                 do
    77                         byte = read_byte(&stream);
    78                 while (byte == 0xff);
    79                 if (byte == -1)
    80                         return false;
    81                 if (byte == 0)
    82                         continue;
    83 
    84                 length = 0;
    85                 switch (byte) {
    86                 case SOF0:
    87                         /* length */
    88                         if (read_word_be(&stream, &word))
    89                                 break;
    90 
    91                         /* precision */
    92                         if (read_byte(&stream) == -1)
    93                                 break;
    94 
    95                         if (read_word_be(&stream, &word))
    96                                 break;
    97                         param->pic_h = word;
    98 
    99                         if (read_word_be(&stream, &word))
    100                                 break;
    101                         param->pic_w = word;
    102 
    103                         param->comp_num = read_byte(&stream);
    104                         if (param->comp_num != 1 && param->comp_num != 3)
    105                                 break;
    106 
    107                         for (i = 0; i < param->comp_num; i++) {
    108                                 param->comp_id[i] = read_byte(&stream);
    109                                 if (param->comp_id[i] == -1)
    110                                         break;
    111 
    112                                 /* sampling */
    113                                 byte = read_byte(&stream);
    114                                 if (byte == -1)
    115                                         break;
    116                                 param->sampling_w[i] = (byte >> 4) & 0x0F;
    117                                 param->sampling_h[i] = byte & 0x0F;
    118 
    119                                 param->qtbl_num[i] = read_byte(&stream);
    120                                 if (param->qtbl_num[i] == -1)
    121                                         break;
    122                         }
    123 
    124                         notfound = !(i == param->comp_num);

Should this:

	if (i == param->comp_num)
		return true;

    125                         break;
    126                 case RST ... RST + 7:
    127                 case SOI:
    128                 case EOI:
    129                 case TEM:
    130                         break;
    131                 default:
    132                         if (read_word_be(&stream, &word))
    133                                 break;
    134                         length = (long)word - 2;
    135                         read_skip(&stream, length);
    136                         break;
    137                 }
    138         }
    139 
--> 140         return !notfound;

We know that "notfound" is false.  The double negatives confuse me.  I
guess that means it must be found here?

    141 }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
