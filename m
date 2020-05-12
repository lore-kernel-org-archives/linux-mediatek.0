Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C43C2D0F6
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 16:22:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 424AA206B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 16:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MRGLGyjK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WB1ARAwX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 424AA206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:From:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqeLJmYQGF+YwogfnvcN/HSgOp7op6b7kq3uOqjNrCk=; b=MRGLGyjKVuTO06
	haV/pRywSpMd1FHuntYcghIVAU1ojJLxLFGI5slAXV2JH0kF1Iv7n9JyiJFpbH/TtpAPF1m0JgkNN
	Ls4OVbkakFKTIuT2rNyDWT4Ri1vB+1fLHQawWltnv5tXGwoA5cX+MQn/5t45b4vLDn+0CQzwQKxNa
	JzB358ZSm27mBxUeNBFNnS3aj87psW9/LqdKPHg7UtIytDVAj9iNohBE+wRBhOXStR2RxoSqn/YIH
	1GWvJiYydj6ngTHEbCvakPio5ICkC8kTiDg3bw/v+9vudk3alAAPYnrlDWXQwrlUTgzgiQMFxiu0K
	432PvHUdvg1DvzEgJ9tQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYXfQ-0005gZ-V7; Tue, 12 May 2020 16:22:04 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYXfN-0005fk-Rz; Tue, 12 May 2020 16:22:03 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04CGCJmt015556;
 Tue, 12 May 2020 16:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=OyaR5MxMU3PPoMjghDt25i0Hctx3uK2R6FlsBKH+A5c=;
 b=WB1ARAwXINLjYpP5h6QLVmPJVJzLCG084isZwoPbJDzgY7XckKnh9KRr0N2dzUF4zwrH
 K6lZ9py+qbqpK/5En0f0Cj6SB0+yAwk6XgsEcbFLawbFabrFeg/JXc/5PxYL1qD3DfDC
 mjgmAL9+kL+2D/J5sRRszQWKP6KRkEed95MiJXYDYezw0UujemgFOehTOXuhF6a9SysU
 WnqMO+Z2LNt9GxL/eWCqp0jO1xQLjsoUU45TgVeZEIggTeMPWurjlcoLQFBV0iqSud04
 I7kdy0AG0vbK5Y/WSRbIeyfpGRnAYLP+lM1PiWoSnSMFjigykDT4/yLnWWSMewI/bq+k LA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 30x3gmm2wc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 May 2020 16:21:54 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04CGINVq155386;
 Tue, 12 May 2020 16:21:54 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 30x69tjj1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 May 2020 16:21:54 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 04CGLp24001016;
 Tue, 12 May 2020 16:21:52 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 May 2020 09:21:51 -0700
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Subject: Re: [PATCH v2 4/4] scsi: ufs-mediatek: customize WriteBooster flush
 policy
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200509093716.21010-1-stanley.chu@mediatek.com>
 <20200509093716.21010-5-stanley.chu@mediatek.com>
 <635f91f6-3a27-ffdd-4021-67705d4063fc@codeaurora.org>
Date: Tue, 12 May 2020 12:21:47 -0400
In-Reply-To: <635f91f6-3a27-ffdd-4021-67705d4063fc@codeaurora.org> (Asutosh
 Das's message of "Mon, 11 May 2020 19:19:42 -0700")
Message-ID: <yq1v9l115us.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.0.91 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005120124
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9619
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005120123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_092201_990914_A2377ACB 
X-CRM114-Status: GOOD (  10.40  )
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
 Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi Asutosh!

> Patchset looks good to me.
>
> Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

When you want to approve an entire series, please respond to the cover
letter email. Otherwise the kernel.org tooling will only record the tag
for the individual patch you are responding to. In this case only patch
4 got tagged as reviewed in patchwork.

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
