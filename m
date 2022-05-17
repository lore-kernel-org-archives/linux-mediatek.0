Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561FCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 11:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fDDozqhXJs4WdnWjpKcJWakppCTGUw1uO8vg3IXj0i4=; b=W5DmK/DyBP7o+H
	UkBZV9M0RCKHszavLiH4vp/KbUZFv8sQc32VOD8KUL4rmmPZHDpxbZD2PGDkNHhCG0BY/H1ZH+5yl
	NVNicviMvjpxz4HSb74UhEa0WjMzcEBpIS+a+kHFFRdme+7U9WdsiEoa/9+6behwIP7FidtOxyxVW
	XgktIgGWBkxb450cykyxI+cRtg3vMRx20AtnWt6un/cCV19wbkhGR5V6KASasHg7OpJYtVjirjY08
	R1aTeAj8kpMtB21d5OU/DeIe3vyCSJP9zPnxj4NHw/stMpeaUT6YiwAf9+G6WWIGzq2OwrLEvQ3Dl
	95OMzsgtCs5ImEElIUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqviQ-00DQ1J-2l; Tue, 17 May 2022 11:50:14 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqviN-00DQ0a-I1
 for linux-mediatek@lists.infradead.org; Tue, 17 May 2022 11:50:13 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HAZAEa023730;
 Tue, 17 May 2022 11:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Ewq0a/e2dM4L3nADDufcVXK4nfXcSJVLAhvAwlim6FY=;
 b=vDrOSukuMMwsGn02MmGoiEtFeeKi6n7Hi9AuFZP1rt5/ZtSo0vSkzjf9wgGduQB31LiI
 aWfDKk9eGnrv2E2JqeZ2lVhz21WuBJ0EY7iA7FS8OHxcL2xHfw90iRb00b4+NF0Mmcz+
 E97X8/6qtvSvn368WeSRp3yM+rOVFLcvs4JCPMD9I53fQVhUSQ7kQNJGSDX60Bh7mz8M
 XmwAqL9TF0WH761SIY3t7nVii06WaxzmVs53cli+xJpUuMzEbi+insfZiPaxrwz8f9h+
 7j7gO5WODoI8T8zJeYBWkEnf44cQVRmnMwL/vjY1N/QjLR8k9riWsnvtCd7AcRk0yVUA bQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g2371x1wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 11:50:10 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24HBjvlW022830; Tue, 17 May 2022 11:50:10 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3g22v8ja16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 May 2022 11:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uxi/TN0XZPyJSYj6ZslgusvBgg+hUsgr7TcvMtYNZ4B/VWGZ8PrSBzHlkkYtTJ17qknlKz5WiKYmBmFYoFs9sBc7tRVM5lKGg/hpJ4RGRoBWTBObmVE0ECLp9noKRmeKEHinvePES2mP4FANVAcAty41y7x/5EpHyB9GjNp0t5cMKAQfu3oFegec4a0fPZJqo0gXBER4XETqBKwInbb4c3bdJFCyzuI+BU7u2lS4XXxj/XZQKZeTDSWZmUQ9kb5whTTt/zNNlwsXZP+sZV8Wi5FJYb95CWrNrK/4zAAm9ddjbbboES4mpAlniSxne1if3EXANGwEOomZRANOOisM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ewq0a/e2dM4L3nADDufcVXK4nfXcSJVLAhvAwlim6FY=;
 b=AgSzDzA1FFFBc/A7gPAJab545WKOGx811aTxOnUodDxGBsblWY4UMFGAhvvTfozBexScFge5pkXg1K/XDlrR7Ed5DWCvRisPrFVy60H1aAGDWyylV20vQrz0s0BSCxhl/I2cxvtNsyDqz5FtDZ4VRdvcJKTqpNpnYzJGmNMOYArqDVORs1SmXrawGKfsW/QynAoK5gOsAUxutXZ9vaOjWOM9Dh2jbZCLU9qhcTh3WZN2dQQNKzmd3uOx7iqJDB0zWvWFavn+zbWLl/vVMSukS1cljUwolDemE5RsTRGTy5IQGOJac48jsCmaMvdALeXGGC1Cdm7lQa5pBc6kTTO+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ewq0a/e2dM4L3nADDufcVXK4nfXcSJVLAhvAwlim6FY=;
 b=BVz7/AeNuHnF7jUWTWXTSySYVu+nGoUAvnyYJoVtf4zeVEhudwc1J4MtloMCiXrnrpIH5njNzS6ImxMPJgRYK4feWMQSJQLKibYmowu4e8kuM/NfW6acepljYEj/g8J/6UN2lFd89/Lzo7tnxqE3PFVvMsPlNZuYyMDzJhANJ2A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1770.namprd10.prod.outlook.com
 (2603:10b6:4:c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Tue, 17 May
 2022 11:50:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 11:50:08 +0000
Date: Tue, 17 May 2022 14:49:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: haijun.liu@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] net: wwan: t7xx: Add control port
Message-ID: <YoOL505vRMBGxX45@kili>
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0033.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18101d99-63d2-46b9-9fa8-08da37fb640e
X-MS-TrafficTypeDiagnostic: DM5PR10MB1770:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1770E2E7406DA3E6957984AB8ECE9@DM5PR10MB1770.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tj7IX1uf9rptVKfG3ZBIHtOG3spXc4o/pXRwRz7vM+FIdw0f6pAXuSsFofwTpZdWIkjfcveTru8dW4iyagLzI+ey12rpZQE4dMEKhZaBBJjOm+2R1cXJ3Ca7DXZHFpxq63lWCwNUeyvtyDaDkgYbCH9U47ujkj9S4E1LOSkX3qqX991chukl/J89AGA83ZwD7IWpvjlF/+Cf2WVFH4LVbUsFsY0igP7PQ9rGlUxrvOMLkRCZG54Ty0vxtb9c/BC/oJspi4rY0oGDzw8Mj49rrSz5ckkgoPEw/mVx7x8l0YZ+3tXJ6ISLMOlCm0MvnnSf0u5B/wgLetZiXcU/gocGjaG62RZbiWQAXvTasEoJR0zM9/u9T94JB6dInKi6QIQTUV24bpG1cwaQpkBQBlOGY8HsQaq6ccwutiYqM7MZmx/+tPO5ayMYbrWLsNoankCIG0CMV1rp9VsXGz46pJxFyFcniPYc4fSkwqkxmyDu0XqeAguLzNG+sx884aOEvcOruMgH4xlOpEQUqLWoRc/tx6SQ+GWTDBq88wpGEeW/avFRYbYq05XEtVngrzNSJXmFj8GjrgviDsgGrA7lK1du5dPU5dp7eg1DrzqoeR8Ui/GB1ahcZ4Q+gI5VWTIpqH2YeR3KSMAeRglOuuBY9/Ax7ptElluHaK3SU2SqOLyuWz5i7tYxvYFhNS1MH/EGa9yGOp6GzeBFcaWnaIpqBpEj6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(316002)(6916009)(66946007)(38350700002)(38100700002)(186003)(4326008)(66476007)(44832011)(66556008)(52116002)(9686003)(6666004)(6512007)(6506007)(8936002)(6486002)(5660300002)(508600001)(86362001)(83380400001)(33716001)(2906002)(8676002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C+N4GJ/UAtZakgKsxT9bq+MwcDe8qvFtjLWSH5pfdfeL35Ikh6bKKLQTQ+5x?=
 =?us-ascii?Q?PqLAqWlh73g+M9nGaOmqFj7FmNZmzTdf0FevbQx/4RsYaxOu89zTM697BMjZ?=
 =?us-ascii?Q?6yKGZYvZZlSZ5ENSrE1JQTHYG7K8wzifaPr6T75G7EbH1NUM74YTr0BFwlUY?=
 =?us-ascii?Q?7i8V01kWV1V76eBWeWAOXK26NDbAzZ7yPdsfRdkVstPoYuWv0F4ijU4mc7vZ?=
 =?us-ascii?Q?bRBJZkY4toxU+zE1RGFg/7IaLQNdklx9Vf3HusIlQ7jzYnXc0fF1Xwo+zuLT?=
 =?us-ascii?Q?SThhlHIV5ij+cJ1MwQ4PjpOV7U3ZcdcazLR7jDJ26n/jMiZctzD0d5dvxmil?=
 =?us-ascii?Q?AbHhhe1q1sZeKGthHr6F1AcWpnCSaLfl0jC/VcDFzlaKrom5pA76PNzJqSA9?=
 =?us-ascii?Q?toaUxbgUUY3F8SeivQvi6tu+4qSYgCi/xFhHUXDN3c5SDwOqqGPFzZlN4TJo?=
 =?us-ascii?Q?SBfaNDkKWNt/cC6oTVA39qH5h1b0ymR2AYuzj3U911iPfrIeNpmtfZw1lv0d?=
 =?us-ascii?Q?vPQTb4b0FLAnYaURn4Hp1Zut5UntbBnIGDqP5Y2YNrWeluFLgDL0TS3My97E?=
 =?us-ascii?Q?lyRFznevrvbNsUIH0F2ClGNB4Cu7VP5Qmiy7LuFuPRhvExZlcmvfEfBq67pt?=
 =?us-ascii?Q?XDJ8I1qizfoDUzBEfUMCYYcOxKKLMnKejDUnjnKFkcK8WhpNua0g2eR3Il5d?=
 =?us-ascii?Q?utjtUyRTTg9wyMHHdpkSt5DSvPnS3YhZQww5iHYlpIp+szJLV1T/t3doBNxw?=
 =?us-ascii?Q?P3NivMAHt6uy5gABQ58UcSZrmQERWLVR7qQqkFgbDVPAucFLzZmABXmX11XP?=
 =?us-ascii?Q?rYUEhjM1BrcQNgf7dtH/N3RudH6WlML8JtgCnsXnUUhBbtOgI4xhxvggQaYR?=
 =?us-ascii?Q?nXhKhVAQQPLqa7vbrI3hE/MAnKsDkMLbkMwiieFyXhepLjfG8F0WbPohg4mi?=
 =?us-ascii?Q?fYI39oEj2tbof3lvG7NQTUzAMGxNEXbsw2IYVlc3onHNzE2svw5V8Q5y0LQ4?=
 =?us-ascii?Q?hJff7l14KrgS8V2ulaPpPJWc4qLVxFfvXxnauDhVMDz/mltIWNNcgrFqDcID?=
 =?us-ascii?Q?3hn4cZresG3xoome8kmNGEZUPzBGA7H/mJPzZ63n0ECxj1Ky6sM4SudpfOXq?=
 =?us-ascii?Q?BS3BU+DVXF+t/AQoYcEgvj6BLOluxqf52lTRlFkqfFuYbD1aGoDss+eZ4T1M?=
 =?us-ascii?Q?csZEhppiuojZEVKdjbxNtp6YhWASGnuarXMCDNA6oawVpqLgwL13ELTZQQgS?=
 =?us-ascii?Q?kvMqrPJu3/rpaZzQpzH4V3wmF4pyp1oqegxfvWtsHNx3nvvVyqWatE3Rzay4?=
 =?us-ascii?Q?DFG0SgPiQ2vXq+Yp3603g08ul1GAkgjH5Aqb3WBIsfJ8i4mGskv5j/nZaAVV?=
 =?us-ascii?Q?W4HPoJ2xhWQPGUpUtyhYmeWnTSKglEftfzMfgRLUmytj7cG6AUfstOYhbx/W?=
 =?us-ascii?Q?ZwoKCpS68flkcjiJY/66ydbEkU7MbHbgelxQ1gFz3S/XUGBeIsluxc/94VfX?=
 =?us-ascii?Q?ChVwDuzlRuqqVibIzB9feMpPiZWTO53nIYEHmqwWfAjiaTDkyPteEIQFpkKn?=
 =?us-ascii?Q?WT1XOmXsBX4viNWQUHso8J+2WHZ73migKafI9E7Ffj5gDYLHdkKQc/TD6B38?=
 =?us-ascii?Q?5xF4AYNWtW51eXielggiT0VYr+ZTTYww+xCXgmW1ke9bhe2fDWA2pXEnqrCc?=
 =?us-ascii?Q?jpV6P7AfFxoX5odVR+DR3VLlYwO/djOPB0si7Lelh8MchvKzj8zN0b6QwxRG?=
 =?us-ascii?Q?h5QlwqkyIoblaW5IkoBE7huWGbfJgU4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18101d99-63d2-46b9-9fa8-08da37fb640e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 11:50:08.3532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VS45gWWEScJ+S7xfpawI21MbN6WFnqKgp7kAik9sY8iyP3eKsr/Vb3dzbYo0piTaPuklrZfDUGl1aKVuAfVzyib9uFY3oCZpp4HZF6T8o/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1770
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-17_02:2022-05-17,
 2022-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205170071
X-Proofpoint-GUID: RStKTQLssIyu9BlihyWcz6YSeek3LDQM
X-Proofpoint-ORIG-GUID: RStKTQLssIyu9BlihyWcz6YSeek3LDQM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_045011_767903_C8694916 
X-CRM114-Status: GOOD (  11.02  )
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

The patch da45d2566a1d: "net: wwan: t7xx: Add control port" from May
6, 2022, leads to the following Smatch static checker warning:

	drivers/net/wwan/t7xx/t7xx_modem_ops.c:499 t7xx_core_hk_handler()
	error: potentially dereferencing uninitialized 'event'.

drivers/net/wwan/t7xx/t7xx_modem_ops.c
    457 static void t7xx_core_hk_handler(struct t7xx_modem *md, struct t7xx_fsm_ctl *ctl,
    458                                  enum t7xx_fsm_event_state event_id,
    459                                  enum t7xx_fsm_event_state err_detect)
    460 {
    461         struct t7xx_sys_info *core_info = &md->core_md;
    462         struct device *dev = &md->t7xx_dev->pdev->dev;
    463         struct t7xx_fsm_event *event, *event_next;
                                       ^^^^^


    464         unsigned long flags;
    465         int ret;
    466 
    467         t7xx_prepare_host_rt_data_query(core_info);
    468 
    469         while (!kthread_should_stop()) {
                        ^^^^^^^^^^^^^^^^^^^^^
What about this is true on the first iteration through the loop?

    470                 bool event_received = false;
    471 
    472                 spin_lock_irqsave(&ctl->event_lock, flags);
    473                 list_for_each_entry_safe(event, event_next, &ctl->event_queue, entry) {
    474                         if (event->event_id == err_detect) {
    475                                 list_del(&event->entry);
    476                                 spin_unlock_irqrestore(&ctl->event_lock, flags);
    477                                 dev_err(dev, "Core handshake error event received\n");
    478                                 goto err_free_event;
    479                         } else if (event->event_id == event_id) {
    480                                 list_del(&event->entry);
    481                                 event_received = true;
    482                                 break;
    483                         }
    484                 }
    485                 spin_unlock_irqrestore(&ctl->event_lock, flags);
    486 
    487                 if (event_received)
    488                         break;
    489 
    490                 wait_event_interruptible(ctl->event_wq, !list_empty(&ctl->event_queue) ||
    491                                          kthread_should_stop());
    492                 if (kthread_should_stop())
    493                         goto err_free_event;
    494         }
    495 
    496         if (ctl->exp_flg)
    497                 goto err_free_event;
                        ^^^^^^^^^^^^^^^^^^^
Uninitialized on this path too.

    498 
--> 499         ret = t7xx_parse_host_rt_data(ctl, core_info, dev, event->data, event->length);
                                                                   ^^^^^^^
Uninitialized?

    500         if (ret) {
    501                 dev_err(dev, "Host failure parsing runtime data: %d\n", ret);
    502                 goto err_free_event;
    503         }
    504 
    505         if (ctl->exp_flg)
    506                 goto err_free_event;
    507 
    508         ret = t7xx_prepare_device_rt_data(core_info, dev, event->data);
    509         if (ret) {
    510                 dev_err(dev, "Device failure parsing runtime data: %d", ret);
    511                 goto err_free_event;
    512         }
    513 
    514         core_info->ready = true;
    515         core_info->handshake_ongoing = false;
    516         wake_up(&ctl->async_hk_wq);
    517 err_free_event:
    518         kfree(event);
    519 }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
