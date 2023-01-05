Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5ACC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 20:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6h6SlU5A0zuGX0GkcqVqSkxWmB5gVmPDaFv9upeKEJY=; b=JOqTPhbeczTjyMN376R8oabdAM
	2ryjVobYvswMSKC8mt3DiG44vt8/KjSxvLxs74ZzZR78Gogc0JCM3zHAVn0OP+I95STEpLTw7DxSg
	nMVlZDSsCfYxyb4biP5pw2MC4TGtUFE2LVfpWkHRtF5bZMbJT+rnudhW5v6NmoQTkmrFwq//v+uPa
	clqMefbP6bfdguTBClwGseT6plQQoRa4MNh0AnC+ZhJ0wMjCU+kPTakBYUjEZpHCRONyTW/loSb/W
	+/5EEPv3LZ7uZuViKo35f/2Lj1XBGxUiJc6Ic0DU9usIEOjIbls65ctWOInQGT3VmsNA6sMaao68S
	bauPP2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXIk-00Ep3a-Ao; Thu, 05 Jan 2023 20:57:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUko-00DQbS-49
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6h6SlU5A0zuGX0GkcqVqSkxWmB5gVmPDaFv9upeKEJY=; b=b5qnfXkJZLwTcAa3DnqXG5iTdn
	J5rkfDGMGvi1K2abwLaCSFIhZBIPMv4P6VYn472ce1hF+dHVsPg0zJnz/ZOMsR90emFFE7sGxasEb
	CFUff64JXmYl4FtxaHGF0BLXu3Yr9mAjpPmqkpTEX9KDXiaLQ/vwR/vXjkPQEXZIXSC47aoblta2P
	rao/3cqUL92pg8XLByZcIxnSItb2lC3BGZ057tmUGlgktRPF9i2sjjmus+5ObvIM9LmtPb270TBZW
	+DluT34UT5J0RytCGuCjy7e92wPAK39UN2eEB7OOOzcmamc7t7DpxJ2EufHHfoFVoL/mMghm9yDyF
	XPbdwNIg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTia-001Vdx-24
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 17:07:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso1828131wms.5
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 09:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6h6SlU5A0zuGX0GkcqVqSkxWmB5gVmPDaFv9upeKEJY=;
        b=qfgIV6+KNhNlHIai2EadAejv7OOkkRDR11V12OpGP2tFc9XeiyuMawbvzgJTN9tXrs
         cR0WnVCxS9IbqSz+/IAgAFRf8VAPr6vfizkuvRL+wq8B000hdQYJX02aM+1gGLLbyWxQ
         pt2j+9WBxSlmHwLXQq98VlnaRfBlMUXxAWh+gLdjEbK4miiZ5PP8/mZXiSK0k8Irtq1i
         l3/gbHxuDV5Ta1uJ5Q/pE+iQM/uA9Xda1ZoJSe0q8kINY349BDLAFTrAs6cLA2cTpHDb
         NdChNoIriRt72QjEG61Y6333Ql9vNB+Ot0gLLnn2qT0mWLwqs3kXtNMiL0jhkInvyhP+
         KuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6h6SlU5A0zuGX0GkcqVqSkxWmB5gVmPDaFv9upeKEJY=;
        b=tnMa7GtDwVklPBStkG2HmT8TedgER/reJyWR+ktd6vZpqs1u678kuNm5nBoJ5nxR+N
         s3660wtWX8J9xWAeUu1yPIsqYXEKG2Pw8qizCe+4g3jErCoXI+jEZeq7MAF7Y+wg2jRv
         BcK3ya7g8kKbLeX4aZ4c62A6shx7xhSdsqAiMf+SxXIkEY9DVd8ircUvUMp+LFgHWQ3E
         FjXfRHARQ87SOiTdj6Pxsa/3LoTDuEyte6FwtYl6bBP4FF9d8n3u8hGlJsvpI7wZJg6F
         EjlEZJaA+Yx0HcZyMUSdmgy9fib6jCFu74TpLrerXipP3J2SIlhSo5KktTYkNrUaks+L
         CT/A==
X-Gm-Message-State: AFqh2kpa8pCsj68C2aNM8esuMPY3KXmuuTipBlo3pgJK3gN2z1V4rEuF
	CKSllkfmBMYGKvRV+HIa3r0VCA==
X-Google-Smtp-Source: AMrXdXumBbhvBPsnLXFiWNaKp/0K4dGbueHABbMCGI06JOhA8oP8PTlc7vyC+M9+2rztudNJ19w5kA==
X-Received: by 2002:a7b:c7c8:0:b0:3d7:889:7496 with SMTP id z8-20020a7bc7c8000000b003d708897496mr36733344wmk.17.1672938466777;
        Thu, 05 Jan 2023 09:07:46 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm37164853wrm.55.2023.01.05.09.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:07:46 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 0/8] soc: mediatek: MT8365 power support
Date: Thu,  5 Jan 2023 18:07:27 +0100
Message-Id: <20230105170735.1637416-1-msp@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170752_775884_7D09EFDC 
X-CRM114-Status: GOOD (  15.44  )
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

Hi,

sorry for the long delay, here is an update to the mt8365 power domain
series. Thanks for all your feedback, I hope I addressed everything. As
Matthias brought up some good points, I got back to try to make the
WAY_EN feature a bit more understandable with less code duplication. I
added a few patches to prepare the driver for the WAY_EN patch. I hope
it is better to understand now.

Thank you!

Best,
Markus

Changes in v4:
- Redesigned WAY_EN patch and split it up in smaller patches.
- Added two documentation patches.
- Added mediatek,infracfg-nao field to the binding.

Changes in v3:
- Mainly redesigned WAY_EN patch to be easier to understand
- Rebased onto v6.0-rc1
- Several other stuff that is described in the individual patches

Changes in v2:
- Updated error handling path for scpsys_power_on()
- Minor updates described in each patch

Previous versions:
v1 - https://lore.kernel.org/linux-mediatek/20220530204214.913251-1-fparent@baylibre.com/
v2 - https://lore.kernel.org/linux-mediatek/20220725081853.1636444-1-msp@baylibre.com/
v3 - https://lore.kernel.org/linux-mediatek/20220822144303.3438467-1-msp@baylibre.com/

Alexandre Bailon (2):
  soc: mediatek: Add support for WAY_EN operations
  soc: mediatek: Add support for MTK_SCPD_STRICT_BUS_PROTECTION cap

Fabien Parent (2):
  dt-bindings: power: Add MT8365 power domains
  soc: mediatek: pm-domains: Add support for MT8365

Markus Schneider-Pargmann (4):
  soc: mediatek: pm-domains: Split bus_prot_mask
  soc: mediatek: pm-domains: Create bus protection operation functions
  soc: mediatek: pm-domains: Document scpsys_bus_prot_data
  soc: mediatek: pm-domains: Fix caps field documentation

 .../power/mediatek,power-controller.yaml      |   6 +
 drivers/soc/mediatek/mt8365-pm-domains.h      | 147 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         | 135 +++++++++++-----
 drivers/soc/mediatek/mtk-pm-domains.h         |  37 ++++-
 .../dt-bindings/power/mediatek,mt8365-power.h |  19 +++
 5 files changed, 302 insertions(+), 42 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h
 create mode 100644 include/dt-bindings/power/mediatek,mt8365-power.h

-- 
2.39.0


