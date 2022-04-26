Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 04:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mrHoj3D7Qvwdk+2sOiIJF2CKovWvbI8yMKL4/jsBXQ=; b=I/o7obbKbfYQOM
	/7xFKMVpSzAVPDzZu+lNJBv8ii4kaUyYrB1/0u62IcXEVxu7sMI+J3IyO54cIgIeDAokC/sxrKFuD
	5qFRqBTJbFMwg2PtWwbxiPNswCM98hfFgbwppjCI2kNPcymW5IVQmNwG1n+Q1jCrbpoKyTdWR9E0w
	EEwdh3CW9gcP6Ubx/fOJHoPyt3f8id7rxo1M+/TmOPrCg2wDifJTjSKWLGwKW0S4zNwlJOsj9cnno
	3hoTqXy+6Nr4S45juSpZLyZNNAas5t+1Mobhjw+K6bBEL2STO2CY+4bMYYRIYRyrwZfbTCgXni+OA
	RluJ2Gj3zlnWq6TOPciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njCNn-00CMMY-L0; Tue, 26 Apr 2022 04:00:59 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njCNk-00CMKn-0T; Tue, 26 Apr 2022 04:00:57 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23PL8t2i022267;
 Tue, 26 Apr 2022 04:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=VfaAkAPyUePRFxMzN4vqCs4A6PVXSAifuZPdHgE9/bI=;
 b=g30R3MYw16RtEFJoD/k/wG7apkc24EzrkocSqiTxKqOanPgiMm8TrNvPwmGPiSH2OPGn
 DtMVSx9bNUJNvK8eYhTyyPW2osoW4uN5Zyf6KNcL1upxZZCt0hwdTKC53CfyRpBp3wA5
 3fDnWX+G7TXLBoJAC7QiaX8XJwt8/A6JEvwYZs6W9OC4h0xqMnTu9B4Tot5rGAqlK11f
 4J8Yylg5ttBqSb+Ht7SwTsZds63CKPsNjZCZBCQ2ks/u67LsronCEAfYjqoeBYXjBdJO
 VNsnzqek+waFTQnrZIupbsCwpQNsJmb7Ey13B2X/9n2eGAXf1ibMM/2u1KbKdg7bRMnO PA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4d0bt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 04:00:49 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23Q40QVv029494; Tue, 26 Apr 2022 04:00:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5yj3v2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Apr 2022 04:00:48 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 23Q40juV030030;
 Tue, 26 Apr 2022 04:00:47 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fp5yj3v10-4; Tue, 26 Apr 2022 04:00:47 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Po-Wen Kao <powen.kao@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Avri Altman <avri.altman@wdc.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 chun-hung.wu@mediatek.com, chaotian.jing@mediatek.com,
 linux-scsi@vger.kernel.org, stanley.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, cc.chou@mediatek.com,
 wsd_upstream@mediatek.com, peter.wang@mediatek.com,
 alice.chao@mediatek.com, yohan.joung@sk.com, jiajie.hao@mediatek.com,
 linux-mediatek@lists.infradead.org, huobean@gmail.com, jason.li@sk.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] scsi: ufs: remove redundant HPB unmap
Date: Tue, 26 Apr 2022 00:00:43 -0400
Message-Id: <165094528686.21993.15243100183282892659.b4-ty@oracle.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220412073131.10644-1-powen.kao@mediatek.com>
References: <20220412073131.10644-1-powen.kao@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-GUID: 5ZG8fnjdj6FEVSC0UJ8zd_-U7Y1gxeCo
X-Proofpoint-ORIG-GUID: 5ZG8fnjdj6FEVSC0UJ8zd_-U7Y1gxeCo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_210056_212164_95E4EB7D 
X-CRM114-Status: GOOD (  14.56  )
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

On Tue, 12 Apr 2022 15:31:28 +0800, Po-Wen Kao wrote:

> Since the HPB mapping is already reset in ufshpb_init by setting
> flag QUERY_FLAG_IDN_HPB_RESET, there is no need doing so again in
> ufshpb_hpb_lu_prepared.
> 
> This would also resolve the issue where HPB WRTIE BUFFER is issued
> before UAC being cleared.
> 
> [...]

Applied to 5.19/scsi-queue, thanks!

[1/1] scsi: ufs: remove redundant HPB unmap
      https://git.kernel.org/mkp/scsi/c/25a0bf213b8a

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
