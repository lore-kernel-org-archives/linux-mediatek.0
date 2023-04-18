Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DA4C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 12:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UvYQl2dSNs2drI6x+tVSTFEOpl8Z5ePoGgWVyp9WoW4=; b=KIEAQwAMshmpdV
	kC5yHPb1UG1NzQdcYQmTVLb6KEBHpV308wEdncCRsr6YcI+BnWV9oYEErLqWQ3eQg9d6onKfyZn2z
	n2qtko1vvUvW0kS0Tou3el/8wwWXnHb9FtPAKaMMWts9yffY0m58/2Vv2NnYCCzotQbNR4j9WeAX6
	LO+xpyFeL+PN2xExU1dIjeIZKK4EvNGt425tKueE2ei1t9Cq6X4ixnjU28ZhXw0xTvX1xewIotGYZ
	LDDsfQbApQ+kKQeIacu5xmbbH4gQJNHJrVDhfIRAS+791cquAoexnD9E/VTXU56CwrzJN++6pRdHw
	Jo1VnQQCduTKNbEEnGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poknK-002BLF-1O;
	Tue, 18 Apr 2023 12:50:50 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poknG-002BK4-2L
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Apr 2023 12:50:48 +0000
Received: by mail-pj1-x102e.google.com with SMTP id hg12so13131965pjb.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681822244; x=1684414244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UvYQl2dSNs2drI6x+tVSTFEOpl8Z5ePoGgWVyp9WoW4=;
        b=lO293BhjwNYLclYsjSpzyyLDt218sTOzbWEbdzTmjP4dBWHVcxa87ECW84PUQ2/B5B
         jBQjO399/tOmeIpg/xIuV/QbyYVsIOx3a6SoDkdh4AOW0IJNhE+whTdu8n7gx4krMy9w
         zTyAltktrrl8zLKmZZq+3s+/gQGCDL/kNppiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681822244; x=1684414244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvYQl2dSNs2drI6x+tVSTFEOpl8Z5ePoGgWVyp9WoW4=;
        b=IypeKT/LLLe1kcyJAVY6CgqJlS5c2+5ddAKB87kZCD/31YCcnB9oJFxfdP+05Qlp0g
         DzYU2A70kwd0WNr0VtE9mHdWm3siZdUdIRf/Kc7YLCYBBLPYZDnTnt8X/UU8iSlgqIH+
         nqlLv3n8bFjItae3p3LxCM8M6BwmmsLfoHl73hETum235urRR+sjy2u4PkPEx94QX2o5
         9JI21gBkWpbsFWBo/ocFWmzacGgJLH7r3FxLDzCxCclKoUEfhSjA1O4HB3caWtgudVU7
         ausFBoLAcaEMlOTX6nQaE8p8MxIaxXYbKymdM34rPPi2h/T9KDgo/nCYEPw5fwNeXeOo
         pYzQ==
X-Gm-Message-State: AAQBX9eg8fxrfH63GYHK9GjkNXBxmyOC3LBeTkF26ucm5x8zrhs9TSVY
	TTzLkXKeduQ6gfpZowpukvGbBQ==
X-Google-Smtp-Source: AKy350Ztbx6m0tcVjG7FcO5xLpjLe3Ig3KnXB+nMZHFdI7Sk9FxbAaBQP2g0+zKuvD4RGnngbX4HBg==
X-Received: by 2002:a05:6a21:32a2:b0:ee:3e4f:eecd with SMTP id yt34-20020a056a2132a200b000ee3e4feecdmr17968088pzb.38.1681822244288;
        Tue, 18 Apr 2023 05:50:44 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:2fb7:301d:6083:752b])
        by smtp.gmail.com with ESMTPSA id v11-20020a62a50b000000b0063afb08afeesm9323733pfm.67.2023.04.18.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:50:43 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
Date: Tue, 18 Apr 2023 20:49:50 +0800
Message-ID: <20230418124953.3170028-1-fshao@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_055046_784397_935319EA 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stephen Kitt <steve@sk2.org>, Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

These changes are based on the series in [1], which modified the
i2c-hid-of-goodix driver and removed the workaround for a power leakage
issue, so the issue revisits on Mediatek MT8186 boards (Steelix).

The root cause is that the touchscreen can be powered in different ways
depending on the hardware designs, and it's not as easy to come up with
a solution that is both simple and elegant for all the known designs.

To address the issue, I ended up adding a new boolean property for the
driver so that we can control the power up/down sequence depending on
that.

Adding a new property might not be the cleanest approach for this, but
at least the intention would be easy enough to understand, and it
introduces relatively small change to the code and fully preserves the
original control flow.
I hope this is something acceptable, and I'm open to any better
approaches.

[1] https://lore.kernel.org/all/20230207024816.525938-1-dianders@chromium.org/


Fei Shao (2):
  dt-bindings: input: goodix: Add powered-in-suspend property
  HID: i2c-hid: goodix: Add support for powered-in-suspend property

 .../bindings/input/goodix,gt7375p.yaml        |  6 +++
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 46 ++++++++++++++++---
 2 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.40.0.634.g4ca3ef3211-goog


