Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC16ECD6E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xsjpLU/+950UBXEs80H9fBqyvb2ncbcU+NKJQmJQO7M=; b=FaEQmnyjo4DRYuJzv789IWbT96
	u/AcdS059DbM2k7vnp0t53NbSx0d71qigKtxmZpKJkOnfbkY6ANxXUfBl7lSf1VChQ3CXQw/KnbDq
	8uC39Ti8BCOhoOGJnXMwWTCPg21Z5M/otCwACdUflSQfFUDsotrJG6SirALTFQGUWFAw0oLbGFbE/
	9hlv8zS/a7+a6MHrn9q191PJU4rtJ0DybodohfVaQ9MiPPzy+83ZVlHIisV9Dj34aquNuTE/AVSZy
	K3UwQAjTSbHgROLkt6kOB8BwZ0i1S13SkVpYIxyIXBhxafhF4/wQTH5+BMLt1D9T/7M8/Baj+n2rp
	a6VBB71Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXc-00000000xPp-2nN5;
	Wed, 11 Feb 2026 19:06:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXa-00000000xOd-08M5
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so27818065e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 11:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836779; x=1771441579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsjpLU/+950UBXEs80H9fBqyvb2ncbcU+NKJQmJQO7M=;
        b=Sz5A34hmnOWrDilCY7s69BJ+SB//eXsCPyV4YiQm7g5gbIc11gT8dqa0d1bjMdoy1/
         kIQAhLnvHMa8yWvu4uD4f91LllXXGIiiJpq+usBYwhE7xc5h/8aAko1O+KUsuCaAV2IG
         /uLoJk7SxfxwjMZTFX1Xd3hL2FZoxJTfHmdK+y85Qz4OiNdWvWjBDFP5n71V/UFLaOHw
         NfOcDk8leEvKyH5obAmY3Ck7oyOcO24rPpnGQV6847+IsDYDMlmCJGooJbfMWcKYhi5r
         uSDu5XWhr4VPCWDRwTIXeOQ81Xsb46SqwPHB80lO0xFdKYFzLAgRPdmJlGV+GqZvwjOh
         YKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836779; x=1771441579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsjpLU/+950UBXEs80H9fBqyvb2ncbcU+NKJQmJQO7M=;
        b=biZZBg8mrkc4qMHaLpV8SM3eVMaA8AVNeNuKx6M+rCMJgb0sjkB2vgx5s7L+RELBEl
         yyq61jiR8qwsOjQn+ks23KG2LKkM9D0ErBnP8YuedGnUzjKUZiGLq04yzf/xj/dpCwJb
         8YVv644FuOBdtWWM5mCxfGK96bUcjy303haVqAxbW9s4UT+zD8lGoAGXBJMNdThM3+yS
         GT9TiHqYeGZkyNOEi9jMptfzyygwYBoTS/KxXk1oZIy7IOpXtrmVbeG3ykWZlRFkWMGK
         3oyIVlPjc0Bfb8ZQSWxiQaOsol7m/zSJnHeADYRXYEPijTmIvokf6/77qfs+AVPh0vzc
         2qRA==
X-Gm-Message-State: AOJu0YxygOSBCz+KBxReA1zfVnxJjgL4s3pKNtPWE3lumjTos6z3VeYw
	9K7CVhGTmzcf9OLbJZidR+/HkG0DalLnwybjN9oH3cHW/yxk9NtUtRoCv7tZfmb5
X-Gm-Gg: AZuq6aLS77+m2Kj7xsc05a9NFCWQbt/RCquINFquxGjaoRfyOclqy10sDuqk4t+5Lhn
	VXEH3AAbnYn8EwD6FsLOr423IeOqktsUc3F4/1sK/11/FYbc+toOgMfrO1cgY11kkdIL44eDUOj
	RT37ClcFREBOLa2e77RQfXJv16ZGLY1UStozu/auNa4Ue+/OwjnjLRWd1ssxauN78vS5Th/8VMN
	mRfFos3Fr9jCNQu8NoCGRb0nyMUqhO3ybCuNZZOP4d1E0WSfYINXIrZI7pyagE77w0TY8s1EPQq
	/+9PeL9x3hrP8JNPgI6t2VIoCaXVIukRNKhKqI3YlLIcQiam44qpM8eqwKj94/+SXfX4OVVckog
	6KoFK0wWknxajvXLbubxtonrpQrXeZKR7FXZRlts0BNl45O4NT8jO72tfLypQQdUtZmavNJURLY
	grHUawdXroaLiT5q9ns/ljwCoJAIFsDg==
X-Received: by 2002:a05:600c:4e05:b0:477:6374:6347 with SMTP id 5b1f17b1804b1-48365710e44mr2920265e9.22.1770836779068;
        Wed, 11 Feb 2026 11:06:19 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:18 -0800 (PST)
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
Subject: [PATCH 0/7] arm64: dts: mt8167: Add the mmsys reset bit to reset DSI
Date: Wed, 11 Feb 2026 19:03:21 +0000
Message-ID: <cover.1770836189.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110622_068603_F33EAD17 
X-CRM114-Status: GOOD (  11.83  )
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

This series adds support for the MMSYS reset registers for
mt8167 and uses them to trigger DSI reset during mtk-drm probe.
Registers and values are taken from the kernel source code
for the Lenovo Smart Clock and other mt8167 devices.

Luca Leonardo Scorcia (7):
  soc: mediatek: mtk-mmsys: Add resets for mt8167
  dt-bindings: mediatek: Add reset controller constants for mt8167
  watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
  dt-bindings: watchdog: Support MediaTek MT8167 wdt
  arm64: dts: mt8167: Add a specific watchdog dts node
  arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
  arm64: dts: mt8167: Add additional mmsys reset bits

 .../bindings/watchdog/mediatek,mtk-wdt.yaml   |  1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 10 ++++
 drivers/soc/mediatek/mt8167-mmsys.h           |  3 ++
 drivers/soc/mediatek/mtk-mmsys.c              |  2 +
 drivers/watchdog/mtk_wdt.c                    |  6 +++
 include/dt-bindings/reset/mt8167-resets.h     | 47 +++++++++++++++++++
 6 files changed, 69 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt8167-resets.h

-- 
2.43.0


