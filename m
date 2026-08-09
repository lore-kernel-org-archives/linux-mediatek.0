Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A70EC5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XbMehx8K2bZ2mGpb16Pwzbd3JSYKI87k4OfxyTYe5k=; b=2dEW8AMPfYZDnNUfERtWTQEKY3
	89NtEsF7Utu4s2KzYUWclOmXCmGT6O6fi/uDSXZ6DCkl+Xvu0LTpotR+E3U1E6PV87ItuOJmKlfEL
	rFFNqFZVR5KxGgj6a4/7dOiWF1S1/cchU09qtgw2BS1EXaKHY2qxVLpdd6lTfunRBCBG9xlrXpKKE
	RP5m1kAPyDHowJFtnFpRXta/GoJY95Er2cJP9dEfjBB/pKFjKBYh7zRQhMTP7nb0HG9pKkpYvWHw4
	/OwWCCg9TfS33GiB2Fq0+38KC1LAu0pN+70mojq2aXCW9AmcnP/Q5bcqD2G6tfQO0dMDI9qrPQC0r
	8BCVCHXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63J-0000000ATB3-2iBB;
	Sun, 09 Aug 2026 16:07:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63H-0000000AT9T-0Cl5
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4954dff6536so9178515e9.0
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291625; x=1786896425; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XbMehx8K2bZ2mGpb16Pwzbd3JSYKI87k4OfxyTYe5k=;
        b=hSNTafWQ1LdgGWa+hmIVg3+AFiBJIyMpeP+rfsz8kLHOJFY0VwrMpMF6BP3nLRuoth
         SCD7qRNRDG/keRbccS1OhmbYJlAGAn1YJx5lwxXAAoSwArbyjlbk5TWtcsNnWKWzhRsl
         w/acbjxvZeBldb6ARvGK4zhsBYhBOKCbIVAD5vKEkEEbPLl7H1LobEXTdM9aIz6y47da
         vquwTifS9oX28DYTuEBrjsfcgTl7XBFt9vZvs4b1P5j6uJXDmXD5NBGXqglZktSTPU8/
         x3NtPp2kfbxSn0X3h3AHHYQMuOtlhHzNyg6s65dvaZezu6u6e7B0Z61tpw+AwwLyTQNu
         yUZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291625; x=1786896425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XbMehx8K2bZ2mGpb16Pwzbd3JSYKI87k4OfxyTYe5k=;
        b=VO7HGjRCEqjYM88nDBqfOaHpxHTLDANzQXO5jRXk1xScc7VrGPZmGZyx4DpBs8e3Tu
         L/LKlTJyVq+ix9cRcKNrR3cNB/6IPT9NKZnKgeRMAuipE4jKIWdfnVNEtzJclEAbUkPQ
         jXfYAdfXpvLtxf2rLtreKWxuj0ToGIqLNwk4YbhXVlG2hptyoavIDY/JSMSCzJXj0dNA
         D8bzbGrLKpZv9ZgizhZX9NE/5H2wLvTiuu941MDqYC3n8LiXiP/d8t8A7zmNSib+GcNp
         5n6Y/DfUK+X/Zk+3/PGP13fNQ0DMwq6Zb0G/sMYQK7gCdGRkhRpvZ1XMy4BIeTcizo/T
         4tHA==
X-Gm-Message-State: AOJu0YyaOyPZiMiu6NQSU5jnd1EvY4GTCBVde26GbaYwGQnXhhH+VF1G
	8AoD4c5Ed8OlYyR+BFkDEYibZbk0Q8KwJfekv8gJFZoLpUN3skETTJlv3VtO0mYRgJ7Zug==
X-Gm-Gg: AR+sD10UtXGTdUPo7o1gTvIQGYiCfvvob9ml9gVsIRIq/EbxOGGSnmpOYWg0xLU2E2f
	f28/mGLD8NbSIa3PiulVigx7ALhuKz/IOB241PvUzr8fCIHYDnmf4uOMLZ+p3D/PHr89bOfvObA
	i2k+XmSCQJ4FAYExAW+mVtFJi+0lPwgx3l+SLfHLD2/CgeiCXqkbjvqJf1ykaf8OO+Ce0Bqrxpt
	+x8eu7RbU6dyfqQwu47/gWRu/FJZC1xmHlXV8p4NN6mnB6SMecq3EurM2NfBbgsTGeqZoLrfyGO
	HrMeUaP7lor6yfJd7rowque4BqzzRmLt3NrEFNgI1V3XGnUDwmlh2/ub8yammXCaNBho3xf+q9s
	0pCPE0Ag2hZcragqowQi3y7GoUG24gT9rpS79nOub3wJnRgG1dyngc9WYG3Xe6mzp8LnTf8FLxu
	5rB05amYjAYYDYrL8PAXZ6nDjL6sU3BjYK02XF49gq5VDe6sMfwxEKCQ==
X-Received: by 2002:a05:600c:1f85:b0:495:734e:4825 with SMTP id 5b1f17b1804b1-49959e3c571mr301623835e9.16.1786291624921;
        Sun, 09 Aug 2026 09:07:04 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:04 -0700 (PDT)
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
Subject: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
Date: Sun,  9 Aug 2026 18:03:25 +0200
Message-ID: <20260809160643.33991-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090707_103154_6C810F0D 
X-CRM114-Status: GOOD (  13.97  )
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

Currently mt6589 watchdog driver implements the watchdog feature, but
not the reset controller feature, which is actually supported by the
hardware.

Add the bit definitions for the 12 mt6589 toprgu resets, which will be
used in the following patch to enable the reset controller. Values
determined from stock Android sources.

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


