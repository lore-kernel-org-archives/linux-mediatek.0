Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531B7CA5FA3
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=; b=P4QmlmZZ4js5enPD8Ogxs/BepE
	YQKEfEIK0Nk+0xpaOWya23ApXZdetup668MC1KMRPoHGUV6mpfyvfTgfulGlnRwElklUH1ekb7DBJ
	uCFKS+BwlfHFR3mbncLxsSYOiiloxv1xEO+Gzv7X4Q5v5Aa9AT/2rXYjkymH1XK8RkNODlsGzy6fw
	3wFWRnnArcOmYTkgusd0qr+3KK09QnpePjJy+n7cx3+mrS/IHWzEqQBK7dUBX0i67DGGsaH9d9pcz
	vDq4rcZHZy7aZtgVeI5fD1ch3zbtnoo0JZuw7+ocaTRRB7vUGJawHjQHh4nMjqJvMS8PHQFGmj4uh
	De+03obQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIPt-00000001dMN-0kxf;
	Mon, 28 Sep 2026 20:57:41 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIPn-00000001dKn-1EiV
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Sep 2026 20:57:36 +0000
Received: by mail-qk2-x08.google.com with SMTP id d75a77b69052e-530e2f0c0a8so39985921cf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Sep 2026 13:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790629054; x=1791233854; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=;
        b=fD9wO29TKUPzxMayGBC9fwCVKuW4OBLjoxbtRo6vNgUZH5V6QBN/Iv5WTVYxCt5L2r
         phDgTdYNU+EILSXTwhMyvZNGuMkm8ARkCrQ2XxXiwd9EsdYzQJIZXTUIQfeWWV7BB4qb
         gyjTmgir+tpzGh6DdBg2//5kJ1Z4rQnnaraU/tgHpBXG+KogeWPUHaC6YDzTJN1nAruJ
         aEEl7GzlPPpcnVJ3W6RjuarETjsCgdeQx9sjANVkdy+/LSu7PHxOf0qdzkezHvV4htz7
         9yhKSapyAs3N/n9pOReXZymg1RUoyRAEZstj/qy7Pi/wY7ThjeVXBRuo6xuic9SUiV1b
         4lDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790629054; x=1791233854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VERUOQXBp5L44ineuoMQ6cH79KBHk57qqtJbh8GU1Ow=;
        b=xWxst4hncOoa40x/VzWS0b0Ak9GydwhJMPSQNeKB9Wt4mhehWSiSUpUeAfptR1YCJd
         8LUSIXgRxc0PdwhPe5cziX0cfMY9Pe4wQ47hG0/e+00Auca31bUo2CS/OV56CO84Dl5x
         XGx9jwwLNXxQW3h79nUiqPHowo2vlunDSGiaSHXf+WI9lyHAC/kNhzbCzIw8VVqg6CRs
         Qa4V7806BB9aXDcCqWFGS575Ji6Dfzf5u42PZhF5OpNYLcsCIdp7PEV52oKUu1qJB2xp
         1WKTbPEXL+/cIH0aMGFXuyAM4yGzgvHmB5N/rpe7MNq4VcYOb+Kt2mTVYy1pS+tQaCgT
         D1WA==
X-Forwarded-Encrypted: i=1; AKwUvBxH/Z9PhTFcaCp1asVAE/20Lng9XcNaYgUf8mIZzsIQPfO2M6ouKSTeJv87obW6pF2OOQ8u4CRAFqE328W0MA==@lists.infradead.org
X-Gm-Message-State: AFuF++kN/poGfRxGOra5DQ0YWdxzSyWwr3Oi2f1Z3dqKunzzeW+vPdjw
	3PYj5fNdx7ENdNph1REMO6otcIcdsWS8lE+xQ5T6J2NUE90EOdXhgssp
X-Gm-Gg: AYBFou0jRxRX97Gz3pVn1ND/Hzm7lcRqVvGZSttpIE+mhwhfdW5mDcArkAzhCi/p3/F
	40q4Ssf/zQzZYjklig8g382+xm6Fv30N8x8gdc+SVEFxFflRryDpoJenXW1BU8j6idYWIdGVku6
	3MPRRx19ptYBsbulPjKMPAYyL57P6yqcku0hBG7h/+/EZOy18XaBd6eHiHDgCv8+FlffuSEW7FK
	o++WAUeJaoJLBoSO+J18+6zYlYNSyWZ4Ql7bkY2hB5zwk8PqICFbtaDHr281ItPlzb+W8dNzvun
	1PonIDywsm/I2fE2p/YFsbbzNGUTE/ZTnBpYjqWYWnPbYRObV+OYZo8nLc2zsmKCAvEq02GREfl
	EQKkgrksm+TgQOmCXEKq+OQJQQbCmgTmDnb7zty7ft1mQcke7HoImWmSsxovvchAXboWq5GbsL+
	rcJWvzeG/9pxi9vbnOApp/dSv9KIUPAdGkMf8yWv4bKgywpiQefaUCuDTJaqA/9bblmZJDc/Trv
	Jwb2dXBq13PGHEYkCTLTREDArsw26hXcENn51gBfZgqzLGXCBGbFwDKm9pm3MCC0Z6aZa2w3Dc=
X-Received: by 2002:a05:622a:13d1:b0:530:e343:b65a with SMTP id d75a77b69052e-5330b6ac001mr253823481cf.51.1790629054051;
        Mon, 28 Sep 2026 13:57:34 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533223c6d82sm71443421cf.21.2026.09.28.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 13:57:33 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Mon, 28 Sep 2026 15:57:21 -0500
Subject: [PATCH v4 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-3-23533a0d30e3@gmail.com>
References: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
In-Reply-To: <20260928-rbrue-suez-upstreaming-mt6397-auxadc-v4-0-23533a0d30e3@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, mfd@lists.linux.dev, 
 Roman Vivchar <rva333@protonmail.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790629044; l=905;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=7RoUzDOZY1QDhkSdG9ZG4g/IuQvy7fWK/zAReNc1Fzk=;
 b=A6AqE7eu3ncyQ70or985e3ODrK8FHn79n9oI/zJvG4E8nupeafb2sik3BBKjwJARUxbfOYIEG
 cbE3E3gNJVsBZowBHGPEj6IcOlHtEOy4pJejW+IVae1ULrZIHdD/kjd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_135735_358482_DB2390A8 
X-CRM114-Status: GOOD (  12.32  )
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

The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
devices array to allow the corresponding driver to probe using compatible
string.

Assisted-by: LLM
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/mfd/mt6397-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 9ec951996588..5d5f816492aa 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
 
 static const struct mfd_cell mt6397_devs[] = {
 	{
+		.name = "mt6397-auxadc",
+		.of_compatible = "mediatek,mt6397-auxadc",
+	}, {
 		.name = "mt6397-rtc",
 		.num_resources = ARRAY_SIZE(mt6397_rtc_resources),
 		.resources = mt6397_rtc_resources,

-- 
2.55.0


