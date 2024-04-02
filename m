Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D7ACD1292
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 01:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCbDPopcwvRQZMkSktlFhLLo3Nu0UpFGUCF9FeZ0mNY=; b=gOyTSO7JMgI92t+NDg/dlxCrMq
	JhR//7nrndxBRWiClzlaMrltrotogjLFwVRRWZ8IWTXCnjdaW/KSoCdnfLi9kuFh6kPR0NTBv73ZO
	wAmFjtuK153pyjDhedbRr8dPxdPUM9EyvRInUv6h7AFO2Zr5yVeGyl5N1duCW9WbSK6tbGlA0xbBl
	en9N4vL7ElR89ww3qAiA60Y16mt7ofEdTqvcBIUomLHDvi6xMVRyvDHOt6Bo+5f0ekN6dvMQDDtf1
	EpKmy8B1AlM9uHkbOo0UCgXtLMHjqLDNKLIwlHP3HSK+olG99UfYynb8TmiFO+uQNClCiegXYOkRV
	Hbt37L/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrTHA-00000009NpI-336t;
	Tue, 02 Apr 2024 01:49:24 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrTH6-00000009Nnt-0TS5
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 01:49:22 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 431IKCQA009659;
	Tue, 2 Apr 2024 01:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=ZCbDPopcwvRQZMkSktlFhLLo3Nu0UpFGUCF9FeZ0mNY=;
 b=TS1/SGOa5In3K4lia4GpZP6pw5LvIzzAghuW0r1O/qrnSxNz4Yp86tk/X3Hy0dzipN3G
 srycrpFXDkCSs53hlqczNYwskkvZQzUKQbKkaTgIjqk/jOgsNVF82vTTRf4hz3Ti25+y
 hClYMCFwZ95t78oYrhmrhELpe2tn3luzPM2LVG/MPCa9OFy2XO5VnSM4CcvdlqPhOI9c
 1TF5fMtt9vdG26IJ9GSlBdiXl0NjuId2GZIpOX5fFAIuo/O2gAPVI4KRrpsKqbRTsvcn
 Wa+cTdeqUS5ilaCGbEtfo5w12GW9ljSnEcvxP9AtKzJ+1t3HQ1t+hSTyV4lN+TObDi2R tA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x7tb9sjpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 Apr 2024 01:48:49 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 431NUTEj018607;
	Tue, 2 Apr 2024 01:48:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3x696cd6cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 02 Apr 2024 01:48:48 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4321mkNH030130;
	Tue, 2 Apr 2024 01:48:48 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3x696cd6bp-5;
	Tue, 02 Apr 2024 01:48:48 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@wdc.com, alim.akhtar@samsung.com,
        jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        jiajie.hao@mediatek.com, powen.kao@mediatek.com,
        qilin.tan@mediatek.com, lin.gui@mediatek.com, tun-yu.yu@mediatek.com,
        eddie.huang@mediatek.com, naomi.chu@mediatek.com,
        chu.stanley@gmail.com
Subject: Re: [PATCH v2] ufs: core: wlun suspend dev/link state error recovery
Date: Mon,  1 Apr 2024 21:48:39 -0400
Message-ID: <171202249153.2135322.11918822860021186461.b4-ty@oracle.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329015036.15707-1-peter.wang@mediatek.com>
References: <20240329015036.15707-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_18,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2404020012
X-Proofpoint-GUID: HmNuGV14Tod30m5MRiyUXr86DJKBqJsW
X-Proofpoint-ORIG-GUID: HmNuGV14Tod30m5MRiyUXr86DJKBqJsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_184920_292567_9E24E9F1 
X-CRM114-Status: GOOD (  14.44  )
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

On Fri, 29 Mar 2024 09:50:36 +0800, peter.wang@mediatek.com wrote:

> When wl suspend error occurs, for example, BKOP or SSU timeout, the host
> triggers an error handler and returns -EBUSY to break the wl suspend process.
> However, it is possible for the runtime PM to enter wl suspend again before
> the error handler has finished, and return -EINVAL because the device is
> in an error state. To address this, ensure that the rumtime PM waits for the
> error handler to finish, or trigger the error handler in such cases,
> because returning -EINVAL can cause the I/O to hang.
> 
> [...]

Applied to 6.9/scsi-fixes, thanks!

[1/1] ufs: core: wlun suspend dev/link state error recovery
      https://git.kernel.org/mkp/scsi/c/6bc5e70b1c79

-- 
Martin K. Petersen	Oracle Linux Engineering

