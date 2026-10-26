Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7902606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NQd9MTVO;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b6dDOc7k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=; b=NQd9MTVOf7vjH2NXl6I7xpozcy
	5gbzCpgg2d0b3S7ZWnYri6gZEa1z04YLN9Hb8mnwIuc2pvPCAi52biCtoHKNeOwu8/UmfFa3DN6ab
	YZxD8trcqexJr7eDzEuDsh+mx7xg1WJwBSzpEjewZirqt1scxjWt8q+kFGkw1NaRt+shOeHLZoXh1
	HtAj3/gsj1nEBZ1aC8DGMV9ahbY3P6HvJrZXz14prM/UUOfDMR0QculkdRHND6dSnJ24X+NuKjYYB
	PgAqvSTotS4bs9MX0YhaUctmOQ7g1xqondzlcODYzkQZmD798bpLsRG+kqKZLzABePEkgQB15qa/A
	XfexetLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSn-000000029lq-1gMi;
	Mon, 26 Oct 2026 09:57:57 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSk-000000029ax-0AJg
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:55 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8a06c60065fso2054049b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008673; x=1793613473; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=;
        b=b6dDOc7kREcWdcvpJY0R97fFY+QbQ0MEdXHHsygiZLTfG0PDykWe/YMXrC5ELAo5GD
         jc7gbdjzNmcKFFNuooNGnRfRg8YJuRHYuD7rsFtk6emi7Qd/uM+RwiRc3eBbHS9PS3Ik
         5vIco/MQHq1n1GCyiZPp7RkBhEJk0XJV3Jy33PAoffbz/QM6tX8dF4CoFbPSg69x3s5N
         J/oo4H58e4rER8xgN75RAPFXZjUIdqOLRs8h5Sf4RpdaAZgZkoJ+AX2Jqyt+aW/XNxeW
         vaVCQbAvIFMJllypIsLNRtP+aS1/XxiZNIc3YgAaxIVfB2rYzhCM76EEgZ+c245M35U7
         KM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008673; x=1793613473;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TRb4tYcOuZPVhYjPWbt4D3gJvCANnKN9gzX1O8Pld2Y=;
        b=hZ8HkL5w6Rlx5SOfPLmti0HDEd8h0T4nOB7o5PGvtddq3mivgZR7tRCJeI0fyqAM5c
         C7t1FcUUmXwfVfRMad0g9bUr1bB2uiZWv6kHFR2r5tzEUzIECqmFMADHtBmGWsoi6oRA
         WhfWwHxmUPNG/fQd5+ElNt6F0EhrKLCX5K8tTNisF3F2mAMa65DScTA+EgNisTmFqcU2
         377fU/S81IOHu2JRZHMe99v2BwQNJaYCcwLMDYIdHds7NHohG3/QO2Lf8h+F42o2N3e4
         HShgZF0mC3IwRVJRK7qjYDGB8bc+An868mUxENUk9E6LDOO/HBS29m18yhoknOfKsfGY
         Qq0Q==
X-Forwarded-Encrypted: i=1; AKwUvBylP+6HyY+rPulu0usPdv5M1n7m9ZtwVsdxC4DTi/GRgiBnHFvXB9KqD/+stdE3qauYt7Q1a3XmifAlPnDhsw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLUSbmAYMEpqeCcv2apYj2N8j/1O/AUUOOqw5nsPG9WRt+7MEzY
	OW5SLams3SeKlbAo7WHq+QYdVXN2LD85RVDn/3E9q3iz9fmSC7GEoOX2oA7t8NdP
X-Gm-Gg: AYBFou2KGYgwMwh7BDL2SZV49958AJ8mAmI0WS1KDf4wtHHsC6KFlcNXraJX+ZepKUB
	jq12uXbzhLNmClUWX3pb6URkJ0ieViO9So+qjdL7S7ZVfRm5SYHlpMGF9CmBOG+31DlSRXphqqw
	70XlTpRBOc9MTPO8FOC4MGIfwYmhUMJiL05zwihTmHw7Q8+qtCqCCVeA0iUNTqnjBB4d/HgXe8c
	J1XvqnfoRCg9gZR8YcCfJ1yMrisIXMaSQ3OQt9ZMwWd2Tg14e94AHguATtKOXin0hrgxK8gYHjM
	R5I1PJeTrmIAF3zbf6IcIz98Juar03hmnXtUwvmes1K2IhaN+z/9sTwebfLoUR35l6fwSQKu61O
	y/n2h1pHiZlc4bdfbtchxuLyZH/7x//xyK3lBQc4yJamOprlLood2VHDOb8nAKV28E6K7kL5QnB
	j8YqI8NEn8FVRW0FNVkcM5dJG8sWDGCZfrwH7VONX+AhmiKbO17G4XA+x2JPlaFH4tMkOQwqm6w
	nSOxiZ+7S7oljSMnGCRFlSTiB+8AdvZq/cSJyWPKoL0UtTO+/KI5nM5CxOCidxd2B4RMcT8Xm16
	/DMWClf+/c3flIWkbSlIgkOJs0R5US4=
