Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D41C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 02:52:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D246920C09
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 02:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GlCNXRzB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GOL2okPL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D246920C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N9yHD5v6/VOkFZG4z3a7hSUzcsf0851XSdKvVjKXtoo=; b=GlCNXRzBgLlWY7VKGg4oqGYNC
	oJizaDhfbbL3/RiS7HQfE2dErnWXT/Jglo7oD1jahNLZWQhpTcPTWElQjqH6HG6YXHaOi81xIDfWL
	DPLhDpBBVmPwFMG5rjtKYqri/e9WVuTL7MjDpYL23GWgNG6xxISmNjDKjSbkQwUfkdbKyTz3W6uNU
	d1BdyqTGqQgJW602tPQQSELjjFxWDiWGnaTXGs8K2ZXl6OqTb2pAZT46QweCDu5NNH+kntcC3lxje
	mFifDH5udcCr0Vj2SKizgMt5JG3Zcr9NmbMNRxv7bCr4sqg5oqPUU8Ilk5/fv1ZtDfHmTVo/imT10
	otoUTlu7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqE2-0000cN-Mi; Wed, 09 Sep 2020 02:52:46 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqE0-0000bv-QR; Wed, 09 Sep 2020 02:52:45 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0892p5j0162498;
 Wed, 9 Sep 2020 02:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=C939ozeuxWuJ6UaWKKgz1ial42qnOOBORlZagTLnDZA=;
 b=GOL2okPLjNan8Ky8Dg7r/p8ODKqq9PWl+8KmOrenLj6O3sY7eeXENiVJhkTszTbVQOU0
 4kz3EPwjkW/v1O6eTruAT0KfN3fqeh8Vxiw7MlZYVlBEvnz231KFu402fIR1aZUPmvw5
 NrREUj+tA+Ip/C4FZ6z/ve9ilplseBhZOKf+TVa0gKdU9ubb4H6xmBD2/ud1KJ604ViF
 o+Lz383UTGTW6o147OaVSK05gcOMxfgKS7arwEck4Rg4QNbgOVhm+MAsO0EcQ0kk6wyJ
 6qXc1oBX0IpNPshhcLUdiK7SHErW/zhVV8wWwYi4ggNCQg1LXKbyi5EiJAWXRemDG931 jQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 33c2mkxysb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Sep 2020 02:52:36 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0892jg7m100313;
 Wed, 9 Sep 2020 02:50:35 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 33cmerym5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Sep 2020 02:50:35 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0892oVNG021963;
 Wed, 9 Sep 2020 02:50:31 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 08 Sep 2020 19:50:30 -0700
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH 0/4] scsi: ufs-mediatek: Fixes for kernel v5.10
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1o8mf4qah.fsf@ca-mkp.ca.oracle.com>
References: <20200908064507.30774-1-stanley.chu@mediatek.com>
Date: Tue, 08 Sep 2020 22:50:27 -0400
In-Reply-To: <20200908064507.30774-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Tue, 8 Sep 2020 14:45:03 +0800")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=1 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009090023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9738
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 suspectscore=1 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_225244_985023_D7DB0800 
X-CRM114-Status: GOOD (  15.24  )
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
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, chaotian.jing@mediatek.com,
 cc.chou@mediatek.com, linux-arm-kernel@lists.infradead.org, bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> This series fix some defects and introduce host reset mechanism in
> MediaTek UFS platforms.  Please consider this patch series for kernel
> v5.10.

Applied to the 5.10 SCSI staging tree. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
