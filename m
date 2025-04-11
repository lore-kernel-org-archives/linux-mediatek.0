Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D342CC36010
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 12:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qVcEprkFzd3rrJu1u3UMnInCKF4r4l20VMNImQnFuE4=; b=MqJ9Yt/odSqdr2
	31+wJlCPWLmw1o9Qd3msa+eXtiooKqhytHy5bmzSnI01siZqfLoLXieqzIP/oKhdapv581PlpFYD3
	YMNS46ZiIJiLfuZku0r9WN9lVy4fwgVG1HLmJAV9Rah1PpHvvLS+7jGJFhhGJCaZpQChN5PGKISIJ
	sQegunlsD5A4OOtgpdkOn52f766dIJnoxgwRP/vMGlmF8m9HSrKTyxTNzboEFkPtXfE8cIeFb5aRg
	DcPV+vLkAZonLgkK4F67LvDZSdbc3BTATC+GwVuoXmMJ+CIJunBemTpmoYrJybl0IF9kd+bCCz/lD
	D9hUQFP44kxh0tKX0Cug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dhk-0000000DmI7-3Zii;
	Fri, 11 Apr 2025 12:41:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DcM-0000000DlBo-3YOw
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Apr 2025 12:36:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7399838db7fso1926448b3a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 05:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374981; x=1744979781; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVcEprkFzd3rrJu1u3UMnInCKF4r4l20VMNImQnFuE4=;
        b=h6tqpTUpvXKj8J1juMz9GMTSz2qR85te8vrvH+BbYlq3I/DDoXzMRXBALtvuQGI1oH
         CHOc8A+QgizEIF8XZVUnBiKT+HqqrWMq25n8ghozAjmGbgyH9Ox9gf+X/YkKcHh7MbLN
         qLGkSGa1B0jv9w9xWcW2hJgRfXpz9vuKZXhIMZfDWkqYCX9qaO1NmdDx1SJp1sIyyRIZ
         8SpjdMwMc45wmM5tVpELUUP6nor6CqTxudvWSmzKKKOsgIXJrdBATq1exYjFFKUYTyr+
         /ygxjAIK+m59FD8nBZ7u+VLxlsX8zCg/7HAbVAd7idSGpTav/Y8pWbyy2gy2P1ciRHs1
         20Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374981; x=1744979781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVcEprkFzd3rrJu1u3UMnInCKF4r4l20VMNImQnFuE4=;
        b=VhRyUORfwA7gLYIFS7k0XM+8988Ov4Qzn7TEfSnZuZeQRayUJwnOgHfRXUG7hc58+u
         6nw5McH2LGg9JdpfbHj54ySulUW2RAicOvHHwO2DODIcY8c+Vqvs3h0EIVytY+LXR1gL
         zxQdgUfTJ0BC0xbTVtfaztSuW3Th5XgYJdZwhGHNhWARbxwkmERZdZBXooCreEnq+QMl
         WdLE6IimMw9jGkXyS+8m+XUMM8DoG8IpgyjPmSaKz4B3U6MZNLxhCKpu8xkwMUprD2wm
         vKDV2EAKTdaq7+hHd/dNhN+F9rhQXqXwYTVBrKW6x3DrcoNFiGTLIL2R+CCVzC3th0df
         rDbw==
X-Forwarded-Encrypted: i=1; AJvYcCVj3ifbgS75YgTpfJpi956aRXeV/YY/JztPRma9oX/4i+WayuL5o2E4OIsyr0t3Vhj1oOTj/R2t8QlDj5k3rg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWfnmx92MU6dpia3oJAS/GWgYzY0xSXHFCdExEpm0umUswaR9O
	eEch59Ddl9fibknHOOba7jGXVMFXCT6p6rWnw0Wo/QP9b+15ee5mvxnuph/dFsgG/xbQU9j04wW
	akcQ=
X-Gm-Gg: ASbGnctMqETAwQP4TsUUEFfffNlqjX8pUmHPPY56CRLBV1yD2zCel2zzqoPqAutTFHh
	xDVKHvlbHqAR5gIZiTbBQBq0Wx+puT9W4exChioGp8GqThHqQi9XQxLRfyN0Z2jkTspdbwCE4Sx
	XKtFVNk+8zD+cR1RdSMR1F+d1aiuWxAlZl3ma1EHHJ+0ESKnkoz0U8FazKreTC/VeEY2LmA2JSY
	Z7SYfSmJh5+83D72fi1lSb4CHj52ZXgeSy/ykITwoclH9/SG0p3krKYSyDo5RbZjLwtlW4kJVDs
	6thUVEn5Nrs95KYJsRPhVU76le22oE2NzaPBaFouOok=
X-Google-Smtp-Source: AGHT+IFovmGyGMQj3bymdOLN01PpdPyLZzWvo7zsQfRwoVJ3a92T1FSTenwoChm6y8KulWHfihn9tQ==
X-Received: by 2002:a05:6a00:1809:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-73bbf5db4c7mr10560474b3a.8.1744374981364;
        Fri, 11 Apr 2025 05:36:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 0/5] Enable RTC for the MT6357
