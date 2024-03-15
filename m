Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93429C54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0MYemMVXfcwym4dqzvAuTYbxf7jh51PQWqcbKiVUnPw=; b=pG5m4D2NaGMYDlvEkTMcCpkCcy
	ZDma1fdLqwQEUBeKon8cvW+OCJkq8kGphMlY5VEBI0FzOcW1Coecz1GRVvW5+OxnWPT7m/PtOS4tA
	yqEfLJEuE4kjhK2ZU7/l6IjPFyTgzBfU5kKZEl4NCeoBEied5rACtjYL5AqoEMV4X7eaVPWqG60vM
	SctZpZPpliU4qU8pxfw/5zO2GNGG9y3aD5Etk//P1cUNHH/BIQ+NvMC0EamjJ19iirq1oltymkFSI
	YCpgCDeySXjx6BjDY8MmjO9FI1GjD0R73Jd4+vz3/OoL2x6hcikEgUOIM7u92hhHeDAhpWkPoETkp
	fS8h4qtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5Y9-0000000HaNR-0oWe;
	Fri, 15 Mar 2024 11:16:33 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5Y6-0000000HaLF-0vPY
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 11:16:31 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5d8b276979aso1392488a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710501387; x=1711106187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0MYemMVXfcwym4dqzvAuTYbxf7jh51PQWqcbKiVUnPw=;
        b=NQ2ojF2wv4RWAn5Gks4KdQHYK8EUGN/DLs8pViQLZclIYMQ56xWBTSs2r+u4a2uJw8
         mwL7WMRG0/94Z4aWyAEs4HsJBeCY/EdIsm71VkDV4oqo+HF9y+Q75wLn9e6YBGNZPvlJ
         s4nRc1reRZADOEjClx9Pu5/CNwPWLq3rQzf2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710501387; x=1711106187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MYemMVXfcwym4dqzvAuTYbxf7jh51PQWqcbKiVUnPw=;
        b=t0pFCcPbbWBDTJDMARymE3bnyIo6b8TfpQyEnGTx1w8ah49LJHFBzkuEReeMB86LxW
         heyXpWF+f9kISqD0kXJ3+wZTFKv4POENajKCX+8rxaIujz464VuDFRSWMJI946bydUba
         QDVJOUlR9B9BYfA+DqQD696xCT2A2ULZXXpt2sqaROAO4zEu3318GI2I3RVUmlV7GuYL
         O6pHd1tNwhHj7NYDnTU6KUQpmumBtwVwuDJqZfuvUzDidSSto3QIBXTa/UaUEPdjd8ar
         F5ZrgOiICnbWNH8t/3aQI8QS7pzt03ZOCJDo3qNuXy0Z5mjd/TdM6ePKpT+3YbUeQ+ME
         Ho8g==
X-Forwarded-Encrypted: i=1; AJvYcCWA48d+HFc1CYPlh6zB74wMrdBkXu4LHT5MYNCOSzlwhUtA2oGxTDI0IlEfbj72m8m4N8BeolnDOVsfnPvgt6h9OQm9aCJu4V0xDn0XlrGxNyZP
X-Gm-Message-State: AOJu0YwP0i+wcXqzdSoR/3/fqPCHQHaNkSaJFGv4ZD+FMzo69u4/i49F
	YxGkAXLm0Dw90cQzSVb8yvR+lgEzk2MK2/lg784RDiOlT3TX5DkfwkH6Pm+FGw==
X-Google-Smtp-Source: AGHT+IHkV6rWNk9VP1u+5Gar92wJ+6cA36TJ/sdDtyUb7G3JlBmUL/yk8qKG8iSNBDStFe511ywLaA==
X-Received: by 2002:a05:6a20:d387:b0:1a3:4a1d:10a3 with SMTP id iq7-20020a056a20d38700b001a34a1d10a3mr2847412pzb.35.1710501387166;
        Fri, 15 Mar 2024 04:16:27 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:2f9c:c00a:bf1f:e53c])
        by smtp.gmail.com with ESMTPSA id c11-20020a62e80b000000b006e6aee6807dsm3122683pfi.22.2024.03.15.04.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:16:26 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 0/4] Update Vgpu minimum voltage for MT8183, MT8186, MT8192, MT8195
Date: Fri, 15 Mar 2024 19:16:01 +0800
Message-ID: <20240315111621.2263159-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_041630_529845_47649F23 
X-CRM114-Status: GOOD (  10.10  )
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

Use the minimum voltage listed on the Vgpu regulator datasheets instead
of the minimum value on GPU OPP table. This is because the requested
voltage could be lower when the MTK Smart Voltage Scaling (SVS) driver
is enabled.

Also update the incorrect MT6315 regulator usages on MT8192 and MT8195.

Changes in v2:
- Update Vgpu min voltage for MT8183, MT8186, MT8195
- Fix other usages of MT6315 buck1/buck3

Pin-yen Lin (4):
  arm64: dts: mediatek: mt8192-asurada: Update min voltage constraint
    for MT6315
  arm64: dts: mediatek: mt8195-cherry: Update min voltage constraint for
    MT6315
  arm64: dts: mediatek: mt8183-kukui: Use default min voltage for MT6358
  arm64: dts: mediatek: mt8186-corsola: Update min voltage constraint
    for Vgpu

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi   | 1 -
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 6 +++---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi  | 4 ++--
 4 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.44.0.291.gc1ea87d7ee-goog


