Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A308ECA5FFC
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 20:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=; b=RlGgbxwVgtxC2i2PrdL226kXmh
	1YPc+28aywcVTpqF3zxvnyfmJm23GdW50zlj+R6+Fw+FV3b8nhOnfVgiRLG3Yoj/c59dt0cvfb3Xg
	wv7h+BnKwAmtUZfr5r1EL63i8MXe/GoDQ26kaQ4srrNCNpbU5P74YvL8Y7ynpEVDUtq6URQaV57Ks
	v8dDbZmBGHoYwOYJ7fGQgpDx+8PT2TD//dg+ZBb30Wy/3dfXwhfIOxTz/rJS2vVwSGcC3B14Gdb47
	FAlQZBEMIyiMZMti8TR7JTh9icyJdBKwts6XmKFVQ5Gz5KKWsu00iLW47bkDiywCzNP3tLSMP9TyK
	DIiwFHHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjX-00000001MRO-1s9I;
	Tue, 06 Oct 2026 20:25:55 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjO-00000001MLs-38Wa
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:48 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-82380b0f55dso559426a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 13:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318346; x=1791923146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=;
        b=fNGpBJCm4odjtkQgmTEQDvZ+ZmYH52GVxWvG3HIZ+a6HUOjh/E5OI+mNPVHOXsbTlq
         v3E/6/HmPTf7sHSl7USmJfEujpingr0r6O33scC/ICDPoivr7tsIq3/Xw0OIIkyZr3xp
         yUOfPUdR46HKYXA1EcAERvniq5uTVEvWzRjGVlP8g5GWZZytgsp83nGDNB6a8lcqnNKA
         z3jcVhfEFT5L5ohYs/qa2vE0B4dTr7TGn7s9Y3zStWE9g7IDZGwbjy86hm26h9FSaasg
         wSjgmdGmcA5xSzbVOBi95ByFpxwrLc8ZmpRwIToSC8hTC8gDM0+iey+IgtFoGplEGs1g
         yhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318346; x=1791923146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuMJ7m5Vcv+rXpqn/K7pApUYeSmPWZZlEhNlSrC3ot4=;
        b=l+8C8OGm6O91Ac1LK7qyovhg0K/kQpY5ztqFKsP2QdqGa2Hu5X27syOaI8fyf+7Sq6
         VqGVtKNh5i+PiMGrWCnzfZo/+qnDa8amzasvXBHU0B1ULufmKX5CjSYSddZCH9slHGTR
         J80HjUr4AoQoI7Mn+e3Ofw17rhDkaWzlqgkJA6eIJ3jt8taJK4VXQY7/P8UBOHtt6W0B
         lYYkNS8TXb15ovIiKy1sONgevcvF/ddVJmeUGeGhXzaU085NOri/qiDDTCRPeUR+DsG4
         uZATgLirh+J6y42YEcGrkG0EcM5FEnLRWDcWMqZY+5TCs6T6Dcb/6RqKINSZH3JN01Wr
         ayfw==
X-Forwarded-Encrypted: i=1; AKwUvBxWWzTP22h9bMf5R0nfF86IhgzeCIejZ3Ecl3gfemYy+UnybTWMk+smOxnYemtmEMvqaAprQ6bAjlmqTP1B4Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kVjVWkIBMGopHG7wzC7n+XSl9rjKZFmuCeYYW3HCW3Ya5eJGJt
	4cpIFiDnE88SmjrQLaE+yla9AWCoybsu9hKo/e6kxoRZmHWkji3oZT8UJadHLsi4xzs=
