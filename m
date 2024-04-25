Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7DEC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Apr 2024 01:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjT+SpPJzKl8w7kSFiIcNkWzRwIJPDHUfy/FQiYyYaQ=; b=HCNFonc6P6Sjcp9oLF+DUIndGj
	VPzxLzmFSGMT7gbGt4xJ5DMtx7xkF+ULNB18SHLDAR9e4l6EzTA6jCEOHrTzHgJcyWbX7ohNijiSI
	Daxnk5YMi4hodWC9QnzMuFLzeOHN+J106x/Udsea6rC0vgRbmHzlNS9NoGYO97f/1Xmu7u3I5CnAA
	VKiuRrviaT20QkYMa0jMvCwiQz4YTOAnALAf/PY+Nm8CC28TG8ammYJTJTCdRDNrU2KVLe7HO/wTV
	xmaEf53a5i/jZkZJ9Pc2XmB1VWCm2j/O5LfTDmIcQ14a6MIALOcS9Jv0aaT1qo1g/lbFdONS6a9co
	SQtw3Huw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzoMi-00000006eJ0-3ZpV;
	Thu, 25 Apr 2024 01:57:36 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzoMU-00000006eFv-43ba;
	Thu, 25 Apr 2024 01:57:24 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43P0i6q4015238;
	Thu, 25 Apr 2024 01:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=kjT+SpPJzKl8w7kSFiIcNkWzRwIJPDHUfy/FQiYyYaQ=;
 b=lWCMwpouBaIo7qm9kBHRsIC4inRFNQ4OaetEyno5mf6OLNMFuZSCJVXsDnKJVRYanU93
 41FjF46goEV0Qyjb0UcomDfGfhTYfaGIhKXWF8spEnIfdWWITu9gD7HzWwC0Ahngx254
 rWsABi0TD6MHyyXUEXhKAlGLI7JjvV8LINIxSnF9jg7aEY/1QHxABu9dxyTYhPYBa6os
 pJ2XY6sS9xf+O+uq97PLy0bs1ldCC4YK+YwTx1+PeyfuYGmfDdGdF7LfaDPz16nZygr/
 Mw8ZdO+MSz9SO0IPSliSVPeg9hBK83Fso4fdHBKqetsSxFlfze6dUVMizG9nahRPfUZt IQ== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xm44f1d6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 01:57:15 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43P0McEA025366;
	Thu, 25 Apr 2024 01:57:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3xm45fyh2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Apr 2024 01:57:14 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43P1vCuR009586;
	Thu, 25 Apr 2024 01:57:14 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3xm45fyh1b-4;
	Thu, 25 Apr 2024 01:57:14 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: fix module autoloading
Date: Wed, 24 Apr 2024 21:57:03 -0400
Message-ID: <171362345486.571343.15378016948257284142.b4-ty@oracle.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
References: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_01,2024-04-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404250012
X-Proofpoint-ORIG-GUID: 5kL1fAXRt9q0alSsinLmOfxzmG3P03OT
X-Proofpoint-GUID: 5kL1fAXRt9q0alSsinLmOfxzmG3P03OT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_185723_161925_E7C18323 
X-CRM114-Status: GOOD (  13.30  )
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

On Tue, 09 Apr 2024 22:39:54 +0200, Krzysztof Kozlowski wrote:

> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> 

Applied to 6.10/scsi-queue, thanks!

[1/1] scsi: ufs: mediatek: fix module autoloading
      https://git.kernel.org/mkp/scsi/c/a6584df2fd51

-- 
Martin K. Petersen	Oracle Linux Engineering

