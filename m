Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F975C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 04:11:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FBDE2076E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 04:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1t9fo8aj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D5W4ihra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FBDE2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZzS8TnsaJsQOQAFyFCiMTUyrr6yIH00HvRO7ubPudpk=; b=1t9fo8ajG/KdOH+Ttp1SAYMqo
	QxUsfiKrVqpepWZwQxmdP3F8T7R01pM4NgHkZbpqaEHZpJUnvnxn9WUBDOS8BWIeT+2BiSpcj5DGW
	UTCOAk7cXswSNwe6394jG5tZcGhgaxMO68Urcq1aYh/9LGxLJFxAd54v4y2J7ekop/IO6L11SpnUu
	HXQ8a0SLxxZbS5NpbKIX/WNAZ95MW0r5oMXeqVQBrH29gThbDj5o9YHJ+Z9gSclJqyN7s14qkjYZX
	Sj9hiYShhl6SBSioz2Lo3JhyARLHFcXoabq2QEKxXmkQQnOJpf+vdaFqrghKqOzaU9N9L1Na8LtC0
	hvMeLYNcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0dQk-0006qS-Ef; Wed, 29 Jul 2020 04:11:02 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0dQj-0006pz-4E; Wed, 29 Jul 2020 04:11:02 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06T43OLU179316;
 Wed, 29 Jul 2020 04:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=id7C7n+jUhumjsERzSUGa3dPkmeF+wO+aUQY58h5H8Y=;
 b=D5W4ihraf+rBnrDLBhlAu+ByO6bjk0IfKP3Y9SIuIcIMR1qlTJKBCgOseDKzzxkBYT0L
 L7hpGpo4j8DNqH6kuvTyophnUM+5juQ3U7gyx4K57Hg1h/gm5p8yYkmR7DFlOEXmpXXN
 8ZyoLJQaGS9o6p3ToNvXcj4OeXluzao2p09+9Vbi63lYpNhuFEMBIVjo6DF81rPh4s0Y
 hfDJJTgIEB0v4QEMGRWamdR32y0h1M55wpQa1rboqED2p9G8nLdaRyLMslLNRAoWAu0R
 zQMh4zS4ZIgH3oubYm873NiwYbopVAY0xNvOAcVUoa7CWGRrJtWVCwCnhOS6iHn+4/ty 6g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 32hu1jk62m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Jul 2020 04:10:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06T42aoQ023694;
 Wed, 29 Jul 2020 04:10:51 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 32hu5u1pxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 04:10:51 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06T4AmQZ030771;
 Wed, 29 Jul 2020 04:10:48 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 28 Jul 2020 21:10:48 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Stanley Chu <stanley.chu@mediatek.com>, alim.akhtar@samsung.com,
 linux-scsi@vger.kernel.org, bvanassche@acm.org, avri.altman@wdc.com,
 jejb@linux.ibm.com
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Prevent LPM operation on
 undeclared VCC
Date: Wed, 29 Jul 2020 00:10:39 -0400
Message-Id: <159599579269.11289.6290519953354146093.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200724141627.20094-1-stanley.chu@mediatek.com>
References: <20200724141627.20094-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9696
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=940 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007290027
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9696
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 mlxlogscore=951
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007290027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_001101_335303_557C0F42 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, beanhuo@micron.com, peter.wang@mediatek.com,
 chaotian.jing@mediatek.com, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 24 Jul 2020 22:16:27 +0800, Stanley Chu wrote:

> In some platforms, VCC regulator may not be declared in device tree
> to keep itself "always-on". In this case, hba->vreg_info.vcc is NULL
> and shall not be operated during any flow.
> 
> Prevent possible NULL hba->vreg_info.vcc access in LPM mode by checking
> if it is valid first.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: ufs-mediatek: Prevent LPM operation on undeclared VCC
      https://git.kernel.org/mkp/scsi/c/0255b1e3d849

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
