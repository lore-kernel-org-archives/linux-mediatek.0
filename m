Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA28E7D0BA
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 01:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sks/tXUf4xnsCRkMVuUcEHqv0ac9dFEzdYVSS3K4j4=; b=FNtf3IyrukFqrHmFmGjyK1shgW
	2ThZdmETkvvIpk3/nGrcXTWBDdqzQ70BpSy1hTtZtYDWdAbRBRjxxvjADKlh/FXd1Yt1FKGDZqyPI
	wl9EaST0V0Yq83aSUBmQmGKIpcqpPOguaOl30SZp6nzzftX0oJmds5KrvaNHmJ78U1cli0KRPSntp
	oiMca+o3gVFPC9vwSGFVzHa/TYONoUOqBAGAlQfubExCWaq3brQimRqLgTEX7DnhzZlHOidPEVW+a
	ffdlBwbvRxsVQImZBHYPGj1cc6xnWLZzBN9Xh1TgICTtESJMKlYhw88w/+vfhvVN9vcbA5h1ilNSb
	HzQ2fcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjUcd-007WOT-1n;
	Fri, 22 Sep 2023 01:06:19 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjUcZ-007WN4-13;
	Fri, 22 Sep 2023 01:06:16 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LIsMBb011444;
	Fri, 22 Sep 2023 01:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=4sks/tXUf4xnsCRkMVuUcEHqv0ac9dFEzdYVSS3K4j4=;
 b=nbBk3USv2ADqkP1SFu0ySv/4aWSTK3NHGHAlYHRAd5wo4JcnFciUoFuiIrUcjWKDceOz
 aJe4Ts8yxjBwbqCatq4vSP3rHJjtzWUXAlKExRXs1WjCOHCdwBxQBq/7DCRIVRgDOTQQ
 XuswiCaJ0LmHTRGohP5xHChZvOrZRbsZcPg6IPgnDHxtZ//6/ALcj73+dSYzkUzoj2w9
 oanfV794xKJ8SUqQAwNEZE+oyEKzRezXfDKkAYbwnQHHCOGBywhcij4Us8LfczO7pBZ9
 3pIlzh3VrFpT2e///04fGjwzEcR1e8P40fe0pJjII6DurJEEe3FoA7SZarLwOC8sDnSw AA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t8tsvrkag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Sep 2023 01:06:10 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38LMeF9L040575;
	Fri, 22 Sep 2023 01:06:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3t8u19bn4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Sep 2023 01:06:10 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38M164sx032168;
	Fri, 22 Sep 2023 01:06:09 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3t8u19bn0m-5;
	Fri, 22 Sep 2023 01:06:09 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Stanley Chu <stanley.chu@mediatek.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH] scsi: ufs: do not look for unsupported vdd-hba-max-microamp
Date: Thu, 21 Sep 2023 21:05:55 -0400
Message-Id: <169534443606.456601.439761904656869208.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230906113302.201888-1-krzysztof.kozlowski@linaro.org>
References: <20230906113302.201888-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-22_01,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxlogscore=957 phishscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309220008
X-Proofpoint-GUID: HNAUVlPRhNXLEOv6kAT5tu68crePIR1j
X-Proofpoint-ORIG-GUID: HNAUVlPRhNXLEOv6kAT5tu68crePIR1j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_180615_478910_6203792C 
X-CRM114-Status: GOOD (  14.50  )
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

On Wed, 06 Sep 2023 13:33:02 +0200, Krzysztof Kozlowski wrote:

> Bindings do not allow vdd-hba-max-microamp property and the driver does
> not use it (does not control load of vdd-hba supply).  Skip looking for
> this property to avoid misleading dmesg messages:
> 
>   ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: unable to find vdd-hba-max-microamp
> 
> 
> [...]

Applied to 6.7/scsi-queue, thanks!

[1/1] scsi: ufs: do not look for unsupported vdd-hba-max-microamp
      https://git.kernel.org/mkp/scsi/c/2c99e3d7d2cb

-- 
Martin K. Petersen	Oracle Linux Engineering

