Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82969C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 04:00:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54B952082F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 04:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pLcpwraF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nPdg4EU7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54B952082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDDHqZPRi1DJH55BdlRt18GcJ4fjmyDyfyZ0v9p7MOA=; b=pLcpwraFpB7BMV
	3amLbPNt35g3E8mt7+Cyis3xPZFYVF0fqKu2G5bHSrILEQm1sUMQfVdZCPtzy4vnwVINOYwvpGIFD
	LUNwQj5HWwVRxJR5Ys8ZMysXa5zDC6/z5yjksS72ZKTcZbcAH+STGdfXiINzjkNO/MpZc+4cl3AeD
	OaW4Ahp2tU2z2tuP2pTx+t0DDuId6W7Q+T/6KMP3erUJUaC9Grd6Q2R56R2hahoyJJ9UDUhO/ZGbs
	EF9b/GH7CyW/yEpNQiTbLo1iOfueznUt8vhhhWKe6xZhkm8zLSIlnz1fooX61PB6CN2RODqte7d08
	tJaX68uGjOe52Fo2XZPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl2m2-0000bx-DN; Tue, 16 Jun 2020 04:00:34 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl2lp-0000ON-Ar; Tue, 16 Jun 2020 04:00:22 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G3upAV054158;
 Tue, 16 Jun 2020 04:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=6gt66nmNkN8e5xAv4On8mJpvQuFVMs7mSPf10c7iWbI=;
 b=nPdg4EU7JQvgPCbaC5hwzhb/sju3oUhOfTmJ4Lj1CrR9EExJU2mhU0UG3QlBhbj9EuQp
 gLePJyZ4y+AfQq+Luk+GTqxAwyR85a2M4Ojxus4dm0/Oor6eRhTnPSkOngB/mNHDEf8K
 ARaZ0yoszniFfLG/9xprTB8z9zlr3vWxUwNySnob7vjQIAvlJt/lUwo16c2w6sQxXITF
 WfJp81aWa7JdPlqR275UDSO39ltrsyH/1oY3JqI/JsJByjbYuqWHjVMmKaFAtCUSUARc
 u0+k+9B8TLTrEOckkjNNJShc592wX3dtPPgl0Uy84ASOHikrWMBoJbhHB1mL5pgdRRdK ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 31p6e7vdky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jun 2020 04:00:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05G3xQB5131356;
 Tue, 16 Jun 2020 04:00:15 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 31p6dcae0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jun 2020 04:00:15 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05G40DVJ021424;
 Tue, 16 Jun 2020 04:00:13 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 15 Jun 2020 21:00:13 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, jejb@linux.ibm.com, avri.altman@wdc.com,
 Stanley Chu <stanley.chu@mediatek.com>, asutoshd@codeaurora.org,
 alim.akhtar@samsung.com
Subject: Re: [PATCH v2 0/2] scsi: ufs: Fix and cleanup device quirks
Date: Mon, 15 Jun 2020 23:59:56 -0400
Message-Id: <159227986422.24883.11135974078256491088.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612012625.6615-1-stanley.chu@mediatek.com>
References: <20200612012625.6615-1-stanley.chu@mediatek.com>
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
X-CRM114-CacheID: sfid-20200615_210021_515341_6BE72E50 
X-CRM114-Status: GOOD (  10.18  )
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

On Fri, 12 Jun 2020 09:26:23 +0800, Stanley Chu wrote:

> this series provides some device quirk fixes and cleanups.
> 
> v1 -> v2:
>   - Sort device quirks in alphabetical order (Alim Akhtar)
> 
> Stanley Chu (2):
>   scsi: ufs: Add DELAY_BEFORE_LPM quirk for Micron devices
>   scsi: ufs: Cleanup device vendor name and device quirk table
> 
> [...]

Applied to 5.9/scsi-queue, thanks!

[1/2] scsi: ufs: Add DELAY_BEFORE_LPM quirk for Micron devices
      https://git.kernel.org/mkp/scsi/c/c0a18ee0ce78
[2/2] scsi: ufs: Clean up device vendor name and device quirk table
      https://git.kernel.org/mkp/scsi/c/ed0b40ffa364

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
