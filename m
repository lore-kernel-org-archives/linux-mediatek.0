Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E76C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oeLXr/ztgvOtVsK+Kl+n0JOEyozvguRk+veU2UYviCg=; b=UYdq2kUpGDBWXe
	vWjgk8IQoPz/0Ds+Spz1GxwSOOpwnXdP++R7ZIpPDmN/6SUs0CYRlW/DXvaPZMkzzJXJwYnD4V2Ab
	nibAjSOLKIZ9nwZPWl5EYvPxYeBBwfJWkr2CrnaNrqsuUTPQ7kEN9x2o2ONbhIoPdm+WyfPfKRtFE
	VHMzir1oJwLVltzkUoCBHA/3sKh+D9qIWchTROZErJtvBs1ffmNmXInmapzowKoe7ogew88bWdC+R
	pLGefHRjNTZx8dUV9g+/RGSzahtwiLGymNhJCzvEBTvTibAljuWLSOK8SC3WlWULFWQJobDUdEblx
	L1VZjUrpg9Y5EB8+nxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2CIg-00GsI4-19;
	Thu, 25 May 2023 14:50:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2CIc-00GsFs-2F
	for linux-mediatek@lists.infradead.org;
	Thu, 25 May 2023 14:50:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6d7abe934so4912355e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685026239; x=1687618239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oeLXr/ztgvOtVsK+Kl+n0JOEyozvguRk+veU2UYviCg=;
        b=N1q2y9PxsUwtmnergtMtlKIEo5yB8DE1LaJOQmZOxctO0npZLLxgcZpWp1MlAFKVuX
         fd/3QOUX6duwieVU7egfpm72qHByhULGPh6QoLcp27T1Ta1aoRXoU2zzmRN+Djl+a/nj
         8RT42EHCVaxcxAdoh07FhJpYj9zAa1XEiTNPcPuzby9JkCSKWz+1OCjP9I3TvOg2DcVa
         Y3ns+bTt7AbWE/roWBBzulJMuMqikbfisGkNnvBDM09RV/PfnQSZYhR8UPG6jGVq/yKA
         bllZaPxRIm02cbuDoN6dQsxpETd4yLqPCPEKZaAGXlgX997P96sHp9B7X1e3ABuuexOn
         gcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685026239; x=1687618239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeLXr/ztgvOtVsK+Kl+n0JOEyozvguRk+veU2UYviCg=;
        b=kYY5mURR70pkSS0DnMdFRzJUA5xNgcgq41NQGvjRAE4d6t8ZnKTpTaaG3YvOOZXT0M
         FPC8bEJupGZ9ibOVJrQKfX+EEAZtRBoziRmKanw6ZXCV8jmI+tguGY0T+4y4WXNPSAoq
         Xta6Z6w7WIdPbDOoxuAXUY0ItuTWxI6q0f7y2twVcpr59mM9c4mEMk02LApRM9JlsaZt
         BlGaocJnwoxZIVtk42xJFXt0HhyVqBEaPkoHGHRLYRde1a6/7ij1tixkSuncarrKN39z
         ypMd2Fg3PBi2F3Pl17C3SecxR8zW30FzjgFdMv01R5qybPK5rnzBCIt6kaiIX3jUhRcI
         rnMw==
X-Gm-Message-State: AC+VfDwTtY9l83YCn4KOkxvOVLnbNdIh64fxoQSFufPdbofeXZzVVXTh
	faasQow72i9/4HuD6O24TAQwOw==
X-Google-Smtp-Source: ACHHUZ61k/sCKf41zD6WPEp1UUz7BzalUtlMAH6Mf0Oxs5zHLKiCMmMLMIuF82QNh9dW5i5xV7F6yg==
X-Received: by 2002:a7b:c5da:0:b0:3f6:774:fec with SMTP id n26-20020a7bc5da000000b003f607740fecmr2762120wmk.29.1685026239445;
        Thu, 25 May 2023 07:50:39 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id n4-20020a05600c294400b003f3157988f8sm2349559wmd.26.2023.05.25.07.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 07:50:38 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 0/2] Fix and clean MT8365 clock indexes
