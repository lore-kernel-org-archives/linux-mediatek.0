Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18433C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 12:12:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5FA42075C
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 12:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7c6bMQa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UVaFVpmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5FA42075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GFpinvPjqhTfSPtcaIDgEIdRoPeHrqyDz2F3X09vX7A=; b=X7c6bMQam9FFul
	hzEbGDsBxbP4kpo+P5CUvFjdFaQtAc7M4Scr/yIz4EvOSJl9GO/s2YaEikyWOgkiBtMe+6O8xKoZ9
	/oCz2Wd3jLL7XjLJb28zlf9/oxkoKXj13kf64pc3wSCw4tj612ncvbIYg9asJsaMb6bUjni1qxwqE
	cvV0RlV1fR+JKO6ULWTH3hRfbHaz0N9Uz7Zw99BCXYOq7utwVihWZw90UBB3jZzWG23P4hnXVSsaq
	DMMJz5By0B9IIPSX7N8Ain2nMVRtdv9YT+hJPTfG+tVQrscIuFFqoKWRtcud7tgusxRGyMlvhIxpu
	Dh0pSF0Ay4x2faqfcYZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZZhN-0004Fw-11; Tue, 26 Nov 2019 12:12:05 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZZhK-0003zt-0X
 for linux-mediatek@lists.infradead.org; Tue, 26 Nov 2019 12:12:03 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8pDw116272;
 Tue, 26 Nov 2019 12:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=corp-2019-08-05;
 bh=/mBMxIIlBQ+XFxgJu+74RNcnTy1AckJgoUjuyVpyT6M=;
 b=UVaFVpmuP55to/4hV4BOtz3AZvc5zUuB3/8JIbNJ3e06RElBJFpqC+Tx1TL3KyhLoQ/k
 u3zhfsAW/k12OWQV+IEYJ5JpEacsTWx5zZTSllioxe0ChSgcQMI9QcbRcMIC8DIvsQbi
 upraQTttR8lYgFES0JQfCJ9468zZzLIJwYtrWzrk90D9PNKBuupuh11p5E/NtF8Jhks8
 DC58PlwnmpFUGrYu+Fe6ujIIzOHsGlQhWHDDOr9pQVDZdGs9lgMSCaxccJnAMbLDcNPk
 UZTOBbusz+/m5gcHzW7aYZS/RCLeKsz8lPg4yjiR0XGZ9He+Mvbe+ZpVSGWszAse1HON sg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2wev6u6d8m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 12:11:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAQC8Rtb089382;
 Tue, 26 Nov 2019 12:09:53 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2wgvfjddd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 Nov 2019 12:09:52 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id xAQC9pAO018135;
 Tue, 26 Nov 2019 12:09:51 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 26 Nov 2019 04:09:49 -0800
Date: Tue, 26 Nov 2019 15:09:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Johannes Berg <johannes@sipsolutions.net>,
 Toke H??iland-J??rgensen <toke@redhat.com>
Subject: [PATCH] mac80211: airtime: Fix an off by one in
 ieee80211_calc_rx_airtime()
Message-ID: <20191126120910.ftr4t7me3by32aiz@kili.mountain>
MIME-Version: 1.0
In-Reply-To: <87v9r7ysg0.fsf@toke.dk>
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-1911260110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9452
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-1911260110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_041202_168505_3850A42C 
X-CRM114-Status: GOOD (  15.23  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: multipart/mixed; boundary="===============5836632262232822709=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============5836632262232822709==
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

This code was copied from mt76 and inherited an off by one bug from
there.  The > should be >= so that we don't read one element beyond
the end of the array.

Fixes: db3e1c40cf2f ("mac80211: Import airtime calculation code from mt76")
Reported-by: Toke Høiland-Jørgensen <toke@redhat.com>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/mac80211/airtime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/airtime.c b/net/mac80211/airtime.c
index 63cb0028b02d..9fc2968856c0 100644
--- a/net/mac80211/airtime.c
+++ b/net/mac80211/airtime.c
@@ -442,7 +442,7 @@ u32 ieee80211_calc_rx_airtime(struct ieee80211_hw *hw,
 			return 0;
 
 		sband = hw->wiphy->bands[status->band];
-		if (!sband || status->rate_idx > sband->n_bitrates)
+		if (!sband || status->rate_idx >= sband->n_bitrates)
 			return 0;
 
 		rate = &sband->bitrates[status->rate_idx];
-- 
2.11.0



--===============5836632262232822709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5836632262232822709==--
