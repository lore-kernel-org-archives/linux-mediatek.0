Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B0AC43467
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 09:34:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBB57206E5
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 09:34:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xekDKSS8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hJ6kgqwb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBB57206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tU4MmONFIILfFmh6esGhzg4jqDTLUOavLI7mPzXkcvM=; b=xekDKSS8yOUnX85vgC9eECsZfR
	V00HXcraaTu7huc+3C5Ch3Ta9L+g+5ZUiexZNmlMrRLWf0VgjrY9EcEP6w0ZRQYt2+ddiVqPTYFeW
	FTNszaVUNNivfuzf+bjTmhJ/lrNWmnK3tYtrOsABeIH7zLHo7Mfv1KsaTlaUqap0eNihPgVhNwACT
	VXX6wIz3s5k5Vi//mFdPN9GakEkn59rqhBmPcouTpgZj5nlaE6a2xalIASf/cd1PlpIOj0bQXkiaK
	RIZ9U+y57MehqjJtYwypE/6DEGZXNaBg71qQU+rpxDLKUjqPp4eyOGJRE3u1zjiKdTrzm4fMQ7hlC
	I75VpIBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQSJk-0002N8-B7; Thu, 08 Oct 2020 09:34:32 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQSJe-0002Kn-Kj
 for linux-mediatek@lists.infradead.org; Thu, 08 Oct 2020 09:34:27 +0000
Received: by mail-pf1-x444.google.com with SMTP id w21so3514973pfc.7
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Oct 2020 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ky6B9tzxN97erkw+L3nihgRW4OC9vjJOPwyhfBdbivM=;
 b=hJ6kgqwbkmiF+RvoAlO+KDFQRiWTJWGEZCGcib6sEFkrkP/9ioxTPU/3+Ump8jnpMH
 R+54SWbf0ge46G0SySQ5qFrvzhoUXIgnEixyPrhOrCyIuZWPOtMtsxEcf2r6sijAtoS6
 6Ope6x8XjIt+Unfrf/47HdTxoQjqg+KP8fgA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ky6B9tzxN97erkw+L3nihgRW4OC9vjJOPwyhfBdbivM=;
 b=Oqqbohf9E3iFqo2UUmbYxXRGP7t8/J8JLGrU2+1xcT5RntajT7vV0UWhzizOh9Z6ly
 410oJ0PnLPr3OrCCBkUEvyNeqooINi6399Pi18CNtMn21HNZVDPVghS1opXKFMvYGfKb
 kE1+UqyAHvrRZSP5WTdgfxdA52gEbX0xCzFCR0ulHJvqdc5OSR48nM7er+H1bELV9lxi
 H8qt2SG/Czsw9QzzXDvIeF1fTap6TeiFc6XGSiWY+yjS1+dkMaxh3Rjmig20EjDogdwC
 96FjW1Wr1FEqWDuaUxa9sPaxok392fkBakK3NudrVqWEODEnQpRrM2SUKWMlmCfQTi0l
 hlog==
X-Gm-Message-State: AOAM530m8krBRO6nDisNA0kt948Z9yCROSaWRkPJkSSRtUpJ7xrQTPIf
 p7C/pk3vsE4MP+gumoS0AnPazQ==
X-Google-Smtp-Source: ABdhPJxNmMQ5cqAp68AMAOr14GG/lN71/+I/Wr47wnEu0lH1ZnbSJkmDEQSjhjshVstu8ZSZpzI7jQ==
X-Received: by 2002:a62:5382:0:b029:155:6333:ce4f with SMTP id
 h124-20020a6253820000b02901556333ce4fmr1061372pfb.28.1602149662342; 
 Thu, 08 Oct 2020 02:34:22 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:b:1a60:24ff:fe90:ea5a])
 by smtp.gmail.com with ESMTPSA id q7sm6113711pfj.38.2020.10.08.02.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 02:34:21 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH] rtc: mt6397: Remove unused member dev
Date: Thu,  8 Oct 2020 17:34:14 +0800
Message-Id: <20201008093414.1911699-1-fshao@chromium.org>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_053426_760546_D7C353CA 
X-CRM114-Status: GOOD (  13.66  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Josef Friedl <josef.friedl@speed.at>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fei Shao <fshao@chromium.org>, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Removing the struct member "dev" in mt6397 RTC driver because it's not
initialized and the only usage is for one debugging message.

Also fixed a typo in the error message.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/rtc/rtc-mt6397.c       | 3 ++-
 include/linux/mfd/mt6397/rtc.h | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index f8b1353777ba..1894aded4c85 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -31,7 +31,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 					MTK_RTC_POLL_DELAY_US,
 					MTK_RTC_POLL_TIMEOUT);
 	if (ret < 0)
-		dev_err(rtc->dev, "failed to write WRTGE: %d\n", ret);
+		dev_err(rtc->rtc_dev->dev.parent,
+			"failed to write WRTGR: %d\n", ret);
 
 	return ret;
 }
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 66989a16221a..c3748b53bf7d 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -72,7 +72,6 @@ struct mtk_rtc_data {
 };
 
 struct mt6397_rtc {
-	struct device           *dev;
 	struct rtc_device       *rtc_dev;
 
 	/* Protect register access from multiple tasks */
-- 
2.28.0.806.g8561365e88-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
