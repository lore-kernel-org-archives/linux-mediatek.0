Return-Path: <SRS0=h1kY=43=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA4CC18E5A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 23:45:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 687D521927
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2020 23:45:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GjnW0++V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Hi7l34ci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 687D521927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:From:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYQTmxCcXloGw7LD+EU8KxUTL+qag7XyvTAjrkcdpDI=; b=GjnW0++VfSRoVz
	VIDR4YibjqiheD94J05/Avv8no6N+ZAWY9x2dGSHeGrTm7MnloopmGlQPROWjgI1J7STP4EHglr5A
	abAjGg2GwhwQaPu5LqW4A4LHgwhd8lJDQphGUczxrTkBBUUEKPBXOsICfp6FBI0Z6nQFQbvRvh82X
	h5fDQZU13nRu7/YCXccVkZKbZO4yETJ6R1wcpLcl+BX/bNVN7FBzwa5a3oChxZbL2S2DGUG+L0SaM
	z8VvdiPv4VHrABMsW1rPkTOJPEiQOkmbJR7LxH0rS06eWSQVddTdldh8oolz3hY5Ui+r5BDdJKRIa
	CRlHmq4KEZygAN4ou9JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBoZF-0006UK-CF; Tue, 10 Mar 2020 23:45:45 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBoZC-0006Ti-4U; Tue, 10 Mar 2020 23:45:43 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ANhTSo135638;
 Tue, 10 Mar 2020 23:45:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2020-01-29;
 bh=t3CA39n3UemhFU8/j6KVedJ9rMu0CeiYG8DJJnO77hs=;
 b=Hi7l34cizeoGMQ+pG8b8oPMIKs3X8X6xog1jV9IRfbgrjHthutqnZ3S91JmQ8UO+34Hc
 pywiNbqXiwUiH1E0HQaZch5Bscgi+hfvjMkIYT3RrsNg7xRpnCUHCENyHsvvPl1+kTKU
 UGLL+6wmRjBQ1kI29mp2XIhMOjfwiMQYz0R2Bgwru4XqKsPsP+aQ8Q4F12hufQ4lAbAn
 UGR414x6KiiCgzXRDdqUjfr6n5N8n1MnACx9i3PmVODUcjn6m4xhSNtGiFMtyoCTxKYP
 rmYuBL5nZRdT36bERS3IjU3vBxORlUXqkmp9zUs7vHa/+P0E7ExliH3Trokf1ntuJnfl eA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2yp7hm4x05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 23:45:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02ANgxEg035875;
 Tue, 10 Mar 2020 23:45:31 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2yp8puv78x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2020 23:45:31 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02ANjSEx023734;
 Tue, 10 Mar 2020 23:45:28 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 10 Mar 2020 16:45:27 -0700
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: fix HOST_PA_TACTIVATE quirk for
 Samsung UFS Devices
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20200302135346.16797-1-stanley.chu@mediatek.com>
Date: Tue, 10 Mar 2020 19:45:24 -0400
In-Reply-To: <20200302135346.16797-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Mon, 2 Mar 2020 21:53:46 +0800")
Message-ID: <yq1zhcnsrjf.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100142
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9556
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003100142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_164542_216734_49636589 
X-CRM114-Status: GOOD (  12.25  )
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

> Device quirk "UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE" is enabled for all
> Samsung devices by default currently.
>
> However MediaTek UFS host requires different host's PA_TACTIVATE
> configuration. Hence clear this quirk first and then apply vendor-specific
> value in vops callback.

Applied to 5.7/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
