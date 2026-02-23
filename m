Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BABEC1112
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 17:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfSw/YyZxtWdt6T+0h8WzqJ7g3THGU6LxAxLY8xoIzw=; b=ADvx92VuTwzfpqOZsNkCHWRphC
	B5LPDHSDX7cI+pTr8dY18dh977XQ9BKUMpo208FLKjyHYAo7tEC69tBM7WIIrTSIBZkbo0t6bxBiE
	rPSu3VTDBLazwUMY3BhWGExXCFbzWOGv+ugj1NrgiTT3mX7h28HpT09wHsFlGMlgVoxuF4CA76cWn
	z+7sEhoAsknX0YP1WSH5FHZwTeFCvGFWUZgaS59LWtyR5r3FzmttjhFuYX6jiYHHLTXX+S9SZe8W/
	C7y1Crb9deDMENEDqIWKhugIr1NnhOqRF+o3GKf7lKsvxyue46hjZ1o4hchFNSlsmUUHVyC4LcNms
	5X+EhURQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYs-00000000jrc-19yp;
	Mon, 23 Feb 2026 17:17:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZYp-00000000jpZ-1DuT
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 17:17:32 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43767807cf3so3472677f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 09:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867049; x=1772471849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfSw/YyZxtWdt6T+0h8WzqJ7g3THGU6LxAxLY8xoIzw=;
        b=Kl8UFxnA+nFadUlZqlU8fYmoEJUg1j6v8aobYxX6+TnAzCcE7lxImj0JjZBmVPC0mu
         oLrMRZTqilA6fgU45DyhjmH4QN7DPo1n/Texs/dPQAxalnwk2SZisbLsyu4uFKjOHKQz
         CWL+LKm1zsLsxFmza5eTvvHxZkRC4vWjxNOvxYs6X6F1o7chxdHEcuJzEFU29flQiYpr
         2u84ct5t1R+OyKdluQYMut1Dq1gmSlky28mW+6zF2RU9KT0sjwHwp7XFcjpI0aHim+eu
         p1yhIE3IgoyiPDs9rPvAcu4xoiWbSt32NcpeaSHORjJmfG7iEcp3EsT9ti/Pjk7JZ9g3
         MTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867049; x=1772471849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qfSw/YyZxtWdt6T+0h8WzqJ7g3THGU6LxAxLY8xoIzw=;
        b=p/pMh4D1vizI+wfBp0muGGqmelP9L52dTdJjNoN7dOR+5uP7iVAOh3czs/lwXjGpsG
         UB68hSYrSgR0L8qNH4oxunEsepVUzRijKDh1h4PasJCHiOsouswBe+a6CC2ruF94h5jN
         xS6U7DJJsy6rwkHYSLV8TMoqOjb9gppO6L9EVYv+VbEsPjzYAx+CDGMBsU4WRzDj7Keg
         WvAJf92MOGvAtnrMpBIxzpIbqh87nEe5NzbOMX1ZNq5VnlmkzcpmEA49Iq/Ps/OAGS+S
         X/4fHDHy+0zbYHWgPplCK5SwNH/HT8kYRs9DHDyVk/1BcWEbt3U1GOgoWrxwyG2Iv2VE
         lBcw==
X-Gm-Message-State: AOJu0YyIsn2TR7rotcHneOJ9QGT5BkVnB3AhRJZ+sbkr9u1ff4OgFVQ3
	FYeHwsx7f+Sy01FcWDGRAK+TDJTrn/fLWOhPnwNwz5IoEcFNqG5K0HwmEfhtrw==
X-Gm-Gg: ATEYQzz4cmH0tkyCIxqQE2gZZ7rcRxQt7IJSXVOeNpqESqw3OAGjayDubHbvMaxda6+
	rG71oaSr8zqDT40pLTO7hH/zj/mWlwx9EHLp2EUcbnaJX7yXhADu5XTEdm0Sa5eQ8LuQB1xOg3r
	Vr40L2B5wyXJjM+Ru6s/YX6CCvRaMsNVJGYdwAB9HfoNXcD7jZTqbxPhAz6ThYB7/Q5hACueqbu
	20BgYDOnzkKiFgfJPWP/A5qPj/PUHANzwS5ohuTnRLbN1Ko5aWSwZE5n1uV6MMBjZ37cm5uhRbj
	T6WbhXJ5uBk8Ldtq6oknuI7c4Dq4aFwuXhucCPJqbonFtP/gKCp45nLxn5RuBbf9+LLf1b46AvP
	s7WKrt6c4Mm8ymijxY+BseTNv3654Ij0Oq5ULRZLQJ8S5/0UdWpsqXtNtaGsRZIsi0eovSBRV1R
	7CLHd74YGkjJa3QoHSI04=
X-Received: by 2002:a05:6000:188e:b0:437:9d2f:8bf1 with SMTP id ffacd0b85a97d-4396f17ce2cmr17527562f8f.38.1771867049261;
        Mon, 23 Feb 2026 09:17:29 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:28 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 2/9] dt-bindings: regulator: add support for MT6392
Date: Mon, 23 Feb 2026 17:12:41 +0000
Message-ID: <b7664f4d9a7b038b0603b6bba79cfab4e18cbdd6.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091731_343227_EB55608C 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

From: Fabien Parent <parent.f@gmail.com>

Add binding documentation of the regulator for MT6392 SoCs.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 5f422d311d4d..b61fce8f09c0 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -94,6 +94,7 @@ properties:
               - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


