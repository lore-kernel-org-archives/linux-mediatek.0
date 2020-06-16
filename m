Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ACCC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 04:01:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD64F20734
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 04:01:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rpOvkDbP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aXtEHtJw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD64F20734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J0Sf4ZpE9AjLKq43CvZpeLgGhd0nMNTvgtBI3WNiC6A=; b=rpOvkDbPgZ1pCo
	OdgPxAfVEAJqn7l3ACqVzeQbap68AF9ixZKizsyII2Vrq6DB0BRcaIZ0m/M2HjuHPAM+t4eDuo7ND
	lvzN/GZf9omKBvrnjWX1nWJHLCTNpcJlWxqlaqe+/EpTF3CPJUNIQu4UyqzJ7RnRb2bfQtVn+VrwW
	s91NC3kr9OR4jxYEE53ntuEhFowyv6JoMDT/NpyKCMrJHXtGGuJetMt0MmZm4ssF9cfRpci0jPKW1
	zovqw1jke7LODwL4iLI+RPqlAO9SvFHTWpa7hCJSqRmwfnXglRJyPsuL1o8MdSfaMdlUaC/LYzlI/
	4rhmw1K+m2KbheySIAEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl2mV-00014X-0A; Tue, 16 Jun 2020 04:01:03 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl2lu-0000TW-Dz; Tue, 16 Jun 2020 04:00:28 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G3vSrw054579;
 Tue, 16 Jun 2020 04:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=sXd+sLQYg8FIhtEijA1MSrH4MGvysjc8wwzx8oKXDRo=;
 b=aXtEHtJwExEZAFN87i+MSxPEgDQhpPJn/kYAwCCvyX8+pz2GCqrQAxz/dVIZPSNkJbeL
 /rTnQwsF10c2DWIfPXUowa0Pr7ne0B030iFPvHAaMGloW1C1unxTuNKTnSoICJS57oSs
 r6nYbZT6hqbHBKfGcdhKlNe2StnR/eUGRDqU+pZFbyrGOkPoZSmDmE/FkmfX8iJIy00D
 i62JjGiQQ0pr5K4f8ZAqKwkUObhmd9eq8xA7BnqPjTmdJucS1/l5dO2F9sR3zhRecsZJ
 UmAC5h/I26MeO72BBimG+/Q9l8XgORbW7/PjOmnXJx5BwwSPmSNel5/LxPoPDhGl7L0P rQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 31p6e7vdm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jun 2020 04:00:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G3xOcP131220;
 Tue, 16 Jun 2020 04:00:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 31p6dcae72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 04:00:18 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05G40Hls021447;
 Tue, 16 Jun 2020 04:00:17 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 15 Jun 2020 21:00:16 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, jejb@linux.ibm.com, avri.altman@wdc.com,
 Stanley Chu <stanley.chu@mediatek.com>, asutoshd@codeaurora.org,
 alim.akhtar@samsung.com
Subject: Re: [PATCH v3 0/2] scsi: ufs: Add trace event for UIC commands and
 cleanup UIC struct
Date: Mon, 15 Jun 2020 23:59:57 -0400
Message-Id: <159227986423.24883.2736410952583648653.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615072235.23042-1-stanley.chu@mediatek.com>
References: <20200615072235.23042-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160028
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9653
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 cotscore=-2147483648 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006160027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_210026_576427_0A47F951 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: linux-arm-kernel@lists.infradead.org, bvanassche@acm.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, chaotian.jing@mediatek.com, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 15 Jun 2020 15:22:33 +0800, Stanley Chu wrote:

> This series adds trace event for UIC commands and do a small cleanup in struct uic_command.
> 
> v2 -> v3:
>   - Refactor "complete" event hooks in ufshcd_uic_cmd_compl() (Avri Altman)
> 
> v1 -> v2:
>   - Rename "uic_send" to "send" and "uic_complete" to "complete"
>   - Move "send" trace before UIC command is sent otherwise "send" trace may log incorrect arguments
>   - Move "complete" trace to UIC interrupt handler to make logging time precise
> 
> [...]

Applied to 5.9/scsi-queue, thanks!

[1/2] scsi: ufs: Remove unused field in struct uic_command
      https://git.kernel.org/mkp/scsi/c/7a7df52dbc71
[2/2] scsi: ufs: Add trace event for UIC commands
      https://git.kernel.org/mkp/scsi/c/aa5c697988b4

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
