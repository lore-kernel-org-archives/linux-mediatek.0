Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5567CC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 03:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhRYrwrdEVUyJTZMUcSbnZcHfY2diOyWfIhBcpExmUI=; b=BVIDE9USYfAZkc4Gb4y7InC4sC
	snfrTGrHHbxjejGinEbrxxWUuUKMlsxvpW6LcTjgisdF9lDh8lKsL50anw8/b1ccQk7Ft11GMD1aY
	LmUlyBXeVBJbTzG9IPRMWTZ3oz8MPQvCYiGKyo24T0jAGa3fS8yN+4xr8HQkxwMwgPDBEi1HfIp0n
	XoExMwfKklx789nKsaj1RFawD+cziKsdukplm50M541vW5APeH9k3QdjdUzLy+b36RV4cG6nBDNSe
	OTlf45SQOj7iBykvR+ENbpCW4w7tNzpOxt/P0/CSyy5KeQ/QbtsMd5iA3zJnBj23g0JxxtDVt2/46
	7VpZ0+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o61qk-0041Fe-Fv; Tue, 28 Jun 2022 03:25:14 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o61qh-0041EE-D9; Tue, 28 Jun 2022 03:25:12 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S0uqoE002157;
	Tue, 28 Jun 2022 03:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=mhRYrwrdEVUyJTZMUcSbnZcHfY2diOyWfIhBcpExmUI=;
 b=YeyrHQrYRXVwVBmcVCOK2kDO9TorNTA5VB4ajD3ADd2S20wc8G4MpDC6uGxcoWivkWh7
 gVqQ6QHubcRAha57TiqWNPi0F3dLeGt19UrxqdNR24DNJImJFPmHURUSB+4wwgewjpuQ
 n/vzJyE12TburwZbTZ20YNkzK0ArDMop5cscZDpKpQlYbTdbxGzxiFszhi8Pba04sQbc
 aZTOPbS4KPlhfDbEgZm0+avohuu1Njca92Q6yfrkqeZUD4oCvJGLn+Z+LkB6VVd7Mqxi
 cpx6L6MHxxkjDXegYXwuwPL14RMncUCcq78pFuVRy2PGpf30QFO5N3kyqg6rIQKofjSx Vw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gws52cuq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jun 2022 03:25:03 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25S3F1p5002510;
	Tue, 28 Jun 2022 03:25:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrt7jjns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jun 2022 03:25:03 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25S3NvqO016584;
	Tue, 28 Jun 2022 03:25:02 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3gwrt7jjkg-14;
	Tue, 28 Jun 2022 03:25:02 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: matthias.bgg@gmail.com, stanley.chu@mediatek.com, jejb@linux.ibm.com,
        powen.kao@mediatek.com, Ren Zhijie <renzhijie2@huawei.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH -next] scsi: ufs: ufs-mediatek: Fix build error and type unmatch
Date: Mon, 27 Jun 2022 23:24:52 -0400
Message-Id: <165638665782.7726.5510380683354329362.b4-ty@oracle.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220619115432.205504-1-renzhijie2@huawei.com>
References: <20220619115432.205504-1-renzhijie2@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3boWjZ63gARTFCZNv0ieh5AH9WDu0tt7
X-Proofpoint-GUID: 3boWjZ63gARTFCZNv0ieh5AH9WDu0tt7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_202511_596262_89E7D437 
X-CRM114-Status: GOOD (  16.22  )
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

On Sun, 19 Jun 2022 19:54:32 +0800, Ren Zhijie wrote:

> If CONFIG_PM_SLEEP is not set.
> 
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-, will be failed, like this:
> 
> drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_vreg_fix_vcc’:
> drivers/ufs/host/ufs-mediatek.c:688:46: warning: format ‘%u’ expects argument of type ‘unsigned int’, but argument 4 has type ‘long unsigned int’ [-Wformat=]
>     snprintf(vcc_name, MAX_VCC_NAME, "vcc-opt%u", res.a1);
>                                              ~^   ~~~~~~
>                                              %lu
> drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_system_suspend’:
> drivers/ufs/host/ufs-mediatek.c:1371:8: error: implicit declaration of function ‘ufshcd_system_suspend’; did you mean ‘ufs_mtk_system_suspend’? [-Werror=implicit-function-declaration]
>   ret = ufshcd_system_suspend(dev);
>         ^~~~~~~~~~~~~~~~~~~~~
>         ufs_mtk_system_suspend
> drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_system_resume’:
> drivers/ufs/host/ufs-mediatek.c:1386:9: error: implicit declaration of function ‘ufshcd_system_resume’; did you mean ‘ufs_mtk_system_resume’? [-Werror=implicit-function-declaration]
>   return ufshcd_system_resume(dev);
>          ^~~~~~~~~~~~~~~~~~~~
>          ufs_mtk_system_resume
> cc1: some warnings being treated as errors
> 
> [...]

Applied to 5.20/scsi-queue, thanks!

[1/1] scsi: ufs: ufs-mediatek: Fix build error and type unmatch
      https://git.kernel.org/mkp/scsi/c/f54912b228a8

-- 
Martin K. Petersen	Oracle Linux Engineering

