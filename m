Return-Path: <SRS0=uKpE=IH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A30C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 13:45:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7928064F69
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Mar 2021 13:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7928064F69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AGHgqtDIOHN+vJKdqAepNlxVTiS8M1HQLwymLfxOG2E=; b=XL6LTZP4wSsZCXodUdmhyEoCLq
	lr0HQPV0NKZHC1PtVBmpri7oQqIQI4lAfrHT4aL0YEVmSnYJnl+8dYByFJtWTl4GC+JKIvduT/1h6
	VfNCwVE47DBqtPSjT30F1sVsolTCkdJoLLVQLnCUwOueuQG7LetSX1RsSy31TPeiOsWr+R5tguX8e
	xK9vDSvS/qsypE8RdN6KiKcV1/dt8Cm3IrldJhOjJQSID982NUqrmUK4++9OqNvPFMBKh0MC9PnyZ
	3b7hTsUpAxEUcVluaBPcmacY0+GA498mA9NrnkGiEj1RSG9BrKwhPBg+/Hem0d1iq4B4JsLjPgCz0
	ErBsfspw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJcfg-004jGt-SQ; Tue, 09 Mar 2021 13:45:12 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJcSb-004ePM-7R
 for linux-mediatek@lists.infradead.org; Tue, 09 Mar 2021 13:31:51 +0000
Received: by mail-pj1-x1032.google.com with SMTP id q22so746213pjd.0
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Mar 2021 05:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DSrjiES35aCdYNr3Gs/Gbw7KzGhsarU4hlR/BQl68jc=;
 b=Gjr822rUysls+DO/IaKW0guLXvpy74s0lzlVkhQNR18w9KPTpY85bKItJ9I4/bMcq4
 uWcwrf41u6MwUn3deE9zmPecx2EKrNiOnvwkCBJgs1nZG7/MdWiVWmauS0JV3Hx5jk2U
 OdYFzPJnVsBx7msp8h7qBr8j1gpPzrSRM0z0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DSrjiES35aCdYNr3Gs/Gbw7KzGhsarU4hlR/BQl68jc=;
 b=JIAC1Zsa2tSQFNIJzl0v9Fb6Be3PPU7garTNCtpS80wmX4SoGMFVCeHVCQyP1pOSvH
 Qi2D/I8MzeFgeVLEfo9RpRz0ZbIvipGOZTTRe2ZooDJQYJ6QpozQul0xBndlbJeNYSEK
 uUJiKWrOm5ac2YbFOAxZZVCRHmiBzNFjwdEHDtblO82qMAgiTZeNN28aZIlMOJZPq/kC
 tfCNn9ImPgVW1bU3YQDT4ABztQJgekAl3Fa2pUqqmJ+l8Rbe9HIscuU4RHcokev3hjOG
 7xlA/lTTC2Fb0WCohV9nJL8ciM2e9e7Mryr64E3AvjBNWa/MH8DFRVOTYqX5AapraguT
 LzHQ==
X-Gm-Message-State: AOAM530P0DQ3wMLdBjBIZWxtAS0TXFwVnwltYbbqG4B5mVCxvoQYNjTq
 IXJK+e6n7XZdBZb50aPbYXgFCg==
X-Google-Smtp-Source: ABdhPJydsoZxe/mN+r6ufQMJip/FV7qBbuON5iAZf1A8uLG6pDr1rGK9h+vu/34KGvTXj/wqlOjYAg==
X-Received: by 2002:a17:90a:fa0b:: with SMTP id
 cm11mr4905696pjb.140.1615296697615; 
 Tue, 09 Mar 2021 05:31:37 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:f936:57e5:154d:e0d9])
 by smtp.gmail.com with ESMTPSA id 138sm13678649pfv.192.2021.03.09.05.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 05:31:37 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v17 0/3] add power control in i2c
Date: Tue,  9 Mar 2021 21:31:28 +0800
Message-Id: <20210309133131.1585838-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_133141_695821_3A877087 
X-CRM114-Status: GOOD (  11.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Although in the most platforms, the power of eeprom
and i2c are alway on, some platforms disable the
eeprom and i2c power in order to meet low power request.

This patch add the pm_runtime ops to control power to
support all platforms.

Changes since v16:
 - request regulator in device instead of in the core.
 - control regulator only if it's provided.

Changes since v15:
 - Squash the fix[1] for v15.
[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20200522101327.13456-1-m.szyprowski@samsung.com/

Changes since v14:
 - change the return value in normal condition
 - access the variable after NULL pointer checking
 - add ack tag

Changes since v13:
 - fixup some logic error

Changes since v12:
 - rebase onto v5.7-rc1
 - change the property description in binding

Changes since v11:
 - use suspend_late/resume_early instead of suspend/resume
 - rebase onto v5.6-rc1

Changes since v10:
 - fixup some worng codes

Changes since v9:
 - fixup build error
 - remove redundant code

Changes since v8:
 - fixup some wrong code
 - remove redundant message

        [... snip ...]


Bibby Hsieh (1):
  i2c: core: support bus regulator controlling in adapter

Hsin-Yi Wang (2):
  dt-binding: i2c: mt65xx: add vbus-supply property
  i2c: mediatek: mt65xx: add optional vbus-supply

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
 drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
 drivers/i2c/i2c-core-base.c                   | 88 +++++++++++++++++++
 include/linux/i2c.h                           |  2 +
 4 files changed, 98 insertions(+)

-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
