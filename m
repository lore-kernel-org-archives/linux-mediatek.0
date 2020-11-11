Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1889C5517A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 04:04:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B6E722203
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 04:04:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NIhVkpYf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="svDd6dU7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B6E722203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y7i/Qro0jbJ9pigxZky4GFx1QrPHFN4ptRAM+aY1iOA=; b=NIhVkpYfaoaJdKQ3bzObhYrXO
	q9V4Khh7d4YnZuZqbOc3YnA+5DMb1caF8kSMTg3twAo7PmmbpMh2V2GTaCeUnnF4CGPDLt1D6WHLW
	YS5dG1hugjiTDsnkrT9EBSHPe0YMvIBkPN94zmlPMbinJBudbm7ChspUftvTFn/oobmQ3p63CV3/5
	wvY0n9RooIsfQxOEE2CjiNIpt2RyXg9S0BIkNR1eHhRf3khUpMZc3dgmFZU1RYLwMkxBvj3oa2k7Q
	QdW2ixErkx6Dqh1WcSyuMHIc2gv8dePbh80t3k5SA9KJ7JbINF3FVGgHT5pULBpaIqI26JZ+eoZ3y
	nsTkwdQww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kchMu-0000iS-CP; Wed, 11 Nov 2020 04:04:24 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kchMs-0000i0-A6; Wed, 11 Nov 2020 04:04:23 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AB442P8090288;
 Wed, 11 Nov 2020 04:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=V5ePjViCRr23kx/T8WxrIkVMuE+GuaYuOU6AhJaCWqs=;
 b=svDd6dU7ZqMaPCMepfgK33jmAw1aA9xrxb7YtwFlABkXncMvms3qoTrbazZesOm0N0eM
 GnyQZ0N+kjlN8wIagNwXrl0yVOxXgXNC0SVzpha5XvzJzoDAqmjBBINfOTYPbHrfxDrP
 hmiCcKD5ivJfs3dB5mYctYmwNTAo6kN9cODsEfmPYpz/so+3j1finA33iAdph+fcyc+0
 159knvpM3/uOzeAtCPqKReIm62xJHKQLKL5Lzs8I+CMWFX4hXJcLheACAN9/Zda5hHUt
 xKE6lcWyvAGzKBuz/hNQ2yDgHRh+QuBV+nR9sievwOdSBHMVXwb/dfwCB8jL60MBjScb Gw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34nkhky1qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 04:04:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AB40tHL113439;
 Wed, 11 Nov 2020 04:04:17 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 34p5g16ym2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Nov 2020 04:04:16 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AB44F45025455;
 Wed, 11 Nov 2020 04:04:16 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Nov 2020 20:04:15 -0800
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 0/6] scsi: ufs: Add some proprietary features in
 MediaTek UFS platforms
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1h7pwfsju.fsf@ca-mkp.ca.oracle.com>
References: <20201029115750.24391-1-stanley.chu@mediatek.com>
Date: Tue, 10 Nov 2020 23:04:12 -0500
In-Reply-To: <20201029115750.24391-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Thu, 29 Oct 2020 19:57:44 +0800")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 mlxlogscore=968 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110018
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9801
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 priorityscore=1501
 mlxscore=0 suspectscore=1 mlxlogscore=982 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_230422_447084_FA1442E3 
X-CRM114-Status: GOOD (  12.68  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org,
 alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> This patch series provides some features and fixes in MediaTek UFS
> platforms,

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
