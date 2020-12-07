Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E13C4C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 23:14:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EA48239FC
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 23:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EA48239FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bjBPqXpB88dr98V8JH20dhZsfIe1HDpNymfdG4uUoYk=; b=dcY1bLCFYcDJlHU8M8YYnP/DY
	0YQ2XEt7Kp0BugROL1pyDx/rjArInw7yl58eSTlrKXFAMNKHdALvafAhXiHqTYbfCAP51EnxdEZ/G
	DLdMYhAM83/MvT377YP7UhV7Hm4AXpWKr5ZmShimh5c2gBslhzRekNb1tQnzmD6eHlj7eFzXdlgwR
	FYK7WheSZ7+s1QFGYIzRqUqCHj8O3OFf0BsU5h8vQtQfwVbIip6i33XMdSTWmrrhN8F7mccvbkM2c
	dmDWv/vb1F/oigm15nAXoz4VVN0ESRpeeOwfwYT9Y2UKq0Fez8sfhTrCkIAUa6Wswb2sKlF+ZoxDj
	CHBMozLXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPhe-0003Hc-9A; Mon, 07 Dec 2020 23:13:58 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPhb-0003Gh-CA; Mon, 07 Dec 2020 23:13:56 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7N5GB7189231;
 Mon, 7 Dec 2020 23:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=Ktdu4qmteWvXa71HFVIEcHcRM66wjaKYjDCbVCkZjms=;
 b=mQ0j1WMFcb4/Xb8gJNBgcYFZaEmazjxoFXvaqN6NC1bQHtVjcvo8Fk7pXq+muqPY/cDe
 yf5LrE64N8SVfGEiRYDhHZHfLLd2jBKNqXj8CNSTQcAONBLIGUDiRLrcEj4e/rdN/NCA
 Fa5vtMwvW10Eqfkkf0yypO834dEupF7mO1bgs11s05SSD0R1w7CnFxWrjVFuh0ZcHyEu
 5NGSBzBFVZbJAX2RKSojHQHr2lZVFvuQ3HuNynv+1HWikpYe5uqNAQYNZPliun59i6FT
 RMi4KyBaWKg0P7fPo4H1Lq+dZAYDNxvrgB+gzmhZliTiaGW0zoY7hZbnFzRIFvPv/Hlh Vw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35825m038n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 07 Dec 2020 23:13:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B7N6SFn190955;
 Mon, 7 Dec 2020 23:13:49 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 358m3wyhp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Dec 2020 23:13:49 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B7NDmIE015578;
 Mon, 7 Dec 2020 23:13:48 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 07 Dec 2020 15:13:47 -0800
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3] scsi: ufs: Remove pre-defined initial voltage values
 of device powers
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1sg8h1a73.fsf@ca-mkp.ca.oracle.com>
References: <20201202091819.22363-1-stanley.chu@mediatek.com>
Date: Mon, 07 Dec 2020 18:13:44 -0500
In-Reply-To: <20201202091819.22363-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Wed, 2 Dec 2020 17:18:19 +0800")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=1 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070152
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9828
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 adultscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012070152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_181355_593930_3B4E3EEB 
X-CRM114-Status: GOOD (  12.89  )
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
Cc: jiajie.hao@mediatek.com, alice.chao@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> UFS specficication allows different VCC configurations for UFS devices,
> for example,

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
