Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7B3CA9EC5
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 00:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XeJjl/io3+aKvrUjCul3f6wSV2JN17uTopzSqxgAVR8=; b=OQZKghZftLz0V87qP0IyZQETsR
	MPYBfDvFWi1Hz3sF5hFhzUqUJn069KiDgrxMk5OLWhIG0Fe0ONchJwDJHG3j4N6HcyxzmpQmYul22
	P9k2Mo8Ga0OCL3kyvcVxQhZZcjuNOUz8Y+UoQsL3J568B2CLdtRdv20eadUOmyw7yLvzjq3mF7hnO
	+8Qq3ET+6cqbYbSBioNsiZNm5usaWUXqjiwqJNSgNKTKSBcmocDrNzw4wr0vt3v6wZ9Jc9TUyTVEt
	mGD2Rnbl8WnX5UUxybbkEbEB4S0fUAA5p/m2C+jObZmHgLP1k/EDJV38xD0FcE0mXtTnRlnZyLtBO
	vfbExfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhOs-00000008ZkV-3BUN;
	Sun, 11 Oct 2026 00:26:50 +0000
Received: from mail-qv2-x02.google.com ([2607:f8b0:4864:33::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFhOn-00000008Zji-10kv
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 00:26:47 +0000
Received: by mail-qv2-x02.google.com with SMTP id 6a1803df08f44-9195de4174fso6688886d6.0
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 17:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791678403; x=1792283203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XeJjl/io3+aKvrUjCul3f6wSV2JN17uTopzSqxgAVR8=;
        b=SK0GFWK9+6e0OgrUxIgW5Z9U7GnwlnKdQ/DXUMzr4IuXBRWdXTm71czbBecHdkGbgM
         zqUiM7pqwcCRPa5PgM9a0svAu0jX0dGoJjSqrYc5p1W0p392zmEnccIxy1ql0SJWgr+1
         xroqaBvq/tNv9IQsSwo1qd/ImDmboKnSR04P1+VsjclGQVykq+p+yICLqjQEjlyI47pR
         hYx9ZgUqbPvv2LWnDtV0V2O1cewgP/mQqiyidjizLAcZTaxXl0l3hi1OnzTn7b0j//Zs
         R9QrBPJhCibi7j6Y01HeJ4H/SKGMXkkTKE8iZB/9xuNtYnHT0/qQRMB32PARrNn0W2v8
         gLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791678403; x=1792283203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeJjl/io3+aKvrUjCul3f6wSV2JN17uTopzSqxgAVR8=;
        b=IriRl7u3FVfgUTW9U70djmm1NZo1uVwIQ77FcjJW6CTgaU0jAkWQYNfVDVFHQE2eXX
         ir0GYhtGEkOO+sxlyp+eZ87sFD+uHhLhGWuefHl3OvejaQzDAipNAAlFBc3FqZGMtfs+
         aJ6py5wgc7oz+Yxz8p6nbfLagAfU/Qpdw/Wu8EPNeYcTzS49/PzOuWlUXeKUo/5stLIG
         sQ0khsKI5EGXDNm80drwv3izsyyb6nuLPeZP1TycTzp9ppLZgBl74lLjHcqAhpUFJywJ
         6tBGh7+L3GTTjLRR2SryCs6mJo8v0VCsgisNKvH65DzQTJBz1k57jXBf/TMmLUjFRaWv
         PvRQ==
X-Forwarded-Encrypted: i=1; AKwUvBzB/MJwjA1ZB6/NSeE0bevgNlo0BSxJwnu0YZFKHO3d70o8S9061P9fTjkZgo+fRN9bZiHgW1AxIjz9PR5AXQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK/vT/5XTx6XciNJ/ATNi8vJ4hq+GgyyoRhrQMpE6iiwUOyq3Rs
	9zMGCR+TY5IfxS4W9xFy195bEYz4BAusoLST+ieNdVmuAmcdEfW20VjU
X-Gm-Gg: AYBFou1Jm528boXYzGMzJdfgmmfcZrY0aXtkkY0NtjYhztZ3p08ZtplUDtOaqB7eyGw
	2Am9PnWzIiEZs/8bUg1eZhEccffBaTqAwqBckEN5gwwunu5SzW24o13LgoPWL1SAulAeSYvkzy7
	nc6HNg4MVJMe5SIRCot6oYFUT75yGaSWdznxvgFLnnI6zjypZSI6V+zHHL3WDUn0HIvUVYQKaKS
	lIXHATdKRfuUi1ZfSxF/NZjya0Ncj8PN7GemK3VofFU1BjwO0w6xXOd/TwKJdBBkf1/hpRNZu0W
	LCVNZeV5g/z+EPereGNNH80esaBQbt4TLM3AWFQ4cF4LbgJYbuq/IrcXrWEQsHPzectwyg5H2Lo
	p+PRiVNOaYXRHmbbXLuB2c1eaJ+czuG44UXO1erZ/jd7MpydnOtT5InR7zfIRk9YEhcAYC/EDaD
	wLENqQGPjuIGgLIaBuazrhmrSD3/rRgt069JkwQ6cgNmQa6vj4LyL/GY7hjfcHBLA9f3s=
X-Received: by 2002:a05:6214:21a6:b0:914:53c0:1a4b with SMTP id 6a1803df08f44-91b557c2adcmr107067156d6.43.1791678403571;
        Sat, 10 Oct 2026 17:26:43 -0700 (PDT)
Received: from omarchy ([2601:804:8780:3df1:6ff:277e:31c7:ac13])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550dfb6csm57407466d6.45.2026.10.10.17.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 17:26:43 -0700 (PDT)
From: zoan37 <agentzoan@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: PCI: mediatek-gen3: MT8189 never wakes from s2idle with ASPM L1.2 enabled
Date: Sat, 10 Oct 2026 20:26:31 -0400
Message-ID: <20261011002631.1105346-1-agentzoan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_172645_299044_24071BC1 
X-CRM114-Status: GOOD (  13.20  )
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

Hi Ryder, Jianjun,

I'm running mainline on an MT8189 Chromebook (Lenovo IdeaPad Slim 3
Chromebook, board "quigon" in the skywalker family, with an MT7922
Wi-Fi card, 14c3:0616, on the PCIe port). When ASPM L1.2 is enabled on
that link, s2idle hangs every time. My question: on MT8189, does
L1.2 across SPM sleep need anything beyond what pcie-mediatek-gen3
does now?

Setup

- next-20261008, plus the posted Genio 520/720-EVK series (which adds
  mt8189.dtsi, from Louis-Alexis Eyraud), plus the board DT. The PCIe
  node is the one in that mt8189.dtsi ("mediatek,mt8189-pcie",
  "mediatek,mt8192-pcie"). It is the same as ChromeOS's node except
  for the clock list. Pins: GPIO48 WAKEN, GPIO49 PERSTN, GPIO50
  CLKREQN. The board overrides the T-PHY to generic-tphy-v2, as
  ChromeOS has it; v3 froze the SoC at link-up.
- System sleep: the firmware has no PSCI SYSTEM_SUSPEND. As in
  ChromeOS's DT, s2idle uses an idle state with PSCI CPU_SUSPEND
  0x020180ff (min-residency 0xffffffff). When the last CPU enters it,
  TF-A and the SPM put the SoC to sleep.
- mtk_pcie_suspend_noirq() returns early when
  pm_suspend_default_s2idle(), as in ChromeOS's driver. The bridge
  stays in D0 with its power and clocks on, and the link is left to
  ASPM.
- From ChromeOS's mtk_pcie_startup_port() I added
  PCIE_LOW_POWER_CTRL_REG (0x194) BIT(8), which force-disables L0s,
  and PCIE_AXI_IF_CTRL_REG (0x1a8) BIT(12), the AXI0 slave error mask.
  PCIE_DISABLE_DVFSRC_VLT_REQ is set, as upstream already does.

Symptom

With pcie_aspm.policy=powersupersave, both ends get L1.1 and L1.2
(ASPM and PCI-PM) enabled:

  00:00.0 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
                     T_CommonMode=3us LTR1.2_Threshold=61440ns
  00:00.0 L1SubCtl2: T_PwrOn=52us
  01:00.0 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
  Link: 5GT/s x1, CommClk+, ClockPM- on both ends

After that, every s2idle entry hangs:

- All devices suspend. With console_suspend=N and pm_debug_messages,
  the last line on the AP UART is "PM: suspend-to-idle".
- The EC sees the AP go S0->S3, and S3->S0 never comes.
- The RTC wake alarm doesn't bring it back. Only a hard reset (EC
  reset through the GSC) recovers the machine.

