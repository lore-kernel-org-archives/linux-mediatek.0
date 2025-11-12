Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E74FCCF9F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Nov 2025 10:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c8EF6cBHJBO/Q2isSVRmRC/bblG4Ra8gNeer+nZltPQ=; b=47CnUWgO7CG0FD
	feTc1zFlk21vpKc0s9JxucfvSZ9TAgQgXcgxYNlJkNIHBVKUVzVwIRBjoOAhmG9k4scvgeVBAkjSd
	M5H5yZZG0/gYETdbPVW8Tb0wMzyIJQZIDtqRJx5mQjhaqSy4ABP4dAdk5VDKWnu2h9vbIrCS4ZczH
	Ug1XOYMwZj1/LQAKXjavxypTxYN6iv2W76gGtjmaMOXpgHcayFd39LwSu+Jh4PFKwnALgx4HBMIG6
	+5jQuzRFEJl7s7OJWXWgxlxWyATnID6Or3wSJZokwuKw8s1EK0NY2EyCU+c6GFLwMBWMF81aTxJ+7
	yxweIl6HArCP/F6WgnbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ869-00000008Yuh-0lxD;
	Wed, 12 Nov 2025 10:29:09 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ866-00000008YtD-2Clt
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Nov 2025 10:29:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-429c84bf326so55213f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Nov 2025 02:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943344; x=1763548144; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c8EF6cBHJBO/Q2isSVRmRC/bblG4Ra8gNeer+nZltPQ=;
        b=INC7vKsM1l/UJN9nHCGqS8l1KdqRcqYbkZoRaQG8jYJ8YCtW/AM5/ZZFh7e6T+VbYE
         CdmtslBROchxNMaCzl1tuY++76tg53aKdLWa5H+fXEC0fI7xpUQLegq6iq8LSkNFAxTW
         W+MDhnEeHOmOD+4TTrNgqyTjnUFdKS2sJmlRSIJMBF/eU6qBVenwaoaLOeax3jC0UA2N
         4dPgUxKL1OsVxh7iImM7DQ6+ePvA3EIjxsVbdV/FOo1QYuC/Izdayv4dUhMlJVCdfle3
         v/Mhsb1nlt2ISVSSC89gPY7/B640nJbZz/gshHm1EHnAkHCkcsJzgwjgNFHjAH2xZGOS
         RnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943344; x=1763548144;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8EF6cBHJBO/Q2isSVRmRC/bblG4Ra8gNeer+nZltPQ=;
        b=IZ7ZkfmCxOfI639PIzA7xgWFVdgLfc/Y2F8MQSAhQgUEesK+/V85CJplBHGwiNmtjh
         jJTeMKnx+42jr/ZNuIaNRlZBM5ZSxf/VhNlkmYcKLn3+gFn0eRZtMeXunOC7ptPbHPvG
         2UQurkGllvd79sMcTr3Goc9tauEEn0Y7UKpq6ZnJsjGnNzRL5nDaZcKd6C64I2zoPKdd
         MycNsVlk2bCIZxpSA2z4asShwmIoPfA+y2fHks4mt7AMAu5Ev1MbIRA7Xm65rzAAAH/4
         cM4DtXpDLBwtCrq/4ffb5V9k1QaU2SpFl/S9CNZAWh/jUHi6H3IdnBZbR8HrkAGqiwaH
         a0PQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxMyJYMutgxH6PE4UuE9jgHP8S9ncAAbpIlyV2uAUQX0wrjmQrmRrVo72Sx+DkL77A0stpVo0dYO8mgr253w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQXJ2Yu6NPT5hyEn+rudw6/TWVMrJJAR9L1D1RUqLGKlAUkoz/
	19tCPQIaZDH4XIS/0qa7HWQzTzTpTKB1UlEVDFUULAfykIPF8+MCIoW5cz+TbW2FGlA=
X-Gm-Gg: ASbGnctzdOvckiLVIxmHkual+Q9WwJpYVF52q16Z6r5WjiDBFMHGc1Ep353uTgG16RU
	fnhtBQMXSaDE43KWR36hsSkPGjfqhw5Ba+hsQqlpI/6UnQ9HY/9AHvS9NiGu26JA+oMZGMk5Ysk
	iTJ9FAWv4arNnKku2R0BChmudoS33Stt3xNalFHWCNiGWDe/WOtTqntmfXY406/TZqY59wXlZep
	EtnOBi5X3CkCAOvMeJ9Tu2cttoZokZKsx3BK0mnXWztBu+jYZtvaoltXG9r1HdcQW5lhU71Lsgq
	084tOkqXXVuc/vR6lyb7pEv7ec/6o9lF36Ji8cjxJUZaAWVPVJ1nU13LOPeWXCQPOUTGeDY67jJ
	V2A++nVBbJ904m3A69ZSesFpXI3m7CEbW4BiqheY9QJBBljMK1E9bB0zS4F+GpuutxroPFKy/OK
	3SbrejyNeuOEuEnpwa
X-Google-Smtp-Source: AGHT+IEMmjHlZdR4rkkkBtikr3kREAJzYe3gVzEQY2F/CPNjTW6FIV3Gq5nMQMHGsI7EpVQgzvavzw==
X-Received: by 2002:a05:6000:230e:b0:42b:3746:3b83 with SMTP id ffacd0b85a97d-42b4bdb73bbmr1049650f8f.8.1762943344377;
        Wed, 12 Nov 2025 02:29:04 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 00/11] of: Add wrappers to match root node with OF
 device ID tables
