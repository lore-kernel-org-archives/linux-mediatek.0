Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4F7C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 03:13:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB7B206DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 03:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ObTS2xx9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CV4M+oT9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AB7B206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hPHxonafzVtT49YfUjzEiQTRLutUx9ojz+ftK7ZBKFE=; b=ObTS2xx92PlkfGfWgOPbGeAk2
	wX8cPS5LQEgxTAaEKyADJvokQu3ZXU4O+dtsHhR9eUH/ugqhROJl3qp+Dsa7td+VCsSS7aPAwmCo4
	hUjk8nO58BsPATh9zywL/LoZr0446oJ1np7lBtneRm9CnrHOpljJiuVVgdui3ObYSYewM8yebnJLj
	pl+orQmJ5VX1SYSUOEJhpU3ESO3LRYka0NKJBTwQ6iBQ7tsoGhw89LXtLWri78BoKxGln3uWDHei/
	PAnzIGVeHgimQQhfYM1BGknsf4wDZvMWLB2fC7bFPMz523uAEjkYkqO8bRYw20eecM/jTuhh2/Jxh
	1bELUSbog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7s3g-0006qb-GW; Tue, 18 Aug 2020 03:13:08 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7s3e-0006px-F8; Tue, 18 Aug 2020 03:13:07 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07I38RM6134878;
 Tue, 18 Aug 2020 03:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=5yqBFvVmP7SjhOSQr96od3VpcBjEYTPTrY/Nozi0giY=;
 b=CV4M+oT9gFZ/4cLx2nRYuV+NF5q6hCIbtSlJ8q6q3Q9ERb1DEUbhsRDdex3LFs1VynU5
 FSz5pdOSVxsicyYqPFR3xXO4Q0iueEj3p4qJbThdX+9a75M8579YCKhOPBDuAdUDAm6Y
 vltGvZFdWlSME9ssHdfc+t4CgthOpHi7xDUkyw8Cz7HR1HCPhrGtui64EtP7EEEZPyts
 zfEaIAbs1nSIHahA/801pf5uH/V5tF2jqAzu5jx5btIZvEJ5zu5avgyz5vn+r6uXzToB
 64YSHjzXNPFSMUA1tWj28j8lxC4Kk1jMRRab+Zv0o/hDrn4vTu8+DVGLHIjdev8uU3oe gg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 32x74r27dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Aug 2020 03:12:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07I37iiN111582;
 Tue, 18 Aug 2020 03:12:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 32xsm1q4xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Aug 2020 03:12:49 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 07I3CmlQ029865;
 Tue, 18 Aug 2020 03:12:48 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Aug 2020 20:12:48 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, bvanassche@acm.org, avri.altman@wdc.com,
 jejb@linux.ibm.com, alim.akhtar@samsung.com,
 Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3] scsi: ufs: Fix possible infinite loop in ufshcd_hold
Date: Mon, 17 Aug 2020 23:12:32 -0400
Message-Id: <159772029325.19587.9193434104087348194.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809050734.18740-1-stanley.chu@mediatek.com>
References: <20200809050734.18740-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9716
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 malwarescore=0 mlxscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9716
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_231306_669679_70A14415 
X-CRM114-Status: GOOD (  17.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: beanhuo@micron.com, "Martin K . Petersen" <martin.petersen@oracle.com>,
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, chaotian.jing@mediatek.com,
 matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 linux-arm-kernel@lists.infradead.org, peter.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 9 Aug 2020 13:07:34 +0800, Stanley Chu wrote:

> In ufshcd_suspend(), after clk-gating is suspended and link is set
> as Hibern8 state, ufshcd_hold() is still possibly invoked before
> ufshcd_suspend() returns. For example, MediaTek's suspend vops may
> issue UIC commands which would call ufshcd_hold() during the command
> issuing flow.
> 
> Now if UFSHCD_CAP_HIBERN8_WITH_CLK_GATING capability is enabled,
> then ufshcd_hold() may enter infinite loops because there is no
> clk-ungating work scheduled or pending. In this case, ufshcd_hold()
> shall just bypass, and keep the link as Hibern8 state.

Applied to 5.9/scsi-fixes, thanks!

[1/1] scsi: ufs: Fix possible infinite loop in ufshcd_hold
      https://git.kernel.org/mkp/scsi/c/93b6c5db0602

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
