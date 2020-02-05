Return-Path: <SRS0=voLZ=3Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8959C35247
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 02:11:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE93214AF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Feb 2020 02:11:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qHYjLRUp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="khBX16i5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAE93214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:From:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ddx4M/pYb/qpucLe976sQdxZGWrq+D+jHB/nDy9TkQI=; b=qHYjLRUp8c1rXf
	dEXx8BKrOzdjc1mGCfN+4KIekTAW8wqJxSvkH2IYCgKUvVeALR98Fuj4NhpuCYK3GsPPUb3E+B1xd
	KnMvV93dCgrBLAPG+BGpoE7hbVC40rwRXyZ8h8QhrAVNBdWXj2TxRDL1sIpKxsar8AeJbROVybwZg
	jfYw+JLYUFc4okSAkHhdvC8ZEKDcUcBsUWC26YHI/Ke0xfpHWk3ZSH3+m3E3rhm+HHfFUOVCZSx9q
	QFhSVBr0TgtEVeum1f1CQNAizKzhkNK1VJNupVNtxjU8+5qB4yCXQfhBcxWc3jivCFGe1f04jkRoL
	j+Bj7fxyS5RtBzA7HRvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izA9X-0006EU-QK; Wed, 05 Feb 2020 02:10:55 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izA9U-0006E4-7t; Wed, 05 Feb 2020 02:10:53 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 015297hc172996;
 Wed, 5 Feb 2020 02:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=WTxvDcELfnF6+kyZJkHVSDKOjDn1Mu05lE76QB+AYnA=;
 b=khBX16i5gBh8xA8zLYM1AJW9TKme7kfJ+2pMQBFgVLj335if9R4Yq3e3SFb27hXdgLAs
 8Q4qUGOOpWSLLKM9KDzVd4XDS6msZaA+g/0v1gOgKcbogwq6V8Kj2fICQpYwNkarCEoz
 L7IyEOlFqe1M9621Db1YCU3ZeHC5KRBiB5SMlrstlf3PUnOKZWl9SU+0OVewGwKnG+FI
 hKQqqmET2qciTZLfM5inAtgwzxFxFMAiYhjNypONNvfayUGO74lZMorUpV501RaOtJP5
 2iC8RpAB0lTfMR3uZ0ecOc1oW8KgTNNVtis1iqWyvjPcSPz1Po8x3KebzE1j2yXHh8tN Sg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2xykbp87uf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Feb 2020 02:10:39 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 01529BlJ130653;
 Wed, 5 Feb 2020 02:10:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2xykc04rj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Feb 2020 02:10:39 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0152AbU3030895;
 Wed, 5 Feb 2020 02:10:37 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 04 Feb 2020 18:10:37 -0800
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH RESEND v3 0/4] MediaTek UFS vendor implemenation part III
 and Auto-Hibern8 fix
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200129105251.12466-1-stanley.chu@mediatek.com>
Date: Tue, 04 Feb 2020 21:10:32 -0500
In-Reply-To: <20200129105251.12466-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Wed, 29 Jan 2020 18:52:47 +0800")
Message-ID: <yq1ftfp238n.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9521
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002050015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9521
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002050015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_181052_367933_4524630D 
X-CRM114-Status: GOOD (  11.91  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> v3 (Resend) - Fix "Fixes" tag in patch "scsi: ufs: fix Auto-Hibern8
> error detection" (Greg KH)

Next time, if you make changes, please bump the version number. Doesn't
matter how small the change is.

Applied to 5.7/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
