Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E55B9C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 02:11:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF2061153
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 02:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CF2061153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RNtwiV0wHRHXbvBvYfCGnNEEwXGhNYaq4eY6M9G315A=; b=gszIrqVwJWiqrExioJP50UCxH
	V+p7CDXufosvn3kFVNAwIYDhJ1KfsvPSPmWv0fF3B59AAnnnPYxplvG/wQLh6nsmGr/hf/Szv4svI
	g7XBnm/P4dKaeuHQkCMHWCgKDJcajRxRcR0Vt8U3m/O1SxX+sytNpwenrb3wJerHXuxRxdnmA2tRf
	3e3CIp5KD0Z+E/+fghS0tZSTCL5iZZwU8ZtqN76pWEOqSuqwrB5HxK8HCOhaitvpsaGzd2l9u1br1
	h1uV8JgjozZ8otmHreGrRU6M9P++WZPGPeLcqywEzGv92C6ONrBUlhW38Y+sYi8eSBOycjmXau5Ni
	6q70OAyIw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXDxE-000SQq-D6; Fri, 16 Apr 2021 02:11:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXDwy-000SOI-CX; Fri, 16 Apr 2021 02:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:In-Reply-To
 :Date:References:Message-ID:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2NYddnjk+RnaHrq0LwxfvF+yiaY56Thd2OXQFOnO1u0=; b=vXJWSSRkzBnsf2gOoFAQ/qKfz/
 YxBNtmTZHdZetCxJcLjK2dP8KiIkhw4lxnaYvPvOzmo6bVeb+ex3lUjNz8CEJoXZC6bDfNRTwm5oE
 XGqdGFYz9neoHDtrK1l9GdUpBmJ8K8HOYX0iIZvscIA/EXgXyWd+uo2JWRPD1sbFzgOnPm229/BrF
 sxEhWSlOOUuDEUtsIbreROxTqZmFFI7qqj8p5AI2/XDGAej3ZlgiOugI6XTP/tntr2pT+y3Of2hDQ
 dt5uAbZjUUjWsYxzHDkmugV4i7Jn6qCG8VJUTpL7cNDNmMOESAI5saigVSqNbA9zl//YNTdKVW/Fw
 0LksZIZA==;
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXDwv-0091jM-NZ; Fri, 16 Apr 2021 02:11:15 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G2ASMp179296;
 Fri, 16 Apr 2021 02:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=2NYddnjk+RnaHrq0LwxfvF+yiaY56Thd2OXQFOnO1u0=;
 b=eXH9I+dpumeE3IhJTBuQ80bBJjl6iVeI+G8OoLe6ObJCttN0WdCyNQH1kkqByUt0Nafj
 0F+U1BxB37XqbYHxwyOjWtI1RPyUEZ50/hlsbjAVFY+Y4lR4J+xrUO1hwfMC1RUeuo45
 2z1cxieDXax//l+80aq7y62rZfYEYDwT10NHaM007+1Opb76m7HrcN22tvCbIwXOA9dd
 1gbUFjEMSUMyKpLpjWlRvuEZb7Ns5jPzE5/Jrgo33F2DoZItuQmzSol7i+cfShu9TayY
 HGN6kT4JPFjv6y3A/SdenLFCpY0fJGJfG2RBYCRdvjgg3lDUtCvRWks18UjJWrRbd92Q lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 37u4nnqmn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 02:10:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13G29eZS111937;
 Fri, 16 Apr 2021 02:10:28 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3020.oracle.com with ESMTP id 37unswga0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 02:10:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLA6UIU6XFtxmSjJlcn/cWJoLO7TM+YEGJdlS0j1x/Ebx8uLdUV1jF5+xVZilfSoWWNgfs9Zfxb4liaqVrqtITUiFBsGbUdfTTqTL9440E6tSONjSMdJhwODvvHuumSgJblnnAWmDuBWYzgO3ar8qPJBHEgKF1vSItw8nr6r7XSxy0hsBH0lMEIQntx6SYczYfehIZC2EFgAh11yQmdzubSHMY7B5MW7SbTWBgYVSv7gW/ZtvT0kxVRnEQXaaFXZyGEL3pqCxdRItFnidRcs7jn3975rlng2ia4cOnK2Z4JBVRYFLu8eDZ8AONBKUHTBBYCay8rjMRhSAFJVxend5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NYddnjk+RnaHrq0LwxfvF+yiaY56Thd2OXQFOnO1u0=;
 b=eCcphUfvmqnRtS45/1j34GIIl+hm+e1mdByjwJUezAzFeZRSVxBZY5OVsAAi0dblt02qL7mmfRHZU7g8p8pERaiZi41MVtbAaKqnEpG3kCn+q7qT0FPbtZSYKL6iylKtjxnVQeRmV0mYw+XVnyYM4GUHwn4TdSZDULnvT9FPD3xXFM7JfIO3JLhZOwMv2DfWGgpg4J/T4X/LI+YnC2+h9tGo4hpDTgBVL5Ilh246Vlw5uoRQzYDl4GRtfQubEh8zSwVaGtAyXvQ1IZ6xPxjbtPD6J8e/g2tWZWTzYsy2wG3TldX4Sii0nSYesybMQu+g2ZkBDA0+FZnPUrl5Rm3iEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NYddnjk+RnaHrq0LwxfvF+yiaY56Thd2OXQFOnO1u0=;
 b=m2HAUuN1k8oMixfEplWp5w1kNccofXkobYmZJV+ALylyk3dpBUTRisT6lAvi+jJtIr3EuyBUUjmGKDAy5wD7ahaSKeffjYJcUxF7xvLM9gdHR4Em/DvyiMR15H06yfHxgdaIwZaV2aE89I/rBBKnH2Jo63HBYL467f5Rop7T+jI=
