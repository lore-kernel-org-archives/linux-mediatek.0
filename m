Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30432C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 04:33:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61B0C24671
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 04:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rFFsX/hj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="wFDiUo6i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61B0C24671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ojgi39gUJNoV95pDeoPJrjNgwreAph7O+deR3IqWB8=; b=rFFsX/hjpHuQYrI35DV++ex1p
	rsTquliwX6gLDv7/TnrBS4oLM93JCGQkJlVKWMRZtxFTdWhTsbF0QLLjVLNBfueQ7e5S1jjnhxUwv
	cDPsV2O5Zr23OcTM4r42mnWFuE7AeTXMr4khEuD1oFrZDwtiGF04ywwkbRH8gWlP5xqNkMqe49ZRD
	lmvvMzBlziosFx3xBOkV46bWOdjJf+9R0sHVFzstZDeXeWiNKCazu7e2eUBdzuKYbBZCMnos3zEqv
	UcD52RO4Xa5mtenKKvDy4sKNS+3DpM+0jJ0o2tjC0fkZL2/KifjMegSQRW5YGEOHhS+u1W+MpFPgw
	7D/l8Lgiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kesgQ-0001cP-D0; Tue, 17 Nov 2020 04:33:34 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kesgO-0001c0-EZ; Tue, 17 Nov 2020 04:33:33 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH4OSrx161203;
 Tue, 17 Nov 2020 04:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=EshNhEFwh1JJV/VNuwzW9QTaC7Bvbm9d7b6KWQCmOho=;
 b=wFDiUo6iRgfzZTEIdhfF89uMbyIKr75LZMJFXT0FbVQweW6K5NJl4C+S0b9mNp2GJON+
 jvCujcRJ/Wevc4KByozmj5KoeWO/7JLQVUXYYzzXNPw6dHnxbaOux+3yQoY0sDv8x2SG
 kwxgeopaf5e2iXNx1GPIGNNAwup+QDYXLHgmmE++VzPRNePmF6RhqI18nJYlkhg/wCre
 2XXqw78xjpDTWAl5MPI9jYTojkL+aUrS/YFeZykpAyAEc8Zv88wNIkouWx4qL7eaTTfu
 7Ikv9RmX1HuS4t5Z41T1j75ckqG+J9FLVl/QNPXyBNgA5FvN0HVQwjMoCdIJT7s170za 9w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 34t4rarm0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Nov 2020 04:33:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH4VYsF039937;
 Tue, 17 Nov 2020 04:33:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 34uspsv0v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 04:33:22 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AH4XCIa017287;
 Tue, 17 Nov 2020 04:33:12 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 20:33:10 -0800
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH] scsi: ufs: Add retry flow for failed hba enabling
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1sg984n7p.fsf@ca-mkp.ca.oracle.com>
References: <20201112054537.22494-1-stanley.chu@mediatek.com>
Date: Mon, 16 Nov 2020 23:33:06 -0500
In-Reply-To: <20201112054537.22494-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Thu, 12 Nov 2020 13:45:37 +0800")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=1 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170033
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=1 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_233332_687091_C113EBD4 
X-CRM114-Status: GOOD (  13.54  )
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

> Once hba enabling is failed, add retry mechanism and in the meanwhile
> allow vendors to apply specific handlings before the next retry. For
> example, vendors can do vendor-specific host reset flow in variant
> function "ufshcd_vops_hce_enable_notify()".

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
