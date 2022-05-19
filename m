Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49F5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gp08qP6fFlA8rA7xjmmTSFmF4oZ/XT/NfLlRNcbPfdM=; b=eJVpqm7BXfNYYa
	0gjxcrbBonNURskcPsZY8GsU62WNSBoFpqYi1EEo+fGJpZ293RHISUCSrKYm94hDZ/Kwh+FP0X5ZD
	IUryGPmxY22W6+3g+7evRo1X79FhgA8EHLhAzJLogGrn59PDogP6viN9bUXXsuvARleoAzmfE+63J
	7DtHxLRFVaztSNz4qyhcOeIkG/YJ53FksVb95Vc+Ry85YHu2XqN/GpEv+y2w0JaltG6jvW5Y/ND5W
	gHGO+Isp02f+TLAapGoqHA7U44+92ahco6gJI6FPU1M2lrL/5TlJeF6GeYAfkU+QXGa/ideK1mKVU
	bXZ8onzMn/yCgo4E9n2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhkq-007jsV-Pk; Thu, 19 May 2022 15:07:56 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgpG-007Gho-EB
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 14:08:28 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24JCp19L027449;
 Thu, 19 May 2022 14:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=oyL4sjCVA99zjLQ8ykrA9DZhGha3aqLKxWmTSPZxw4o=;
 b=dSwLSMrLBBFZ0OLtDWvbTEUtilHxRLDDbkj7ytSD3CzKzhBMGT+8vphjeMq1BVMWD7C2
 8PKz+diQFjfruhkK3tfoOXXKl3DijrvdwCwcpjTt+08dbpx23cXVTQAFg5q3broaklN7
 d46xrKTaLvVIgsvWIzkqmCmN7Av+9ASJZoH+W7BJpLO1HnDTSc8ZRpVSw7wm3zDKesaw
 I7PPP2YxGgrOD7TYLk9spvnch0FQrgOoDB0AEOoXJgiJXjQWdxRQuQrv2VK84yUuatxc
 LKDauSIexJ8n5qepqK1x42Wcqjzis03iLsBj8AY6pj6Hc1eJobxnlpg2vhI26i51jyJE Bw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g241scbqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 14:08:17 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 24JE1mas029431; Thu, 19 May 2022 14:08:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3g37crfnyf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 May 2022 14:08:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbwZc5smbLVjR84Ja7uPhXdsAG5vq8y1jmvJfZCllau/muNIg/qFtXcAQ1HOzvVTNxPoWS73TMoqFFcI6zzbaq855YgG6yQQRTvRkT+IXdtH/xHJWN+50ONht21UTjWUHt0TXiORpMN4y0p30MbdNukkxrUUHXCu6y+5NLoesxvJOd9KPeGVyaVmQzTG56M4ya7+n3mnygLgfC+8BeY6RuFz79ld/gOldLXQ83qU4HA3qm1FEnxzLdH1fkNusAzAWnAlj/Ic87reXQHjcchURKdy8dspgkhhKrjd/RAw1LtHCGt6A2lw/A1up1Tk/HlLH9YtYKPXdiGudtcuLD8XRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oyL4sjCVA99zjLQ8ykrA9DZhGha3aqLKxWmTSPZxw4o=;
 b=n0auprqEu6+EoMpFLEUpGBaYI+z2ZaaIjNzecASDWJHZ/bbuPte2f2X6k/IUbRPmdKwXeIDPGijK6yhkelPu5FBwvWginFmQniMEGdB+QiDunBMmp1ssH6EQWws/n/y/KreyL5WEOjF2/NMfURIV0gxbvFmff9PH+9XN+RqnDcggXfQEh+hNlvji8F1dPwwYdQnz7AVkXAOd6R40Aag61gRSCeJjNX0DkOZVnVCK5VuxGIspQlmWGydYXekvH1WvfnSBT+xYeJQfkRh/zqQF6mO7d0JTKaLZh5NDPHNbgtQUg1tY0aZ0atL2MIw388101g4RIaVpT1SVkKUrulyXeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyL4sjCVA99zjLQ8ykrA9DZhGha3aqLKxWmTSPZxw4o=;
 b=TTooHPCUSRXB9+omfAOlDQd1DRdQlB9GRNTHMoEJfoAc4H5NeYDAfkjBLjEoiuB/Gm17JKK4cahJTktoLrK2aWZsvBaU8P1XoEtJ34hCmqdpW7xddT6Da54G2EuqjvNeM/TC7dxEdyNLZfzs2M4Sx6QQEfRQq0HRRBl32R2LAa4=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR1001MB2362.namprd10.prod.outlook.com
 (2603:10b6:4:32::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 14:08:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::86f:81ba:9951:5a7e%2]) with mapi id 15.20.5273.014; Thu, 19 May 2022
 14:08:13 +0000