Authentication-Results: acm.org; dkim=none (message not signed)
 header.d=none;acm.org; dmarc=none action=none header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB5484.namprd10.prod.outlook.com (2603:10b6:510:e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Fri, 16 Apr
 2021 02:10:25 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::9ce3:6a25:939f:c688%4]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 02:10:25 +0000
To: Bart Van Assche <bvanassche@acm.org>
Cc: Asutosh Das <asutoshd@codeaurora.org>, cang@codeaurora.org,
 martin.petersen@oracle.com, adrian.hunter@intel.com,
 linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, Pedro Sousa
 <pedrom.sousa@synopsys.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bean Huo
 <beanhuo@micron.com>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Wei Yongjun <weiyongjun1@huawei.com>, "Gustavo A.
 R. Silva" <gustavoars@kernel.org>,
 Dinghao Liu <dinghao.liu@zju.edu.cn>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/SAMSUNG
 S3C, S5P AND EXYNOS ARM ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/SAMSUNG S3C, S5P
 AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v18 1/2] scsi: ufs: Enable power management for wlun
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq11rbb0ynx.fsf@ca-mkp.ca.oracle.com>
References: <cover.1618426513.git.asutoshd@codeaurora.org>
 <d1a6af736730b9d79f977100286c5d9325546ac2.1618426513.git.asutoshd@codeaurora.org>
 <f111e363-c709-fe3c-65da-450c9e9e3408@acm.org>
