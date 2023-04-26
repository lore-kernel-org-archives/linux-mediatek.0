Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB4DC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 14:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RMNClM9ik+szOvJOLzfRpbcMxADOReFPHjEqSl9MgW0=; b=CRm5dxZ2u4w9SJ
	lTbIMUHTc4a5x2VOrgVSynyxLYMcIcqVJf/j49gr587zsHhRr8nWvvqEOpGp/iZ6IrYoW0CFhTp7r
	qNzE3rzkYJNOZjwwdhEG4OJLjQiO8u2i/sAebwsWi1CfromOr/vRgCpT60ke1qINt3djf5KEndMna
	A9HWCWQF3aGHilZZOdaDpXz+j4GQ1mJIVBaIeURov9TnaW2jrzQNn7hxh29+slYVFKyJzxTX7ZgLK
	rVlhAggRKzyYA1mHtqmGFFyM4l2wlqOgrM607g++9sKFd7hxBDJWs5WUD2sNMCwykJyLw4YAP91zB
	4DgTkq2ZJwxz2pcNyYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prgNo-004EXn-2V;
	Wed, 26 Apr 2023 14:44:36 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prgNm-004EX0-0S
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 14:44:35 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b73203e0aso43668708b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682520271; x=1685112271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMNClM9ik+szOvJOLzfRpbcMxADOReFPHjEqSl9MgW0=;
        b=T1qwsRZgAaz7PgyfGME8hLTr+BlhLPS7hZWDSk7H9HG+U/in5nh4UEAeuL4awFu7Kh
         vvYQ74hjznhzvQQZ6ipUybRF6I83VVUuO8PQrWmuojfajIXZcwe72Vn8Bp6qakLrEUeT
         MSl0I6qTjgjLGXWar+a/gXZSDsWsiIMMymcxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682520271; x=1685112271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMNClM9ik+szOvJOLzfRpbcMxADOReFPHjEqSl9MgW0=;
        b=e4sA4yCHSrtR54zlff+HBZhHxhx+jT9egAnWpkgNuKCYJVkxsSY7Gy9oxLJft8vSuR
         9iMi8aJFPD+rCAcyNgKjEItwujbLlfy50dLJmqjHfEvZXFc3Az4tr5QtNqQ2CjgfUSKj
         1ZuY5GyWLCy7sbYY+zq8I2+g1mwjx4x2IXL5ipomIGvgvVZHZbypsJpM6jlcwaXv46Ad
         TMm5h5poYTTyNO6WvZBsS5EMpXJKHUXHYSMFDBHmGW23N21Q4bATCxIY7k8n1KwTp7Cw
         kIR94uTG04sqIw0G6cX3Iw8UoVYGZZaktyDgBFA6HYlvhAmKWrFImHDGx0HYYhl1ymyd
         U+zQ==
X-Gm-Message-State: AC+VfDxxYB5VOY1BkuyOWgqJqnKMzHCxn773AqQWp+0BmsrIWUBjxBfW
	UY/d2rvKnn1lg+a9B0SGZVotzg==
X-Google-Smtp-Source: ACHHUZ4VGDqLe4ucoBanVPHSiLZqrXQslXJ89MS3u5x7RjaMFE2ziXuibgHtnrtIF88PtTG4jGJEVA==
X-Received: by 2002:a05:6a21:9993:b0:ee:bcf3:be0c with SMTP id ve19-20020a056a21999300b000eebcf3be0cmr3657144pzb.0.1682520271275;
        Wed, 26 Apr 2023 07:44:31 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id f17-20020a631011000000b00502f20aa4desm8750495pgl.70.2023.04.26.07.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 07:44:30 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
Date: Wed, 26 Apr 2023 22:44:20 +0800
Message-ID: <20230426144423.2820826-1-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_074434_195914_50C121DA 
X-CRM114-Status: GOOD (  13.79  )
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

Changes in v3:
- In power-down, only skip the GPIO but not the regulator calls if the
  flag is set

Changes in v2:
- Use a more accurate property name and with "goodix," prefix.
- Do not change the regulator_enable logic during power-up.

Fei Shao (2):
  dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend"
    property
  HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend"
    property

 .../bindings/input/goodix,gt7375p.yaml           |  9 +++++++++
 drivers/hid/i2c-hid/i2c-hid-of-goodix.c          | 16 +++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.40.1.495.gc816e09b53d-goog


