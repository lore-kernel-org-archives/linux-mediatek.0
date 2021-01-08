Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C78DC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 04:20:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44D62075A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 04:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A44D62075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YxQJy4fPr0OOGdDRmkP9SuZGf47qZTdouDTIKXFISEM=; b=oLMWXBccfHp9ePp6xTkrWJcnx
	55kbY9UGuxQjusRvIwfgwh3mmtN/2hIbYBl98AnXT+qN+vo00S/YfRl5TDLfkROb4pbhUuHFnofZ4
	ukXUeRe2kJb1tua9x6Fi7FO8ZOnEN8ZjBDC4dNnMjGKq6S63IgodDoEBo2oEV04sEgnWMmHg5GBnT
	PeMWXQZHNKyE5+lo9B2+TZwbFzskke1y4UZgDkAik44x7h2t3AOCmKRlaWPJ+ErdeID+J9ACcHzdn
	K+G05Ud3FhaFw27BqZg/+SIRwW6ILOPcKdaPSjQJPqFlOq9S+WBQLUggOBGxsK7BzVC6I5vYvInq2
	O/6T3FoqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxjFu-0008Mf-Al; Fri, 08 Jan 2021 04:20:06 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxjFr-0008M7-PY; Fri, 08 Jan 2021 04:20:05 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10849fcd106185;
 Fri, 8 Jan 2021 04:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=yZzYiFILMo+MCkdifb5EGY33AydWCm2X4YPlhcEGEgM=;
 b=EO0fpG0qFkDLFfRKU8FoaKNDAIjDTAAtwinun2P2mXnP3aIGvgPQ8eDxJ7BRU/sRRqrX
 vFvcXeofnBruXz1RMkZcwmJ6jHeOTD/jHWKQ7xNE3107tbE6k+vTIV9jfTa3ZlAt5Wyk
 HixsnR+Aav01bjW+uaElW77Ceu4XhWbqSIE2PHqX039sm3IjKDoDIbbNWzK1f7BkXvjD
 Rndw6wuzsHGOkJVdeb/BGKiRAHfLVGtTlrxJPVK/wiFqGuFzwqlNQpUSOFv09PAFQG5n
 IzWazj7tF1Phi8iZyqD5BWD1ecYJRQYnr71F/iC8Y2jpZQ+ZTbhgjrn4tXOymhXFjc4K 0A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 35wftxeyt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 08 Jan 2021 04:19:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1084ATkY040361;
 Fri, 8 Jan 2021 04:19:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 35w3qut0gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Jan 2021 04:19:57 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1084JuOi012527;
 Fri, 8 Jan 2021 04:19:56 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 08 Jan 2021 04:19:55 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, Stanley Chu <stanley.chu@mediatek.com>,
 jejb@linux.ibm.com, avri.altman@wdc.com, alim.akhtar@samsung.com
Subject: Re: [PATCH v2 0/2] scsi: ufs: Fix power drain and hci quirk for
 WriteBooster
Date: Thu,  7 Jan 2021 23:19:40 -0500
Message-Id: <161007949337.9892.11394622290093764791.b4-ty@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222072905.32221-1-stanley.chu@mediatek.com>
References: <20201222072905.32221-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=944 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080021
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9857
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=960 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101080021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_232004_000415_B9AEFE09 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com,
 bvanassche@acm.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 jiajie.hao@mediatek.com, asutoshd@codeaurora.org, chaotian.jing@mediatek.com,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 22 Dec 2020 15:29:03 +0800, Stanley Chu wrote:

> This series fixes two WriteBooster issues,
> 1. Fix a corner case that device flush capability is not disabled during system suspend
> 2. Fix the checking of UFSHCI quirk UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
> 
> Stanley Chu (2):
>   scsi: ufs: Fix possible power drain during system suspend
>   scsi: ufs: Relax the condition of
>     UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
> 
> [...]

Applied to 5.11/scsi-fixes, thanks!

[1/2] scsi: ufs: Fix possible power drain during system suspend
      https://git.kernel.org/mkp/scsi/c/1d53864c3617
[2/2] scsi: ufs: Relax the condition of UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
      https://git.kernel.org/mkp/scsi/c/21acf4601cc6

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