What works

- L1.1 only, with link/l1_2_aspm and link/l1_2_pcipm cleared: 10/10
  s2idle cycles, RTC wake, Wi-Fi back after each one.
- L1.2 while awake: 200 MB over Wi-Fi with no AER errors and no ping
  loss. At idle it saves another 25-50 mW over L1.1.
- Workaround: clear l1_2_aspm and l1_2_pcipm just before suspend and
  set them again after resume (a systemd sleep hook). 10/10 cycles.
- Adding the L0s and AXI bits above made no difference to the hang.

ChromeOS builds its MediaTek kernels with
CONFIG_PCIEASPM_POWER_SUPERSAVE=y, and the comment in its
mtk_pcie_suspend_noirq() says "It's recommended to enable L1ss
support, so the link can be changed to L1.2 state during suspend."
So L1.2 in SPM sleep seems to be meant to work on this SoC. I haven't
checked the L1SS state under ChromeOS's own kernel on this machine.
Since the AP gets as far as signalling S3, my guess is that something
outside the MAC registers is missing.

Questions

1. Does MT8189 need anything else for L1.2 across SPM sleep? For
   example:
   a) The 26 MHz reference clock and CLKREQ# in L1.2. For MT8196,
      the mainline PCIe sphy keeps pextp_ckm on in L1SS_L1S1
      (RG_XTP_CKM_EN_L1S1). ChromeOS's MT8196 pre_init forces
      pcie_26m_req and bypasses its ack (PEXTPCFG
      PEXTP_REQ_CTRL_0_REG) and switches PEXTP_CLOCK_CON off the
      low-power clock. Is there an MT8189 equivalent? The T-PHY
      driver has no L1SS handling.
   b) A resource request or constraint for the SPM/TF-A, telling it
      that PCIe is in use so that a clock or bus resource stays
      available during sleep.
   c) PCIE_RESOURCE_CTRL_REG SYS_CLK_RDY_TIME. MT8196 sets it to
      10 us; MT8189 leaves it at the reset value.
2. Is anything in the setup above wrong for MT8189? For instance,
   nothing on this DT platform programs the endpoint's LTR Max
   Snoop/No-Snoop Latency (both are 0).

I can test patches, read registers before and after a sleep attempt,
or try other settings. I have the AP and EC consoles and can reset the
machine remotely. The board files and patches are at
https://github.com/zoan37/lenovo-slim3-chromebook-omarchy

The debugging was done with help from an AI assistant (Claude).

Thanks,
zoan37

