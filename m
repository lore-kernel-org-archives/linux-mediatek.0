Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A38C7EE24
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 02:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppDk0NtdoPwnA/hqpFAWgsULT+yOKmYHv0B85aNUoEY=; b=eXU4ayuKComx8tjqR3RaHOoybn
	uMkvixsP6V5FflsYFAqatt0/AMIHXo4HFvj7ss0fjIMmAsDozslwO23E78u2v3ynD68XUaO57YVIT
	ezZ47w0Wik0xwcX/QFtfjoYEi0L1ILrLYNIjIKQKIeeYjOk96xkhGuGCMI5dI3AbnDOnjOLKWlOCC
	HyYpcc5c7RFKQpdiRrmtF0YR4xSQjsSwSi1lzFethYyhPwuD3LgMEQGt2py3/SJxY7IKTuN1b+heM
	RAF7jhuRKP9Xe6EzA8r06tgchws/6Z67N8+yyAw90KdV4viHZwHmx1O1uPh4375wG4kxrSllOB9iB
	bJ2Ph62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6fm-007n65-1u;
	Wed, 17 May 2023 02:13:50 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz6fk-007n5D-0z;
	Wed, 17 May 2023 02:13:49 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34GJwqMX019718;
	Wed, 17 May 2023 02:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=ppDk0NtdoPwnA/hqpFAWgsULT+yOKmYHv0B85aNUoEY=;
 b=gnbhIS9UxNMkxyYwFEkwDeEkNXZGrjqDIL3/3kUbYrSzkUSxi6Jk4ugmWirQgJc4KeQv
 IpBQulNVjBD4MXLFtwLF58rrMPViDeRfgzoKs2TIvT8qD4KnuLZJckny9rz3omBuZn5v
 /cGFmIOEyoerURQB7ZZrbofkoxhn7yE5gzTGrDq1JERO+qDj+dp87KM0isRgtcp86PpN
 GY44/cAFCZx4nKBN425qd3NKRZ1ZCZ1ALtZsmuoBEBZ/KqmnxJYZeKI/58u5SZ0kmjZE
 jXS3QQDrMN5OioHATSHm/bhEcFf1aHHAVv51icYLX2pa177OUiL3M4VeA+S48KP9Lyly fg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qj2kdmtpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 May 2023 02:13:43 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34GN8fcQ040031;
	Wed, 17 May 2023 02:13:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qj104k9w4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 May 2023 02:13:38 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34H29qF5039460;
	Wed, 17 May 2023 02:13:37 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3qj104k9sf-3;
	Wed, 17 May 2023 02:13:37 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Po-Wen Kao <powen.kao@mediatek.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, peter.wang@mediatek.com,
        stanley.chu@mediatek.com, alice.chao@mediatek.com,
        naomi.chu@mediatek.com, chun-hung.wu@mediatek.com,
        cc.chou@mediatek.com, eddie.huang@mediatek.com
Subject: Re: [PATCH v6 0/3] Several UFS MCQ Code Changes
Date: Tue, 16 May 2023 22:13:27 -0400
Message-Id: <168428957876.722389.3023312263286378543.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230504154454.26654-1-powen.kao@mediatek.com>
References: <20230504154454.26654-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_14,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305170017
X-Proofpoint-GUID: FCjHcAqvovQ7ILZX5jjVT4jM7tPtyK8K
X-Proofpoint-ORIG-GUID: FCjHcAqvovQ7ILZX5jjVT4jM7tPtyK8K
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_191348_459094_A362B707 
X-CRM114-Status: GOOD (  14.07  )
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

On Thu, 04 May 2023 23:44:48 +0800, Po-Wen Kao wrote:

> v5 -> v6
> - Also fix call to sizeof_utp_transfer_cmd_desc() in
> `ufshcd_release_sdb_queue()` as suggested by Stanley Chu
> 
> v4 -> v5
> - Send MTK driver MCQ support as independent patch and address Bart's
> comment there
>     "[PATCH v1 0/2] Add MCQ support for MTK platform"
> 
> [...]

Applied to 6.4/scsi-fixes, thanks!

[1/3] scsi: ufs: core: Fix mcq tag calcualtion
      https://git.kernel.org/mkp/scsi/c/5149452ca662
[2/3] scsi: ufs: core: Rename symbol sizeof_utp_transfer_cmd_desc()
      https://git.kernel.org/mkp/scsi/c/06caeb536b2b
[3/3] scsi: ufs: core: Fix mcq nr_hw_queues
      https://git.kernel.org/mkp/scsi/c/72a81bb0b6fc

-- 
Martin K. Petersen	Oracle Linux Engineering

