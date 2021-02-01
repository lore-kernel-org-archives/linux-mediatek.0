Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B68C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 12:14:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3166464E8F
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 12:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3166464E8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zk07XB5i04MrSZKQPY9OVPYDdD1gfjs6sXElR2ccTIs=; b=nyCQ3HOW1zX06bc/XLBvzkmGnl
	hNDaNCM18A3ZxOvtoNl3pNn/9rrRplYy9D/pOUeC/VD759Nk6uPlM/lCKEWbmnmEKRY/0sOfCZ4nc
	8INl0vdedOCMLNqT7j8GJ6/ooNQBHP6iY5ur5AhoziqZtj5LDQlCbvFtDWQmFq8qSlGmce5jwwnY5
	z42NKwXctw2cZzaLefgJu+1NsjaXd1SqwyNxKiQR/nnmxg4GNl/6SqKi+IIAt3nkPk9cCNM9WqiC1
	qQ+tOyrZIe30+4S4BwmfSKKhBgB6E5pTdhM2sFFPEuuFhrkMT/ghAvzMtPa8gMazN0vYQDXGnESW2
	rRJ5QwDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Y61-00012p-SX; Mon, 01 Feb 2021 12:14:21 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Y5z-00011f-1A; Mon, 01 Feb 2021 12:14:19 +0000
Received: by mail-wr1-x436.google.com with SMTP id c12so16322822wrc.7;
 Mon, 01 Feb 2021 04:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZqqSEikuKoZ7t9f3u+RFTxn353pYpN9LldSfi3Rr3M=;
 b=Yw/EY5THxQYott8yUhDX9m0QAA4mX1UaLLa8cq8HCrgwIHknjmi0839RWs5hojWvfA
 ZiKXGollAHVxbrsrQDo922lKgEjEfOgNx5EnN6VW+j+jClNQfLxrsm9zIpNUlYobVJQR
 GwKhkRZpId3tVXDQJnWb3AYYU3ZMqGglq2K0fK4m1pusRffzFLte4SX/poLoTbV5xkDG
 jbTRX6pEpqBo0IpCGR9JoHS0kZ3hwRZNT7BoQODWUTwfbMoG6UKYOdYVji/DMXC0Hx9P
 gVAx/DWULDNdvshc/2FxWMtuEBUCCnJZbXb8G51Ye+/wC4+KPHXGJwKn+4E6iUfZKWb+
 SHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZqqSEikuKoZ7t9f3u+RFTxn353pYpN9LldSfi3Rr3M=;
 b=sSwHiTDl7G3VVCfo2zrUtHrSdVJ+6n/PD8IjETztADdQe8hDU1Fp+j/yde40UyLqxl
 ysaMlCtUHmVeVUAJ/erbBy/k/0W67XwdDupded3yjt7hw16jitjPVOu2CmXAGILl+luf
 OtOC9TX5oCr3UCu1/Fk7ruaODa8ZuiWOAFJTDRiWphHxUUE4+xYVsWBS5fyyaM7BwDTk
 lYP9kyMT2JxS5QN90pmiEa+CyFYKz6YTDDfMX+ZlbemJ4BUgHbKhp7UMlGtzrmdK2fWR
 /chRI1b4ibR0xkdmkUoTbHuZ6aD9Yw/L6CJq5EoLP2bE75lqyHOInBlHAXXSVG2wbDYe
 YuKA==
X-Gm-Message-State: AOAM533pxRjlBvoAG4IiBfrAInbvV02TzvzV/Qpm41dIvQzZ5mmerqea
 ZaTPMztr/smi3Ap2neZ7wm+8kEJFddNZP8UU
X-Google-Smtp-Source: ABdhPJzCm8JqwFovXlYiyJrS9Y8DqOHhf8sUnkwsefp/4vulBLEBvyjuiQd8jg7dMnspNvPLQVMm0g==
X-Received: by 2002:adf:8464:: with SMTP id 91mr17345253wrf.188.1612181657697; 
 Mon, 01 Feb 2021 04:14:17 -0800 (PST)
Received: from localhost.localdomain
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.googlemail.com with ESMTPSA id j13sm20698332wmi.24.2021.02.01.04.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:14:17 -0800 (PST)
From: Bilal Wasim <bilalwasim676@gmail.com>
X-Google-Original-From: Bilal Wasim <Bilal.Wasim@imgtec.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 enric.balletbo@collabora.com, hsinyi@chromium.org, weiyi.lu@mediatek.com
Subject: [PATCH v2 0/3] Misc bug fixes in mtk power domain driver
Date: Mon,  1 Feb 2021 17:14:13 +0500
Message-Id: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_071419_136117_01496862 
X-CRM114-Status: GOOD (  10.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Incorrect mask for the "bus_prot_clr" field meant that imgtec
gpu power domain (mfg_async) was not powered up correctly, causing
failure in driver booting. Fixing this and also adding "domain_suuply"
capability to "mfg_async" power domain (for mt8173) as imgtec gpu
needs da9211 regulator to be enabled before enabling this subdomain.

Tested with mt8173 elm chromebook.

Bilal Wasim (3):
  soc: mediatek: pm-domains: Use correct mask for bus_prot_clr
  soc: mediatek: pm-domains: Add domain_supply cap for mfg_async PD
  arm64: dts: mediatek: mt8173: Add domain supply for mfg_async

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 2 +-
 drivers/soc/mediatek/mt8173-pm-domains.h     | 1 +
 drivers/soc/mediatek/mtk-pm-domains.h        | 2 +-
 5 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