Date: Wed, 12 Nov 2025 11:28:45 +0100
Message-Id: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5hFGkC/42NQQrCMBBFr1Jm7UgSYiyuvId0MW0n7YAmkpSgl
 N7dWC/g5sP78N9fIXMSznBpVkhcJEsMFcyhgWGmMDHKWBmMMietlcPeYvT4oGWYfymBcaSF0JK
 zvVfWtdpC3T8Te3nt7ltXeZa8xPTer4r+tv9Yi0aF47lVTLrmYK53CZTiMaYJum3bPr5NAz/DA
 AAA
X-Change-ID: 20251106-b4-of-match-matchine-data-4a64bf046814
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3319;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5+dyAstf0xhbGIWyYKa5+nXexFcqNXdclmhKrec/Eu0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFgkKzLKPJ79bhNkhzUMxTf7Rq0m0OFEmF4q
 dnv57GH9wqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhYAAKCRDBN2bmhouD
 18J1EACLN9dO8VHBUsLifJcqZjQO60hgIzWj+1YfL7nCpzD4o/V3Zb9fmbppxoW4A8qBWHFp+9z
 bla89lZvHQZo5Io3ja8lW7quIu9nzOFwt9GGBLMYb+Y4ukJpyT7gnUqW8MSni+LVw0fGpJwzl4c
 khYK2MI/R/M9d8wpqyfT9qS9+54jhVEmCX7oAcfw6fUOJghJ82AjVlioaejmfFriDfgq1AqC7Tt
 tLYC/FxWxmwChwzttO5J6CuIWkPJQQoqWoFeMjSJqgz0In8mhbWxhp1F6NyiLwj1BL9z6dGyTRX
 L7/11go/X9B2H+c37Dx4RMwFJb5p53L1RfJ+cc5Ub1MMcEhPFlxWk7LVM0QTk1T1sIszZNTiSch
 rRf7xEqCdXvr9Fpd+TIK7K7Wm11BCoErJWT6hj0bsWLVtyC3N+y5Pfk/nekv4/4e2hbWTQg3cQf
 MCAmbLzployqG0E87eyUpzn8cC9Zyu9YZs2rc1Mrc4ZHC7AJlaWEAPmoNfpCZVFKErcfVMjy0a8
 PPMvUe1+u/lpKCkXWSD8JfOk+mFkqB8gR2Kh+tMtX6hJHj8J05MZAWwknwQKHYYwAY6QKdUnk3g
 zOhsW95VFgRYFLBwwC+Cz0wjXr5kwLh4U2ZhwY0tRVnLtCw0DWHx6zGGwKRTG/YKbYQjDuv2t7S
 KoMdrL+EsQdcY+Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_022906_620251_4B48F003 
X-CRM114-Status: GOOD (  12.94  )
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

Changes in v2:
- Drop cpufreq/ti change: not correct.
- Drop soc/qcom/qcom_pd_mapper.c - objections from Dmitry and I think
  better to drop the patch in such case.
- I did not implement feedback for first patch to make the
  of_machine_compatible_match() matching machines in arbitrary nodes,
  because there is no such use case possible and no arguments were provided.
  I also did not use cleanup.h in first patch because existing code
  of_device_get_match_data() does not use it and I prefer uniformity.

- Add Ack/Rb tags.
- Link to v1: https://patch.msgid.link/20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org

Dependency/merging
==================
All patches depend on the first patch, thus everything could go via
Rob's tree with people's acks.

Description
===========
Several drivers duplicate same code for getting reference to the root
node, matching it against 'struct of_device_id' table and getting out
the match data from the table entry.

There is a of_machine_compatible_match() wrapper but it takes array of
strings, which is not suitable for many drivers since they want the
driver data associated with each compatible.

Add two wrappers, similar to existing of_device_get_match_data():
1. of_machine_device_match() doing only matching against 'struct
   of_device_id' and returning bool.
2. of_machine_get_match_data() doing the matching and returning
   associated driver data for found compatible.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      of: Add wrappers to match root node with OF device ID tables
      cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
      cpufreq: mediatek: Simplify with of_machine_get_match_data()
      cpufreq: sun50i: Simplify with of_machine_device_match()
      cpuidle: big_little: Simplify with of_machine_device_match()
      firmware: qcom: scm: Simplify with of_machine_device_match()
      irqchip/atmel-aic: Simplify with of_machine_get_match_data()
      platform: surface: Simplify with of_machine_get_match_data()
      powercap: dtpm: Simplify with of_machine_get_match_data()
      soc: qcom: ubwc: Simplify with of_machine_get_match_data()
      soc: tegra: Simplify with of_machine_device_match()

 drivers/cpufreq/cpufreq-dt-platdev.c               | 15 ++-----
 drivers/cpufreq/mediatek-cpufreq.c                 | 12 +-----
 drivers/cpufreq/sun50i-cpufreq-nvmem.c             | 11 +----
 drivers/cpuidle/cpuidle-big_little.c               | 11 +----
 drivers/firmware/qcom/qcom_scm.c                   | 17 +-------
 drivers/irqchip/irq-atmel-aic-common.c             | 15 ++-----
 drivers/of/base.c                                  | 47 ++++++++++++++++++++++
 .../platform/surface/surface_aggregator_registry.c | 13 +-----
 drivers/powercap/dtpm.c                            | 16 +-------
 drivers/soc/qcom/ubwc_config.c                     | 14 ++-----
 drivers/soc/tegra/common.c                         | 12 +-----
 include/linux/of.h                                 | 13 ++++++
 12 files changed, 79 insertions(+), 117 deletions(-)
---
base-commit: a4ebba34e722123f1c09ce3282e26f052fc8b27f
change-id: 20251106-b4-of-match-matchine-data-4a64bf046814

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


