Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD389C63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:41:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FAA421D1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FAA421D1A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lPt9A0pLTt85p0PY62l8rqdSgNiT0rtdO47JaGUGtW0=; b=L/FEiSNkBgCf4gd+Xz11HLt000
	lUzAmGj8wQadEIvHZ6ErD51Ciu3YePGih6f3T/yxN7b/ChjEc7wEvyZ1XB0cKB2fHUkbl4QJlS53I
	JAmeAQKVAdp6eV0WxadxstDHfYvv0VtldaTlnWaX8UdXl0vtdXpIjE2khI8TlMVYFn4bLVy71Wjgy
	jlNd0/nQNzcgKgxjvk9EM0yD95i9WPEIZbhKQSjIgsvZFrfPhG6OS/TU9mZcckdlcSz+ooYtIQi4Z
	nmVKSRWS8xM4xXtcXFVWDS6ry4dIyRiv9j0bKx113ZcQwpTf+Am7aFBI6G94Vpq7kZF8/fmAFHek4
	I7VmdEiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkkBQ-0005fO-Jv; Thu, 03 Dec 2020 08:41:48 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkkBO-0005eO-9I
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 08:41:47 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38Z4bU104343;
 Thu, 3 Dec 2020 08:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ngAHlOlhS8B8dIePlASXJBeaZG67oRhYlHd+DRQgKf4=;
 b=yko66+cI3h1IO+pmwX5XtiIVOhyCjcSE0/ncQ/jru6IoVm7YzMdFOOsKEEIxslu6+R0v
 WYCwg4GWh7Uya+lyPsClanMI8eNROY8pS82ZBrkzQGIPpK892f8i3UvEjN74OwPCenyL
 J7XInKu2Iosd3vSetvcOLC26nNMxYM9XqVurDvg29yCSf+cnTHfuIXqT29edpCeZqhN8
 Rse6n/o0nPTjyZXT+Uq2hGBQPyEiSfYO9so0ZAu0MRUPI6iZWs4APXHW2B4zykxPyqBS
 od6x0gxPbbdE5XmwKl8NDTY1dzWvXBJYML71glJowwIABZLOkxpdyYUIIcmL8nWfKe03 cg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 353c2b4nnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 03 Dec 2020 08:41:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38eBai194219;
 Thu, 3 Dec 2020 08:41:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 3540f1hrrp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Dec 2020 08:41:43 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0B38fh8A023113;
 Thu, 3 Dec 2020 08:41:43 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Dec 2020 00:41:42 -0800
Date: Thu, 3 Dec 2020 11:41:35 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 2/2] usb: mtu3: mtu3_debug: remove an unused struct member
Message-ID: <X8ikv1QA3Do50D+R@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 mlxlogscore=992
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_034146_510262_3464940B 
X-CRM114-Status: GOOD (  17.16  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The "nregs" member is not used.  The code uses the "regset.nregs"
struct member instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/mtu3/mtu3_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_debug.h b/drivers/usb/mtu3/mtu3_debug.h
index 3084c46017c3..9a36134b322d 100644
--- a/drivers/usb/mtu3/mtu3_debug.h
+++ b/drivers/usb/mtu3/mtu3_debug.h
@@ -19,7 +19,6 @@ struct ssusb_mtk;
 struct mtu3_regset {
 	char name[MTU3_DEBUGFS_NAME_LEN];
 	struct debugfs_regset32 regset;
-	size_t nregs;
 };
 
 struct mtu3_file_map {
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
