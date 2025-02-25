Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12DEC021A4
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 00:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mzxasuy+e4bRJryQPZfFxX9fVGPe0gdt9N4OvhNBSuM=; b=i0flUJmLMaONEL4yNr9BOdwO/b
	R2MdBfe/SH7HuEEgwkJ1wLR6lVjQLr3X8AvYyLrjYnbMisw6GmjShfli9yE8mx8In6yYIv387iwWr
	gcXmqZsdSPjHEc3hbERKJRC/Z1f/9Vue227qK51QDdKtS4UvT7xfG67n/+uJOt4BWmyubLjA0Lz5E
	ooSkGIyfmrx9Hw7BpfbmW7q9BjdnIBaJkBbhM1PlWTOVcCBs2FSHZHNVzdWBVa5oD19+oF7RjQqKY
	PInfNgqi+KQim/AbQNQM13/4pRLCLsoneljX6jvMruPHk03w3RVdgzJTuRXXqNRp2zoaeDT8qad2Z
	jKFjb40w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmitI-0000000FcnS-0DLW;
	Tue, 25 Feb 2025 00:33:40 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmitF-0000000Fcmv-1fPw
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Feb 2025 00:33:39 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51OMK0JS012484;
	Tue, 25 Feb 2025 00:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Mzxasuy+e4bRJryQPZfFxX9fVGPe0gdt9N4OvhNBSuM=; b=
	i0CMgggUaeLt0x8x4WYW4OBZ/ciLe7YMSRYs6qY9kOmv2McZGAhgNJ9jRfQ6myBA
	PlL9MWu0AqyJuw0lAm1H0V9VxuMqlHwwqh3tlqFTslOX81yN/bslysRD0X0Samea
	f3sNvwzM25gOVztmZK2qQxRdpnFizF9noD1ZQdVu0twzaxkM3fK0U9KW517D0nHl
	xiwcpypYJpf3CcXS4yKy/0cRNpUgBg5uHmF7yremga3zPQb8XmkCvU/VWCg6M5oy
	Kom/06zV1foPZLKYQeDmCuh/vk3irJbNHPJl/47QN3YbtN+OIZivWPV7YtUSE83C
	QqJQ8LpCtL32vf9nGKNldg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44y6mbkxks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 00:33:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51P0UE08025437;
	Tue, 25 Feb 2025 00:33:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44y51f0q8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 00:33:20 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51P0XI1t025171;
	Tue, 25 Feb 2025 00:33:19 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 44y51f0q87-2;
	Tue, 25 Feb 2025 00:33:19 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@wdc.com, alim.akhtar@samsung.com,
        jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        jiajie.hao@mediatek.com, yi-fan.peng@mediatek.com,
        qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
        eddie.huang@mediatek.com, naomi.chu@mediatek.com, ed.tsai@mediatek.com,
        bvanassche@acm.org
Subject: Re: [PATCH v3] ufs: core: add hba parameter to trace events
Date: Mon, 24 Feb 2025 19:32:47 -0500
Message-ID: <174044345131.2973737.3696488766957573194.b4-ty@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214083026.1177880-1-peter.wang@mediatek.com>
References: <20250214083026.1177880-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_11,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502250001
X-Proofpoint-ORIG-GUID: Q1gmIuWKgbbt0rPGSaGicO8IobcucQFk
X-Proofpoint-GUID: Q1gmIuWKgbbt0rPGSaGicO8IobcucQFk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_163337_551778_B7BB8437 
X-CRM114-Status: UNSURE (   9.30  )
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

On Fri, 14 Feb 2025 16:29:36 +0800, peter.wang@mediatek.com wrote:

> Included the ufs_hba structure as a parameter in various trace events
> to provide more context and improve debugging capabilities.
> Also remove dev_name which can replace by dev_name(hba->dev).
> 
> V3:
>  - Remove dev_name entry form TP_STRUCT__entry() to reduce the size.
> 
> [...]

Applied to 6.15/scsi-queue, thanks!

[1/1] ufs: core: add hba parameter to trace events
      https://git.kernel.org/mkp/scsi/c/583e518e7100

-- 
Martin K. Petersen	Oracle Linux Engineering