Date: Thu, 19 May 2022 17:08:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ethernet: mtk_eth_soc: fix error code in
 mtk_flow_offload_replace()
Message-ID: <YoZPQNFPTQI/6ZhP@kili>
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0082.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1397eac2-df86-4435-4501-08da39a102ff
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2362:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB236222D96E1113FDBD719AE88ED09@DM5PR1001MB2362.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yw+egIatM0qzXRo7p7WIwakeJJJ2AbjexoK0c9J+hGZxKsli1HCwZtMdMkfAqvsOVnn21WC9B4WUmpTn9spfAxmKtZDv5hJAjPlw3X/yrDTKlcFgOiMlnAXrT1BtyxKeCygw22SiBKcysPGpVzC6AUdoQFEpsc/dnhib72pKMRmAyiKDIRnkWHd1sMf42WPfBESVaRKpgXLFdc7yhBI1oS1qoBWN/Fd6/PT25XKHF3dqYJx4ygGN3lmHf7zuneTpTiwXrIbHb6nGn4hMf0gJWeWk9fqu9Hg74wS5O0Z4Vpm3OLstGio5hk4llxS+FfJDy7cD1n5LXASFNtFdO9RDHdMqRkN/WbxvVsPSH5bDQccmfT3H/snEZuihIbXBHRVKqrYE1kORWZPXomj9iQ/ethOv3SKeqkRnAaLfG30k+a1oitRHi02xDt6jYhaB2Gyhbiqe4GvbWR1AaHwoUFufufe2d6Fg7g8feLBXUl+nF0GnbcUzEMrXwfKG/ZK+yqAZgC1re6QdTZu5kteEzq3614B1xlOz8LOw7HzRaaLilujfWeP9WzQSoB1UYZiI7olVrGGAk6BBjEdeoAIeHR4ALYOtWvJS6nr+IzjQoizSajzkE9bJc2/aBcTBtgTbHvHJYrQDRbOAGXBtfNw7G3v3nRof7/uRx8a5nsVe+p1VlPk6rFhLZwmAfguhLQyiGlIh+RyZxkXcyda770PTepl/yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(52116002)(7416002)(5660300002)(86362001)(6916009)(186003)(54906003)(316002)(44832011)(83380400001)(9686003)(2906002)(508600001)(6512007)(4326008)(8676002)(38100700002)(38350700002)(6666004)(26005)(33716001)(8936002)(66556008)(6486002)(66476007)(66946007)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EzHZpu45rBCLT2+UgP8aycqOCUTqGAT49IVBCy9nKuiILowsdYGqjgaPMyxa?=
 =?us-ascii?Q?+Z1XOtHHremtuyS6Vr8oydvVLsB2/wWDYYlh7Fn0pp6pA591y8KU322z8MV0?=
 =?us-ascii?Q?0hMPHYhK7pq2bOhelLtPrGKU5j5E1rKB4wztVmJNEu6XEWpHtoFF4BuEXtnG?=
 =?us-ascii?Q?FvZezxuKyRFSlShnf6gqrM9Yce4weRMOC+SKUK5eXtkpHnE3EU4PvgEQKET1?=
 =?us-ascii?Q?0KswpmWoZG52/klOZz/Mc3DiJ3Glu9ymwZSH25budYSwnc8cqCRjc37nQJIi?=
 =?us-ascii?Q?r327c45ikMArHIfVO7mrKqYTEO5h8kS31/rzEGp2UTibF6hatjgVre3vbo8M?=
 =?us-ascii?Q?l4JAhBLNC+w0RdskD1i6b0sfnv5Kr2vbYWMpzfWzFvP+3eId2sT4ZORpt0q3?=
 =?us-ascii?Q?Qy+7w/8qBZQMNyfTOw57IH23VX5AYVzfWHBjdZmeUVzHj4yTQS2cYR/D2tB/?=
 =?us-ascii?Q?3Wt45891aWZtwakL99KuspqcQC7lixlTEP1pk0kMVMYP73jScHmBF9gVReeH?=
 =?us-ascii?Q?cQLnHWVATFAvRka5pEcVzDPltdPskdk7zTcd44Oxes1XqSzNXF9OqN8SnOVX?=
 =?us-ascii?Q?MoXCIBGEkqfbt3pd5C72WkPC3Ks22pBifkVlTXqDAF4nkwl7MRQLS3i82vjX?=
 =?us-ascii?Q?sNprwGsLSafVPI3f/LKaLNT6K8UmhIs9g10clGAuKrxR+mLUIv9OC+cvqWNl?=
 =?us-ascii?Q?pGVmQc1xhE/gmTqqRRJ4GkejsFNBoG7tWx6CQlNLBpaXbhVc6nSAwlcbrplQ?=
 =?us-ascii?Q?h+gKv076y0JFLnVAbpnH15rvpdK5BalhFWtSrLQ3w4JIsuOksZvlwi3Gv6aF?=
 =?us-ascii?Q?4Ho4/Mv7n+oa0ec/DCN+izy7mm1iCpicbAT2XEN+o6Pfdl1jAcclXmlrhrlv?=
 =?us-ascii?Q?8NzDi9sa21tohCiBWdbCy5jnSnQfSznuuD9jQdUI1BSUWHunEHMY7pQUfVZC?=
 =?us-ascii?Q?3pF2nIz3a/kb2oYhRz9qAwAdRq4uR21dpL1m9VnlH/WCBfH+uA/EHs5oaZid?=
 =?us-ascii?Q?s95XsSL9RTfLyh0/3zcSGSTvaCpC6yHkLZq3rwlQEHq58VHRfv8B7T+RnTZ6?=
 =?us-ascii?Q?+wKxzOZ3H6Ywlm9nx2m+kgGEiPLXDI4ygazeo5AQhL6/pfdcMjZTDYf8BUjp?=
 =?us-ascii?Q?Cl+zPRHeA6Ee5vYJ8tJ30bEfvFiUX3zfq7rY1Z/dVefdiAQWm50+cd/M8M/p?=
 =?us-ascii?Q?rLEfu8BJX2pn8XzLhQjy3oyL6ltsBB7ZcvowfTLAx1Mml5vKtpKiLl0nP7Xp?=
 =?us-ascii?Q?Xl55CexhW5WpIjaEW5JDc+UKZH0djce/zO4rYmMA8mhxLjx1NzzzHhKsrdbb?=
 =?us-ascii?Q?Fiaf3QyXvW+lHRN/rRk2i4vyIkGMvii2fUqfK/QDokk7Nb6oz6C/iNsPums3?=
 =?us-ascii?Q?5zLHb3ymP9PT0ccPy7fJjymPdLh67z2W+ly2aWBKbtug1qxMUp6fu3+D2mW0?=
 =?us-ascii?Q?5dQQtEefGuDyj/sRHgQPJTBjEOvWvJIu/FvSAIHzfwttYCHCQfA+jKFe5fV9?=
 =?us-ascii?Q?y1TS0HQQWHwZVwYtXg3/wgyTahV+jREKJN2yVGXYZWS/IbWCDwTZI+LFSwTE?=
 =?us-ascii?Q?IYShyMO7kSEB7uVcayhIHPyN1fpOmRRt5gasgBPzIcsjR9fYkTnOiPWa6wOP?=
 =?us-ascii?Q?X13DSosz0B5MX4Bzc8i7r2I9Hrm3QyDsTulmMWNkdQ6EEHK6JHHRtQYTq5+P?=
 =?us-ascii?Q?lJA7BnlTJZnJI+2OQtnEEwVWlhqBvLh4VYANSgI5YEZGadLJ7d3YJCb0guAu?=
 =?us-ascii?Q?Q61DpFmLSsUEjuOcrphG+3tSE6Fjn5Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1397eac2-df86-4435-4501-08da39a102ff
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 14:08:13.0085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/Qlf55NAqbyh7QL1ZE9WKPucRxdAdbPl6kVGeA7YzLjWil5Tms4E8X+87nmzkFVo4LG7PYcULTUd9lv76eJgL+yefBaG6JhaFF8tu9Y1qQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2362
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.874
 definitions=2022-05-19_04:2022-05-19,
 2022-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205190082
X-Proofpoint-GUID: iFm_nQWfzKW68TWHdv1x__qNhBZZEBj2
X-Proofpoint-ORIG-GUID: iFm_nQWfzKW68TWHdv1x__qNhBZZEBj2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_070826_906445_3F0B3B63 
X-CRM114-Status: GOOD (  17.43  )
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

Preserve the error code from mtk_foe_entry_commit().  Do not return
success.

Fixes: c4f033d9e03e ("net: ethernet: mtk_eth_soc: rework hardware flow table management")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The original code used to preserve the error code.  I'm pretty sure
returning an error is the correct thing.  I guess please double check
this patch.

 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 1fe31058b0f2..a641a44323a9 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -434,7 +434,8 @@ mtk_flow_offload_replace(struct mtk_eth *eth, struct flow_cls_offload *f)
 	memcpy(&entry->data, &foe, sizeof(entry->data));
 	entry->wed_index = wed_index;
 
-	if (mtk_foe_entry_commit(eth->ppe, entry) < 0)
+	err = mtk_foe_entry_commit(eth->ppe, entry);
+	if (err < 0)
 		goto free;
 
 	err = rhashtable_insert_fast(&eth->flow_table, &entry->node,
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
