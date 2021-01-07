Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568FDC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:01:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35322313B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35322313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OUJUhsUdm+WmEUYZ0be4Ny0sMoGNeu8E3xIiwhQZEcc=; b=EbsH5IUNiJ5Gw1GJ5jebDAKjTV
	YX/msE0buK7m0hIv+eEYyp5fOaTzdvjD+6g12FzxK/FS2An/3aLxMDFJmOy3oVvfiikkbOQ9ponte
	elfJGWm4PdzrnpZ8cRDlUfDn4duSB4ldZYLMwOubntxMWhzV7NY7orgFap+vSN0yIxh9XgMj0uuIL
	xs+1q1KQRgq2BVRWO6UOZfG/kqi3awLvaYwqhL/VkCAZW2ctWtNBMZKlye2+mg1rTgE00B8FksY6R
	tvqYgZ4yXEcKN/sWqd7SYSyPT4Acw9160fRgVBd0166NvKPIlFFjsjKKLfVSk28zmMGokdoBlLvGN
	qa55s+sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxR9v-0003Jq-Bz; Thu, 07 Jan 2021 09:00:43 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxR9l-0003EG-2S
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 09:00:34 +0000
Received: by mail-pg1-x534.google.com with SMTP id n10so4379462pgl.10
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 01:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A38XEG2bxzvR12086jQpwTTb/g0iT6/kG6TCSTQMuF8=;
 b=HJnCLAsRHKWwLhQ7mKp+58XMFdmWbGx2dCO0jxV1ALEGSO6wf10jAomB5O+3gmuBHB
 CTPoWHFdcP5Go3ofX1hhjyQDEi0/327NPX2VSj+mZcNIK2gvbIFO94nb2C70wwBJNaZ0
 GsavQVH6iJa2B0zmPjPsSTxSS4hW7wytRLe9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A38XEG2bxzvR12086jQpwTTb/g0iT6/kG6TCSTQMuF8=;
 b=sZ5KR2hPJRFKgaLyNMZtjeGJ+50gbKbmsyUtf84aHvBCEAki+LKLokGL8F4hjzmc8T
 yPcfZlFka9iag97ECbSGWeUxsDqb8ybgwJ5PZk6iQxdLQ2zdHwNpdOOSq4b7RF6Wej9f
 rPBt1ET7izpSzhp2ahtIhxAQYlE40wSzMo/YCdwb42AEps6QAxBef8pB0c0wXZrwbV6H
 0lXVhYpXnHIBLg/JZbKUySKF5sc5huCxbmdj+b6y7VUijgoT+YRcyhr5RoHVgkUZb+KV
 RSj8GIOid2h7+/BA8V+zlFY5rI+qmfOKbnjR5HRsGk03lN5DZNlmlRsFC4xxgJDwDB1Y
 AMxw==
X-Gm-Message-State: AOAM531TrK04YJo782YdGi0HIyMrjhk60rt72vELqG1PF9gYFnn9firv
 JMsuzUTkX0+K1fuQuOP/KZwyuA==
X-Google-Smtp-Source: ABdhPJw9Ssl8Yb7I2NbXzQGWuVjK6p28ej36nNEL2Q2+nQZhP5RGtaadDnQqTtmMvEnuKGhzm6xJnA==
X-Received: by 2002:a62:e30c:0:b029:19d:932b:a1e2 with SMTP id
 g12-20020a62e30c0000b029019d932ba1e2mr7918416pfh.78.1610010028859; 
 Thu, 07 Jan 2021 01:00:28 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id a29sm5022421pfr.73.2021.01.07.01.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:00:28 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v8 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Thu,  7 Jan 2021 17:00:18 +0800
Message-Id: <20210107090022.3536550-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_040033_242659_71BC7453 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

Follow-up on the v5 [1], things have gotten significantly
better in the last 9 months, thanks to the efforts on Bifrost
support by the Collabora team (and probably others I'm not
aware of).

I've been testing this series on a MT8183/kukui device, with a
chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
mesa 20.3.2 (lots of artifacts though).

devfreq is currently not supported, as we'll need:
 - Clock core support for switching the GPU core clock (see 2/4).
 - Platform-specific handling of the 2-regulator (see 3/4).

Since the latter is easy to detect, patch 3/4 just disables
devfreq if the more than one regulator is specified in the
compatible matching table.

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
[2] https://crrev.com/c/2608070

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message
 - Fix GPU ID in commit message

Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
  drm/panfrost: Add mt8183-mali compatible string

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 6 files changed, 161 insertions(+)

-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