Date: Thu, 25 May 2023 16:50:26 +0200
Message-Id: <20230517-fix-clk-index-v2-0-1b686cefcb7e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALN1b2QC/3WOOw6DMBAFr4JcZ8E2vyRV7hFR2GYJq4BBNkEgx
 N1j6FKknCfN02zMoyP07B5tzOFMngYbQF4iZlplXwhUB2aSy5TnooSGFjDdG8jWuMCt4FmqVVP
 kGllwtPII2ilr2sP6jMlcxBk4I5JpGMkk/XRNizz5eTnE0WHYzpBnFbglPw1uPbtmcaz/EmYBH
 EQmeVkqUaZSP7RaO9IOYzP0rNr3/QvBW6pQ5gAAAA==
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1079; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=mJgIzKbuG8pOxtxWfLmmBivGM0R6E16D6cc2oakm5fM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkb3W+7R4+WpLQFt5TQvVau/Q3VcVbO3w8VqqssbLY
 g5NzkRyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZG91vgAKCRArRkmdfjHURclZD/
 9QLAUKtYzpR4BF4chcuH2K+VHCEK/q+A72ywFvKsKuqPYRq3bl/hB3x9pw/ZIf8ZTIn0jdVYXxicFt
 4v66fpwPsT7bZFvIWwt3pOy7NgbWH+xHHRXh2y4V6RS/fIwekCb9vwty3//kGvBan7/Z2/+sbpSJkp
 zzMy/9Mcw5n9MdE4KvbK5TvB6RIRBOFs2/Oli0bZqhW/M0YTByzZPbqK89UtpCgxs3ok1vtCsC5u4M
 v15AywGqae1FGszDfABRIIr5I2oJWjTm4zz16RH6B4dC90EmM0/2unf8fIZQK3sFnxS/58XsaKnyGm
 INyRxjk5FfNaMzWZorK5s7PRTiTYokSnVpqbL/O1YwCfG15QLTd8xlYzMk5jOROui+mcv3ZDzGOe2r
 M3jEMABp7BPr3k+yxCluJ9rQXh2kfAd36EpgRzVgoOZTQnjHW5+lrpbxhqCwZGFfnx3aiT3JPbqLLK
 x+KK6oN/1l90s7lrSAdoNfDMhcKda+Ghv2ZWNBYxVGh+oHz03B4a5HnicdgxYsXFytTVC2/hw4W7DZ
 JBSlS/aVAmHJMam/I9GpfPLL1obX+zETV9SwV2iruVVx9Eb7+THBnB5Bg9L6DX6qlW0t3gdhfwDn+w
 g/h4HGJcjlSWUYC1F0X413yT93KRezxA/bm+7jABjd3Uoty15pMrAB+04Jdg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_075042_743737_2848D1D5 
X-CRM114-Status: GOOD (  10.39  )
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

The first commit replace un unusable clock by another one.

The second one fix a regression which prevent the initialization of the
latest indexed clocks. The regression is introduced with [1].

[1]: Commit ffe91cb28f6a ("clk: mediatek: mt8365: Convert to
     mtk_clk_simple_{probe,remove}()")

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v2:
- Add the missing clocks in the mt8365 clock driver.
- Revert all change in binding file except for one clock.
- Link to v1: https://lore.kernel.org/r/20230517-fix-clk-index-v1-0-142077a1732b@baylibre.com

---
Alexandre Mergnat (2):
      dt-bindings: clock: mediatek: replace unusable clock
      clk: mediatek: mt8365: Fix index issue

 drivers/clk/mediatek/clk-mt8365.c               | 11 +++++++++++
 include/dt-bindings/clock/mediatek,mt8365-clk.h |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)
---
base-commit: ac9a78681b921877518763ba0e89202254349d1b
change-id: 20230517-fix-clk-index-96043baf65be

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


