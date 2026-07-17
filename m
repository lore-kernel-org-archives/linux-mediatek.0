Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438A0C44515
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=; b=fSghzulbpcItxGFybiRXIoxJQ6
	ggXFZmYsjJztDSuMpqb7RI6F4YhtrgddY2SeuST9yBkhHsaL0JNrrInDmVcYGSkC2Aiokc2j0SPjO
	2MY6WIoQJQ1LuB/+UmTXkbTthM2R4licVQfbzQtjQmB62YhZz/x+14CFfw3W9Xp7W8/Qds8YH755L
	Xs/DLIlm6dfgWsKOxzwcBfYr0RzRL1LnmbzVuaIQ4Rt+5TGzZfofGbdumfmAmDtpdoJsz8/8nzts8
	Wi3eEj6FGYBstKTp2AJor5ZhgxYewVB4m4N52Jt7oLA8MxjRnrkOICPOiQm94LEbha4KyitU8H4pu
	cHfNTqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldR-00000002lFJ-19YF;
	Fri, 17 Jul 2026 16:42:01 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldJ-00000002l9j-1ctV
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 16:41:54 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-69a50189d25so14450883a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 09:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306511; x=1784911311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=;
        b=UfzAX5nyqNqc+6wCKylWLzU62+dl1lGIoqJ6gysBa2pwqjVG2wS6Uqda0ZV/p0bhuk
         2cfhQa+3T19mkU9+2b2LM7lbagayhfdod0qtcQdDPovtWW0X0pHMjKfJ8i2eoC+Od2jQ
         pnpRvNVzkAcPmg57ogVwM4VC4HWV5qjdZvN11RFeHATaWDDjDikyr5M16f2nRiMhLERU
         ElSpNUJl14hIbxAUh9YW71qb48Vo/IgRGRf+V2uPeRC1vYRdeJ48p55nCgLZdWBNEIar
         VMGT5E3dhW+QFbPT/Jxol2Yx35Ot7pb79KEL+Tz7mjezl1cf9tRP2YiL58pZ9ZWs62gO
         1QGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306511; x=1784911311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=;
        b=WKs9smv+4Dq3k2SuFWETKFqgfJfwCdIJgDzuEbXSf39rdjddkI+gg1UxZOB9tSEmU3
         FBESki38fyzX6AjBDMKI5ifYFw9VyOjn4DNBqkD5cjN8WO8ODudtAK0e6ycbxlIjM1qI
         YhyCa0QkjA3LCCfONf1ryf4e6dZArpR+zg2g1nPhmdo680bRR8wU/oX21Folff4yH2vR
         KDzQrjMpeBDf0mwewX8uK5NUFlAeiPmG5vQ6QBYpxcoQzo2yvwkNudKjUGS7P+e5e4X1
         9onVRm5LyVY1Bzvyo3uD6uTZHBiTMms71rM/HCyP4hB16cd9fxTCW/SoLmoSzb2QR8yt
         wfbw==
X-Gm-Message-State: AOJu0YzDQ9I1NKgrZXHwBbDKbtMbKGLBpTgNjEjNOuSeLyaZECAI87te
	ZLr8Vtjh6TKc3co6/Mh6VwYVa+98BEiXncehd8bfk703y54HLUpgBECwLZaD78wf
X-Gm-Gg: AfdE7cms/vPaHNlC1B23l2tIzSWUCvIu9bCHVmT64Bswa8De3iIM7cdpiz1KfhJ2hyJ
	HGEUmRhdJqdUV/hmTJV5ctG1IPRy4RMjvzaeCMrYy0VhBCc4fID1B4G3chxvu0sZv8NKCXyRvq7
	KZbOL7j2EzxKV5VMqWvt3Y04t7UV+eMJLHs9X0wPv+HxbOgxMjpTgGrQ7u5uVvv4GiGvqccgVoK
	mee97CRrlcreJuybYnZK/zSN7XmAYAoC0oy+O62ErNSOc5BMfEzdebCkQOgss+hoEAKZVkE0TgY
	5P4PPPu96g7h6C7eouORgdBJOtAschUDbE/LhHQLfGxdTu6hSMOLgOIZPOdEPSa4MAcZv86c0t3
	azuisExBKQ/hkwoU76rqhv8+j2ZP/bEyoVskBut2qW+k3hfutDnSfYvcoznWBAZklHt00ob+kVw
	==
X-Received: by 2002:a17:907:1b26:b0:c16:14d1:b529 with SMTP id a640c23a62f3a-c16b46e2b24mr154301766b.18.1784306511183;
        Fri, 17 Jul 2026 09:41:51 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:50 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
Date: Fri, 17 Jul 2026 18:39:12 +0200
Message-ID: <20260717163959.714561-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094153_458528_05E817E5 
X-CRM114-Status: GOOD (  11.04  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add reset constants for the 12 MT6589 toprgu resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
new file mode 100644
index 000000000000..ee08c39df513
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6589
+#define _DT_BINDINGS_RESET_CONTROLLER_MT6589
+
+/* TOPRGU resets */
+#define MT6589_TOPRGU_INFRA_SW_RST		0
+#define MT6589_TOPRGU_MM_SW_RST			1
+#define MT6589_TOPRGU_MFG_SW_RST		2
+#define MT6589_TOPRGU_VENC_SW_RST		3
+#define MT6589_TOPRGU_VDEC_SW_RST		4
+#define MT6589_TOPRGU_IMG_SW_RST		5
+#define MT6589_TOPRGU_DDRPHY_SW_RST		6
+#define MT6589_TOPRGU_MD_SW_RST			7
+#define MT6589_TOPRGU_INFRA_AO_SW_RST		8
+#define MT6589_TOPRGU_MD_LITE_SW_RST		9
+#define MT6589_TOPRGU_APMIXED_SW_RST		10
+#define MT6589_TOPRGU_PWRAP_SPI_CTL_RST		11
+#define MT6589_TOPRGU_SW_RST_NUM		12
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6589 */
-- 
2.43.0


