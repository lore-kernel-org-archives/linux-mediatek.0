Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B336C56202
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:31:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE92D22267
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EA0UWXis";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lWHAHkAD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE92D22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7diJCLqgEj+AYUgCpNcOo7mkXBZl27Cp1g3XAhfT6E0=; b=EA0UWXisfE6PeU7jmgWgNT1Yh
	isL2ElAYjO8I+R+DUrcl7cj8IPaBwva7ytnBlD4fwRBV0fgDUIelUGTxKkIftAtG5lDhrX7i8qqBU
	cKsqI9YsUAee6Nwahy5GSjWKworNol0CXv6AxJPzKv395r+/Wf/dQlM8bedyU/stGiwN6aF7XBDL+
	tYg5GNzAgDZahFDBxU1hMrD2aMiHZBOjyNbisEjED8v9euJYViVPKGT/DXGPB/KBC7Lm0l18UEvFx
	qMrHtXlA8N0uaOPXjmDWIbzsxBuE1D3kU16pqZK1xmm7tOXkEXokZkA/oiAfNptr0Zy5NFew+PWaz
	1kxZqiAkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfx8T-0002SH-48; Fri, 20 Nov 2020 03:30:57 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfx8Q-0002RE-9K; Fri, 20 Nov 2020 03:30:55 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK3POrJ096713;
 Fri, 20 Nov 2020 03:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=jpMD3b1qJW/Kul31vRtcwfkmxhU26skq+zg6BUmega4=;
 b=lWHAHkAD0KmpcibgC0Z1+H2PrV/CUbDLr7rie2WaMBxfIjbR1dwusGS4rZvG/W1kP5kp
 tt9mQYoNNZXX+iGSciu29U6CbSQvuXQZdT6oxsl497RxZwA31oFsRvkthsZnf7XSEG3E
 FkKTztrFIwFclkJ2oSzL/rtkzFbO1c3TWKyNE4QlikmIHN08lVNqoZdKdnZfHk/IWKbA
 aQ+xuJyTXjy9hZBcPz2TG0/HleMRX+JjFEL0lgDiyKNqcjenxtnZyw6ZMb4ciDzXbCV5
 Bfa6sA7qBh8qGuYlqNgicogwawemTPLGc8zPG41ctu4uWVuZcB0ji1KTvOTg6h4APdDx Gg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 34t76m8qvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Nov 2020 03:30:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AK3PjYv032437;
 Fri, 20 Nov 2020 03:30:41 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 34uspx2hq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Nov 2020 03:30:41 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AK3UaPc017127;
 Fri, 20 Nov 2020 03:30:36 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Nov 2020 19:30:36 -0800
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Stanley Chu <stanley.chu@mediatek.com>, jejb@linux.ibm.com,
 alim.akhtar@samsung.com, avri.altman@wdc.com, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v1] scsi: ufs: Fix race between shutdown and runtime
 resume flow
Date: Thu, 19 Nov 2020 22:30:34 -0500
Message-Id: <160584260540.532.6488395968913616505.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119062916.12931-1-stanley.chu@mediatek.com>
References: <20201119062916.12931-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011200023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9810
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011200023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_223054_505085_29E5C161 
X-CRM114-Status: GOOD (  18.54  )
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
 beanhuo@micron.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 19 Nov 2020 14:29:16 +0800, Stanley Chu wrote:

> If UFS host device is in runtime-suspended state while
> UFS shutdown callback is invoked, UFS device shall be
> resumed for register accesses. Currently only UFS local
> runtime resume function will be invoked to wake up the host.
> This is not enough because if someone triggers runtime
> resume from block layer, then race may happen between
> shutdown and runtime resume flow, and finally lead to
> unlocked register access.
> 
> [...]

Applied to 5.10/scsi-fixes, thanks!

[1/1] scsi: ufs: Fix race between shutdown and runtime resume flow
      https://git.kernel.org/mkp/scsi/c/e92643db5148

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
