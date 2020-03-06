Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9B1C3F2D7
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 04:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BAB720870
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 04:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YTbid4s9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UBFJfk7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BAB720870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vucdqzPUPys0h2KFduWuE0u8K502rfBDP/o1cStqh0k=; b=YTbid4s9MCmod3
	KZWGs/ob0L88UjiGklRi9XDUtudLEwfD3nL2e9Ns4uVq9K6E6RBEhICY6CAJPUPnkS45YhtkIjA9K
	AjFfTyzN3v14Ksk6NC+kPlQO03NoYBgcuPQACnnfPhFTk7fDkbSX2hlMaTn8fJ6GBc+ctS3Ry6fys
	OLPTSJ5OS8khJ/OrOC2/ocm+NFCCyple8LVj83CO8MOtFFqDcC4oj+4pclNdIDb49lXgWiI6n3gGr
	4O3vvm+cPr4q5UX2DmJS0XxxlJzDvasXGNtbuWVLz7xM1Pk6tzg+nghcf7FNbCU8hPkWAOt75vCSK
	hq1NtnKSp7tWzw8+2VEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA4N7-0004xO-Dg; Fri, 06 Mar 2020 04:14:01 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA4N4-0004w8-Uy
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 04:14:00 +0000
Received: by mail-pj1-x1041.google.com with SMTP id np16so499254pjb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2020 20:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NGpha79Xw/kyrpH0KRykBURmEGjSa5ilFJNdTDuhavo=;
 b=UBFJfk7m2rjCNVc4mkH8nMfqbKNiiahjGDbTAxb6n6L3W7Pm2HZ2sPakIgBp1lURAp
 wCEx2AOH+h168RFpbM4kCfC0Bl2UTfPV+8xRkoukQQU1Xobx6M1BG8uUQvmOfTE3yk4+
 UBcROZ8vF9c7L9/DPrmxZxWKgxx6AwppH4XvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NGpha79Xw/kyrpH0KRykBURmEGjSa5ilFJNdTDuhavo=;
 b=sPnuUTgqX8/1ofzqb77lhthJujDmyOlnTwb2BT0BAwmgcb1la943VSwpDpgB1THRHn
 4ryfKRL17msN0N2DhY57yAE24lMeqg2pNqy5wx6/QLlLPu1CGdQCybYGWhsM6hs4R63F
 /3SWH+BwTa7yQR+nufk2C6+bA/hIug91Ypq8icDGH/oNEWammlNo8xmFK9B/neCuHblL
 rrz+YxvN3KRqfhAqwI//RvE/hdk+z6yr556CF0+NFJKgR110JTY7fWlHwKUcvAF2GbN5
 AqELcqelQ+32iS1V92Qt8tqgN42u0Qm6CfYVquCQFxHVhQt9vtJDzntBdqH5IkpAtIQZ
 g+sw==
X-Gm-Message-State: ANhLgQ1idYOTn1aWvWR40Jyuw17AKlTj4VPnD0H8l4ioaE6MVBE/vcgX
 gHUZwzFHg3irqOK2I75cDZpn1Q==
X-Google-Smtp-Source: ADFU+vu3QozVC0yE6LU6QscNhoRjHqPVAaBn/u3r6arshufaf8EPEK3BnFSFTzSCvpBiTDYG84+h2Q==
X-Received: by 2002:a17:902:b485:: with SMTP id y5mr1125061plr.4.1583468035448; 
 Thu, 05 Mar 2020 20:13:55 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id q97sm6295025pja.9.2020.03.05.20.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 20:13:54 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 0/4] Add dts for mt8183 GPU (and misc panfrost patches)
Date: Fri,  6 Mar 2020 12:13:41 +0800
Message-Id: <20200306041345.259332-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_201359_023894_3D527187 
X-CRM114-Status: GOOD (  12.59  )
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Nick Fan <nick.fan@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

Follow-up on the v4: https://patchwork.kernel.org/cover/11369777/, some
of the core patches got merged already (thanks Rob!).

The main purpose of this series is to upstream the dts change and the
binding document, but I wanted to see how far I could probe the GPU, to
check that the binding is indeed correct. The rest of the patches are
RFC/work-in-progress.

So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
backports to get the latest panfrost driver (I should probably try on
linux-next at some point but this was the path of least resistance).

I tested it as a module as it's more challenging (originally probing would
work built-in, on boot, but not as a module, as I didn't have the power
domain changes, and all power domains are on by default during boot).

Probing logs looks like this, currently. They look sane.
[  501.319728] panfrost 13040000.gpu: clock rate = 511999970
[  501.320041] panfrost 13040000.gpu: Linked as a consumer to regulator.14
[  501.320102] panfrost 13040000.gpu: Linked as a consumer to regulator.31
[  501.320651] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
[  501.320954] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
[  501.321062] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
[  501.321734] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
[  501.321741] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
[  501.321747] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
[  501.324951] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2

Some more changes are still required to get devfreq working, and of course
I do not have a userspace driver to test this with.

I believe at least patches 1 & 2 can be merged (2 depends on another
patch series, so maybe we could start with 1 only for now...).

Thanks!

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  RFC: drm/panfrost: Add mt8183-mali compatible string
  RFC: drm/panfrost: devfreq: Add support for 2 regulators

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
 drivers/gpu/drm/panfrost/panfrost_device.h    |   1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  11 ++
 6 files changed, 166 insertions(+)

-- 
2.25.1.481.gfbce0eb801-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