Date: Fri, 11 Apr 2025 14:35:53 +0200
Message-Id: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkM+WcC/22NQQqDMBBFryJZdyQmjdiueo/iIhMnNWBjmUioi
 HdvdN3l+5/H20QiDpTEvdoEUw4pzLGAvlTCjTa+CMJQWCipjGzkDShanAh4cYDK+6s21qvBiCK
 gTQTINrrxUHJbNxrYtcf3YfLhe4aefeExpGXm9ezm5lj/JnIDEqhTSqM3BrF7oF2ngEy1m9+i3
 /f9BwGfd+7DAAAA
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=TeU1qtBc+lGVT/HpCQKfBJRuhD/X5cT4MzAlX7BxgrA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+NoIYjXj+o9tBSbe2ubQIPyD5kfY0YF94od6r
 MU0pleCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURVN9D/
 4k3aK0aGww2YNwHcKCp0TO1UivbsRrZwQC1+ak/Uk7UU7vYjLfAYE/2Dn20O2fUDmSLz92un+oTBP4
 x9Fhdg9CHZkQaaoxcapPvvG32aI2Aau2SYnny8/WhV65oCkofNgsmj22b3HHWSq1voe7T/kWghKUIo
 INAdePtn/XBWvyNNt5QUKX1fFUYxG6TZgTF2RryD7y91yyff0QE/UqpzsbA7ZOriIrfCC6MkQq/kcI
 Dfi6huKX79Aij45TnVutEJQozpDU839t4r1hNIsihIUXI0DkMZTUKdqftJoi+dhwpQGIQuyb2ilDlB
 izI7ZCeZsnnCW91AxhA7MitBvFdHdmoWyrzKUoQak+rNfMdiSYD8EIXc6SQlFG2L2hDkgnvpSAji7K
 jIU6dnaUKFY1ITVHzLGxbyAvgKrdlfUMmkeaHuRW9yNxoYVsd4Io2LJ3V9hk9PhXESMr3CRl6DSEI0
 nlJusBoAibu3rFd9TW/yKTlC0L7eqDgLxRvgLVClSZeUDaC2YJIxMnRrEqH9ffXks2uF6bMftm/Jt9
 lAhBwwVAHSGS571K0h9uk8QmQvOMSPTNu+/uVbx/F8BAO5bJjb6Yi/P6nCGHFUZ+7FuF4UARR7SXXW
 BkZJsK6teBtEffDviuxEDEwPAh9/YTnJJx1ClDIfZv8AaVBXbpar7T50Es/Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053623_154433_56F506C1 
X-CRM114-Status: GOOD (  18.56  )
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

The RTC subsystem in the Linux kernel has long had issues handling dates
before January 1, 1970, particularly for hardware with base years before
the Unix epoch. This patch series fixes these issues, focusing on the
MediaTek MT635x PMIC RTC implementations.

The core problem is that MediaTek MT635x PMIC RTCs use some defined years
before 1970 which are negative values after conversion. These differences led
to inconsistencies and bugs when the hardware's native time representation was
converted to the kernel's time64_t format, especially for dates prior to 1970.

The first patch adds MT6357 support to the MT6359 RTC driver. The second patch
fixes the fundamental time conversion functions in the RTC subsystem to properly
handle negative time64_t values (pre-1970 dates). The third patch adds
explicit type casts between signed time64_t and unsigned timeu64_t to
fix comparison bugs that were causing validation problems.

With the core functionality fixed, the fourth patch removes hardcoded start time
parameters from the MT6397 driver and instead relies on the start-year
property from device tree. Finally, the fifth patch updates the DTS files to
specify the correct start-year values for all MediaTek RTCs.

These changes make the kernel correctly handle the full range of dates
supported by the hardware. This matters for embedded systems using
these MediaTek PMICs, which may require accurate representation of
time across a wide range of years, including before 1970.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v3:
- Rebase on top of rtc-6.16
- Added explicit start-year property in DTSIs for MT6357, MT6358, and
  MT6359 PMIC RTCs to ensure consistent values between hardware
  registers and the RTC framework.
- Removed hardcoded offset and start_secs parameter in mt6397 driver
  in favor of using the DTS start-year property.
- Fixed type comparison issues between signed time64_t and unsigned
  range values to correctly handle dates before 1970.
- Added proper handling of negative time values (pre-1970 dates) in
  time conversion functions.
- Modified rtc_time64_to_tm() to correctly handle negative timestamp
  values.
- Removed the tm_year < 70 restriction in rtc_valid_tm() to allow
  pre-1970 dates to be validated correctly .
- Link to v2: https://lore.kernel.org/all/20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com/

Changes in v2:
- Split the patch to have:
  - Add MT6357 support
  - Fix hwclock issue
- Handle the year offset in another way, but the V1 way still viable.
- Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com

---
Alexandre Mergnat (5):
      rtc: mt6359: Add mt6357 support
      rtc: Add handling of pre-1970 dates in time conversion functions
      rtc: Fix the RTC time comparison issues adding cast
      rtc: mt6397: Remove start time parameters
      arm64: dts: mediatek: Set RTC start year property

 arch/arm64/boot/dts/mediatek/mt6357.dtsi |  1 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi |  1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi |  1 +
 drivers/rtc/class.c                      |  6 ++---
 drivers/rtc/interface.c                  |  8 +++----
 drivers/rtc/lib.c                        | 38 +++++++++++++++++++++++++++-----
 drivers/rtc/rtc-mt6397.c                 |  3 +--
 7 files changed, 43 insertions(+), 15 deletions(-)
---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