Date: Thu, 15 Apr 2021 22:10:21 -0400
In-Reply-To: <f111e363-c709-fe3c-65da-450c9e9e3408@acm.org> (Bart Van Assche's
 message of "Thu, 15 Apr 2021 16:11:23 -0700")
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: SA9PR13CA0042.namprd13.prod.outlook.com
 (2603:10b6:806:22::17) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by
 SA9PR13CA0042.namprd13.prod.outlook.com (2603:10b6:806:22::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Fri, 16 Apr 2021 02:10:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3473df74-9e4b-4197-135c-08d9007ccc02
X-MS-TrafficTypeDiagnostic: PH0PR10MB5484:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB5484094EEA1D2E8AF11FACDC8E4C9@PH0PR10MB5484.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IdGc0eGSLAPYVOkqjXWDs8nZmWqJjLDzO8YJIjoo2hZv+M8zwh+8t9yCkhXojFtzxIUTb/vsIuQln5oapLPS4rHuv8H2eTWm4aT3IYNVHVJjUo8nkOQgFKeOF7v1pTm2RRyJGs3zBcWirOnOed9hUPrDAfG10oRe0dCGASrBTnmkS+DYBuByBsIIP6DxR03mx7d/dvKv4FGE5W3O5Co6gN2gog/MsWCEWMXUQraf7zBGONEwJuQxf4id1DAEKog3+dE9xDjhDUfENbpHIkRhkWxg+WBkUg3txF0EWgC7X3nj3VL9YZM6PSV02l3zW5/KvX9hrT0bF9Z/svF6uehHUjmmTSsYCDOKeuGuNruKj+KMinrF4GBvfKkEqoHUQyFFeeEfRsPjoOQ7zwotAgiEWC1973b2SWrp0QF1vjbIGYB140M11VGNEM1983Oy463Ur5481SQCvFHTXQ0ycN/t/SS5RHsBJQcL5pEWCM7lTy0yXnPWDAp8hyMWw42d3wpdirMMXYIUHZ6d4QA9KCJ49wP0GTLX/06s2W/WBu2kq/dg62+uwS/jUxcbg3Typf50UU+ew8DfR7B9eiBLmd4Kt/oZWtsAB5belHitXnoimYpkk928bNToldXSNMukrvXCSWpw0RxRzqudOJLW+m66JA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(346002)(366004)(136003)(376002)(2906002)(54906003)(55016002)(508600001)(316002)(66556008)(26005)(186003)(16526019)(66476007)(7696005)(52116002)(36916002)(66946007)(6916009)(558084003)(6666004)(86362001)(7406005)(7416002)(8676002)(8936002)(38100700002)(956004)(5660300002)(38350700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?MHPjUO8CMNTcszas/9cu1bzKjiMIjZt7IS2l7JaQm1bZ0ZCJaGXF5pX8S5Xh?=
 =?us-ascii?Q?+H9zFyGAZIKeEjQikGGB8BOKKqN7aYoViFG8s7++Q7QtfS5gB7fifTuO8w5r?=
 =?us-ascii?Q?HZrkimdSMNSpAQknA+fpc9CzQjkgj0SN2tK0eADS1as89y5CLSjC1xZHytGj?=
 =?us-ascii?Q?lneYkB9hdxSxrLOKAlY0ZPKMU7X7H2evG6Q49VWqeRDSRMajIo3zN4y/tm51?=
 =?us-ascii?Q?Zcm4iJpxQs009HJLARvHun3RX2a5CDqJoY26B5IJ/vyYNI0rBxHBJPwdjtFU?=
 =?us-ascii?Q?LtJ2OP1ytqg7X8E3AKxpA+KbKfddLqLyqzyEIURU0Y0xXlSDbpXjRj1QuQhq?=
 =?us-ascii?Q?Y1/nwxKuGnHovdj3K+cQBX+YrFgYMSbI2Ez7tPP9UFZwfUP5o77BgUXE7kbY?=
 =?us-ascii?Q?dLaKVlvAjqs8Q0jgLbYrHTRhyHBz0uy2PYTxdMkzmT23xdmgZgXMumfk2+v+?=
 =?us-ascii?Q?ID8ZKFAtSVZEtPk7ynJkYlszrUo9vGbUxOH5QienX+arm1MSjaEnqrVFxCrF?=
 =?us-ascii?Q?Moqv5PSH47oK5ONjLw66nLEKJ8c2/2uJm5uN6V10HLPzN90Dnm9JSwg460gd?=
 =?us-ascii?Q?go+R9eDZ0G7xZPSDw4cxvn5xO0IEei6AMK9HQeCHG/DgyzvhJSSBs08B/STg?=
 =?us-ascii?Q?lrBbIZBPmZ1+0/fO0dmibXD7qN9Wvg6dkIXEZggmsY5Zl8L3rk9nMYDLkU7l?=
 =?us-ascii?Q?W+ziqSdg7kyVqHHNRLIOlyJsrGx/egKuHsEZJvB87N3pd2Gj9UiPKHOBWxvs?=
 =?us-ascii?Q?nBUIRzeZMEDQB+1eMkSk6w2ew8Ebd2ChTKMAbDzs4jp1wdXo921SSnpbhrLg?=
 =?us-ascii?Q?bR7wCvN+AOfTGYpvvY/kBbqC/xSyF8sRfbDdIe4BNo5bwSxJXstsUdwV6Fi9?=
 =?us-ascii?Q?6Bxhhb4KG4lQrmxhzutL40PxSZtAdL7VnBheW/ikglo75oEqJ9I6i5rpBVMZ?=
 =?us-ascii?Q?HOESmOsxZGAw19D7ZJBaB8RRo6DaUeWk3S1MvdlJ6/W0UNN26rZo9c5c8VrL?=
 =?us-ascii?Q?z0p+8fRKrp1ls2lj21YWNfksr/7+83WE98qGB8WMpZNYFj53sJZOQE8uYe+p?=
 =?us-ascii?Q?TSYIbzdPpc044OMUqY/VEG/o15EyW4oKaJWZe7duBl5MXCtRmtnjqAhFLVSs?=
 =?us-ascii?Q?brxCBkt7wo1w206gzz6i4COQXvSiB4YRui2a1dRQKAA1OKyebhdL+auQOSQt?=
 =?us-ascii?Q?jBGTtN2etnf1dGV1nnGphNZUyrgsa//mP7thLxXBUZPpWlxS4Gk5Gq5xswDy?=
 =?us-ascii?Q?XfU6KKOWvzs6uBT7FpLb8pCMGROBFOk+1dWPPmYxXJjx0bX/F11l7nLdm/1u?=
 =?us-ascii?Q?VeBSfNruzR5NdfCksjq63wwO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3473df74-9e4b-4197-135c-08d9007ccc02
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 02:10:24.9244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /dx5CzDIkblNOl00a/Wv4bc0Pu8sHT19ip3yXoPKYrLamQTG+QSnQCSMTvmOucahf4toTMzqEu7EicGf50MNdw3xQwR8pnZvEEm5txqInrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5484
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160016
X-Proofpoint-ORIG-GUID: ARO0uEsIKqF_rEuBOT_JHknwppqKrVDN
X-Proofpoint-GUID: ARO0uEsIKqF_rEuBOT_JHknwppqKrVDN
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9955
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104160016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_191113_924082_F55A61BB 
X-CRM114-Status: GOOD (  15.62  )
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


Hi Bart!

> Patches sent to the SCSI mailing list should not have a "scsi: " prefix
> in the subject. That prefix is inserted before any SCSI patches go into
> Martin's tree.

This doesn't actually matter. My script will add the prefix if it's not
present.

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
