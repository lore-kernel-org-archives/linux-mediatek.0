Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEBCC43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 17:07:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31F99206F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 17:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNhyjsP1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lodNl1uk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31F99206F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:From:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPVWdyIERlxxnYyC+KgurOgYBxMH1U/wTwIgJ+65Gb4=; b=aNhyjsP1Y7U6J1
	fv4RIKcOJA1XrzrexiVhmuyjd+Ew7Xg/FavD8hTfQcVNf2lIu1X3pfEOBu0bZjB0ECwU/eesj/CRC
	wvAvafkz3me9okdX0jUGhNYlYaSVQCU+r1wKt/FJPlCTOtw2pWewkfVPP+EbG9FPecFlFDasEIq/j
	qQzqTYkLr3VtLItjaU3EmBYUMLglKCng8/E5tJbw6yy6mSxYflLfwh2FPxxwNMsX8W5Uq1Sc49iwC
	JNxFx5/cCilheBr22/iZSuo0D7DuB7CMzHfbw/Xscy3nWNLRhch9NJzY8xGAcsgaGxRZs03hwxdc4
	sqzaGLuGTqfBtum94lzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHsRf-00035u-4P; Fri, 27 Mar 2020 17:06:59 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHsRb-00034F-H9; Fri, 27 Mar 2020 17:06:57 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02RGrO9E016710;
 Fri, 27 Mar 2020 17:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=SN3O4Y5dG042zQht3ivK30o8UVK/pwtZpWfdz47WMlU=;
 b=lodNl1ukohVFLHlaRbyhRAkdEF9FlwV8CMo3re0LETjsKo0wWJRT8ygG+lVG9psHlkGJ
 ym8EY2/4xWFnCYVyJxECcmTnoHzmIwIHRC4Mh15iWHfNPiej162SEsyC0AA7SzU8szGn
 y+uWa4AdkJUmW3q9wDF+FFWUax6gxnYTSiHWp/N2Obc1skla/iIvvazJh1XZpe6oZHSy
 1bHN80KvbqwosbGS5KIDxSIaQTIphVHSDG1FXitDvHqrH1I4NNA6v26A569jsBE1y9ea
 8izAUw4YohVyBNRQnExfLZ7w4z+CD99gyGPH3vEpcclZsoojFewptsuaepAVlNiZi/cE 7A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 301m49gh3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 17:06:43 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02RGqt4B072701;
 Fri, 27 Mar 2020 17:06:43 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 2yxw4w7trh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 17:06:42 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02RH6dBD009423;
 Fri, 27 Mar 2020 17:06:39 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 27 Mar 2020 10:06:38 -0700
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 0/2] scsi: ufs: add error recovery for suspend and
 resume in ufs-mediatek
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200327095329.10083-1-stanley.chu@mediatek.com>
Date: Fri, 27 Mar 2020 13:06:35 -0400
In-Reply-To: <20200327095329.10083-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Fri, 27 Mar 2020 17:53:27 +0800")
Message-ID: <yq1eetdbuck.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9573
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270146
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9573
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003270146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_100655_702489_130E5B67 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

> This patchset adds error recovery flow for suspend and resume in
> ufs-mediatek driver.

Applied to 5.7/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
