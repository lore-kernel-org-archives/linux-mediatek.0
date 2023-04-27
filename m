Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD31C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 03:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qyCuMNKBtQeGA2gyVABto0ConQLwqnJ6FAuzCLNNnoo=; b=dQyhQ+kx9vCGVn
	jTwkYJ/KEAaZDIjlQPyihORKN/sAiWkJYYwF6goVJt1QCEGP9UIC96Do0h69g0CVDYR04sYlwtpLb
	ePkF7I5wQYIcfRYPmgYBZ+XQLCcrBDu5sffg0N9uuavQYWuCweiGk4/8/hQS3YpmzhHV6xdUaPWI9
	tf/oZABDOAFL0rtocoXjc/SFUydIhFmxJnSXN8Ee398ZGsL4IA2GEEyKFiRksTkkeEJdchMAWWw15
	G/EgoXifWJC8TKD7H2uoCi5zclvlDJujVJnilw71oTetggEmdLF+naQAEaXK/rVmP6vfukSOPyafj
	3qX12r8xO7fCRJjW3oRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prsl1-005O86-3B;
	Thu, 27 Apr 2023 03:57:23 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prskz-005O7U-1n
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Apr 2023 03:57:23 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-24b89b9a72cso3922447a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 20:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682567839; x=1685159839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qyCuMNKBtQeGA2gyVABto0ConQLwqnJ6FAuzCLNNnoo=;
        b=XPmo68CuIhhAAWRf+FBNumslgXuHd59asHCw8Hw/Wq47BEyMLMLgmyuuyI2EGsCBh5
         xnVTMAzNjy0dL2RGxv0len2THJ81brBgBlc2WZH8zR6Btv46u8c8RnldHC1M8cP/n7It
         2kwD6AqSgTqkQG1LscmH/muTMzoyh/p7KU/+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682567839; x=1685159839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qyCuMNKBtQeGA2gyVABto0ConQLwqnJ6FAuzCLNNnoo=;
        b=l0uWSxEP+pSyzSyGsQ6R3PR8AXukZvxQYgu4DaAMPOH4N3W3l3eqNfj9ZOcyosoHWL
         Ut1PzPPaRb3Ue7svcQdgd43hUgjpc3aNIepho6/+9ZxEDSPVgC8x0LopkzH6NRdtU/FV
         veZdyfoqVAE3O9wOaT9cJz6zPbdGezbk/jGapQcnKxvjVzZDjTHPCJW9ceJtPFMIrdJI
         HTHTXhXNB8TYWlh+PuYoQ4NYD1XMWeb0fRn7M8qDXKGQnqYWFfDXHNOKjFC9fToNPD/w
         CixWuc3YDO3ASHgSsBtekEZt0sKjPVXqqzigkS6AGo7dd3Rr7h9+re8fwrNTsxwna84F
         g85Q==
X-Gm-Message-State: AC+VfDyjGJofSx8plHlx1yTo1eXAXrLHFGP44VnnLyA8dmQtFTYZKnz7
	3lwfLInPlcPSzq90TK1xy5eDIQ==
X-Google-Smtp-Source: ACHHUZ4cTM0qcZus6xYcro7JvNMdYpjfgWbsmj/pL9SiS8eN7atWWr38IqCZ1ohC5+ViTtremXq2mw==
X-Received: by 2002:a17:90b:38c4:b0:23d:a2a:3ae4 with SMTP id nn4-20020a17090b38c400b0023d0a2a3ae4mr405236pjb.44.1682567839599;
        Wed, 26 Apr 2023 20:57:19 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090ae00100b002471f9a010dsm12214092pjy.21.2023.04.26.20.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 20:57:19 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/2] Fix Goodix touchscreen power leakage for MT8186 boards
Date: Thu, 27 Apr 2023 11:56:54 +0800
Message-ID: <20230427035656.1962698-1-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_205721_634935_7D8D631E 
X-CRM114-Status: GOOD (  13.48  )
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

Changes in v4:
- Minor coding style improvement

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


