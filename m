Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EADC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 01:48:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0B012256F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 01:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0B012256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGqcDbcSG3rhE6AF0723bXWZFiblpOKwjgNDNUBzdSI=; b=ByS+GOM3WIK/QLdlGobHyEwnaB
	wQ39P1UY4lq917J08E0mLWqRl1jsGx/TouhruY70f/xr6+gPerSjnp7exAwoLVSaC6I9CipgR9sfj
	qwn5A28KJDp3Rx58Y/T/gzMvv3Zit4eMHrkxjYKQYqxdwaVvCfsV3QbgC/EzwiYLgSItA+0JYiAKB
	Xi3kUZGRhDl/59oMq1Yfsxp7qgpMUp1mls2ZfjGZAv2CaGR6ZghppxcQ0v6ffv2ea+OMwFcKUuiMf
	Q2FDzPBc1cvs+/OAp26I4N8t6Cn9og1zC6pdIAOShRq584H5WwX/LkUdTxwcOEFifW0ZzdozpBhBy
	+3cwp7/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksFja-0006J3-Kr; Thu, 24 Dec 2020 01:48:06 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksFjG-0006Bt-4o; Thu, 24 Dec 2020 01:47:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id z12so341573pjn.1;
 Wed, 23 Dec 2020 17:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
 b=b6VtEooOcj6G+Yzpi4yuJN2Tk/SCa/SppLvqNgEo58oVrEjCAz1l+tZ7p2qxpJdQo6
 w6tXHlyTmRCrgh6d0LmrA591KKa/9pf+/B3wSV2LYhzMi6s11w90sJMKum9lzVj7f765
 8T1YcRYffdY/7PJBIEceM7+/YqnyoNk19x4gcUMGZcNfJXlmP/HH3D3HUDq9xMjvQh4p
 kunYYB7no+7ptTFO9yko5kfUjD6qcGJZRNmftBjQ5fk2BV3vBb4YU7uRRxYzOz4Jx9AF
 71BV9zna5T2aG1XekV32MPfwHLhjFIXoEulg37C20FOwWjIsYTk+HyFpMWf9UqegGFYK
 iTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=S08RLDHwV3/dF7+XO13dHwF7/fsUpwvF4WzmBuKer30=;
 b=fwjLDX7jiweTl003NVlDDWW+beXnH/3RDOZRTEfsIVG2L9+UQQL1xZZLFjnlAcLoGN
 jGB1PBRa8aa+dqDFQ4MCDM/ehH+vnf/8a4y8aQdF+lkR6p/MMmKWxZCg8dOptIKqT0P8
 cmNSPHINEpCkXrW77Niw3cquIJkurqC35O9jOKawk9EMq9MS7mpBQi94RQ/8hsXmL5NT
 DFEgM1mk+ZGig4b5M1zBJ5ymDA73xTWFTYNSlWCiwYZb2I3meqRQdvhvrOjzJmiIyB1f
 oe1iePuWQ0pL7qYboH0/tijmQrK1gyudEabxc1vcif4KPAZbI5PqyFeofDSsGfghYwKM
 UA7w==
X-Gm-Message-State: AOAM531MUeoODC24yw0rWSCgeWk/yOcyL5HgDRtjYicevO2MR7ZdNg1K
 q/G/8vPcmcg6RmSJAToIzhA=
X-Google-Smtp-Source: ABdhPJxqjoQSL0T7GEFa+YhUWjU5wOryKoVWZIE5tSsZZdXdO6a/pSWx+KIYHbCiwtadTy/Zv0l7IQ==
X-Received: by 2002:a17:90a:2e84:: with SMTP id
 r4mr2153362pjd.147.1608774464055; 
 Wed, 23 Dec 2020 17:47:44 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
 by smtp.gmail.com with ESMTPSA id h16sm26604516pgd.62.2020.12.23.17.47.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Dec 2020 17:47:43 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH resend v13 3/5] dt-bindings: leds: Add LED_FUNCTION_MOONLIGHT
 definitions
Date: Thu, 24 Dec 2020 09:47:18 +0800
Message-Id: <1608774440-21655-4-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_204746_276112_8A22C418 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Add LED_FUNCTION_MOONLIGHT definitions

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/leds/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 52b619d..843e65d 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -78,6 +78,7 @@
 #define LED_FUNCTION_INDICATOR "indicator"
 #define LED_FUNCTION_LAN "lan"
 #define LED_FUNCTION_MAIL "mail"
+#define LED_FUNCTION_MOONLIGHT "moonlight"
 #define LED_FUNCTION_MTD "mtd"
 #define LED_FUNCTION_PANIC "panic"
 #define LED_FUNCTION_PROGRAMMING "programming"
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
