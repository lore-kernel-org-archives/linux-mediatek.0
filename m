Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E1EF30298
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2026 01:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lS5Nmckq8BzOO+HU/fwqkdq8Sst6mJg6TrX0okzH9WE=; b=liSRlIICZjZHfijkXpeI1nujnC
	2fzz9jnGEzF11+oaseWjblc2uVTq4f62QW6bIBZUCVml7PFpBizCI0NMnNCgO5pi3BP/91ekMCmB7
	37tkRLd4HGR+ckrm7bsCefOuyz1I4hS2V3Mq39oUmn8nTtLoIoBj5qZK06FAUM8ZhBJmpzZSPL92h
	ONqtpvwvhn/yip97sFu1difMjFYnmYM7A96wSICs1ImbeovGU8TZdylNPFzQW1C5sdpfxlko9XQFb
	xirhMlJnUxhDveTiHrvNFPHC2izYDj4+eL1a4pEot9lr6NxfLMgDd2xqe6fhxrsNYDdbhME5axWuf
	Hji3ov9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wxl-0000000387h-13SC;
	Mon, 16 Mar 2026 01:41:45 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wxi-0000000386X-0fPE
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Mar 2026 01:41:43 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FMmRBv4177353;
	Mon, 16 Mar 2026 01:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=lS5Nmckq8BzOO+HU/fwqkdq8Sst6mJg6TrX0okzH9WE=; b=
	Y57MtMOgZ01d1wD+bDOslPO7c9ghT9juOT31LWU3zuToJi/7RrIiW+v1KJbVmVZo
	Fe00R/vQZsiDuhmf8tNXtNOSHBxwkiiX4X5QesKmVQr+DJQ/fgRd6NHUnzZrVCOE
	yJhp4qrNhJgbgOfls98FoOQF09oMXPm8nGZhidGan4wuR1S6BUAR8yS/O0YpJhZp
	aSpgHRB/BzJ6X4A0vzTigAqibouq2ziCMd6O6yPE6cdEmp67bpDOcIV6QEc8Rh8m
	w21bI5QZqaGHdgozkICai8XBfxIMWKePRCb7wYRqFXvYAY0J8BhiM+wycNNDl8Cg
	2uvxwLXijqzqZf2dh7e0QQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cw07r9aqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 01:41:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 62FK3b3V002736;
	Mon, 16 Mar 2026 01:41:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cvx4j86np-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Mar 2026 01:41:36 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62G1fXhZ032070;
	Mon, 16 Mar 2026 01:41:36 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4cvx4j86mp-8;
	Mon, 16 Mar 2026 01:41:35 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@sandisk.com,
        alim.akhtar@samsung.com, jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
        naomi.chu@mediatek.com, ed.tsai@mediatek.com, bvanassche@acm.org
Subject: Re: [PATCH v2] ufs: core: Avoid IRQ thread wakeup during active UIC command
Date: Sun, 15 Mar 2026 21:41:27 -0400
Message-ID: <177362524479.2599440.14041046227573442647.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306054419.3816557-1-peter.wang@mediatek.com>
References: <20260306054419.3816557-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2603050001
 definitions=main-2603160011
X-Authority-Analysis: v=2.4 cv=HcsZjyE8 c=1 sm=1 tr=0 ts=69b75fd1 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8
 a=mpaa-ttXAAAA:8 a=qFATSNlW8LwFkCsGeMsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 cc=ntf awl=host:12271
X-Proofpoint-ORIG-GUID: m3f0sv0dYCe-_QKN0X64JSSNVPJROIwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxMSBTYWx0ZWRfX/JXjjMWI9X3I
 HOrwuMf/93QG0JJHpBZXcHcEwQLd0YEXGvlOW/vZAuttODBe6AldVE0N3hj+96RENHW0SI0Bvo/
 jYl8JgFPISt7kxn0HaeKiFgd2xKKrqiUdGbMPmFAWpYLXXUDkwD/K6oEzQaxrhSDIn6QqQnkz1W
 6DOvEeaCnvPZN7dRG9xuu5Ah3UjQAN7Jvw9ch4+rGUusYz7W7GFU7pn4ExgbkY90TR2QGecB0oO
 fZFuGLYmRPgYsGtDvlRN+PtUI+GZElVR7LT8D/Tf/Rg2PdJ16dY9FwWMVFL4OlJQXpL70jfFmeu
 lHETD8dxqdKZuMPMIjgCzrdy+geiKbAzoJprsnnuYSbwt+LZu1KjoXV6ToRUJam7u/ECV7ThAgs
 pYA0yqT963nvws+QEs9vlIeWT2ZxWm72ZilIhsr7LW3fd62a3XYmryOp8GAElRWQ4yIL31HSrY2
 SlBHcBItl1CobqQOvqP5mpsD0wkGDXWfe8Lr8rWo=
X-Proofpoint-GUID: m3f0sv0dYCe-_QKN0X64JSSNVPJROIwQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_184142_201546_0B66E2CC 
X-CRM114-Status: UNSURE (   7.10  )
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

On Fri, 06 Mar 2026 13:43:02 +0800, peter.wang@mediatek.com wrote:

> Only return IRQ_WAKE_THREAD when MCQ and ESI are not enabled
> and no UIC command is active. The default UIC command timeout
> is 500ms, Using threaded IRQs during an active UIC command
> increases the risk of timeout due to possible preemption
> by other system IRQs.
> 
> 
> [...]

Applied to 7.1/scsi-queue, thanks!

[1/1] ufs: core: Avoid IRQ thread wakeup during active UIC command
      https://git.kernel.org/mkp/scsi/c/6475cfb81fc4

-- 
Martin K. Petersen

