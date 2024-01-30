Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162B4C47DB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 02:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzUezpQzBd4n0Tque+IpmQqiRhLzThAx3OoMrn7PN3M=; b=4ZDm/3jQoN9/UC8OmIyGI+dZQH
	OKhEjdOmoXCWnPNrUD843pBRugxVZ5t/IMJfwurW+wQodUYKnUGeVKNFNYUUkyL4tUWPiy7DZ5WZb
	tZBTyC4/MxhIqehfHcdUbEANmiGrm89qfAEf8G1Sq363rJItLyc6qXMqN7Yax8QEAWPfSc9/WANuT
	wH5ZDyXE8cdv70CP3Xy6cnJ7MFbYCySXFLJtef3Nlt6lJGQAwljfPXInX106tqdTjgirj1lT6uxsy
	tGq0cGjhnBcpsCSHs5F7JjNGRbx1Aml6H91muPLpVjr46YtmZzhYBbYDgtyII7ojNu0LmO6eIxDgg
	c9rBalSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdqn-0000000Exh8-2jia;
	Tue, 30 Jan 2024 02:27:49 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdqk-0000000Exfp-0K3G
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 02:27:48 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40TJiRAR004400;
	Tue, 30 Jan 2024 02:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=RzUezpQzBd4n0Tque+IpmQqiRhLzThAx3OoMrn7PN3M=;
 b=AUMcTwcZ8UEuuDLUyYlfGtMtyoq7jmdGTnyrZs4PpAGvv3pad1TJU8eIT/6W3jlpjtjC
 xskEJWM5DPWV29y8aCFfueSsyI2LS5FrUNEGX5PDfJVO+SPSSxP+GI02aCjiZdrQQ85N
 4FHjYhDXG0dLcwyzFaq9uvl6VTD290lFXHpsoiv9fFRQEsp7a3XcA8V+dNg3HbgBVMVa
 iLxIquSQt97v9nDOYOJkVVYE8PyX3vyrrvvp3H5JgHBlxsBPQkNkGHoVfdfD4BYhiCM9
 x5HHpKvxw5YVzx+lQjUKZRkuxgopsI6p4wE4jsLLNj91hOTiYDh/yX5I7lEB7tDOsyfi HA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vvsqawf80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jan 2024 02:27:43 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40TNuotH014461;
	Tue, 30 Jan 2024 02:27:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vvr96g53g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jan 2024 02:27:42 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40U2RP00040916;
	Tue, 30 Jan 2024 02:27:41 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3vvr96g4y7-11;
	Tue, 30 Jan 2024 02:27:41 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: chun-hung.wu@mediatek.com, linux-scsi@vger.kernel.org, avri.altman@wdc.com,
        alim.akhtar@samsung.com, jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        alice.chao@mediatek.com, cc.chou@mediatek.com,
        chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
        powen.kao@mediatek.com, qilin.tan@mediatek.com, lin.gui@mediatek.com,
        tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
        naomi.chu@mediatek.com, chu.stanley@gmail.com
Subject: Re: [PATCH v1 0/3] ufs: host: mediatek: Provide fixes in MediaTek platforms
Date: Mon, 29 Jan 2024 21:27:07 -0500
Message-ID: <170657812662.784857.16191181039085066671.b4-ty@oracle.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231221110416.16176-1-peter.wang@mediatek.com>
References: <20231221110416.16176-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=878 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401300015
X-Proofpoint-GUID: NJkiV0n_fjGuAiw418eQU27uFr9FqCiD
X-Proofpoint-ORIG-GUID: NJkiV0n_fjGuAiw418eQU27uFr9FqCiD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_182746_149986_724B0A59 
X-CRM114-Status: GOOD (  12.40  )
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

On Thu, 21 Dec 2023 19:04:13 +0800, peter.wang@mediatek.com wrote:

> This patch fix MediaTek platform exit hibern8 and mcq related error.
> 
> Peter Wang (3):
>   ufs: host: mediatek: check link status after exit hibern8
>   ufs: host: mediatek: fix mcq mode tm cmd timeout
>   ufs: host: mediatek: disable mcq irq when clock off
> 
> [...]

Applied to 6.9/scsi-queue, thanks!

[1/3] ufs: host: mediatek: check link status after exit hibern8
      https://git.kernel.org/mkp/scsi/c/29b3a373e2df
[2/3] ufs: host: mediatek: fix mcq mode tm cmd timeout
      https://git.kernel.org/mkp/scsi/c/468b3e0a3bca
[3/3] ufs: host: mediatek: disable mcq irq when clock off
      https://git.kernel.org/mkp/scsi/c/e0dc13e5a3cb

-- 
Martin K. Petersen	Oracle Linux Engineering

