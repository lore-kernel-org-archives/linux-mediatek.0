Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9C6C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 22:54:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325C7239EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 22:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325C7239EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PiELS0LJT8MQ+vZ+gxuf0MlgfcOEl06rgJHkFNuB0Q8=; b=RmVlKh9vpqtC9UOtQzyGrpSq2
	3iy7un7aeC8FXAhX9LdEXTVPshsUuXlRVlP17P+65xb5A/JpnYY9SCnvd5fTGydV7ad1uL6kvNuLq
	iBSnXnQACqUE1RLJNwuKLbvZSBmLEnr6eLsFafKPIDcAMzIdQsfoIgDXxjdrx3Sx1yqk0GMPN0du7
	ZR9pPsCo4dfxJ1r9dC0SWfjmy+38YAVevSmWMIj5C5U8wrZJqYNF3jOhh04k60WmPfPJOMwSMmkMO
	uuFDO9jE2hatLnf/fKp7SqrhkALgmcmJUsme8rZWX7VrPgtZDyIUdx83U2JfL+upeDXUCaIvMCq/4
	de1QzNvow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPOf-00076d-UT; Mon, 07 Dec 2020 22:54:21 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPOd-00075d-OV; Mon, 07 Dec 2020 22:54:20 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7MjHPC176755;
 Mon, 7 Dec 2020 22:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=p7XgzgkKK50pzgoOvf1ZcA2bYFRD86gNnJYethpS7tg=;
 b=t4lqBlkKjf4pShwoN95Pin8iAKAKNnttn42BWjS7+bvqBTLcl6Kkepez0AmykFbAn/3V
 kjRYSHq4AjHXX9+5BONf96/WU3wzgl5hJ5Cu+SojWuwVgo/fpYYoNLLCCzlZ5ruz9P/o
 GJewv0pkzpSug05O+Ylkk0/w11b/0Gf0XsNN9FPO3kI0pAzwT5gEKMUiRZ6kpmkMEx9L
 ftbcFkAaVItKt6GsEF9DVOKmyYkXwgYPr4tmtuZB5iuCOO4efVuR7YKmPtwe/3DiE4Ip
 BuO2HoKZ8lg8wJMYcMXnQ7p9PqiFkLx1DTw3C9Lk/jhUthBlzetn2/k6CHlCqM6h36pT FQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 357yqbr4wu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 07 Dec 2020 22:54:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7MojCb178079;
 Mon, 7 Dec 2020 22:54:04 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 358ksmt2yg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Dec 2020 22:54:04 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B7Ms0fu030714;
 Mon, 7 Dec 2020 22:54:01 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 07 Dec 2020 14:54:00 -0800
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v5 0/4] scsi: ufs: Refine error history and introduce
 event_notify vop
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq18sa92pol.fsf@ca-mkp.ca.oracle.com>
References: <20201205115901.26815-1-stanley.chu@mediatek.com>
Date: Mon, 07 Dec 2020 17:53:56 -0500
In-Reply-To: <20201205115901.26815-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Sat, 5 Dec 2020 19:58:57 +0800")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=1
 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070150
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012070149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_175419_890579_F2A353CD 
X-CRM114-Status: GOOD (  13.59  )
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
Cc: matthias.bgg@gmail.com, cang@codeaurora.org, alim.akhtar@samsung.com,
 beanhuo@micron.com, bvanassche@acm.org, linux-scsi@vger.kernel.org,
 peter.wang@mediatek.com, cc.chou@mediatek.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, jiajie.hao@mediatek.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, huadian.liu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> This series refines error history functions and introduces a new
> event_notify vop to allow vendor to get notification of important
> events.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