X-Gm-Gg: AYBFou2zePh36M4Vo/AUQmwTVkW7NMSO82kAu6KPK3gS7Ym4ujEsmVBh85HZmyLK5ww
	5836dok0MH/IRW5uzHb2nHQQXZh2/QkIQOihwztyMojQZZzOxlLGBTWtQLHWd1qoxCGnvTLyfos
	sYbpBsxWq6XxqAeSgGT/ZqAw7bXAqvbvvWuH5cTvbsWHVqi/Vq74o9EjIam3fuBtK3CcdTb3Rv8
	LHL7eG481J7DByV3pFeHBUciG6EJmAhnhPLxkeH4hslTzyC8ibUeZ02tyJFnHy8r3tmbaB71gW+
	i7QnXgFbbb5MqdsalzBsJhEWaywbLFEp98cBRhxdqoHfx+UlMKuc1IOkeO/9UGW9GFnfGCtJZN6
	wPPtozN89l1aJVp8pUJFBep5bbRy35TVhuvKvURDV2UftEgek6PEkWNDgeyhhIAk9WfGZmsGns8
	l5Fj7NMFjDhAVspH3OegF3hIXPCaO6xWCTHIYMtkmcHnDFaFZ0W9/h/TG0bgfpnbEp1z5M7WosJ
	w==
X-Received: by 2002:a05:6820:1996:b0:6df:961a:af2f with SMTP id 006d021491bc7-6e7ac5151d7mr253655eaf.85.1791318345779;
        Tue, 06 Oct 2026 13:25:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:45 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 06 Oct 2026 15:25:02 -0500
Subject: [PATCH 2/4] drm/panel: himax-hx8279: add the VDDP supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-2-50d884b42aae@baylibre.com>
References: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
In-Reply-To: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NyTgz/hgDxQKSuA5Ck4SyFt9fR3sfL/MexR3R/H3dxg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVksNR5t/ywYjewlDcdi0ghHLOdJJIGqzYu4S
 0FRGFjsMxSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZLAAKCRDCzCAB/wGP
 wCSBB/4nAAPLD1Yv3Td1SgrZyG8pm0J+BxnvcD4ztUnuid/60B8XkFmMjr6FQkqLK1d/baXFatE
 cbGI8eGxXtN9EELfUFzkaiI6pbFo9vOfFbKfurBWmbBbZqfRPcn2p1P/KwOT8e9ERwN3pJBgDtw
 IJnA7ofvPQwKGq+hg/++URBXqdhW+mxUBDmxQ5lrxAKGaRxYsDnjzMf9aLhuEGGceSHp46P1zX7
 guK6fHdEksNWYX+mLcopg1bP6zp2KmcaUalp9b1hlPC3s2Xtoq75Qas1m+fWyast2NbbU+XFCNI
 OcROe3ts3gEeZSCMkm8yhiT4SXC0JamLJMaY4PxVT7cnbLG/
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132546_804790_259B4FE8 
X-CRM114-Status: GOOD (  12.46  )
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

Get and enable the vddp-supply along with VDD and IOVCC.

The Startek KD070FHFID078 panel has a VDDP power input, which the
MediaTek Genio 520 and 720 EVKs switch with a regulator of its own, so
the driver has to enable it for the panel to be powered on those boards.

On boards that do not describe vddp-supply, the regulator core provides
a dummy regulator, so they only see a "using dummy regulator" message.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8279.c b/drivers/gpu/drm/panel/panel-himax-hx8279.c
index 9e443c719843..fe665cd3a3d2 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8279.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8279.c
@@ -112,7 +112,7 @@
 struct hx8279 {
 	struct drm_panel panel;
 	struct mipi_dsi_device *dsi[2];
-	struct regulator_bulk_data vregs[2];
+	struct regulator_bulk_data vregs[3];
 	struct gpio_desc *enable_gpio;
 	struct gpio_desc *reset_gpio;
 	const struct hx8279_panel_desc *desc;
@@ -769,6 +769,7 @@ static int hx8279_init_vregs(struct hx8279 *hx, struct device *dev)
 
 	hx->vregs[0].supply = "vdd";
 	hx->vregs[1].supply = "iovcc";
+	hx->vregs[2].supply = "vddp";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(hx->vregs),
 				      hx->vregs);
 	if (ret < 0)

-- 
2.53.0


