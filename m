Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 04:17:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E7F361AA7
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 04:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E7F361AA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWa/e3nd06n9gCX2Tb6uaLroGYYgjE1kvvSbuBc+ZDo=; b=Pa2W1GfEXEAT8D
	JTI/YgHEoT0w77G5KXejIHLzYOD5FL//+wezQSkpkdAdoEmqv4VuMUbqutfIp4BqQR3P9bbLK7fl4
	3JaaqXQAVImlGWCmPaJmrIzKCqXTL80leiE7M6xhHlDZfGyUuv3fDbojOa/vkfp5tpookl12nK4Ni
	t7SO+3ujbmix3lNRRbNuVLt9nHN5Hx6fFhga8vTX4z/NfzG4y+hzajq82lnbzDP0iglFqnKjVvQmu
	soRzKaahx9YnA/1Kp6bVfxose0pCketwg93SMv8y9GcxKnNQYJnNij45aOotA5+uz3c5aev0kVV8K
	+AndUuqJ9a0YKNwxFFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnvKm-009PKX-Dt; Fri, 19 Nov 2021 04:17:08 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnvKY-009PF6-Tj; Fri, 19 Nov 2021 04:16:56 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AJ4C20U020979; 
 Fri, 19 Nov 2021 04:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=Y69FHpOAx57lLd3f+zNs2LCJmaW7F6iBzQxq4zJsLj4=;
 b=MsDg0vDN151NCtw+7aIdmzfl7kGhUZhHGIpOQJevjGwmLeAHPtpSgIoRSvX9ubQki5fN
 jBpQvg6c3DpMBY66itM7k+ygdXY45uZ+EHJczbjCrCU2wzAIT61EIua9nmkH7wmSoQvz
 gXNJyPPC4labbaRzvUr9vpYFMZhJwZeQA2872kUmATxkh8vTSIYlHO03WTc/ql8Pa1B4
 q1hijT/Ldp3vfMGSq7pYV7t9Z2aF8mTuK15xoPLTfU6Qb7dTSPebqwWVRWnUxEd/oEX8
 qPPaV4fOnQp/jMQ/P6kwGi7sbvC5m3FDQqa/hkAQL64rNvajne6vdSrRto9Ad5HMcVjC tw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd4qyucj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 04:16:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AJ4FBOf020402;
 Fri, 19 Nov 2021 04:16:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3caq4x7c00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Nov 2021 04:16:47 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1AJ4GiwK024731;
 Fri, 19 Nov 2021 04:16:46 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by userp3020.oracle.com with ESMTP id 3caq4x7bx2-3;
 Fri, 19 Nov 2021 04:16:46 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: cgel.zte@gmail.com, stanley.chu@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 Ye Guojin <ye.guojin@zte.com.cn>, linux-mediatek@lists.infradead.org,
 alim.akhtar@samsung.com, jejb@linux.ibm.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, Zeal Robot <zealci@zte.com.cn>,
 avri.altman@wdc.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: ufs-mediatek: add put_device() after
 of_find_device_by_node()
Date: Thu, 18 Nov 2021 23:16:32 -0500
Message-Id: <163729506337.21244.16117956445573879495.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211110105133.150171-1-ye.guojin@zte.com.cn>
References: <20211110105133.150171-1-ye.guojin@zte.com.cn>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: _y2LW0XTb1knUXYDye0z3F6PA7Vd0Tid
X-Proofpoint-GUID: _y2LW0XTb1knUXYDye0z3F6PA7Vd0Tid
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_201655_120470_8E1F8A65 
X-CRM114-Status: GOOD (  12.75  )
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

On Wed, 10 Nov 2021 10:51:33 +0000, cgel.zte@gmail.com wrote:

> From: Ye Guojin <ye.guojin@zte.com.cn>
> 
> This was found by coccicheck:
> ./drivers/scsi/ufs/ufs-mediatek.c, 211, 1-7, ERROR missing put_device;
> call of_find_device_by_node on line 1185, but without a corresponding
> object release within this function.
> 
> [...]

Applied to 5.16/scsi-fixes, thanks!

[1/1] scsi: ufs: ufs-mediatek: add put_device() after of_find_device_by_node()
      https://git.kernel.org/mkp/scsi/c/cc03facb1c42

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
