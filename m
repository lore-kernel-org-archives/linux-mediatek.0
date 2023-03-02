Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE9FC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UCzu+CfYoO6L/88b2EATsbmRsnxpl5XJojzf9dpIYbM=; b=oWCx0K5Wu6CD+GPWTT7H+5IoET
	aSaivH6JPTGKLEIqVY3PMbzxRZ9gJgvlQeAMyVugxd9jV4hR8jQct14tCzpPUh0v7Woo3yM17C3a5
	o8LYTWbuZWdy1GRB7Xaou+Wvk6eEvBoFvzd4FLc+91wTR67/iQiHhKp5cby4utTvY1LTZh0BXoNVY
	uQiGslpo6xpA2O0zNTAqY6wgRKMowyuNsO6vorYZKShJNbXIFieBEc7ZrbBrFfQfyai51omJqaBiM
	IZWStYHMpg7llsJEAd21cZYgi7y35kfSp6rGbW1yZ1s8HBhwwF/gicqUDqb81ylioS/PB0590hfX6
	G7vBBMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi22-00282U-8c; Thu, 02 Mar 2023 12:27:34 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXi1z-0027zZ-2o; Thu, 02 Mar 2023 12:27:32 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g3so11413125eda.1;
        Thu, 02 Mar 2023 04:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677760046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCzu+CfYoO6L/88b2EATsbmRsnxpl5XJojzf9dpIYbM=;
        b=nMWeYaQK6N2n+tcRBZmsETp9VrbSsWitZpxfoLVg9dzNOrnd/hoxPvxWQvmPhV/Lcz
         FiF0pr0nw8IU4Dbscq9aSQVa5jbCFXsGAZrerRZM+L3OtZCBV/hMjW4QzN2csYOfCqhF
         NY9UN9AvbZWXbCBBcZypwKWVjV0pFBhqdL1tIkz7ntdJvqxtsz1kHCXjLltF7i5QRxMc
         ojfNwCdwyyqaH1kRZX/hVTUmdYTmbTEONcJDBtcjUX5l9BYhRbpztFvkv0N3ZSmlRWPv
         sZ0ugavlEGWk7oC7qqgydCV/UJ41I7q6DzTZCgbZ/5e5QwBnV5KIK2C9JWgSq1oQh4lL
         9mfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677760046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCzu+CfYoO6L/88b2EATsbmRsnxpl5XJojzf9dpIYbM=;
        b=yNdzyR1ItCS3PvdRTbFM8Vc3ZfL1/VX/HIdP4R3U0k103jK9rdwfvsZ3KXBsGlbvvU
         eguEj5S8+POSkrbGEPRDiNFxyQEFHhIKOo5iurSyatAycmszBq9vBSTct6LNVAC6Z2wp
         KH7WrP8P0gsetIyQ0tbJ5Hiuqug3RiavFmL8LTx7GXENTL8ZEodZeoTT74IsK5c5vk97
         3UayibtzMDIRPt9bbo5v937nDBv82hzG3ajV3ZWGf6KThDp4CG1mpv1x4WL/vqH9Ctkm
         +cnHv0aIMQnAuxuSFzRH3seK45W8c7vULs4FoJ/1Ke8v62HZ+ILPtzSO0n0RyLy8U9QP
         +YLA==
X-Gm-Message-State: AO0yUKWbIf3eINWpyGtLxwPJ5MuwnWC15pdUj2ziNCtnMzK5z0vN9+BB
	SIe6ED5Bmp4tJyaPptC0/dlt6k9hsos=
X-Google-Smtp-Source: AK7set88KNYQCJ8xnXU4YX6cMBd1m+CfpbxjYXG8W1sUvhQ4bXwI2FO/XpIVWpYvF0lT7Xgkx10HGQ==
X-Received: by 2002:a17:906:9156:b0:8d7:6699:3ba9 with SMTP id y22-20020a170906915600b008d766993ba9mr9434114ejw.29.1677760045782;
        Thu, 02 Mar 2023 04:27:25 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id qc17-20020a170906d8b100b008ca37f3eae9sm7038375ejb.131.2023.03.02.04.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:27:25 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	"Garmin.Chang" <Garmin.Chang@mediatek.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] MediaTek MT6735 SCPSYS support
Date: Thu,  2 Mar 2023 15:27:06 +0300
Message-Id: <20230302122708.73848-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_042731_169608_0005F467 
X-CRM114-Status: GOOD (  13.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision)
can be found here[1].

This series adds support for most SCPSYS power domains on MT6735. See patches
for details.

Changes since v1:
- Squash DT binding patches
- Dual-licence DT binding as GPL/BSD
- Switch to mtk-pm-domains driver
- Add MFG bus protection bit

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Yassine Oudjana (2):
  dt-bindings: power: Add binding for MediaTek MT6735 power controller
  soc: mediatek: pm-domains: Add support for MT6735

 .../power/mediatek,power-controller.yaml      |  2 +
 .../bindings/soc/mediatek/scpsys.txt          |  1 +
 drivers/soc/mediatek/mt6735-pm-domains.h      | 96 +++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |  5 +
 drivers/soc/mediatek/mtk-pm-domains.h         |  2 +
 include/dt-bindings/power/mt6735-power.h      | 14 +++
 include/linux/soc/mediatek/infracfg.h         |  5 +
 7 files changed, 125 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt6735-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt6735-power.h

-- 
2.39.2


