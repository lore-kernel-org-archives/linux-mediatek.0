Return-Path: <SRS0=kKdk=A5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DC6C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 05:26:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8341F2076D
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Jul 2020 05:26:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yaM1rn/9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRYpxoRA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8341F2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=znzjo8bPz09tqHJppZbRowA1TasfWrb1en4YhaEmzW4=; b=yaM1rn/9udqTIMQLyBIzSUEXPh
	vzM58jPHnyKGDav9bQCVBKBP33BMviDda1sFLrRIuwMM/BKOGkN21ngCGq5oYC9Uk9SU+cF20Nu01
	Q4a4zVYd7mLMefmqCFJtgBRtI4XSi5Kt99FnDO+B28JBWIixNj8f2E03pXr/9Q4ICGkgKvd8svrM0
	6vQfJbR24qQGgOkosV1sJd7rWZBz05or4N1fuNiun+0hj5UO0UOfnjIzbSiHx2k6R8LMArvA4F7mU
	e5WI5RWlJTvIUatIQM6xPP1obrw7pj4aorQwzyKPsddC6TTZRHjKwt3siE8uq08AG/DWagwvekNUu
	FcIVWUuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwfN1-0002uq-PY; Sat, 18 Jul 2020 05:26:47 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwfMy-0002tW-F9; Sat, 18 Jul 2020 05:26:45 +0000
Received: by mail-io1-xd44.google.com with SMTP id l1so12542875ioh.5;
 Fri, 17 Jul 2020 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=SCHfx5BI0heiM7sUgX9/TzzuZtUxyDEqeWGyvIFDhhA=;
 b=sRYpxoRAbVVJddam3wPjUBFy+q++TqDEySUNHSYndfoezqzTo/CV4brjxOsB9Ju6Pw
 AdHziWCgVlJjRGjKMDJY3bhgYmBV6sUMLfzoCEPl9FROW37s3RepHiB20odn9h/N/8An
 t54gSf1j3G/d12jADgTphGomHtt8EpR4G2YDYT66p2EzJqmcXeEWP+LQQmgsmUK1CXgw
 U9JQIOE/cC1pf1rYlHvoKYopmvKS12v2x0ZZedl5O4uWZfYhVom/SItwhlG8kLj5gCW5
 tOrwZj79RVfLeMW2bX2OXBmsqQ43M+JZPTXeKGPr0+tPxsPLYixgpr+SNMAkQQ4y36tZ
 eRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SCHfx5BI0heiM7sUgX9/TzzuZtUxyDEqeWGyvIFDhhA=;
 b=TiWYSKHdSs5Vn8VUrcSqhEb4JRyh0bqHB52QqSsNLLK7DhNSXr0rHD6jGXHJedZPF8
 /xyDm8kg2XTKjaWQwA75Hb2qIQof+4wGXZ/WE5ngLWSQRzj9PuRVqwij0QcwRxH9Z6pW
 HdUGLRn+KgOPWuxteUugOK28xjdRZ5HspMxq5a0mRKTNs5Mv2gYlOpL16q05yQkk0Wio
 vt3vg6rr1hMqLLyJGDuf1zx7fieDSWu3vo3wrADIQN9983mSAg21cwP4B6b8qC8LuepF
 lIMnCEt+lMnQn8fkBLHOIlLhTsuhYWa/W0NDHN3ljgLcvOsrQrDF1lcy+xyY4SdvIQ0l
 +5/Q==
X-Gm-Message-State: AOAM5315vvRq16UkL57cTYvWLVU8tjJVjuSnnD+4FeCX5SLqOGmmLX2v
 Nw0ixIwl3vuaQuDihrIUauc=
X-Google-Smtp-Source: ABdhPJzQqlmtBgAX2zPQun++Nq03W8tZGAakz1U8y4y8IC7ATIM4teO1+JqaUrmSpAflgfliW/kn+Q==
X-Received: by 2002:a5d:9306:: with SMTP id l6mr13072604ion.105.1595050001248; 
 Fri, 17 Jul 2020 22:26:41 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [160.94.145.20])
 by smtp.googlemail.com with ESMTPSA id 13sm5357408ilj.81.2020.07.17.22.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 22:26:40 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Jakub Kicinski <kubakici@wp.pl>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mt7601u: add missing release on skb in mt7601u_mcu_msg_send
Date: Sat, 18 Jul 2020 00:26:29 -0500
Message-Id: <20200718052630.11032-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_012644_557937_BEB563E5 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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
Cc: emamd001@umn.edu, Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the implementation of mt7601u_mcu_msg_send(), skb is supposed to be
consumed on all execution paths. Release skb before returning if
test_bit() fails.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/net/wireless/mediatek/mt7601u/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c b/drivers/net/wireless/mediatek/mt7601u/mcu.c
index af55ed82b96f..1b5cc271a9e1 100644
--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
@@ -116,8 +116,10 @@ mt7601u_mcu_msg_send(struct mt7601u_dev *dev, struct sk_buff *skb,
 	int sent, ret;
 	u8 seq = 0;
 
-	if (test_bit(MT7601U_STATE_REMOVED, &dev->state))
+	if (test_bit(MT7601U_STATE_REMOVED, &dev->state)) {
+		consume_skb(skb);
 		return 0;
+	}
 
 	mutex_lock(&dev->mcu.mutex);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
