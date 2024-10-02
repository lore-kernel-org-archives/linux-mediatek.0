Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D296BCF31B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MvXbEXUNdq4h1cZ1tBAnoLDdp5iJf5TUxbfcrMQtOlA=; b=aDltf1/msTMrkm
	TW0tivUI+FbxyeGH6EJmTJn5bu0csEmo3ilXCz0YPv1qvLu1UZ2KZ5IdkcFGtJLWY/d0G6eNwj18N
	VreWuRd94zdTyl+oWUwMsuu89kTnPlPl/koXaWqyx8ZB21OSW0pjXtIrgX9Fyr+Q0DbKLt0fsRgC9
	h1cMKTZ23qgVYDH2DXUTxsmUHes6BS5xQ8mVdqbT8zFpKFF4K+anXhSgplYuD+c/TWxfXhFG24Jkl
	0A7xyCbgXT3xFBB06wvcGaC4brtgVjH02bR7dpZ7C3yueOGo9iDh+UqaFu8mP1OrGzFG77dSNmMKH
	2Rd/jiX6S2FylBuyh0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxrB-00000005ig0-1Rg3;
	Wed, 02 Oct 2024 11:49:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxol-00000005htQ-47gt
	for linux-mediatek@bombadil.infradead.org;
	Wed, 02 Oct 2024 11:46:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MvXbEXUNdq4h1cZ1tBAnoLDdp5iJf5TUxbfcrMQtOlA=; b=a9BzTL0SGpMwXsWQ4KWgoUOo4E
	jXRMFSl0LxErLwszXMmTPPuLpDR9zZWdbFPE+VRu2TlUmQthwPhb+klsuN+gfSHQqjiepcbeZEWIq
	HLnYZzEz8WqKbmThTDSDf7dLFtnleT5HHC9zlbXAsERtZXZzeuvirijJt0La05DhQrvZ58V3SF19e
	fF/oLziVCt4su16fVEbercQn03loWuzJ6j74uYb7MSxrkgrpIS/LvWf8AuP4TpLLdZ59IzU3Zb8bm
	UqcHww1pvzROIc3xUlEH/wgm9SrK3Ej8hDfvIMN3I/wlCADIbhBHSkXfWdk36lgHyMnsD24RZ1jJ6
	4UvnqPmA==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxoi-00000003ThZ-1HNq
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:46:54 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7198cb6bb02so4878955b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869609; x=1728474409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MvXbEXUNdq4h1cZ1tBAnoLDdp5iJf5TUxbfcrMQtOlA=;
        b=jtp3mDoCUt4e3kDu4WaiZw/NAn8ZYmcieyFNZkKBvtzVvjyKCH0quAlEIbSDUi0728
         2CA/cu01cXutE8hS0fLuoLMRdc8BAj1g8l+gBhMu1a1GRArGHi0hUiagxrNR8XzaAEBB
         74DycJ2CZLCQgN6sO1EkoQDCOGSZ1oRWhKlAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869609; x=1728474409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MvXbEXUNdq4h1cZ1tBAnoLDdp5iJf5TUxbfcrMQtOlA=;
        b=v7plDN06RD0d2lkfgx1Ega2010pC/Y+VNmSD5yzF76cm3Xl69p9YAxAp46fCSUWyAv
         mWljK38Qob7vGbW8ccszJ3OZMVaaWGOxPlUmz3cPnCcD/nFLRIehTl7kj17Rkp/y/To7
         xxpMDWUy9Z+rdC8KDNHQ3rWTj9hpUufbUs9BPXJ8va7Dk2uFGvIvEgvJ7pDoYoM5q9q0
         UprKW6yiSSOTC7PCMPxx6bJ5DFlYLIBHKWE24f5EM21DlaPOuAgWhVgZ2nadh8BXWzjA
         BgiOssn7wgQRQrTde5l5juiaZWPo/EElu9lvzM6Jpisdy5huk5ovdwJqlR5KxSZ8beMH
         MBAg==
X-Forwarded-Encrypted: i=1; AJvYcCWAk7XyezBIMsJA5+mLlniqmkXTquiUE/zogJhAkRlxSoNe3pvMQDwswnC/MNOdfn6NpXCKOYIg+0sVcMsZHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOji4XqhEiIHDBGzREk9/MJ8QneBqIu3YQSYewke9ZBFooNqqe
	oYgILSYliZ/W26xbUSZB1X6oA+eXz+UCo+2xBnQq+pmRsyZPIzVGDBTtZ0bF652IhxOPy8DPUKo
	=
X-Google-Smtp-Source: AGHT+IH38Uq7NXWfIYE1q4kGGCRLr5x4PpVHTxwtFl/L4xZTss5jzvTLpCR6rd3v1IX3zgI8HbdufA==
X-Received: by 2002:a05:6a20:43ab:b0:1cf:6c65:5dc with SMTP id adf61e73a8af0-1d5e2d4bb3emr4565200637.49.1727869608746;
        Wed, 02 Oct 2024 04:46:48 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:46:48 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/9] Add platform supports to MediaTek MT8188 SoC (part 2)
Date: Wed,  2 Oct 2024 19:41:40 +0800
Message-ID: <20241002114614.847553-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_124652_505952_B42E29EA 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

This series is based on top of my previous "Add platform supports to
MediaTek MT8188 SoC" v3 series[*].

There's nothing to change or address in that series at the point of
writing, so I decided not to resend it and start this new "part 2"
series instead.
(if I need to update both series next time I might consider merging them
into one)

Specifically, this continues to introduce the following platform supports
in MediaTek MT8188 SoC to lay the groundwork for the board device trees:
- PCIe
- MIPI DSI panel
- video decoder and encoder
- JPEG decoder and encoder
- vdosys0 and vdosys1 display pipelines
- DP-INTF
- eDP and DP TX
- aliases

Please have a look and feedback are welcome, thanks.

[*]: https://lore.kernel.org/all/20240911143429.850071-1-fshao@chromium.org/

Regards,
Fei


Fei Shao (9):
  arm64: dts: mediatek: mt8188: Assign GCE aliases
  arm64: dts: mediatek: mt8188: Add PCIe nodes
  arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
  arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
  arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
  arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
  arm64: dts: mediatek: mt8188: Add display nodes for vdosys1
  arm64: dts: mediatek: mt8188: Add DP-INTF nodes
  arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 641 +++++++++++++++++++++++
 1 file changed, 641 insertions(+)

-- 
2.46.1.824.gd892dcdcdd-goog


