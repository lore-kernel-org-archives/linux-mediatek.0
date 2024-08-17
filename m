Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262D4C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Aug 2024 01:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EA6ZqVmrLUT8u1Gi/L2ocydEWTBAELEMEgUj7rbu3c0=; b=uhDO+HiVvQe91zS84thQ2Aoo8v
	Oboa2Kw2wR4T1z3vqC65pa1YY8Yhhaq+8x+CoRo6SyVXTacNhcjJpv0vrxqUpBCt7QJqqdrRPfjur
	JJ1fJ82dgI84hz3Wou66d8s8yQBCS+C9T/6lMd+JQiF1ZTeDTh9u5ferJKsXOV5Sowf+Mw0Wuywlp
	4WrDwHew5yuY11hvAntWxEbuDq1p522Un/hR5x5ZbXvctjpZDaoArgjOTRtJXibEobksE0zGz7nzM
	y2Z3MB+ybARIyax3mD6pEIrnNWFrapzRLHwdTceALHY1jYLeRrvhmIP5sCnW9N7wu1TzRhlHI8i26
	1xxLlZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf8Fw-0000000ES01-07Ey;
	Sat, 17 Aug 2024 01:29:24 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sf8Ft-0000000ERzX-3H48;
	Sat, 17 Aug 2024 01:29:23 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47GLBwI3002666;
	Sat, 17 Aug 2024 01:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	corp-2023-11-20; bh=EA6ZqVmrLUT8u1Gi/L2ocydEWTBAELEMEgUj7rbu3c0=; b=
	Km/2mFSpOhheyR1VtQQDRx8XfDGWbKLYPxkU6hIHWnzOYOggVPhUwJNxt80390BZ
	L16uYNfyrgXsStn75p7i5IOXI2wqDwALT/MGEUBMIVtrX29gn8KhZw7bHabuB+lk
	ad3df2qWBNaqwX7bSch93wI6FlzSBpKkUHzgIcwFeQS23UwaAqN8wGPAwj3QUHgM
	mKyQpRPaTnq6Ybu9EvFaahnjLv8RqenBUw8uNxo1Mce4jz8HssrUv0dN6xiYALMG
	VMudC3/J5xEP6UX/borAP2KCn37V0Elge0GUgO0ssHlgCe9XXVrAOcaNDIKHzfvG
	aETUjj6MQJHIxTMcyWIroA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40x0rtws25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Aug 2024 01:29:15 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 47H1Bl7S020945;
	Sat, 17 Aug 2024 01:29:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40wxnkh7vy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Aug 2024 01:29:14 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 47H1TDaW025300;
	Sat, 17 Aug 2024 01:29:13 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 40wxnkh7vt-1;
	Sat, 17 Aug 2024 01:29:13 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: James.Bottomley@HansenPartnership.com,
        Chaotian Jing <chaotian.jing@mediatek.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
        stable@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v2] scsi: fix the return value of scsi_logical_block_count
Date: Fri, 16 Aug 2024 21:28:34 -0400
Message-ID: <172385808991.3430657.4000095161450212305.b4-ty@oracle.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813053534.7720-1-chaotian.jing@mediatek.com>
References: <20240813053534.7720-1-chaotian.jing@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_18,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=820
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408170009
X-Proofpoint-ORIG-GUID: EKuiijOEDYYkysP55e_fT2efBn111NWZ
X-Proofpoint-GUID: EKuiijOEDYYkysP55e_fT2efBn111NWZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_182921_844497_EC2E1F16 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

On Tue, 13 Aug 2024 13:34:10 +0800, Chaotian Jing wrote:

> scsi_logical_block_count() should return the block count of scsi device,
> but the original code has a wrong implement.
> 
> 

Applied to 6.11/scsi-fixes, thanks!

[1/1] scsi: fix the return value of scsi_logical_block_count
      https://git.kernel.org/mkp/scsi/c/f03e94f23b04

-- 
Martin K. Petersen	Oracle Linux Engineering

