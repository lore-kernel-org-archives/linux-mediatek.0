Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63CCC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 17:01:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D9523C43
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 17:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D9523C43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9vQVjI/QAb0xjEs1asJS+ciSQKEAbzCtJHEer7xqFvw=; b=Tudz0y9g4JrqM/kcSzQIs73Lm
	NohY2RUrVnqt/kce1DDm4VoTPQiZilmDxPheZiw+C2h/xuuWnO0navNj6atbtfnpm3Dj783s6JxFZ
	gcbSIVIms5iJMHDmWYFzJ6HUh1tyEtS7SzKXS4O8UH2a9TNda+y7/N1cV7EP5BRKkVW27nTJ6kMrA
	pHEtiOjuyHz+tJgI/5EF+YkFMSw1i33TrAoBwLn4+PRTNOi9d1xiRfoA2rPhep2Wk0CMRP7/V8Pq+
	XvQyXF1LNV58Vei9pFfaMXw90liSRF5EDJ10wzT8LJRA7JzlLvCGf6QE5oO0kmICwn0Lu/66E/ZMe
	PFSrkSsZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2qD-0004ZF-Vx; Wed, 09 Dec 2020 17:01:26 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2qC-0004YA-5R; Wed, 09 Dec 2020 17:01:25 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9GtN5Y045655;
 Wed, 9 Dec 2020 17:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=6GtIekTTcrPSDzpoKvQEwmdx1Vo00hrZrKFEn9U7jNE=;
 b=Cyqya+MxtBOeeztnjdiw9D1TCRRpJ5VUxekfjj05dpLCETf7+3r49wANgvlsu2pLD3l8
 4zbN1Ugs0pwM/6UcIg0gzi+NFuJZDDlO8C7Oe0AIJrAaF8DDTCUKrfOZLLMRymPJVKVd
 QFrzsl3TyoP/sAvLBo/mru9xNpJcf6rHNY+rhr0Md+x3jZ1BnWFwl6WWADnhAQWoPVAT
 VknGOtctevM2rmJImwo9BdNlf1ysbULhB6YSz/eOfbThBjZ+yMbX6bu1pbPeCINPX8ZD
 aqWaQxw6HDVpbqHzva6SKvnyU57ZLjqofKFmRg1IJ9741yheMJ+96vTyuvdprswq0mX1 aQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35825m993p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:01:13 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9H0aSV118901;
 Wed, 9 Dec 2020 17:01:13 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 358m40hv4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:01:13 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B9H1AWH008611;
 Wed, 9 Dec 2020 17:01:10 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:01:10 -0800
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] scsi: ufs-mediatek: use correct path to fix
 compiling error
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1h7ourk1y.fsf@ca-mkp.ca.oracle.com>
References: <20201209063144.1840-1-thunder.leizhen@huawei.com>
 <20201209063144.1840-2-thunder.leizhen@huawei.com>
Date: Wed, 09 Dec 2020 12:01:07 -0500
In-Reply-To: <20201209063144.1840-2-thunder.leizhen@huawei.com> (Zhen Lei's
 message of "Wed, 9 Dec 2020 14:31:44 +0800")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=1 mlxscore=0 mlxlogscore=847
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=861 clxscore=1011 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_120124_323050_280A50C8 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: linux-scsi <linux-scsi@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>, "James E .
 J . Bottomley" <jejb@linux.ibm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Zhen,

> So without "CFLAGS_ufs-mediatek.o := -I$(src)", the current directory "."
> is "include/trace/", the relative path of ufs-mediatek-trace.h is
> "../../drivers/scsi/ufs/".

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
