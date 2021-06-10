Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF144C48BD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 21:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC9C0613F1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 21:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC9C0613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rA/8NTtZPv1mZdOWCNpbPe4pChF+CJxoABmacQRH5w=; b=GhtpK0XxKOeq3E
	w+QFHBe9CzwiyiQx8cgdh33/NyZGwgBE2S/h5aUjbLrYt8HKMMX6cP7XAIknsWuYSh0PO7mv11ulS
	aEa/tsWGlp69HYiQ+vOLHRyKs9aJ+qzErlBHNMYDUAifA2Sc79ZWzHs+JgakqV2IwJHKqiGSpKF+I
	TR/X72Fg3yrkRfc1GOCHLCh8iPme3f03DW4ZlkCfWjMaMwXwJNgEE0BmB8QHZfRuaeg7pqjVadKlA
	d9Mt8g4+oA4w8xO1VY++aOVdD3JO0YHi36z2eucmV7ZIc0qmiBhbGNgGmmC1R4xqn48x1oTRZPCQO
	eZlCw+GWxavZdiod5pQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrShI-002gdg-US; Thu, 10 Jun 2021 21:58:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrSVG-002aY4-CS
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 21:46:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623361577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=70NgQXU1//Wzo0iLFWpl3KegQtCCZiFqqErbm/ywz0w=;
 b=fF+oCEceU07g8XSAiSqhudYdj5jAckIimN/lNBODag1p9Ys7WVr8XA4f1gT4KRitL3/k0s
 XGgoVwb3Bw4HzqTDdOy3Ns5zvYNh0BHN0PUmdc6aprqplyi1LZaOHj6bx3trOxf6JeWpQJ
 VAK483Ou+r8wwgUvMp5VR2Yv1VV1znw=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-XuoGl5QdPtWXlK_VmdPT9w-1; Thu, 10 Jun 2021 17:46:11 -0400
X-MC-Unique: XuoGl5QdPtWXlK_VmdPT9w-1
Received: by mail-oi1-f200.google.com with SMTP id
 s17-20020a0568080b11b02901f6e9faaaddso1898925oij.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Jun 2021 14:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=70NgQXU1//Wzo0iLFWpl3KegQtCCZiFqqErbm/ywz0w=;
 b=MeAlP5DDafcAsUQjdlv2hMxifnL13OVqFPTo32siC2TGvGbwXS82UVLXJPfKJIbm/O
 QJvRrTariluRxAnVhnBzZUHhgxAqXS14tJUIy2w1aATmOnqRsbF3VkTn7hvKOXAKORT0
 MszglWJmo4tK2xlgiRNpeGeGHyZc2XNF5Ek4ULPCe9qz9tHk5phXsTT272zmU50xzOiZ
 7kR7+zDMVNKDOV8KMQVrXSVgwkBl6mCtGK8oW+OFgXlWVyNuvNFIfYfx7KSmkWbR5zTN
 Uqs58JtzVdy1lmL/0VnDFPOoSsD9LA1XEbAV+2BFMVIx+QCnr5XFGH9BjrMW2RgjskO0
 4UXw==
X-Gm-Message-State: AOAM5336kRjD7rZJovTe8uHUJXBWhrBTBt6b5A23wrZfzx9+/Ed2XI0L
 pNV6/Vddo0E1m/ETlg4eLlFe0SMr/0L6Wbm2QquWAns+wDDZyzlW9sZlUqdZKGTn1wgN8Bl9XE6
 9dhkwNT7jQQbiHFJePF+DZYe+ClKmbzl1
X-Received: by 2002:a9d:554f:: with SMTP id h15mr358471oti.237.1623361570540; 
 Thu, 10 Jun 2021 14:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5xdp4Jwej97Ul1cmx7ubsXWjXdzvP8bKBwCPJ0ttg8L6uH+IckI6kmbkyG1b9obIsJHKQNQ==
X-Received: by 2002:a9d:554f:: with SMTP id h15mr358446oti.237.1623361570280; 
 Thu, 10 Jun 2021 14:46:10 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id i15sm881839ots.39.2021.06.10.14.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 14:46:09 -0700 (PDT)
From: trix@redhat.com
To: robh+dt@kernel.org, tsbogend@alpha.franken.de, jic23@kernel.org,
 lars@metafoo.de, tomas.winkler@intel.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, nbd@nbd.name, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@codeaurora.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, zhangqing@loongson.cn, jbhayana@google.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
 shorne@gmail.com, gsomlo@gmail.com, pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Tom Rix <trix@redhat.com>
Subject: [PATCH 7/7] mt76: use SPDX header file comment style
Date: Thu, 10 Jun 2021 14:44:38 -0700
Message-Id: <20210610214438.3161140-9-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610214438.3161140-1-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_144618_528704_0727C58C 
X-CRM114-Status: GOOD (  10.36  )
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

From: Tom Rix <trix@redhat.com>

header files should use '/* SPDX ... */
Change from c file comment syle to header style

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.h     | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
index 05180971de841..03877d89e1520 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /* Copyright (C) 2020 MediaTek Inc.
  *
  * Author: Sean Wang <sean.wang@mediatek.com>
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
index 8f8533ef9859f..397a6b5532bcc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: ISC
+/* SPDX-License-Identifier: ISC */
 /* Copyright (C) 2020 MediaTek Inc. */
 
 #ifndef __MT7915_TESTMODE_H
-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
