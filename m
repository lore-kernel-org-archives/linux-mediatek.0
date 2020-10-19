Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1786DC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:07:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B5D1222B8
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 14:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UfwvuU42";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="q58YBicn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B5D1222B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mkd8fnR/ECKdKYVI6EgnwhK/2lF0tCgx/Kxt073pcpY=; b=UfwvuU42Ji7n3A0wNZj8sKqPnh
	TNeel5RSQbnpjEzwZ5BcdKKhqlgAIjy2HOp7blaAspeSKqa9Cn34drb2MFlirfr7OmMq+Mn25SsdG
	hi0Wpno/EAgcAJy7qdPLoj7jIzKu/tu+4iXI+twru4ecN9zkpq+XAp3HOwwuFIMJENCFKuMgmQaws
	T2Eliqs1BIbdDgMu+IPaAC2+uQFi1SmFvqgvfwP9HhD0XVPOIDALI17Ng850THVozK4Q4G40yPlMn
	Yty9VSsPt0kZkopGMcyAXkNkFlc0HJYfesfbagSkvSiVoPwpXjdQ9oyd07WW8oMTtjZh/NACtmBc9
	SoEt8LbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUVp6-0004QT-Hf; Mon, 19 Oct 2020 14:07:40 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUVod-0004Bl-Gu
 for linux-mediatek@lists.infradead.org; Mon, 19 Oct 2020 14:07:13 +0000
Received: by mail-wm1-x341.google.com with SMTP id e23so10440820wme.2
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2020 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ebVSTF6C01uLAR4vrWlCZCg3/AjoCT6KW7MfS2FL1W8=;
 b=q58YBicn3ANSptSyrmNZgR7LtjM4s17qFl6avOnGe9XlPfwuz66SeedC071MO3YsGs
 QZuAKNHudNN1e3YDhOWn0R4TbddBnkUX1+W3zP4DG6b3gOlTVdoX0fYrFipNZKSGV14t
 TOByIynj6gsulAIXfRH1ceClLqOEV0oYRKMHg7wufNCcFoLvz+VbtrIzJb8zJBS3wGfd
 TtD/dEssRkie0FcIUx43DkEPJtjhuiO8FS2WTP3liPopHkfLRLUhsQFlBErDZ5Hr9qfw
 0/zRxt0k6BP1JWLJGAIp1TV2PqD0AVYAJLnsJqS9ZA6uo+gCBo93vSqV7D51WitWcpBc
 imhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ebVSTF6C01uLAR4vrWlCZCg3/AjoCT6KW7MfS2FL1W8=;
 b=oJeyd4QFgyimT52QVzEdflou1S2DbhQRGToxWBvEG8jKGdRNOJYAP5qEIbF55MVRln
 IoZ0S8Jml6IVGkofBEt3MVuuLDe0B7irepgpq+7n3dxfNGC3/d01J9JeWXknyd05jZzP
 JlubFtTGtH1aUMVeF/3LS+tdYQeJooz7tAdWzE+upQEODq+u/R/1Lt0lm9k5B2S2sEL4
 yio2tUvj59SLA1FIKDjXtcx4CNOKIuShhqDv5fmUIRpV7pDnXeZZ2vEsI7R5IusKeaxa
 W0zgj6S9dUHr+/B2OG2V7ZGh+Yb6/pYSWXp2fp0Pd1blcWAaB7jkWoLeKMRVmMezThZ3
 wpmg==
X-Gm-Message-State: AOAM532SEceJyZ5A6JFj1RhUienFAGiuaA+QytGA5OAJgbnrwpqmiTv6
 CX0gTUMhNOfWE5ike6Iv8JkRPrsI0kk6sA==
X-Google-Smtp-Source: ABdhPJypMv0Z1XIG/QxhI7DDBx/5GK8UprJZ36/vq0bC5DYKq1zcI1ZC4PpBiCXyNPi+pp8z+Y6jEQ==
X-Received: by 2002:a05:600c:1081:: with SMTP id
 e1mr18704315wmd.156.1603116429676; 
 Mon, 19 Oct 2020 07:07:09 -0700 (PDT)
Received: from localhost.localdomain (26.167.185.81.rev.sfr.net.
 [81.185.167.26])
 by smtp.gmail.com with ESMTPSA id a3sm114182wmb.46.2020.10.19.07.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 07:07:08 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: [PATCH 0/5] Add PWM support for MT8183 EVB
Date: Mon, 19 Oct 2020 16:07:00 +0200
Message-Id: <20201019140705.1518822-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_100711_600538_62D1BFD1 
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
Cc: robh+dt@kernel.org, Fabien Parent <fparent@baylibre.com>,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 matthias.bgg@gmail.com, lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds PWM to MT8183 EVB. MT8183 has 4 PWM channels.

Fabien Parent (5):
  dt-bindings: pwm: pwm-mediatek: Add documentation for MT8183 SoC
  pwm: pwm-mediatek: always use bus clock
  pwm: pwm-mediatek: Add MT8183 SoC support
  arm64: dts: mediatek: mt8183: add pwm node
  arm64: dts: mediatek: mt8183-evb: add PWM support

 .../devicetree/bindings/pwm/pwm-mediatek.txt  |  1 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   | 12 ++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 14 ++++++++++++++
 drivers/pwm/pwm-mediatek.c                    | 19 +++++++++++++++++++
 4 files changed, 46 insertions(+)

-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
