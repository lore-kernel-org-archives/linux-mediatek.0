Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB9CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 08:27:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAAB423125
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 08:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAAB423125
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dr3SjDghVJVtRILl9xI767RkIT6a5srkJN8u7sXoB5I=; b=LeqTk5Wv7chX3rmU/aPnHglLkG
	VtZMZfPEKnAWNWCOkHKr+SvRvriUMPlAioGAwqJ/Xz9S9lClFntj1hY89k7cfFdJ861ZtXF9QyjHE
	iwgarglifUpD1tbbdMuIxHSblvqKytNl+m/oge/Jfjd0bENYZJV9+azXPIxSFCvyASAcZrrPKiZP8
	uX6BygXr95WLqQpE7/7Vuuo2CZBCVPhEH+2F/b1dlh+cemS2V2VG17vTtFbiPr70mjwWV6KZWd/S1
	2hH4QgNxDsEMIk4ovv8p9Ciw0D+Pbh1eqUH7do4K4iS7VBIbqjo1zLUbDfX6p3wN+6h72Q1FtlISl
	tmepGBlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxQdR-0007La-BN; Thu, 07 Jan 2021 08:27:09 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxQdO-0007KU-0X
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 08:27:07 +0000
Received: by mail-pg1-x536.google.com with SMTP id c132so4353909pga.3
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 00:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEpfUC6SSuCT9kZJdE2Ig06/CQbJ0RWivjJUsV8Lfw4=;
 b=keJrF5bJ/TAruJLytWQ5e4qbzCcZE4wqWogRJhz9KK6RehvGdGP37siDsg8IROV5ue
 GWOoANiKd1b7dVNcfN9sLFf6eJHhOe/SNYlei2d3rapZBNLYd3IBPZFeq3zf52VcYW8J
 AMiVHEC29PKd/bWG1EpaOPVzUURnMOPHKNj5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TEpfUC6SSuCT9kZJdE2Ig06/CQbJ0RWivjJUsV8Lfw4=;
 b=Q2ySBVVMAzNjKhjDWVxgmFbdX6ghpx5tFpp1c2OcKD7ANBNBc4MqY2Xy656ML71gRs
 YY/EiFQ64hFiU4BDy1ZID/kMYEObgbX1EHEAEJvYXHxPxQgcVm7lcfOkNejXuYWrswXP
 /L7oD0HVYTbYdVAfKzzjzjhwFMfP+3qzNYAbB+JY8JubFUWPhyh3X3SvnZPa064Pum3I
 h1OIQkI6PlnlwIv1qJzb3EXKSzSiD7Rp3lsLwLEzpQAGnyF0CpPAgT+p7WCfDoYkeuCD
 asVa3qbulhQ7xdz/vIKzjwuIZ2dyAQSEAFwcMob7Bx3dyoQQYZCHsAvzg67GPvqb1VwA
 wluw==
X-Gm-Message-State: AOAM533srYuBapzW/h1gqWfAv2ITDptZZArYQzfIVwZrxpECDx1ORd5g
 MdEgds+e9JzEBZnoDldpHWAP3Q==
X-Google-Smtp-Source: ABdhPJzJschmke2ee3zxGdTwh3Txk5dMJ25wnI3dFDHvLFWeRJtUCGcJ5Xt19DXHGfLKgciROYSl/A==
X-Received: by 2002:a63:e151:: with SMTP id h17mr775830pgk.120.1610008023863; 
 Thu, 07 Jan 2021 00:27:03 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id o14sm5825580pgr.44.2021.01.07.00.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 00:27:03 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v7 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Thu,  7 Jan 2021 16:26:49 +0800
Message-Id: <20210107082653.3519337-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_032706_155220_46E4C5F0 
X-CRM114-Status: GOOD (  12.62  )
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

Changes in v7:
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
