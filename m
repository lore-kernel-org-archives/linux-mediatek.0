Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69E3C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:16:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B627601FD
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B627601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=PLWZSU9T3wna2wjEpJzfVh7xBFwM3spJATmJH8Yxmug=; b=VzRWAu+Fn689gFMVzffJQx9RZ
	9XQ9jdmp5sLDD80K9JCOrcZXOZIGrXyLOmH3Zc2hw0KlbATIdr4CTXWZ/+dPXY3L/ICcjcA2zoTvX
	eqWTWIpZJV+HUUXkP/iC/4fOThVt8YDEkhCQTHj5ovAB96H3rt6NQUmZDjWq6WwJ4T4Qhv4ufMVRM
	ind6IrcRKMjsn4QsNHbgvXzhIIirqVExnekmu2SIFKCnkyZ14Ry+xQliZSSNUnTvfj1PIX6PdiowJ
	r7umNndDCPMPMBAIURBjANDHAAQct2Y5OMp47Y69GziCD+PAln62iuyPhBbut+plSVEM2ScxRoZg6
	AHH5sEEzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZCiU-00ERSr-VL; Wed, 21 Apr 2021 13:16:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCiT-00ERSJ-0Q
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 13:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:References;
 bh=lvHlrK+MD4CobteVF1oYxOoc1hik2TwFpy2Fj01dlKk=; b=bl2JJXrphnPQWezPWh6lnYIzk9
 Vt8ezj6v81lNi6e6Bhx988c6NCHYAjm4je8cDbgZ1HATDD4obZlymlh8EOnTN727CnGj7v7MCrAOH
 fs9QoR8bzKWwJhj8SbDDW+hS9ZCQObyuKUl9aLyk5rC8++Pk5NH8+2kb1WSjYQrxIVY7N5FnC7K5h
 bvKG8fM0eVouJYVk/BmbdL7HqKTfTM1glXKAHtl3ZGBjmxg1JkneSlUfx/dPACtp8YVbztiAVIfcw
 rQIFu+LBDStMDJDC0mwxW8oNODRtsPEhVSei0SHBa1rHieO16GJmv4ijuEx6BwIuDJ/aiZSiT8CCz
 Yg6aLNcQ==;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCiN-00CuCT-ON
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 13:16:27 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LDGLgx028054; Wed, 21 Apr 2021 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=lvHlrK+MD4CobteVF1oYxOoc1hik2TwFpy2Fj01dlKk=;
 b=fhh4VScIPfIZEwLTHciJt04EY0Y68kttQmtAOCIA+9C7xW+xv3U7nkn46XBvzZ3RaBer
 UDdQEsGzDRSGsdEIiKfYUGXsxKLiXUcc/DsIckoe/9pz09SOlL8pnd8BlQ4VaHswvQVz
 ERhG84v+L1zs8+sejxc6EorE0XVkkHLBSF7/NqtS/6U961mUfkDHzNVAnu0zFer20UFQ
 KUbB+uW20uv+pBwvm8VLw9GCE+YdO2yiqCp9zbWXVNY681pH2aii1cIYqU+BnZkTvff9
 4ldeqOx0ZTxNSnD501zBgTdU11nc6ZKI4KY1XYk1/P0OtYoB+iheKK3NRzwCOS2POKLB bA== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 381dum8p13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:16:20 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 13LDFsu1132150;
 Wed, 21 Apr 2021 13:16:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 3809m0kkev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:16:19 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LDGICW133342;
 Wed, 21 Apr 2021 13:16:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 3809m0kkej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:16:18 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LDGH0H016345;
 Wed, 21 Apr 2021 13:16:17 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 06:16:16 -0700
Date: Wed, 21 Apr 2021 16:16:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Soul Huang <Soul.Huang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 3/3] mt76: mt7921: fix a precision vs width bug in printk
Message-ID: <YIAllkdDJrV5OSdL@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YIAlQKR3IpfKW5Sx@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: j18SJFENXvV2rrmHVmlUHHQO5zv-r5Dv
X-Proofpoint-GUID: j18SJFENXvV2rrmHVmlUHHQO5zv-r5Dv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_061623_820834_F6234D84 
X-CRM114-Status: GOOD (  14.98  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Precision %.*s was intended instead of width %*s.  The original code
is potentially an information leak.

Fixes: c7cc5ec57303 ("mt76: mt7921: rework mt7921_mcu_debug_msg_event routine")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index aa55667b6ed7..45ad2c337d41 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -500,7 +500,7 @@ mt7921_mcu_debug_msg_event(struct mt7921_dev *dev, struct sk_buff *skb)
 			if (!msg->content[i])
 				msg->content[i] = ' ';
 		}
-		wiphy_info(mt76_hw(dev)->wiphy, "%*s", len, msg->content);
+		wiphy_info(mt76_hw(dev)->wiphy, "%.*s", len, msg->content);
 	}
 }
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
