Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E38C64E8A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:41:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDBA721D91
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 08:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDBA721D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pCBzSIjt7usEu+TmFld2Z7iYAJOmafJ+VJZlww+vZ8k=; b=qpOsM7kjwZZ/APIhyWVLE2ICy4
	DvjS+5DQmO9Cm1ZmMv6s2i/QcCq4eOYdBKyshYjNzlvrLwgpd53RlHked66BBZl12Ra0NhKSGqRVw
	cQOY1inYD7yGY2f0r/wOWbPshAzJ074Ck05whonLuEts0kXUTn19pFEYQx38w6ct8n2VYlZtDm2b0
	g9Qa/4l+Ip27LIJ9SBCtgFPBdwo0FZt9Zsv2yDfy0SKcwjxvNKPgQfSoNtG0C8l8Zuo+w0/xTa+MG
	WDLYzUdS86lB5MS3/sLRrT/ku+1ZklR1mqSQNzlvQyq3mzOFVtPMBzT2qkHk0B3PuQ1FfzcRaerHi
	RaGpV6Cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkkB8-0005Zr-1K; Thu, 03 Dec 2020 08:41:30 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkkB4-0005Ye-UE
 for linux-mediatek@lists.infradead.org; Thu, 03 Dec 2020 08:41:27 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38Z8Tt104377;
 Thu, 3 Dec 2020 08:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=z4UsB695l8jGpTz1SJLTMgskpbp4iNCiOUXV4l4A9SE=;
 b=FTWY2h+qUr3ngB7ULbzVv9y7qm8yynxK17+3Dk6w+RQmcwRHYB/vJ2MGA7A3ly+hcad+
 L6EMqKrKFNusGoXejsV7vQZ9ZGWLD8+QLS22uclWIYfVzB61khkiGbRGJh8YDRmqlk6d
 3I6GSXwUo40AkU7FUQaoQca7TQfSupMPygp8CPC1RRp13ggBZzKaqfmdX3Tq6d9cgglv
 c1z1nbDGlQ6siZL9UsBrjjjVDUPNy+qE/5KNlbdR2U9kxbzXZAiduZtGunycr9hm8F5v
 y5Ob7x3XD05yRJo3JpJHfViQa6HPDbI1BBLh2iF1OcpRe+0ceBpR23nOxrFxgM7pNTCi RQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 353c2b4nks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 03 Dec 2020 08:41:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B38eM4K133029;
 Thu, 3 Dec 2020 08:41:21 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 3540avpwd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Dec 2020 08:41:21 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B38fKKk020872;
 Thu, 3 Dec 2020 08:41:20 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 03 Dec 2020 00:41:19 -0800
Date: Thu, 3 Dec 2020 11:41:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH 1/2] usb: mtu3: fix memory corruption in mtu3_debugfs_regset()
Message-ID: <X8ikqc4Mo2/0G72j@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012030053
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9823
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 lowpriorityscore=0
 clxscore=1011 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_034127_089349_F4301851 
X-CRM114-Status: GOOD (  18.30  )
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

This code is using the wrong sizeof() so it does not allocate enough
memory.  It allocates 32 bytes but 72 are required.  That will lead to
memory corruption.

Fixes: ae07809255d3 ("usb: mtu3: add debugfs interface files")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/mtu3/mtu3_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index fdeade6254ae..7537bfd651af 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -127,7 +127,7 @@ static void mtu3_debugfs_regset(struct mtu3 *mtu, void __iomem *base,
 	struct debugfs_regset32 *regset;
 	struct mtu3_regset *mregs;
 
-	mregs = devm_kzalloc(mtu->dev, sizeof(*regset), GFP_KERNEL);
+	mregs = devm_kzalloc(mtu->dev, sizeof(*mregs), GFP_KERNEL);
 	if (!mregs)
 		return;
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
