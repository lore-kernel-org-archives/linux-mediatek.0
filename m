Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7C5C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 03:10:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD86020836
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 03:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hQzgqIdy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UVMiQAzv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD86020836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ykZdMOgC+TbdOmJDvGQ/yK9HoxFSML+j8l1Vs88PHGs=; b=hQzgqIdySZPx1FT0L5oKzLb9V
	QVDH/Wg+i5V+WFGtyw1M4urJjTrf4QkRYuFfX7HGQtXda0unO7fgGmhEFJs/GtD2SJ/DShLzDhXUg
	jwEAhdXX+JSZg3fFi3Vuy7HIqq0xqAbq9/tZ/lmjwq+S4Co6Te3Uxtq6UZ1cdeNe4J8aGbAwpOchP
	dqG5bZMkaUX2UoteWRWr3KAk2Z2Yv064JddniIZbPSgw6P9U4CuVkx+EQ0xMd8iyzwjVoJUpE5bYj
	7JKvvVEkNWHAgPdMXiuKuorF+lj+4bWvRi9hOCWcGOobVCb4Hnbmu4HRiJhNlQFZuHlYS8ulhdRNT
	vJZhVz0xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp1Dz-0002rP-BH; Sat, 27 Jun 2020 03:09:51 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp1Du-0002qn-M7; Sat, 27 Jun 2020 03:09:48 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05R387Yh140563;
 Sat, 27 Jun 2020 03:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=xIrmrUzyhNuy2QdFNyWnEHlW+Vl1QGrjqP5R+DFTkvQ=;
 b=UVMiQAzvzEiz+I9s1sMlK7Zv/0o3tGDno+b+cbkiEqUnyY6WUryhHGnFspBP2ldoPuSR
 PAa5XWsxlRKf0NFWkTaKuEce7ArhmKT59dh1akNofeEdlv4fFub6+ELOxHMbhZQpVIqI
 fkNuAUDqYGN6TJJO1W+L7Wme2qah1Z9JGttuhBC3KcEA1GlIYIGQER9S6GXWXVVsL6ot
 3kAskece3czHPrt+PexLMHT4TZ8sEoCxVROq/FYnPPrtBlrHWPQ1B9IGiXBhmdNYGKFE
 PpXsm+L00VqCErJPghOokghObhEmYCnbXlLYTFrFE94QSOId1lfleE67RuwEmAPq+tyX tg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 31wg3bkcdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 27 Jun 2020 03:09:37 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05R38I2M099922;
 Sat, 27 Jun 2020 03:09:37 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 31wv58terd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 27 Jun 2020 03:09:36 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05R39Xg4010865;
 Sat, 27 Jun 2020 03:09:33 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 27 Jun 2020 03:09:33 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: jejb@linux.ibm.com, alim.akhtar@samsung.com, avri.altman@wdc.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2] scsi: ufs: Disable WriteBooster capability in
 non-supported UFS device
Date: Fri, 26 Jun 2020 23:09:25 -0400
Message-Id: <159322718420.11145.18067065778687552607.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200625030430.25048-1-stanley.chu@mediatek.com>
References: <20200625030430.25048-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9664
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=902 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006270020
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9664
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 phishscore=0
 malwarescore=0 cotscore=-2147483648 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 mlxlogscore=911 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006270020
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
Cc: bvanassche@acm.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, asutoshd@codeaurora.org, peter.wang@mediatek.com,
 chaotian.jing@mediatek.com, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 25 Jun 2020 11:04:30 +0800, Stanley Chu wrote:

> If UFS device is not qualified to enter the detection of WriteBooster
> probing by disallowed UFS version or device quirks, then WriteBooster
> capability in host shall be disabled to prevent any WriteBooster
> operations in the future.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: ufs: Disable WriteBooster capability for non-supported UFS devices
      https://git.kernel.org/mkp/scsi/c/a7f1e69d4974

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
