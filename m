Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29B6C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 02:24:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40B420FC3
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 02:24:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XkMlXa4y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hK3v0Z+O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C40B420FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3CtGxSZBvo8KnY2WcJ7qKyqPd9KpX5DqQOyPxBmFh8M=; b=XkMlXa4y2luRgXh2m4uChCSGO
	iPwayKEZw0MTwIDiAa2Ekv7hrFT+5GfYj40IhmDOD9LyZjnl1jqJM9rofUyX3CDLQmkOmAan1X44F
	pnhX3VMMU//EhrpJ1gGb85qDoBPpaP+N0TL4A4IOwQAGpr96VcN6kRzqQgrxF8MljXDrRzYOlS73N
	FTgNYC9Hg63gAlGxFXwSzGSHNo68LduvUWMUeQxKiq1FWij4h5lQ5lMcn1FFwDOXgXW1TgNKnL0sT
	oHyotIqrPNU3/4a3HeF7LuwGwGmhI/luS3gWIrJjrD8G9vK3Lqt7TE7AN2eL9sj8zETVCcWC7Ejfx
	4FDbmtOZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0yF3-0001nI-GQ; Thu, 30 Jul 2020 02:24:21 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0yF0-0001mR-Rr; Thu, 30 Jul 2020 02:24:19 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06U2Mwfl076425;
 Thu, 30 Jul 2020 02:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=5nt+OQOgz9c1Jq5csx1e1cWddsT+55Nv1ODVtbhfM0g=;
 b=hK3v0Z+OKX9UG3MsvIeECKyoATY6qUZIPJCZQIdHmtHsAdUJw5T0WRa4T8rK2PX/XptV
 E1RbQRF4FK/leboMwWJjXU/PLexsnFqPwpCdUjVOHbjd171dB6WhAL6n0GPWbu6wWLRl
 lYkl8Idj9dAu8p13xHFVOMEnBXFcUwzfyNu1Av68aWYnZpfMzKQJch75Jta8HDn4oZ13
 CdSSfIkiKohS9i+QZZxG7uT26zEPcIi+7/HPMRIscX4Gb1B8dLECV9DJJ3VHLxd570HO
 5+TVAskoL/YLC1ujbvyEX5ilrHdUiVcmIB1nH4UmReE4+nLvACFN7nk7zTpWg7I+wsdO mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 32hu1jh3hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 Jul 2020 02:24:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 06U2NPif162325;
 Thu, 30 Jul 2020 02:24:09 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 32hu5vvh46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jul 2020 02:24:09 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 06U2O4Tk018408;
 Thu, 30 Jul 2020 02:24:05 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 Jul 2020 19:24:04 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: alim.akhtar@samsung.com, beanhuo@micron.com, jejb@linux.ibm.com,
 linux-scsi@vger.kernel.org, avri.altman@wdc.com,
 Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 0/2] scsi: ufs: Introduce and apply DELAY_AFTER_LPM
 device quirk
Date: Wed, 29 Jul 2020 22:24:02 -0400
Message-Id: <159607582923.27464.16053842449051029984.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729051840.31318-1-stanley.chu@mediatek.com>
References: <20200729051840.31318-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9697
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=853 mlxscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9697
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=864 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007300015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_222419_071117_32B586CF 
X-CRM114-Status: GOOD (  17.08  )
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
 matthias.bgg@gmail.com, chaotian.jing@mediatek.com, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 29 Jul 2020 13:18:38 +0800, Stanley Chu wrote:

> This patchset introduces and applies DELAY_AFTER_LPM device quirk in MediaTek platforms.
> 
> Stanley Chu (2):
>   scsi: ufs: Introduce device quirk "DELAY_AFTER_LPM"
>   scsi: ufs-mediatek: Apply DELAY_AFTER_LPM quirk to Micron devices
> 
>  drivers/scsi/ufs/ufs-mediatek.c |  2 ++
>  drivers/scsi/ufs/ufs_quirks.h   |  7 +++++++
>  drivers/scsi/ufs/ufshcd.c       | 11 +++++++++++
>  3 files changed, 20 insertions(+)

Applied to 5.9/scsi-queue, thanks!

[1/2] scsi: ufs: Introduce device quirk "DELAY_AFTER_LPM"
      https://git.kernel.org/mkp/scsi/c/33166bebcd6d
[2/2] scsi: ufs-mediatek: Apply DELAY_AFTER_LPM quirk to Micron devices
      https://git.kernel.org/mkp/scsi/c/4d4673745fe2

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
