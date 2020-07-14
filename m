Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2289C433F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 04:59:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71CCA221EB
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 04:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hHVgP7mV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="z4pAkkYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71CCA221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8T+mRHBIEmfNmxdp1ATihBqD/TiOLYsacuhz2iyW+lw=; b=hHVgP7mV0gXQQPw7Y4NiCM7Dr
	uPAp4NdnL7PIm0YXgIXjPi18oyPJWwVUECdsiKXSxQPdsEa16KXlIDg/kjLviuUJAR654j6lxOw+Y
	DnyHDMR8ZuQ6Dp1WQgPywi3c04Cz5tXNefdaogkd6PTwIfxSeOonKGhOSrbkRbiNy+0mVmNgp88QY
	bbUxp+isAjsgQDWCIeIADRQrcS1GhjRctK6eI1xwO4mUbvKhtkYpuXatUQWaXaZN6ZVpNsGOc+cKc
	uqXzMIx+6SDKo6Cw5RxbzviPyS6Hf37QUgqrAEn+C3ux8qeq7ht3Xp9u4T8M2BhPC1Ym1HiLPV3sL
	gSSAQ+L5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvD2D-0002Mc-GH; Tue, 14 Jul 2020 04:59:17 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvD28-0002L4-W5; Tue, 14 Jul 2020 04:59:14 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06E4wRIx100119;
 Tue, 14 Jul 2020 04:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=i/edOp4Ak5/v8uEvTvaFWmM61UPCIIBiDRWqpfNG9p8=;
 b=z4pAkkYBn0q/EA/pLW+9xuEBtS4DxKI7m5WCNvGQr3Mz/CZL/7mgW/5j2OaoP3nQK5ZC
 JD+9IR8mrx0q/kLHeakpHW4OVRx7xcErXGxJnZRMHwm4AUbqiNghYaJH4bUqZ+1BUcp/
 FKK41DGwUKgLwWMZ+cizN8e3PL/R4qTLhDKuK0uoPRBm6wiis+w/appuJ1+eIQxeBtaO
 A4Up5oKu8wfZO92zKOtUS3dEEvEY1Iavf2I9xZWOftCqlujkhRYEGp7Lfu9XQeIayk6V
 xdi5zpRzuOv3/iB9bqVnfwWAq2OFiAMrNyDwNDoh9lSxbQ7TUGjbLRFOwlJaNFFSqfIe xA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 3274ur2yqc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Jul 2020 04:59:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06E4vXfW174045;
 Tue, 14 Jul 2020 04:59:00 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 327qb2nusv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 04:58:59 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06E4wvhU022060;
 Tue, 14 Jul 2020 04:58:58 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 13 Jul 2020 21:58:57 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, satyat@google.com, avri.altman@wdc.com,
 jejb@linux.ibm.com, Stanley Chu <stanley.chu@mediatek.com>,
 alim.akhtar@samsung.com, ebiggers@kernel.org
Subject: Re: [PATCH v3] scsi: ufs-mediatek: Add inline encryption support
Date: Tue, 14 Jul 2020 00:58:45 -0400
Message-Id: <159470266468.11195.3653329950550952550.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200712003226.7593-1-stanley.chu@mediatek.com>
References: <20200712003226.7593-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9681
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_005913_200951_4B775CBA 
X-CRM114-Status: GOOD (  14.78  )
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
Cc: linux-arm-kernel@lists.infradead.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, chaotian.jing@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 12 Jul 2020 08:32:26 +0800, Stanley Chu wrote:

> Add inline encryption support to ufs-mediatek.
> 
> The standards-compliant parts, such as querying the crypto capabilities
> and enabling crypto for individual UFS requests, are already handled by
> ufshcd-crypto.c, which itself is wired into the blk-crypto framework.
> 
> However MediaTek UFS host requires a vendor-specific hce_enable operation
> to allow crypto-related registers being accessed normally in kernel.
> After this step, MediaTek UFS host can work as standard-compliant host
> for inline-encryption related functions.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: ufs-mediatek: Add inline encryption support
      https://git.kernel.org/mkp/scsi/c/46426552e74f

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
