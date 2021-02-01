Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CD3C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:46:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAED764E2A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 05:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAED764E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDWotbMBxxVe8ldEs64BO3xGGtBfs33FISyUa4RStgQ=; b=ZTZvvRBHXMJR3kWsA2h5pGGpeT
	o36qoSFuGSdAW97hffrmWsmSJLsikldVKXwsj1Sa8jhkF69rhl6Oisr13uvLr673rISVv4aWLs6Rv
	S+TTY04eAPoeqsqgRSCCdVrJtSF0HR89PGNEreKr0nS51X8CInZhhjVPD2s/hgRv+gtfdNLVrEcxT
	+VqUeokiAio3a9puGiFb3eZpH+SOwKjhZoLrge/Ip21oYWbYevfwAkJuhldPE7Dvag3jg7htApOiG
	Wn/irlaNPmgwij0BU9MQiQTTQEE/Q598zAWvyJAwRnK8bepVRrC5aHWMzT0oqPX/gjziXRrnr/aMO
	nEY78dmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6S27-00061V-7t; Mon, 01 Feb 2021 05:45:55 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6S20-0005xB-IW; Mon, 01 Feb 2021 05:45:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id l12so15209153wry.2;
 Sun, 31 Jan 2021 21:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=A6nqzjnju0Qhug1o/Lp3c3yaK8vd09BbFSgR2jNN2os=;
 b=HUOIhEGcfxfn8L446WEypesTISgace3Zfj3t+CN+U/snn6XBaUek7PLugfoeumpQ+Z
 fG4zsr/ifmE8CcogDYGl3Da5H9HkEOrQRQBSwFN7yxjFdVjbEW8wlFrtEo2StbTI5V2Y
 AFCsf/caRliaM7KrrPshjo0+qUakjaOGzLSZCeyn8XhFLSKFxuqBd9ajLYl/1zre19Vu
 e10M3HnuiSz/Kns30zB99QcwxBQpwk/kfN2n5i5ZmRoDAK2YJL/r9Ekw15eoZWaj7qhl
 aAGjkHlRReIyR27VjmHgS+dTLNmAoHWchraYcK6TKt0L1H6Hh+3wKm4FMAWS8iYUEzb6
 cvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6nqzjnju0Qhug1o/Lp3c3yaK8vd09BbFSgR2jNN2os=;
 b=RKn65ULQhoXqt2Zof4s8UlTTmiL6CKmRpFfWHfvhDZQgPzKkCyhtvxtKH5ec6E2ukn
 538XU4czcT5ffhiudROo/NhLIIs6uRMQMa4XCb3F7FfKUpTOO6u72MeKzhepFwGguSEG
 7T23sax+O4aiMWf+SQjbDMZywni8FkYTMwG4IOBKlvxLMeLgIBnzVUc+Cpd53Q2nzMXm
 eEFy75jiCUedlscjKgFt2m0bMclogTcWjoK+wa+Y3oO8plqDWQptLXc2irK+LEiAAK9c
 3sDmbnX3DGIS6k5oPnIfAUvV0SFTxKpMNax44yJMj1pxTws8gAJNvemc5k7s+4Wp41rs
 llbg==
X-Gm-Message-State: AOAM531r81RYsVQUCpJrCboXacFMVnUQB8mDRciODhdOmszyIcI6tyfv
 pqgYcumrM4y4BNrj5qRUbptfqyktxJ+j5txR
X-Google-Smtp-Source: ABdhPJwOxoNhyRFfFK7IapulMZIkG3cro5Uw/IVmbj1j9tqBC7WXrQU5KVCjAjt5m/pcL4Tu5cv/gQ==
X-Received: by 2002:a5d:50c1:: with SMTP id f1mr16556956wrt.235.1612158345806; 
 Sun, 31 Jan 2021 21:45:45 -0800 (PST)
Received: from localhost.localdomain
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.googlemail.com with ESMTPSA id r25sm27123540wrr.64.2021.01.31.21.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 21:45:45 -0800 (PST)
From: Bilal Wasim <bilalwasim676@gmail.com>
X-Google-Original-From: Bilal Wasim <Bilal.Wasim@imgtec.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 enric.balletbo@collabora.com, hsinyi@chromium.org, weiyi.lu@mediatek.com
Subject: [PATCH 2/2] soc: mediatek: pm-domains: Add domain_supply cap for
 mfg_async PD
Date: Mon,  1 Feb 2021 10:45:42 +0500
Message-Id: <20210201054542.1470695-3-Bilal.Wasim@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
References: <20210201054542.1470695-1-Bilal.Wasim@imgtec.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_004548_646723_D2762AE0 
X-CRM114-Status: GOOD (  11.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mfg_async power domain in mt8173 is used to power up imgtec
gpu. This domain requires the da9211 regulator to be enabled before
the power domain can be enabled successfully.

Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
---
 drivers/soc/mediatek/mt8173-pm-domains.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
index 3e8ee5dabb43..065b8195e7d6 100644
--- a/drivers/soc/mediatek/mt8173-pm-domains.h
+++ b/drivers/soc/mediatek/mt8173-pm-domains.h
@@ -63,6 +63,7 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = 0,
+		.caps = MTK_SCPD_DOMAIN_SUPPLY,
 	},
 	[MT8173_POWER_DOMAIN_MFG_2D] = {
 		.sta_mask = PWR_STATUS_MFG_2D,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