X-Received: by 2002:a05:6300:6bc9:b0:3e2:59b5:a6a3 with SMTP id adf61e73a8af0-3e7a1b97c06mr4376109637.0.1793008672624;
        Mon, 26 Oct 2026 02:57:52 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:52 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v6 0/4] net: ethernet: mtk_wed: misc fixes
Date: Mon, 26 Oct 2026 17:57:27 +0800
Message-Id: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDIzNDA0ML3fLUlLTMCt1EMwNLA1NDUwMTcyMloOKColSgMNigaKW81BKlWIh
 gcWlSVmpyCcgIpdpaAELEUQZvAAAA
X-Change-ID: 20261018-wedfix-a60905150472
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Sashiko <sashiko-bot@kernel.org>, Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=2955;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=549qJPyhyqlBNx06uotz1gnmv+Qgyf4W7lO1nGNCwHk=;
 b=s6R3dKe4amKcP5NVpaUVkILmnGN7AjJuw87IEHxjMsgOZ4RpuDVhDNjo6RwpCw1Nd9be1Olqg
 dFeUk96NAcuCyw/2hqTkfxI7BpUwpPLsEq0U1p4SG/c/MXdoXkslwoX
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025754_129092_AA3047A2 
X-CRM114-Status: GOOD (  12.56  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ths patch series includes some fixes for issues that were discovered
by Sashiko and one original patch fixing issue I encountered.

Patch 1,2,3 fix issues that were found by Sashiko.
Patch 1 was compiled test only.
Patch 2,3,4 were tested on a mt7986.

Patch 1 fixes tx wdma ring reset for WED v3.
Patch 2 fixes the reset condition for rx wdma.
Patch 3 fixes rx ring and tx wdma ring not being freed up
Patch 4 fixes WED on non-DBDC mt7986.

---
Changes in v6:
- Update cover letter to address the platform that the patches were
  tested on.
- Update message of patch 2 to clarify what's the issue.
- Update patch 3 to rely on ring descriptor instead of an extra flag.
- Squashed patch 5 into patch 4.
- Lin to v5: https://lore.kernel.org/all/20261016-wedfix-v5-0-8b02e78fd34f@gmail.com/

Changes in v5:
- Add cover letter.
- Add patch 3 to address Sashiko review on rx ring and tx wdma ring not
  being freed up.
- Add patch 5 to address Sashiko review on error handling.
- Link to review: https://lore.kernel.org/all/179000700034.2160803.10594281691384015089@kernel.org/

Changes in v4:
- Add patch 2 to address Sashiko review on rx wdma reset condition.
- Link to review: https://lore.kernel.org/all/20260730090030.201100-1-pabeni@redhat.com/

Changes in v3:
- Add patch 1 to address Sashiko review on WED v3 tx wdma ring reset.
- Link to review: https://lore.kernel.org/netdev/20260706101044.161059-1-pabeni@redhat.com/

Changes in v2:
- Address issues raisied by Sashiko in patch 4
- Link to review: https://lore.kernel.org/all/20260706101044.161059-1-pabeni@redhat.com/
- Add comment to explain the special case
- Link to v1: https://lore.kernel.org/all/20260630144831.1109-1-hujy652@gmail.com/
---

To: Felix Fietkau <nbd@nbd.name>
To: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Sujuan Chen <sujuan.chen@mediatek.com>
To: Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Zhi-Jun You (4):
      net: ethernet: mtk_wed: skip ring reset in wdma_tx_ring_setup for WED v3
      net: ethernet: mtk_wed: fix reset condition for rx wdma
      net: ethernet: mtk_wed: free up rings during detach
      net: ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986

 drivers/net/ethernet/mediatek/mtk_wed.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)
---
base-commit: 7076f684d5132e6a6145e1da2fa74771ecd052e5
change-id: 20261018-wedfix-a60905150472

Best regards,
--  
Zhi-Jun You <hujy652@gmail.com>


