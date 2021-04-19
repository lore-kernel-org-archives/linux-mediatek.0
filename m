Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A35C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:33:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EB88610CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EB88610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dsUBzM8W1ZO+C4/BZOY50hcs50VwYfvvFhPuDqK9aLY=; b=BPeuIE/09ooCapBObxWnQCfX7Q
	JbnebuqAejY1XlFGoIoQ3cWWJ6Qt1qZMrsVIftnChDMrM+k7Hu4l3s5KNDIfPzzncX52R/enol/ip
	KhDpgWgsMfK+dtBrRmEAer+v0mJ4DFKbUVQt8mIuKvcW9wsWEjsv8lGL/C40Wl0k4/sSBLnXca1M3
	6FER0etX/YemhWRN4irRouf8NOGOkVj5RHSOd/qR8bLdDLA1L/MeG+wa/M7hMEcuWoeWIFdtFDWz3
	15K0TElWLh1s0v9zF0rsYMvntHmQ3BTlttlfLGEh47aL6lhdfFxtoX1v4eh7dJzoBAAh+G9PSq1zx
	N7ov6jTw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOPJ-009LLI-1b; Mon, 19 Apr 2021 07:33:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOP4-009LHy-U3
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 07:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zU2109fDte5QzQTU6OiyUjXeLbUbmc0eLsamxuYgBY4=; b=W9LWDKgX6cbIyAZH5IKWBvCzOm
 1MjdYljG/K/O5ezjpg94qy4dPn8SPwL31212HUxy2LgmaRNpcx22KuwF7RV+NoOZVVpuXToqyVQIN
 2zYXShiZej92dH7uNxz2d+99uL8rVbyQdGeOdKJCS2BPKA2aspsKENsclN6yt5C8/ms9ovsPHipBq
 tVZm9Okg0WCTDpKsenUVlmNCYm4l2e8ib114oFgIVJMREaO1+XHIjTITnTWMei1GcRfz9JeHbc+tI
 cXwaWLuxfej8atRcf5QqzYbA0t2ehwHjoJuM5Tw6RIWMTJd45UBTnBk2e++t9vMKnYRBudptMaKaT
 AVOUX6DA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOOz-00B8KW-E1
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 07:33:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so7976513wmq.4
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 00:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zU2109fDte5QzQTU6OiyUjXeLbUbmc0eLsamxuYgBY4=;
 b=cTal5zic1kcTdzov7ZwC91ZPKRclHTTOlDdHpITvaOaiXUTZfpJ+3usRyKlz6/agC5
 AsrsAN6JFILMF4jU8jK3D9UvjGqaDBxku6qGjZ5sM3hDAeEDN0MfRNp589yZWNrGddou
 FS/3UfSei41sfbcsKB3XSKApmzZSukPylSssmL4dYnIXYQbvppcL5sdbKqDCZ3mBwdHr
 +jNawe+GBs8uecyYHqLh99/F8gGZ3Aj2m0I9fvUklslVj4WxHMQc4eqZgVFkdSNlcY71
 twjMw+3UlmWlHXN/4Fye2Zkv2f43Nnrr9FvIgoko4jtZCKyEhxSD9l1fl9jZQguo3lxD
 cQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zU2109fDte5QzQTU6OiyUjXeLbUbmc0eLsamxuYgBY4=;
 b=gE/WqO3X/jnitq7Rarzxghag1Dr7HKU0Q8myqMvGLF6mA/M2+io7GVqVtGZFzDkUID
 e0qThwR38qpK9OLRvVjwG+QwAlcOyYt1dYe3WF87xws92vIOyTFkTNtovAOLK1zDsv0B
 2/z31NBhG0WT2XQUOTa+pyoP4pzKw1UUliipCkmXEkRR4tDCg0Z8ZeWCSoibp69y71vd
 VGu+wUt8chCNx9ul32Iz27/veVQWhpXrgCqVkXATDlBNZd6EvM6uTZVIFV1ZxP31P9wf
 vG+HNjyTDk9/eRklRhxjUbxyUwk5zXl473r3Gm5Y17GT/2Wi3f9OUrXbL1Q/bpz0h/W4
 HczA==
X-Gm-Message-State: AOAM530GVUisYG0fvcCvLMCymr/iEV7w+WjKv3XxMgIv7/7Lel7Q5vSg
 9VWUObmOSCdk61RbcUgZKn6O4A==
X-Google-Smtp-Source: ABdhPJw3An0kM4uAq/WF0hpG90M8E13eTj8qTaoZc2EbHJ0InBjA6SPO6b4yv0Sqpk1BhQQ9B9DIdA==
X-Received: by 2002:a05:600c:220c:: with SMTP id
 z12mr19954322wml.92.1618817578964; 
 Mon, 19 Apr 2021 00:32:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.32.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:32:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/5] mediatek: hdmi: add MT8167 configuration
Date: Mon, 19 Apr 2021 09:32:39 +0200
Message-Id: <20210419073244.2678688-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003301_489845_ABB0F322 
X-CRM114-Status: GOOD (  11.13  )
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

The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock,
and is not validated and supported for HDMI modes out of HDMI CEA modes.

To achieve this:
- switch the mediatek HDMI bindings to YAML
- add the MT8167 compatible
- add a boolean to discard the non-CEA modes
- add a value to specify mac TMDS supported clock
- add a conf entry for the MT8167 compatible

Changes since v4:
- fixed bindings

Neil Armstrong (5):
  dt-bindings: display: mediatek,hdmi: Convert to use graph schema
  dt-bindings: mediatek: add mt8167 to hdmi, hdmi-ddc and cec bindings
  gpu/drm: mediatek: hdmi: add check for CEA modes only
  gpu/drm: mediatek: hdmi: add optional limit on maximal HDMI mode clock
  gpu/drm: mediatek: hdmi: add MT8167 configuration

 .../display/mediatek/mediatek,cec.yaml        |  52 +++++++
 .../display/mediatek/mediatek,hdmi-ddc.yaml   |  58 ++++++++
 .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
 .../display/mediatek/mediatek,hdmi.yaml       | 133 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  17 +++
 5 files changed, 260 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
