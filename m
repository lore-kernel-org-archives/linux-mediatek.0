Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0778C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 03:01:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4484206F6
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 03:01:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BZXoLKz3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="sIJbJpgh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4484206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:From:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gks3JrW6jMtaN86Zvvdd25c+tRx9Mgub0MDjFP9UUKg=; b=BZXoLKz3WqxBYr
	psj2Q2xb3I8fx8r/n9cd3DdSh9MXw8jpRxE+T7eqqI2YKRzQXEMbm4DVJEWOPx7FKjzCLTH5zDlDv
	0XyEgJTwFu+vY5kHTh6MfF2h8wYkdxY1S9u4awja35c4PcLz8B7rAIoq6w0QzeEh6sMr8I0fEb4qC
	wFTb5aHmrV+YXVfndd3kkfeiQOpL2MXGsSXcqrSaAHPLMMn7n+ZRMLhI1ciAH6zMQ6q8IcMbufCJU
	sXHxBQGDtp9odt7RIEgmQ+geThYReNWR41X9yiqMbgaIRthnGi86BBPDUlhevyr0kz2hO8KfKKipO
	uXDS23BxxLeo2vXpt5QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHfEl-0002st-8q; Fri, 27 Mar 2020 03:00:47 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHfEi-0002sM-Ib; Fri, 27 Mar 2020 03:00:45 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02R2rHX1004219;
 Fri, 27 Mar 2020 03:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=/wkiygzUoOpQBZUiBLbZ9w4yqD+TzEh+mMQY5zK1otU=;
 b=sIJbJpghTsia/bckgGbtItBDEBVkW9TRgAuZC7bFdltY1zbJLzeEiQOJv2dSHv6/jwSb
 fCholSEZT/lkSRaaQ8cannQizUMbBtamdhViGb0E98zl7rcZpRZkc8RT8pUvTsPXU2dE
 8ycZ8S0GlFp0zq2Y8Yc0BTwJT3Mr7+wbyhO2zP03CvwfZsuP4KRNC1WC/QWzsWH/F5g+
 2eCJkjtJVb38yXu/ZySfDEJAf3+3tC9yTDgnut5RkiOpGRj6PCRBdUPVEgqIW/QY/3L4
 7lSSCEjBybBH11c2danVRGFX9BBu/K8N0jQuv7b+YD2VSNdbi3h/nskmNspjnCZzDBpP Ow== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3014598rng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 03:00:27 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02R2qrxu127717;
 Fri, 27 Mar 2020 02:58:27 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2yxw4uvbn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 02:58:27 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02R2wOrN014275;
 Fri, 27 Mar 2020 02:58:24 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 26 Mar 2020 19:58:24 -0700
To: Can Guo <cang@codeaurora.org>
Subject: Re: [PATCH v6 2/2] scsi: ufs: Do not rely on prefetched data
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <1585214742-5466-1-git-send-email-cang@codeaurora.org>
 <1585214742-5466-3-git-send-email-cang@codeaurora.org>
Date: Thu, 26 Mar 2020 22:58:19 -0400
In-Reply-To: <1585214742-5466-3-git-send-email-cang@codeaurora.org> (Can Guo's
 message of "Thu, 26 Mar 2020 02:25:41 -0700")
Message-ID: <yq1lfnmcxmc.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9572
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_200044_704435_A4E91B71 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: nguyenb@codeaurora.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>,
 Bart Van Assche <bvanassche@acm.org>, saravanak@google.com,
 Tomas Winkler <tomas.winkler@intel.com>, kernel-team@android.com,
 salyzyn@google.com, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Venkat Gopalakrishnan <venkatg@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Can,

> We were setting bActiveICCLevel attribute for UFS device only once but
> type of this attribute has changed from persistent to volatile since
> UFS device specification v2.1. This attribute is set to the default
> value after power cycle or hardware reset event. It isn't safe to rely
> on prefetched data (only used for bActiveICCLevel attribute
> now). Hence this change removes the code related to data prefetching
> and set this parameter on every attempt to probe the UFS device.

Applied patch #2 to 5.7/scsi-queue. Awaiting Avri's feedback on patch
#1. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
