Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE3A606A888
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 18:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nPuS9+gD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kx5AnIbO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=; b=nPuS9+gDNWbEyX0pF3s7P9paef
	wwYFMeInHkDqTiA3tYFiwN5ozBJCZpBW9necizDqS80/kYpQr16X0/ficyZpbbkzGsnTVkCmA9VM1
	mSyKkcqZ+6o6OlBDPvH/bYZeI+J5sOrN2K8nJ2EwH7u0mutk7ugFc4JDUyqlBT3x3i9ilbvf/nJxL
	OA/akw8RIl/fYFXSIP33cRBp6r72yFAUn79jBwwj9U+grVf551pjNrpvghkzPlPV1bXJR05Ni13LF
	iRDYoLZke+xe8CpHBkOHIkTKjfgZeB60nd3CujXgtP7jzx5twIuRgsNSnCnyh7LDZ9LNDCAAr/E2d
	0zUUPORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1j1-00000003dJt-4Bmt;
	Mon, 16 Nov 2026 18:46:44 +0000
Received: from mail-oi2-x0b.google.com ([2607:f8b0:4864:32::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1ix-00000003dHy-0tJK
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 18:46:40 +0000
Received: by mail-oi2-x0b.google.com with SMTP id 5614622812f47-539edfadfa9so1170433b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854797; x=1795459597; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
        b=kx5AnIbO3ITPD88lqiZ/O8Jt/CUzBQquIznIyCmHKVZLv63eV2zUTd/K55nzPX6PQ3
         BKw/Ls2KTH2xmbu8eG58bsH27iDDwFwxc4sst8gB3FiPRfdGX5goSCJaXKvPoLczVAte
         vhydmMrE7eDzqg2V0h1nafR3riHQHrhrwMU2p10Q2C/liKXmDYryOIReKLX/ord4EEFd
         YEVdaZFlpNnL18FWiyG9w18ojLXeTMcF5pqXUxLlUpOd+rgitz5zJ1yiqU6dHc/nt0ur
         UI8w68SR0o2xLRmyYP4l964CSA2x12nwGCk/9J9TK/qPw/MuINzYb6hKJwNfSpDu0oJg
         oaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854797; x=1795459597;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P78VDpsJpTz+1/Uu6wAD6OIZCd9bSuoX6Podaf0tODg=;
        b=O2aJnQr0ujRh43ezIGNZUafZw8wZlI3mTlaE2Gtoln46w+tDGDBWJyCGeXB98rSM9g
         cQE/s+1SuULJdewuI5fXNKzyMK+aZurCNYfIPwCtHQFATPZFnk+Q+Nxx00eKAKt25g+O
         2TQtMLxpjrBgMR+6dX/XwXJuDrYkQZDra5J81ac9/Vt9xKXO1A+ZBkAkq196khxp0A4Y
         TQpzsKPPe/8ux7R42NMQF6E4iBpM8OwtG5Tso5VEiUlfB4IAIH/BFLKjDVH0pubQRsJG
         R+OB5gG7o95FiENRFwQLlPyDck1r0Olv0tc2S4GNYQXFCvvQFrgPbBL5C9V/Xa4kKxjg
         eXSg==
X-Forwarded-Encrypted: i=1; AL+hErFsIjokIaGDuIaBIQa8wfo7ni5lImlj3IJ5PDyCpqBd6HVrBux2b0N+fTUemuahM3YdSFaj2ns9E0xKqNuVOg==@lists.infradead.org
X-Gm-Message-State: APuU4Z8jtPO8OXVGBuhcgNhcsSc8VZyXEKMDcb6E1HEieA6D3fAiUbTj
	/y9+f+Jd+pP1U3jebcQKXA3xpBqYb2fwRAl2k/Lcg+qQsoWr0TpHIcWO
X-Gm-Gg: AYBFou2BhzdAfiNxDT8pbSpd7jeostNuhq6fVQ3RH52EnMxWgPpyNCKZk4+VSJ39VGH
	QBMoMck1uo1+94Z6Q7YqUhgqy0qNz1dTkKsHF3kuOBdFg3xM8901l/Xzt2pKXcts2dL5PrLtrQI
	4pU+YMvvb/LG9rAZaQoWQKVQZ6U7rtLDzO60VXJaaRPC91tJ8tFNdxxmhYCWieTLl1cTZP97IGD
	hLWrLgKS8xtoyltXBHJ/sbnhfd9+eW4zT5g3MTEcNMZ5OoRplxHzcYD8DpcV1iXTrPQmw7iflO1
	qU30Ui/WTHZldSrHWNFqXD3aUXvgSMHfUKn48Swekpv2lg2koMrDRlzsexzwB/fCRkfzRK7z7EI
	yN2yeLOwMeLMNyVAtI5OV3f5Sj8O/yOJr2I7WaGZk1ROvawimy5yszbhzSPg05isYZ93ghu/4HA
	6b9rwVrZ9jUnngWYVD5KfO2np/VCJteg5x63q7MqXDyhbU26qOD3m9HwUdgxe8Su7psQiIaHUyF
	5kqtkANm9Qbn+uKmmRet8JqE3kCuqJ4NS8E9RgvCgMqL3hfWH7ZljorDiUlKQGJE/Gyh3S/sQGY
	KwD+vPOnxRnjSxpGh7HqE/W5sjCV3ERuH36nZafacGnJTqGSQOCuQVIWFOhfvYR6O+HQ20WNtiH
	AQbJbaEjFxnRIW2aRxQ8imCzDkE6Z+chm0krssk9o
X-Received: by 2002:a05:6808:3186:b0:53c:7298:3591 with SMTP id 5614622812f47-56e5fd4852bmr9836229b6e.1.1794854797281;
        Mon, 16 Nov 2026 10:46:37 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe242b670sm7210735fac.17.2026.11.16.10.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:46:36 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v3 0/2] rtc: mt6397: provide the RTC's 32 kHz output as a
 clock
Date: Mon, 16 Nov 2026 12:46:32 -0600
Message-Id: <20261116-rbrue-suez-upstreaming-mt6397-rtc-32k-v3-0-179145eb7e89@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43Nyw6CMBBA0V9pZs2YTkcosPI/jItaCjbKIy0QH
 +HfDbhh6fYu7vlAdMG7CKX4QHCzj77voBScCLA30zUOfQWlACVVRlIdMVzD5DBO7o3TEMfgTOu
 7Btsx40JjGC2yuqM0ZCmrM+acIREwBFf75+acL4mAm49jH14bO9NafwJJ+lOYCSUWOs1rzistU
 z41rfGPg+1bWIVZ7a/q36tCiVRYo1VOKevj/rosyxeEFL37MAEAAA==
X-Change-ID: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794854794; l=2739;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=edI0U8BJ05vm1zYUWZKlM1TrWGXlJBUbcmpWbDIqGNc=;
 b=NLQ9/9ifb2vqQe0on9JdNLDbVdTMhveUDIstOj4nsP4FUeFFlZdrmwfVC4+mYhCjsUQssYltO
 y+PtxNWp0vnACO+TbUGWxj431pgV6oe5TK+FwOAtVekLyd9sDVCpExb
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_104639_268261_449A8D88 
X-CRM114-Status: GOOD (  15.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The MT6397 RTC drives a 32 kHz clock out of the PMIC, which boards use as
the sleep clock of a Wi-Fi/Bluetooth combo chip. RTC_CON.F32KOB gates it,
and mainline never touches that bit, so the chip only works if the
bootloader happened to turn the output on.

On the Amazon Fire HD 10 (2017), which can boot through U-Boot instead of
the vendor's LK, nothing sets it in the former - LK sets the bit at every
boot, and the MT6630 combo chip's Wi-Fi and Bluetooth never come up.
Letting the RTC provide the output as a clock lets the chip's
mmc-pwrseq-simple enable it. With the clock wired up both came up on that
board in two boots out of two, and in none of three without it.

The driver registers the clock only when the RTC node has #clock-cells,
so no existing board changes. The MT6323 shares the MT6397's driver data
and gets it too; every MediaTek PMIC RTC whose registers I could read has
F32KOB at bit 5 of RTC_CON, but for the MT6323 that is inferred from the
shared driver data rather than read from a datasheet.

Lee has applied the binding to mfd [1], so v3 is the driver part only:
patch 1 gives the existing write trigger member a name that says what it
is, as Lee asked for the new one, and patch 2 adds the clock. Both are
for rtc.

The board's devicetree that uses the clock is not upstream yet and follows
separately.

This series was developed with the help of an LLM.

[1] https://lore.kernel.org/all/179459615032.87488.12726056214378307165.b4-ty@b4/

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v3:
- rtc: name the new struct mtk_rtc_data member control_reg, rename wrtgr
  to write_trigger_reg in a patch of its own, and the local con to
  control (Lee)
- dt-bindings: dropped, applied by Lee
- rebased onto v7.4-rc2
- Link to v2: https://lore.kernel.org/r/20261102-rbrue-suez-upstreaming-mt6397-rtc-32k-v2-0-19ca72815374@gmail.com

Changes in v2:
- rtc: check for #clock-cells before reading the driver data, which is
  NULL when the PMIC has no RTC node, as on mt8173-evb (Sashiko)
- dt-bindings: add Krzysztof's Reviewed-by
- Link to v1: https://lore.kernel.org/r/20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-0-9758f38d7053@gmail.com

---
Ryan Brue (2):
      rtc: mt6397: rename the write trigger register offset
      rtc: mt6397: provide the 32 kHz output as a clock

 drivers/rtc/rtc-mt6397.c       | 95 ++++++++++++++++++++++++++++++++++++++++--
 include/linux/mfd/mt6397/rtc.h |  8 +++-
 2 files changed, 99 insertions(+), 4 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261024-rbrue-suez-upstreaming-mt6397-rtc-32k-0a1c16f63383

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


