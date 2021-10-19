Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52966C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 03:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCCE6134F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 03:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CCCE6134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2T4p32Fh0f6dKS059KdB3B8kc3HxQhzV0zrqStOSgs=; b=XDDI4J7ewuSZ2h
	Rf8Ec/GSDyxe1ks9tpITId/efeSh83IvrR/8hWl8NP18B96OyEH+H03mNrsDi1HGIvfnvrjFcQFEg
	3PIKajsvpudoD9p+ah7QMDeehcYwYS4iFQ9eXtFzzpx7/7DBO7z/Dtb+tfMIahKDzzToY3COPaK8X
	q1SK0bVrJdHgG5wN1NL6d2MWhFYw1uXblULm+4YB2TB3C/4yP8g9MXYfVoijrZUx7GESJMUqR+xKm
	UtUpKx9bftafSaVKe1zsuWLzqpmVZ9VSG4lyQUZv6yMvPRJKkGDAwMp58j0+9viU/MzChTikSu2h0
	Y10hB1+ZzuVa3cvBUNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcg2e-0004BV-D2; Tue, 19 Oct 2021 03:43:56 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcg2a-0004AH-UY; Tue, 19 Oct 2021 03:43:54 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19J349Re015244; 
 Tue, 19 Oct 2021 03:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=KJiWubGMNyWOQmJE10qT2Q36ZJt5GUJhKqw9DNxgJQ4=;
 b=ZB4zg4rdRs0Vcc+913MwHxrfk5sAq15IHJFAjX9nyws0eep02QnntyJV5phXiBuX1z03
 a7I+hsyjPiAUCvHuAt3R+/FR1nITZy4MOHjyeWBH+Is7f7ZfUJvMDkcGGShg0Otl+4KL
 GMlZ9NCRo2cNyLeO+GpU4T44xEAEiMdBc4pPNjBi4DkP9XSWxM4gxT7qhzlk7JRBfmEk
 5BifvxWs+63m9FqRc3de5xhrTL5pTIueC4zEYaiJLP3vCADTW8GyewZ6NRK9cWdt6eC/
 SRs8hGvV9iyHDMCHF9ZDrots3VKAjZMVQEUI61FNHo6xISYVn0K4/o8ygViwpRnYy2sQ NA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3brnfhqskj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 03:43:48 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19J3ZT3a077053;
 Tue, 19 Oct 2021 03:43:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3br8grmmtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 03:43:47 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 19J3hhHf101685;
 Tue, 19 Oct 2021 03:43:46 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
 by userp3020.oracle.com with ESMTP id 3br8grmmrp-4;
 Tue, 19 Oct 2021 03:43:46 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Martin Kepplinger <martink@posteo.de>,
 Miles Chen <miles.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bart Van Assche <bvanassche@acm.org>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] scsi: sd: fix crashes in sd_resume_runtime
Date: Mon, 18 Oct 2021 23:43:40 -0400
Message-Id: <163461411521.13664.305092538440750987.b4-ty@oracle.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211015074654.19615-1-miles.chen@mediatek.com>
References: <20211015074654.19615-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: gKb9G-3VbOOMGIm4I_ziIPWhbKimffoM
X-Proofpoint-GUID: gKb9G-3VbOOMGIm4I_ziIPWhbKimffoM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_204353_137355_2E3EC172 
X-CRM114-Status: GOOD (  15.30  )
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

On Fri, 15 Oct 2021 15:46:54 +0800, Miles Chen wrote:

> After merging commit ed4246d37f3b ("scsi: sd: REQUEST SENSE for
> BLIST_IGN_MEDIA_CHANGE devices in runtime_resume()"), I hit the
> following crash on my device.
> 
> static int sd_resume_runtime(struct device *dev)
> {
>         struct scsi_disk *sdkp = dev_get_drvdata(dev);
>         struct scsi_device *sdp = sdkp->device; // sdkp == NULL and crash
> 
> [...]

Applied to 5.15/scsi-fixes, thanks!

[1/1] scsi: sd: fix crashes in sd_resume_runtime
      https://git.kernel.org/mkp/scsi/c/85374b639229

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
