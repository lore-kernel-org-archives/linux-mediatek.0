Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED66C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 03:15:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C20B20716
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 03:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c4gjSBx+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mmnn8Wjl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C20B20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=93/NpFGwle4fhXlg2oNL5fZF/4dAe7XjvbBTJPPHV98=; b=c4gjSBx+5qre5FASeZtsJ/RU9
	zCq98+E0MgHqtWN45my0GU5P8Z6y10JHM9zdTxS5MVKe8nIWwUWP23jEhOoGkx0mDrUp8wXHUgUxr
	HTFyryV5+lgyazSy2RzA5Pc0t6ZPZQFa31zp7eHp16oYzJlNJpt2dyChQBQs4mcREPx0WzMOxx5xA
	f61Ne+YVh0eDD8Mypgu+rrxAAvJy5Q+iYA9dDpQoom2FGnBrlidQBfXilAAEQEWblYuKZE4b+SxmU
	0U/L/ZSN05ed7LBZkqmsOO9WqJYvqXltN+JqMD7qYXi53rNhPn2A+KHT1bJCwj42p7W3Bu4g154U4
	1WWkfn4rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7s5V-0007U1-Jp; Tue, 18 Aug 2020 03:15:01 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7s5Q-0007Pc-00; Tue, 18 Aug 2020 03:14:57 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07I37RAJ032354;
 Tue, 18 Aug 2020 03:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=i0Ck21e9YZG44XY0ne7BebS9dKCanyt1u1wJwiaHac0=;
 b=Mmnn8WjlkbGgXmBmv7DM5ElBm40DDiYL0PwZYhBVgYS6+G/liu3TO3w8Blu1XWWUizFU
 8IADRKG1r+U8wj2rGAemvpIJhk/Idph45IM6ouH18iBR18MOkMqNuerYMG6lWD2Ks351
 crKd+IzZkWl2Yw0RCTnqdg1FRJHTsd49bftDVvyVY1TP/jys3cyQh8F1RNhOtWVy34oH
 PwbhjSoT4JdP1jMw2aeiZRnJuMozdmjaWUPjuDPKIldl+TkcM720Y7fy0e9UNox6ir4i
 76svkmlKSOuHIFShJW2g8XP5mGfMgWtF+n+R4FJsL4LBjnFqSQ2BL1DeDxzG3O4H9tYp Lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 32x7nma5mj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Aug 2020 03:14:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07I38BAZ104642;
 Tue, 18 Aug 2020 03:12:48 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 32xsfraxtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Aug 2020 03:12:48 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07I3Cksj021371;
 Tue, 18 Aug 2020 03:12:46 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 17 Aug 2020 20:12:46 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@wdc.com, jejb@linux.ibm.com,
 alim.akhtar@samsung.com, Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Fix incorrect time to wait link
 status
Date: Mon, 17 Aug 2020 23:12:31 -0400
Message-Id: <159772029326.19587.5344784814122261360.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200809055702.20140-1-stanley.chu@mediatek.com>
References: <20200809055702.20140-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9716
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180022
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9716
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_231456_186986_1A683E43 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: linux-arm-kernel@lists.infradead.org, bvanassche@acm.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, chaotian.jing@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 9 Aug 2020 13:57:02 +0800, Stanley Chu wrote:

> Fix incorrect calculation of "ms" based waiting time in
> function ufs_mtk_setup_clocks().

Applied to 5.9/scsi-fixes, thanks!

[1/1] scsi: ufs-mediatek: Fix incorrect time to wait link status
      https://git.kernel.org/mkp/scsi/c/215d32670251

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
