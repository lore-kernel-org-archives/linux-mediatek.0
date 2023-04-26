Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D90C7EE21
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 09:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tiC1EixoNe9TvcsXGi4HMFFCigO3LAC2XK4QXXLhOuY=; b=R0Sf0js+fQwVX7
	GWbVBdArgkJOCdmsOfQcNUzpqLL2my4DYM8q/YZE48gYKBqmKY64S3C2xGJV2O7SH4znrIf9CpgDq
	XfsY6IEjLNVedvRUqM/jKSPL84qmbd6+UTuRObCO5SOIyIj/rz/N2CVk7+WZk/lL84AFTBK4L8i0N
	6Bn47+KPhrX+nwrfz84v/uCvFWUgSdTpCCFCfUkYYpMgGbOeI51TEjjKBVeE6d3fzqwzssK2qvA04
	H4Bx6X4newMI4ozaTytV4KATQPZD0rG7lL+9yfvCXTzlinwJAS4Fm/wDS8uUo3Gh5PjY3If8UVnti
	2ZYRq1UynbZagKeoqv5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prbWt-003K4n-2n;
	Wed, 26 Apr 2023 09:33:39 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prbWr-003K2w-0Q
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 09:33:38 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-63b5fca48bcso5686360b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682501615; x=1685093615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tiC1EixoNe9TvcsXGi4HMFFCigO3LAC2XK4QXXLhOuY=;
        b=N/4d2/dnYSkhGgmo1yEJ21nMJwso80TVv1R2jKDFELl94n03lMwt6NogcEwg1IsE6c
         kSjyQUDyCFg3pECB7tQBBB3Q1iX4k7l08KYKz/UoU9ccAOok4Svwduyt0D01gNr1L2Ma
         LvwNagl9VKFmb+/D6nQBPH3LJbb40OXlhjzlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682501615; x=1685093615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tiC1EixoNe9TvcsXGi4HMFFCigO3LAC2XK4QXXLhOuY=;
        b=AxmtGc7+6EDUQRrvAD1xcoUFU/z1wZYkv8XfAGk0HVq2iYvkhUeo5EirgkV8iY6eft
         yGKkuAyI2MArDaLl80StDmpBuUKVMTfmZY5kq3kyUMbdijTnXrAo7xHlGyWelgPUbyrr
         NbLetGSbx6Cd8TYgRtiezpmVrkdv/pfpA9CuUyxo23wJpiEHDSTX0NOpVaYgC04VlLlK
         NPU449ztCxPo6a73YuydJcuBoK8MlTLqKpZbBGwZPtuMsBmzIB+W+Ks+M2ekVpmeRsRP
         v1UM0dSyWIRw9wse5IBETqoKIopbPcc/EwdF5oidx1kJoM5XiZ2evtvcqqnuSVwXEtJm
         /LYA==
X-Gm-Message-State: AAQBX9dSUHSygVIOMbonTMdI5i2xF371QuhGae0Ze2E9m3G8C/hCKnk5
	DUQJy6bMM4rHJyT/oueV52DexA==
X-Google-Smtp-Source: AKy350aRbFyZHOGKWRhhNxNRmhRppBdI6Qj5Hf5cU5Xv1kPX2Am2QNrW4+QfzRy/3gQG4MmiMaD/Rg==
X-Received: by 2002:a05:6a00:10cc:b0:63a:cefa:9d44 with SMTP id d12-20020a056a0010cc00b0063acefa9d44mr23043975pfu.14.1682501615312;
        Wed, 26 Apr 2023 02:33:35 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a00078100b005810c4286d6sm10730075pfu.0.2023.04.26.02.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 02:33:34 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
Date: Wed, 26 Apr 2023 17:32:28 +0800
Message-ID: <20230426093231.1466984-1-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_023337_195288_32413A0E 
X-CRM114-Status: GOOD (  12.18  )
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

Changes in v2:
- Use a more accurate property name and with "goodix," prefix.
- Do not change the regulator_enable logic during power-up.

Fei Shao (2):
  dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
    property
  HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend"
    property

 .../bindings/input/goodix,gt7375p.yaml        |  9 +++++++
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c       | 26 +++++++++++++++++++
 2 files changed, 35 insertions(+)

-- 
2.40.1.495.gc816e09b53d-goog


