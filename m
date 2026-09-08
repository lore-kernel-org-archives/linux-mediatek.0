Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEDFC79F9E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=; b=bjvY5blcjgdcgJWTLkN5eiCfnX
	Ybh7VWXuCFR4s71ZckBRfPxKfjlSBlWEJfb2WH37sJOnuKGknLLrsE9HyM7dZu3LpbW0QOQhdGQ8c
	DK6FfyFYlp5kKbmXFlqO05gMlaMvWg+k6GXQDXMTDHTFMDGq21UNRVv98VQDw7ezXN4sfoPatovkO
	kj0IVka+3Kf+eM0LVXMXbUzlxgWfkD/wCCNrmIUy+Ud/RAVEqFKET3hyASNTY2M3yCqL+AV7b1EIo
	Ct2gp8+6sNPuLWzTevH59vfQPd27nnHZKcgWkmFw7JZnbAsp0soC8O7Rma6fKhM6S0jotEDRbfsm9
	3Gf6af0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zsI-00000009sEy-0GYF;
	Tue, 08 Sep 2026 17:44:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3zs9-00000009s3O-11ya
	for linux-mediatek@bombadil.infradead.org;
	Tue, 08 Sep 2026 17:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=; b=h8hbpSDVZdCuVPp9jqLSE5joTd
	K+DMJRZqNljXIyG4u1McrodV7n6AANvASMnsx7fBYFX0xRtdl2UbL1t/NNve4L+FJ7yHjLG9BoXiV
	pEf8Wyty6oTm13v+hW16o5JgiRGr2fWS6q8twei5bZwgG2yaCdkHLCgyyXXjMeCk3KgNvJV06cnE2
	lFx5p+QxxDhDPW57Fn8dyDBNtDsguO7ndki3uxDKwxlKEUVNrYlq82uWHtZebCffXR1LmpDH9Agox
	VwLUeRkVED07Y6bM3xIRDzHmIE0ZT1qwUyt8MwrjqJwIcNcjVYZXO1v2trzoRL0IsJx3xvF+v5PnD
	pxpkgOZQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3zs6-00000000B0F-1HGZ
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Sep 2026 17:44:40 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso48712115e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2026 10:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889476; x=1789494276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=;
        b=DV5DZKRKwSOH1BvraVuBcH6Q7iv+9KD7iAKrkXGJ0od8yBMQBTpDSFElZe3ut5yMK4
         cjY5f/qQDEnIvHLl/CTJoON+mp591fIOWlzYLV15If3SXJP2iFMmCRWICePFladHdTym
         Eq40XngbWpxcETwrDAmqpB9fzA3zLLqTceFyYFnfElAs9lDhevTgDeKC+Kt6vfTgyVNe
         5aAZfN3hXOHBu3Shn/R8vy5uP5IQBA994u2M+GblFR+imfN//khv/e3oB7JJpUV4dq+k
         YlO5Bda0MqdYgQzKTEcxObLpD0fQbCt7Kdk02vdV61v59bnehD6ZL8vIFCwV+M296PUt
         W+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889476; x=1789494276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LV0nGy7Prgird+t9YLnwanXWuEc7A0E5cLswUODru1c=;
        b=ESHdf5OqDLjhiPsIskXN6uB5JiAlZqifnalPSuXzIiLh9F1ci8CcItsv7o7sZ2Auln
         j34g6dkompUpNVHC5tOYDV5kjnpt9z7cK24v7O0maEJE+/zVTfBLZzpwyXoKTuTXQQz4
         UZ8fo4rhPSywnUNJWKfj8ajivbF8hid43NcU+Zd3eCSeou3D7WFkVOgri3Re6m9qg7I5
         /x6VHIsI48ERD4+MFjtmSFbiEknbkYngrdJ4rjIiGA1xVIEh9Amzjesw8p0THk3NTM0C
         E/w5ijc7+D9TO21zDiR/EZErk5YXbrz1KuLobeRuBk66dUnaW7SJqfdCPgyX71gEfpRv
         njTA==
X-Gm-Message-State: AFuF++nkrlIaj8Yn6YxRrrQZfDCIO61ocTg8lb7MQ8UztbY63graAbMH
	luRZ6dwdl7ThnUc211Wr8v+LNC+goJ/8ECI/kwg4WhZVA6YGfdYTM+tV6ztpMTes
