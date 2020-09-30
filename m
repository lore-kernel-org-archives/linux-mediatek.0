Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B70FC4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 03:37:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BA8121548
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 03:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="02d1NfUa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TH29ePoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BA8121548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AUcQ5vN6OZ4tDNVVz+ppLLc8cBNuHN6bNYolatgVMcs=; b=02d1NfUaztDAbkkE7MBx/gq9r
	oZFGH9T0qLcTiL/tOvvZt88kIN5asNzPN/5ZxeQNdiPUoCtF23buzMiXZheqWy/mDNHtZImDLc8e0
	xERmeEQ69L8y+/qTEGBxr4NoluZTjX7ZAC4/XR8epT6nIF9a8YenRqNi1Y10WtV3ev6wcf7RXIvn1
	aPiCgzledu7hIigjR0VO92Vo8krjEF0tvp2HZZhBRs3f5miLc5l3CX+UKxBQOCW1SqewcGO+JbwqS
	dF2zVFRRWpcRy9LsrOuNtAmrlw316gN9p2UXlv+Tq5bs1zQCfbas7os9nDU6Y5VvgA9RMaWVwF1Dh
	yxN/f58dw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNSvj-0000w6-5s; Wed, 30 Sep 2020 03:37:23 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNSvh-0000vf-29
 for linux-mediatek@lists.infradead.org; Wed, 30 Sep 2020 03:37:22 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08U3PW2U124710;
 Wed, 30 Sep 2020 03:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=JIO2OhkkQj/te/56QEIG6eLxxBrz3gNMbTJM/EjNIE0=;
 b=TH29ePoP1RKgZ3g+wmY/4SK2ohmC8Hz1XBIWFYRGKQuGHmpzPziOjeYclheu6t4jQSnU
 MNGLyoww1N+9+2YXG5hG7kOn4d4fy1d3vQzkKyHKsfnAMtP/LigYsaQU9OHxTwv2c++k
 7siM1tVHfqBf3mn4b53EpRaP3sIJ9sPToZTOBOc9z2epmmno5TSznsH7pUR3OzaFHac4
 CDTBgV+q3uGvAwgTq16Y3aGQctuHyFw1odp5IL806vFY4iOXNdJMrPMP02KIwPlHMRJ0
 I0fW9u069WH/PsKoUOA+gWX+fPfifHzMYVNN0KyKVzyuzANibJ3iXeL515zGfr+oheEh EQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 33sx9n67e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 30 Sep 2020 03:37:04 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08U3QVFX064910;
 Wed, 30 Sep 2020 03:35:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 33tfhygkyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Sep 2020 03:35:03 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08U3Yxha015339;
 Wed, 30 Sep 2020 03:35:00 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 29 Sep 2020 20:34:59 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: avri.altman@wdc.com, chunfeng.yun@mediatek.com, kishon@ti.com,
 pedrom.sousa@synopsys.com, robh+dt@kernel.org,
 Stanley Chu <stanley.chu@mediatek.com>, robh@kernel.org,
 yingjoe.chen@mediatek.com, mark.rutland@arm.com,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 alim.akhtar@samsung.com
Subject: Re: [PATCH v3 0/2] scsi: ufs-mediatek: Support performance mode for
 inline encryption engine
Date: Tue, 29 Sep 2020 23:34:51 -0400
Message-Id: <160143685414.27701.1344452138838007621.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914050052.3974-1-stanley.chu@mediatek.com>
References: <20200914050052.3974-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300023
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9759
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_233721_264274_03B6C38A 
X-CRM114-Status: GOOD (  20.12  )
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
 henryc.chen@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 vivek.gautam@codeaurora.org, arvin.wang@mediatek.com, jiajie.hao@mediatek.com,
 chaotian.jing@mediatek.com, liwei213@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 14 Sep 2020 13:00:50 +0800, Stanley Chu wrote:

> This series adds high-performance mode support for MediaTek UFS inline encryption engine.
> This feature is only required in specific platforms, i.e., MT8192 series.
> 
> Please help consider this patch set in kernel v5.10.
> 
> Thanks.
> 
> [...]

Applied to 5.10/scsi-queue, thanks!

[1/2] scsi: ufs-mediatek: Support performance mode for inline encryption engine
      https://git.kernel.org/mkp/scsi/c/590b0d2372fe
[2/2] scsi: ufs-mediatek: dt-bindings: Add mt8192-ufshci compatible string
      https://git.kernel.org/mkp/scsi/c/c1a3bf99d76e

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
