Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F7CC33CA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D564D20673
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:37:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tmoo1RPK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KjSa4cmc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D564D20673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h3OYgqEJrBUiMpTKoJ6IG8BQshfg5DxA4ywIE3V7148=; b=Tmoo1RPKaqYSrz
	rPi0X08UV5i3+mK4y+uMb5LhAmWBrYXRj5PY1RaHDG2FT60aOK300NpRKKHvYV58gxQpn/FImw0ZT
	WgYe16fOy2o8TjadMYhpCvlubJ4fc49Gqa/NSNVUdgvaYPanVhfDJHZWwwfShY4vqc7XZx/Q4KKpz
	+hF2sFpO8EpXpAyXtl3+Cc/1f6TITmVVxJaZMpFMzVZvNGclFMZe+gxpA6nafbkJAz4Ptmk118nQX
	rJ6XzFZbV3mWVQAUgjZVzFxUiFm7nrtQUeflU2O21RBWQGZgJ4PSHYQePB7Xog7YK6TLbil2R4cVK
	XIpCRnT03x8zqW2wxWgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iporV-0006WC-TA; Fri, 10 Jan 2020 07:37:41 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iporS-0006VD-MU
 for linux-mediatek@lists.infradead.org; Fri, 10 Jan 2020 07:37:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id f20so527077plj.5
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Jan 2020 23:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SvaOTqe9vv2vgBX/0s0tlxD/m/5uJBFVxQC6/f12J1w=;
 b=KjSa4cmcgVBqcSfdfv8n61/028FjDGN6C1grjJKBT0FgzX9Z2+DacVwxR8bjn4zRx+
 aAZodAJZNLZv0D4Ysy5Buay9JdlGluTI/2xRKLasjw3WCBfwmpV8ZBAI6HNqiV5jpGBn
 RsThcEfoNkOlPgLLcQrb3HyeiULZUdvQCNKO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SvaOTqe9vv2vgBX/0s0tlxD/m/5uJBFVxQC6/f12J1w=;
 b=VD2FDFMreRgdy981fm8pKAI0P0TbMnPg0k9Z5Y+0TwgadAXoU/UZgGOKub/xP5ltjR
 ejzTecXQJel589fvc7D2U7bzY68xdQS21Pwcx3EuyPec6An+K7MzEJ3YL94m6/yHqxH/
 FSXoNfPsQZ2ldHtxYSZsGoqIYGvn66mj+/cvlLCbFyzGwjh8gptDzMHJ7+GRcK+wVuhp
 YfQ5kiPxdJq6ryUpfvIfHnJOmUeS+QLMLqL3k/ob3Gy+f4lyqJqblgUxli+1emGWpVQP
 bL6zguN9QY9d40OtDtR6KuhKzC2E5eE8REO2XcKANPED5uiAkdoaK6Z4aFzaI5e+yiPW
 lCSQ==
X-Gm-Message-State: APjAAAVKomJ6y1BY2FsaYm/svM0RY47ggjJhJ0rLHQRdz+wiOGdgSCq2
 83OcLGOaHu7I9tpbaWNABBpMLQ==
X-Google-Smtp-Source: APXvYqxytG7Z9y6Z61d5GQU9Hnb21hBVtECYCvXx3qYivuDVxrF71+ICMHxhkVi4/n0R+pxRlfjnuw==
X-Received: by 2002:a17:902:34d:: with SMTP id
 71mr2644975pld.140.1578641857781; 
 Thu, 09 Jan 2020 23:37:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id p28sm1373919pgb.93.2020.01.09.23.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 23:37:37 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] Add mt8173 elm and hana board
Date: Fri, 10 Jan 2020 15:37:28 +0800
Message-Id: <20200110073730.213789-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_233738_759630_A8D6AAF0 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds devicetree and binding document for Acer Chromebook R13 (elm)
and Lenovo Chromebook (hana), which are using mt8173 as SoC.

Changes in v2:
- fix mediatek.yaml
- fixup some nodes and remove unused nodes in dts

Hsin-Yi Wang (2):
  dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
  arm64: dts: mediatek: add mt8173 elm and hana board

 .../devicetree/bindings/arm/mediatek.yaml     |   27 +
 arch/arm64/boot/dts/mediatek/Makefile         |    3 +
 .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   27 +
 .../boot/dts/mediatek/mt8173-elm-hana.dts     |   16 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   60 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   15 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1040 +++++++++++++++++
 7 files changed, 1188 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

-- 
2.25.0.rc1.283.g88dfdc4193-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
