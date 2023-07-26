Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A41C001DE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 02:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMh1G86btegro+q8PT84XfdXXTJ/MmX3zLsqv/lmEkM=; b=ZvZrOxZIFo5kCzlAxgd1zKDMrH
	h3d+73gF/6DtEZmA7Jh0uoiDSg1FS4/+wJ+hoSJ7SNS059sJ1GrAWbOgDMC5OoABNiIlu4v0nIC+G
	5gimbwuruUtNY7rcgZVW9pMdRiYIWtycGCF/r9lobAI8KrP6/pXA+kvjMp41K77HA5YJzPHnar7rz
	Ac8fUy0ywvSxYOu5cImPQAgTxb42s3iAA12ixh+e/rZrsIEHEu2jrBqCFB2uA7j3RtHKCoSQN0reu
	RwF1M2A9srfhH079cpIypgoz2/k67NOlyLi1scXwJflKkYcmT4MdO7N0fuWWmTm62OOVtCRT/EqDt
	QgGbZ8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOTu3-008tiN-1g;
	Wed, 26 Jul 2023 02:05:27 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOTtz-008thk-35;
	Wed, 26 Jul 2023 02:05:25 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PJIpH4010850;
	Wed, 26 Jul 2023 02:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=FMh1G86btegro+q8PT84XfdXXTJ/MmX3zLsqv/lmEkM=;
 b=KZaxkatBV/AuPE7U5sP/TZzOFr13WzlyxHMU68jKdmoCeSIg7JtKt3OejZwSxjoZqN6V
 Cc42ZWSVlgDdMEmNNwXRbZpltt/WPLvZYCW0ypPNlqo1jIYitbPYG8Y3DScj1Wrk51zt
 sh9tHaxV/VajFnNBZ8W7ITfftga+3rghR8+XwdvFV8GdoABDR9AjgzR1446p3jPBt3rK
 JuV1KSwUhEofoPTaHUpEyIHZkQfMkV1u1rR9z6IeTCtV4gPoA0OeuX9tMowFHCM9XfRA
 eHqEG20hse5tUfF06jsOH3/CDwwUZHiMdvh/xWxm7ZfrFm85H4HcbLuhcTYsnmIUlfxh mA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3s07nupcg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 02:05:15 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q0UmSx023117;
	Wed, 26 Jul 2023 02:05:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3s05j5jd3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 02:05:15 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36Q253Nf038905;
	Wed, 26 Jul 2023 02:05:14 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3s05j5jcwf-8;
	Wed, 26 Jul 2023 02:05:14 +0000
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
Subject: Re: [PATCH v5 0/2] Add MCQ support for MTK platform
Date: Tue, 25 Jul 2023 22:04:53 -0400
Message-Id: <169033702299.2256288.9455380314208185203.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230701124442.10489-1-powen.kao@mediatek.com>
References: <20230701124442.10489-1-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=935
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307260016
X-Proofpoint-ORIG-GUID: ao8jG42e3efmWM1rKiKmGmlf7X5RjES_
X-Proofpoint-GUID: ao8jG42e3efmWM1rKiKmGmlf7X5RjES_
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_190524_006438_67F5DFDF 
X-CRM114-Status: GOOD (  15.56  )
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

On Sat, 01 Jul 2023 20:44:39 +0800, Po-Wen Kao wrote:

> v4 -> v5
> - Remove unused define in header
> - Let chatty log print only at debug level
> - Correct ufs_mtk_init_mcq_irq() that was wrongly fixed
> 
> v3 -> v4
> Address AngeloGioacchino's comments.
> 
> [...]

Applied to 6.6/scsi-queue, thanks!

[1/2] scsi: ufs: core: Export symbols for MTK driver module
      https://git.kernel.org/mkp/scsi/c/11afb65c100a
[2/2] scsi: ufs: ufs-mediatek: Add MCQ support for MTK platform
      https://git.kernel.org/mkp/scsi/c/e152a616c886

-- 
Martin K. Petersen	Oracle Linux Engineering

