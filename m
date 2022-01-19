Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 04:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ItkbB+I9xN6SCg2Kx0JLHC/C8tS4rYJHvgyT02l+Zhc=; b=RNlW5M1S6k58Fy
	7uqYnIpMg3VjAWqV5jnKTFk11XRWU2qEVdC1Cy8H0aEZ1WPVR5ACKTmG4eWutFzIBCnlpn2zFeQ4p
	4SWtFw3zpgRBHcY3pemzxZ4XdPfqod401PToI0nPowrSNvTYBGI2J4fVCPHabxcabPu6/WquxVw4e
	wHJIwV9FUcZm0zgMSJ94WWIX17Kv2xt7zvWfF9aCnYJUHVB5khsBCaRlM+cGZQ3mIZPiCjXOdi0cY
	/N/r9yKWXM1kOA0Lpyzu/ZTfmI+zZanDNBKMBvVQl2u7WYApXeBBual7OxHRVam6gQ4r2t35UhKDW
	BRDckpqH71WoxwVriCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA2F0-003igq-6i; Wed, 19 Jan 2022 04:06:34 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA2Ew-003ifg-Th; Wed, 19 Jan 2022 04:06:32 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20INx3mT022260; 
 Wed, 19 Jan 2022 04:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=Is0RxxFusS17EU4y8KEr+vNiOrU+GXKq+9bew6VJxEI=;
 b=QMR7bTqrOki/WC4guc/q8gseADxVFLpL/wxXO7JYN3ixr6tSBhDPdKsoJV3FXTvfgtJ+
 xI0GHJBFmOPSUMO5SUb2+zBc8wHTOVcUvCUycCJPq44y6RHNyAKYyfekp3NLGM0r7ncO
 GgFkk4LUCHld6HolSVzfr5sT0zMsXgfPrc+uXT11xZlIlqcnrvMEXwXozIrQqnoGGCYg
 p5li0RW4o3U89y/r6Vy0Hq+lxhAb9GBKrTLJSrlRRW2GGwJKdiOhPZIb8cv/xaOqJwhz
 lIYamnnhEUcNkPE8o85cRVFUsdLnuZL/D8p9i0L71SWnWnABvBowwmw8jCkuRWzuEaz0 Xg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc52uv8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 04:06:23 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20J42A5N091561;
 Wed, 19 Jan 2022 04:06:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3dkqqpnr9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jan 2022 04:06:22 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 20J46HQ7110383;
 Wed, 19 Jan 2022 04:06:22 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by userp3020.oracle.com with ESMTP id 3dkqqpnr68-5;
 Wed, 19 Jan 2022 04:06:21 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-scsi@vger.kernel.org,
 Stanley Chu <stanley.chu@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Avri Altman <avri.altman@wdc.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] scsi: ufs: ufs-mediatek : Fix NULL vs IS_ERR checking
 in ufs_mtk_init_va09_pwr_ctrl
Date: Tue, 18 Jan 2022 23:06:13 -0500
Message-Id: <164256513503.31841.2498520978130234851.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211222070930.9449-1-linmq006@gmail.com>
References: <CAGXv+5GF1WOeXVtnknAa4GYXE3Hd-UzcCBCyQzT6KY3tJCrVGA@mail.gmail.com>
 <20211222070930.9449-1-linmq006@gmail.com>
MIME-Version: 1.0
X-Proofpoint-GUID: aLqOXzXBfJv9DFzSfV1-xmycvzNoXC2E
X-Proofpoint-ORIG-GUID: aLqOXzXBfJv9DFzSfV1-xmycvzNoXC2E
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_200630_990245_A150E9DF 
X-CRM114-Status: GOOD (  12.97  )
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

On Wed, 22 Dec 2021 07:09:30 +0000, Miaoqian Lin wrote:

> The function regulator_get() return error pointer,
> use IS_ERR() to check if has error.
> 
> 

Applied to 5.17/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-mediatek : Fix NULL vs IS_ERR checking in ufs_mtk_init_va09_pwr_ctrl
      https://git.kernel.org/mkp/scsi/c/3ba880a12df5

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
