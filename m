Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCF1C47DB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 02:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSjQwz/LMG7SM4NIPUeOK917k8N7lEdxTH1OYuR665g=; b=uzJviRqP4pduVF4qs/Lyb8gHRs
	PhE0UTr+f3WBkCgMB067IeBKZ7S9AN13O4gUmBsXD1g62lTQ/aCpoYMEpwC6F8+CfzMo0f86VVyaC
	pW4o3e8f5fm3dMtVhq0zXk4rU4cGv2EX9fNxpABRO37Ht/Hwuf4p/FRd+0DEOKGfEdUOPGs5AH2kT
	gl5FIrqXd/zRtHEktp97j0DIrHiZT6xx3YU+1Pu4ZMKEvOOLrc+bJCl3x2nTz/Xj2d7PeC5iRDMIr
	AyApi58s/Ief7B97jUYU4BxvCLICWC7yZDHh2KmbXgjJB0kYKp4PJLWG2tFAu4dGllsV8Ti97fWrr
	renVyKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdr4-0000000Exlz-2TpQ;
	Tue, 30 Jan 2024 02:28:06 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUdqp-0000000Exhn-3Y45;
	Tue, 30 Jan 2024 02:27:53 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40TJi1lT016789;
	Tue, 30 Jan 2024 02:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=PSjQwz/LMG7SM4NIPUeOK917k8N7lEdxTH1OYuR665g=;
 b=CCIe7+3kbfSsRluYQWioOta2zNTIjzOK2dJuj0sGEVg41oO0sD+xjmreMT15x4VVThyL
 y0jYYO+lZOZc6uU9JASedKsa4qGMI/angRcvhV82aBa6ULXUXcj0h890H5iU+rpJs5Im
 mpHMhAa6Wj+bMhzJmUVYQPE5Wi40zfKwd3UyuHAWgVn7SAgH8PGPZiiwt3bJckkIwhYg
 WaIGduooxgSuvmugFpWScRm5ZoLKxM8ASjMcJI/oW0Dkz5US12Tze58/TKQLh+Lu6CvA
 qea4ncsig9bYuk1w+XXTHlh395O0hRa6B9bZZZoZqtietu0fruTw4qHhsMAs4XShOvFC uw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vvsvdnf4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jan 2024 02:27:46 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40U1Jbse014551;
	Tue, 30 Jan 2024 02:27:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vvr96g54e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 30 Jan 2024 02:27:45 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40U2RP04040916;
	Tue, 30 Jan 2024 02:27:44 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3vvr96g4y7-13;
	Tue, 30 Jan 2024 02:27:44 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Maramaina Naresh <quic_mnaresh@quicinc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Stanley Jhu <chu.stanley@gmail.com>, linux-scsi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, quic_cang@quicinc.com,
        quic_nguyenb@quicinc.com
Subject: Re: [PATCH V6 0/2] Add CPU latency QoS support for ufs driver
Date: Mon, 29 Jan 2024 21:27:09 -0500
Message-ID: <170657812656.784857.12349810743131732483.b4-ty@oracle.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231219123706.6463-1-quic_mnaresh@quicinc.com>
References: <20231219123706.6463-1-quic_mnaresh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_15,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=764 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401300015
X-Proofpoint-ORIG-GUID: Qw1lRoHD-ORVhe2pPJxh4GIgqthnKFHF
X-Proofpoint-GUID: Qw1lRoHD-ORVhe2pPJxh4GIgqthnKFHF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_182752_044992_5F5185CC 
X-CRM114-Status: GOOD (  14.51  )
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

On Tue, 19 Dec 2023 18:07:04 +0530, Maramaina Naresh wrote:

> Add CPU latency QoS support for ufs driver. This improves random io
> performance by 15% for ufs.
> 
> tiotest benchmark tool io performance results on sm8550 platform:
> 
> 1. Without PM QoS support
> 	Type (Speed in)    | Average of 18 iterations
> 	Random Read(IPOS)  | 37101.3
> 	Random Write(IPOS) | 41065.13
> 
> [...]

Applied to 6.9/scsi-queue, thanks!

[1/2] ufs: core: Add CPU latency QoS support for ufs driver
      https://git.kernel.org/mkp/scsi/c/2777e73fc154
[2/2] ufs: ufs-mediatek: Migrate to UFSHCD generic CPU latency PM QoS support
      https://git.kernel.org/mkp/scsi/c/0652205b4ce2

-- 
Martin K. Petersen	Oracle Linux Engineering

