Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1141C5AD4C
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 15:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDez5tRetN1AJgLDMvel4wminLzFvgWM5mFAzZfyJXQ=; b=3OMBtcVJrcSg1tXK7C/o6LYDcz
	3kq2WXdtqSDirXADTjlVsjlXQBDuxm9xdZ2+PZ0ipN+goYjrBEHSGDET/OJdtIJtoW8rcpIyKOWqU
	H0dZWUl8nxiXfDGvrG5FZ4PwTFglqQD1fqUk3xfLawuiW4zAn3bjPawY8Dh63EN09UpqcFez+a4oJ
	deXyQzbLUvB+u4pCF2+muCK2akKxUobwZcAH5KfWdZC9Uvo72IFd2kghOBhBL9PIwrjpcZ/MWpzVr
	MS3a3m6fQHJT/PWQYLK2JgNmZpD76CsuqvXzDNrQM1lwV3r/VwC6k0h33SnDslN9pvNByL0TOWLaX
	HfvqMVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HZx-00190E-2v;
	Wed, 15 Nov 2023 15:13:21 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3HZs-0018yp-1p;
	Wed, 15 Nov 2023 15:13:17 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFE4g2g017281;
	Wed, 15 Nov 2023 15:13:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=nDez5tRetN1AJgLDMvel4wminLzFvgWM5mFAzZfyJXQ=;
 b=FqWppTjVjLypjuwDl/gQIG7dXKSSfUaB3Yj+9cXNgvmvhQ0dKLSJYsgFY48eqsxWdoDV
 78OdPqWD60C+eUWljmIBfepowHwHTclADPu4tvucW+s4nZ+0yY3DGbBEygWzDva6WobR
 jpklQ1dYf/fOdKwQpQTNUlZ47TrAKdnCk6FPzsZtw4ojckDxKRTt9lU8+tNV8kCDleb3
 v4KHuiToIcWmnCcCDkoSvsTuuwKd2Qdbuz3D5AeFkTfv2GRrG+R3jNjj47pa4n4wyngs
 1sQn9kOV7xkT74fIyvODwCBx1dNFBFPYsPRaupH5Jc+IuqQYITe1K3AuJ7+E8TsBrne4 zw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ua2strr7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 15:13:11 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFF8rIw004087;
	Wed, 15 Nov 2023 15:13:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3uaxj4087e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 15:13:09 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AFFD8SP011253;
	Wed, 15 Nov 2023 15:13:09 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3uaxj4085x-2;
	Wed, 15 Nov 2023 15:13:08 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        naomi.chu@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, peter.wang@mediatek.com,
        casper.li@mediatek.com, powen.kao@mediatek.com,
        alice.chao@mediatek.com, chun-hung.wu@mediatek.com,
        cc.chou@mediatek.com, eddie.huang@mediatek.com
Subject: Re: [PATCH v3 0/1] ufs: core: Expand MCQ queue slot to DeviceQueueDepth + 1
Date: Wed, 15 Nov 2023 10:13:00 -0500
Message-Id: <170006111387.506874.30054136833694357.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231102052426.12006-1-naomi.chu@mediatek.com>
References: <20231102052426.12006-1-naomi.chu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_13,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=846 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150115
X-Proofpoint-GUID: 8NkSe1YHupy-NeYHRS_P7bkfejE5w5w8
X-Proofpoint-ORIG-GUID: 8NkSe1YHupy-NeYHRS_P7bkfejE5w5w8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_071316_605516_C7AB8101 
X-CRM114-Status: GOOD (  14.82  )
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

On Thu, 02 Nov 2023 13:24:23 +0800, naomi.chu@mediatek.com wrote:

> Expand the MCQ queue slots to comply with the UFSHCI 4.0 specification,
> enabling host controllers to fully utilize the MCQ queue slots.
> 
> v2 -> v3
> - Add patch description that why this patch is necessary
> 
> v1 -> v2
> - Remove QUIRK_MCQ_EXPAND_QUEUE_SLOT quirk and make the change for all host controllers
> 
> [...]

Applied to 6.7/scsi-fixes, thanks!

[1/1] ufs: core: Expand MCQ queue slot to DeviceQueueDepth + 1
      https://git.kernel.org/mkp/scsi/c/defde5a50d91

-- 
Martin K. Petersen	Oracle Linux Engineering

