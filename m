Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D31DCFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=suc0Mn31X9HOZBvZqGf7HMOAhhfsmvf/3O/lBe/Yamw=; b=jpSKHZO9ZvvwC4
	2QAyxNhis7mDjX1V07ky/8RcPM7ohCnc80U+FA/GzuZ+mAUSutJDaMBxpSjdlE6D/xLK+0YF+yXcD
	o6jhOwW0ZgIVsV3JXPMVGu1MJ7R9Y3PE3PZ8ODMtMBK6CQzBV2end5OyzfglFdv+Ku6+rquvKEK2E
	wbLxyPRCsLrEICDG4Hm+21QJ8TfIoe2bEYWXdRa010R/GeaAM+fyrnQl7/dv82ypRd8+L1Hq7DCiV
	SE8XLXx9llmBnF5JYE+U4rw+GPmL7qIyI16Rwl45wceZnqxFJCR4vWuf5h0sNQvyM1h6tNYB5NWlM
	J+0PXM1LZ3MD7LSwdBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdSL-0000000BMYx-3AYl;
	Fri, 04 Oct 2024 08:14:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdQc-0000000BLxH-25ou
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 08:12:48 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20b8be13cb1so19377005ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728029565; x=1728634365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=suc0Mn31X9HOZBvZqGf7HMOAhhfsmvf/3O/lBe/Yamw=;
        b=VuQL3dJZYWS3Q5ERLYqnPycNfux3v8WbaEV1A6+TybaeB2msn88oWr2YtG0IKZtcwK
         MJvm+kei7zGjpsmanL3MDXQ63xg+zFqI6FFsZ3cmHnwoDG/B1N7YFB2TgkBaFz2V1fp/
         LjrzZigk0JIDSNQr+FFyD04/Y/n5CaU+6grIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029565; x=1728634365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suc0Mn31X9HOZBvZqGf7HMOAhhfsmvf/3O/lBe/Yamw=;
        b=HJ6tWh4T1O5+uZGkAQuriNeHJp6gnZvQtp0iJC8vIZFuWu+E9oVuY6JnazFFxKnGEB
         pKr5VXGWH3vBxFdcSYiyB0EkRmwefmpruVUzlPUQ7qBM58BD5MlUGMKRJ+pBqdmb4LgS
         lBe5l4Mh9ey+AQO1E6EWIS0kP8bheLpUs0uQgMrwYQGb1kSulpCCP4CtEhvxlOXOJgZs
         yVIQqBjLFo4ojVx02teX9MurJr2IqFola1KUZaO6dGFrWB3HajnXMnOl16osn2dNTfKT
         SrV3SzoGUypF7AXyGzbtH6nb9yfw/qfuQ9vbKzg+PWAXvRtb/f8Tv6SJ0zxwLJMH2Mdd
         F7hw==
X-Forwarded-Encrypted: i=1; AJvYcCUgCN4zkiKKGmxAesvwseiXXdQcsDZY9yn+Wt7FCQitgYo9myNtAB3uh1X9pBaJw2FW6YzruzvizuMPtfZFTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLw6SENIGL3U9t6grv8ykUH/gecAfC7EZsf2Pc6CYYUXk8iyWS
	8z22Eot/6HVTb8Cu2GvTeosyOZ1dIustgKiTDm0yzDQuutwYFIqjC/S5xuZCEg==
X-Google-Smtp-Source: AGHT+IFoAaPoa4+bOiiJGm9uVxI1PYIZfoGl659lJ9EF8peD1VPs7dE5Za5eho+/Mscv1rkg0dsNcg==
X-Received: by 2002:a17:903:2291:b0:20b:b610:bd06 with SMTP id d9443c01a7336-20bfdfd323fmr24619985ad.19.1728029565579;
        Fri, 04 Oct 2024 01:12:45 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:73bb:cecf:e651:2ce6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefad264sm19401305ad.205.2024.10.04.01.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:12:44 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 0/9] Add platform supports to MediaTek MT8188 SoC (part 2)
Date: Fri,  4 Oct 2024 16:11:52 +0800
Message-ID: <20241004081218.55962-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_011246_582764_ED2951D2 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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
- MIPI DSI
- video decoder and encoder
- JPEG decoder and encoder
- vdosys0 and vdosys1 display pipelines
- DP-INTF
- eDP and DP TX
- aliases

Please have a look and feedback are welcome, thanks.

[*]: https://lore.kernel.org/all/20240911143429.850071-1-fshao@chromium.org/
[v1]: https://lore.kernel.org/all/20241002114614.847553-1-fshao@chromium.org/
[v2]: https://lore.kernel.org/all/20241003070139.1461472-1-fshao@chromium.org/

Regards,
Fei

Changes in v3:
- add the secondary MIPI DSI

Changes in v2:
- add linux,pci-domain to PCIe node
- add power domain to PCIe PHY node

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

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 668 +++++++++++++++++++++++
 1 file changed, 668 insertions(+)

-- 
2.47.0.rc0.187.ge670bccf7e-goog