X-Gm-Gg: AYBFou0X1pwOqrWePf4mz+fYa8IM4a2ky5U28lkW9xu5trnRVYbe9L4gSaK3n+F69+q
	QWlKHQOekTKFfU6q/qs3bO5u4pqVWlhaFxSImfEsW/M1L7MjdB7cgsIFmTYwh55Dp+qLFjFah5w
	mnCXAs9Up08Pq3jfj5EK/qbepLXDPtuTDnEFNdP1oPWua6/WUSODKCDnYljPc6ZVKEVLbmDmUY7
	9Kx0EQ1pg2lb0lxHP+G7opGHgbXLwZ9iWS9wbVJNrWpYXrUVTXL4dq3oQyzKJ83ALrAi1gJm7Bo
	zvwHMYXq/eGc5XvWIlfiXaB6Ypt5snHl2d5K+h06YPL3egJxkD6fwUNR+YpZxQBk1zn+HL8A3Rv
	z+75FqYPrtGL1QIjYZy8yTgpCPa8UdyGtI6KRE1NW86XuulhrOmxWGT18FE6Wz99O1pD9aklEwc
	53KBYFSYn3RbSyk8fWCeAF7fYblSv8D6c6wvdrMb3ee5StqLgPwnvf8LnJ
X-Received: by 2002:a05:600c:190b:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49cfa20cd63mr290493175e9.20.1788889476492;
        Tue, 08 Sep 2026 10:44:36 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:36 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 6/8] dt-bindings: reset: Add mmsys reset ids for mt8167
Date: Tue,  8 Sep 2026 19:38:33 +0200
Message-ID: <20260908174259.9009-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_184438_469707_1946E67A 
X-CRM114-Status: GOOD (  12.41  )
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

According to the SoC data sheet mt8167 has 28 mmsys resets. Add the IDs
that can be used in device trees to identify subsystem resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dt-bindings/reset/mediatek,mt8167-mmsys.h | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt8167-mmsys.h

diff --git a/include/dt-bindings/reset/mediatek,mt8167-mmsys.h b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
new file mode 100644
index 000000000000..b21f67b3b55c
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt8167-mmsys.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+#ifndef _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+#define _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_
+
+/* MMSYS reset IDs */
+#define MT8167_MMSYS_SW0_RST_B_SMI_COMMON	0
+#define MT8167_MMSYS_SW0_RST_B_SMI_LARB0	1
+#define MT8167_MMSYS_SW0_RST_B_CAM_MDP		2
+#define MT8167_MMSYS_SW0_RST_B_MDP_RDMA0	3
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ0		4
+#define MT8167_MMSYS_SW0_RST_B_MDP_RSZ1		5
+#define MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0	6
+#define MT8167_MMSYS_SW0_RST_B_MDP_WDMA		7
+#define MT8167_MMSYS_SW0_RST_B_MDP_WROT0	8
+#define MT8167_MMSYS_SW0_RST_B_FAKE_ENG		9
+#define MT8167_MMSYS_SW0_RST_B_MUTEX		10
+#define MT8167_MMSYS_SW0_RST_B_DISP_OVL0	11
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA0	12
+#define MT8167_MMSYS_SW0_RST_B_DISP_RDMA1	13
+#define MT8167_MMSYS_SW0_RST_B_DISP_WDMA0	14
+#define MT8167_MMSYS_SW0_RST_B_DISP_COLOR	15
+#define MT8167_MMSYS_SW0_RST_B_DISP_CCORR	16
+#define MT8167_MMSYS_SW0_RST_B_DISP_AAL		17
+#define MT8167_MMSYS_SW0_RST_B_DISP_GAMMA	18
+#define MT8167_MMSYS_SW0_RST_B_DISP_DITHER	19
+#define MT8167_MMSYS_SW0_RST_B_DISP_UFOE	20
+#define MT8167_MMSYS_SW0_RST_B_DISP_PWM		21
+#define MT8167_MMSYS_SW0_RST_B_DSI0		22
+#define MT8167_MMSYS_SW0_RST_B_DPI0		23
+#define MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG	24
+#define MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER	25
+#define MT8167_MMSYS_SW1_RST_B_DPI1		26
+#define MT8167_MMSYS_SW1_RST_B_HDMI		27
+
+#endif  /* _DT_BINDINGS_RESET_MEDIATEK_MT8167_MMSYS_H_ */
-- 
2.43.0


