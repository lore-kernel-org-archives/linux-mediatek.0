Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A191EC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 02:26:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE5E2465E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 02:26:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OYv0EQls";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="poW5hJS+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE5E2465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:From:Subject:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RUqo80M77NtIx5l/z+7GqP5WBbH07W0H4F+6RiQnuNI=; b=OYv0EQlsep+6q0
	I3/WUXPl13Fz6QPZZZ04O6zMCEuxM+vF0aOWgEGGKPyJ9HSKM9coGdSYlVDOF0ESiFb0IsYMtxU2O
	ix1oPiwH52spKpgKaVFFJimijF0VOpWCb9t0PcxElt4Jieacyg0LJSCTiF0UHH3xq/DLRI/cCIPWm
	nFFQdpUXJPrrpSIwfyZPLJcSOZfQ8aeu65jss6oEcTDYHMZ8pAPUNLfI7zkQWQuLS/wA6Bcg7hV7u
	wnbgnI/o6FA8hNrmPhJi+dLNzIkYfykIFJpwBmmdbu7ymTfD90DEStZ6/e51SSoufHs+MOEvb7RTR
	mouriD50B7Gd6APjaZDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii7zB-0003QG-IT; Fri, 20 Dec 2019 02:25:49 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii7z8-0003Pn-Mb; Fri, 20 Dec 2019 02:25:48 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBK2ORHs014980;
 Fri, 20 Dec 2019 02:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=WSCbW5n/K+yFGCoIIv9tAuO/xX8+MPhvcwwEKLbt9vE=;
 b=poW5hJS+wECdnuMxfG11NUFx9St59HnR7ne0jkok0MlqTrA50wUfBKNWX6Uq9Qp61myQ
 Nm8b+7YZCAxgef8/sZpA4t831WR6DFl79bXSTVd7kmlIhemIVQbUEl4TrPz3P2l6r8iz
 n6coFJrbqJC2ZmtnvnOE4VzJVb8XRARhtVL3FI0WC+A7devGDFCA4Cdga6GTxbz/3VUX
 /EeIvgoHG3acPA+nFmmQbUVIMDpPx+w+w98DY6G/y22IGD/0rIQTdjr7gCUAZQAXDD/I
 ixvqhcvsXCeEPaze6LSfRasooS7ZlAL597543gNzly1ooxP41Ehb8U59lc9Fq+woBWbl eQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2x01jae86b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Dec 2019 02:25:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xBK2OPH3021922;
 Fri, 20 Dec 2019 02:25:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2x0bgmsq91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Dec 2019 02:25:34 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xBK2PV96027350;
 Fri, 20 Dec 2019 02:25:31 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 19 Dec 2019 18:25:31 -0800
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 0/4] scsi: ufs-mediatek: provide power management
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
 <yq1tv5vc3ci.fsf@oracle.com> <1576805118.13056.31.camel@mtkswgap22>
Date: Thu, 19 Dec 2019 21:25:27 -0500
In-Reply-To: <1576805118.13056.31.camel@mtkswgap22> (Stanley Chu's message of
 "Fri, 20 Dec 2019 09:25:18 +0800")
Message-ID: <yq15zibag2w.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9476
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1912200015
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9476
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1912200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_182546_870796_93D63FAE 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, pedrom.sousa@synopsys.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> Otherwise missing header "include/linux/soc/mediatek/mtk_sip_svc.h"
> will cause build error if MediaTek UFS driver is enabled.

Thanks for the heads-up. I obviously don't have an easy way to verify. I
did check after applying to see if there was a way I could trigger a
build of the driver on a non MediaTek platform. But that didn't appear
to be trivial.

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
