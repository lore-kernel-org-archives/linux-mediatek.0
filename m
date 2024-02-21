Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26F8C48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Feb 2024 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGszybDShMhaNAGR4ySRJN3naBbuC1XXSNLMe7bzTxk=; b=wemUZbmYaF14hRvz3kSBiKCCmu
	rQl7K8ILC6LWfLL0nGPSuQsaMmkEUGw7LkeHOsuPxJ4fF+W2Wbl8a4hMYSwfdeJvcYHKZZj938GBm
	j2siX9gr/tqeAx6GxjPQjUQ6OQ3Kjgf4+ZSqqtjt1/bJWIvJQekx5OQ9nUi5MpOKtNh7CeHGRjn1d
	g3VUia1b42VuL/GRBeRu+GGvY46/AqivusjIFAVAnXc/iIvvXB76MCYTOeOvHFVSGFteE4AlDJCJb
	QGmtBFN5Z+pIrcaJvaEwQXOBhpVjXZgGVapWdYH92ZgqepiTO5ruO4GYDYsSxOIvtV6zKIGGomKQ2
	/GcNo5mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9N-0000000HVhR-1fuf;
	Wed, 21 Feb 2024 07:36:17 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rch9D-0000000HVae-0fkt;
	Wed, 21 Feb 2024 07:36:08 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d22fa5c822so46543151fa.2;
        Tue, 20 Feb 2024 23:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708500965; x=1709105765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGszybDShMhaNAGR4ySRJN3naBbuC1XXSNLMe7bzTxk=;
        b=KWCh6TtAFmocIzIZFWPrOIcJnClLVCTCKRA7SgsN/vxcsQ56HG9sr4Avw43og722Fy
         AraU4OMpDliRrFAr6C3iEzmu9ldbIseNN45I4A4aDt3EYibaU+q7yC7ZCsdtpQ1quQVC
         PeKzU/55JSJui3R5Yf3ZGTO6RRF34w6G8yQazQab0jOHB+fTh0foJb2cKOJsR696RkjF
         fN8+/3lag2JDIC8UPhjzv9Z5LICeXPjtzjLWNMwm9rHZT9NTJ43xRcqezxyOmvfa82HQ
         Q/6t5wu4G4/meE7LLBxansSngn7yqO/10qE3JP8iAHRd0kDzPYRo66tS99+nMOJwq+zW
         050A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708500965; x=1709105765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGszybDShMhaNAGR4ySRJN3naBbuC1XXSNLMe7bzTxk=;
        b=p+925qgVtWjERVwOFSiARHdZ1YLOywCP8/AbYze9Z7YZ96TAm5egjhcMvXr/51KvFi
         J7YU+tMbYBDwzX/jpc6QqH1M80hXrjcpd8XszHaH3jjstEA7SqX0A9OgOVa0qoOw5um9
         XDcrEwnH3Vyzrl8UNzcVt62tTgxCsBlSUNXfJr7KoBmOiBd6n5R8K2KVvIKbWPSmqItW
         Oj4oXxK/xWeIOJqqHd4fAnMr3fJspqocZ328tluoLSoo0SrDg6U1nwbYas/QlPb2CeBz
         Mnk1C+qsBI9RJG91vK0vLwpp7YlJrbbMKvnfvSWPNK4ZrjY2FDFgzZJkausfG/qJWOhy
         8pUw==
X-Forwarded-Encrypted: i=1; AJvYcCVC7nDRrjI9WQsRmkCsOJ/ur8QrHtSYqtjpxP41/V0qfs2tdR9WtdPpfHnaFdNDuqht1cEiFyVIUjfIhKr5tAqJQczENkcbb+wh10IGQH/JO6OYqBeunBapLE78lgDI3XuFZV8J1f+roBbMH/rnm//lWTD2aH95hJc=
X-Gm-Message-State: AOJu0YxjIid/dWN+K3WRsnpW+QEyPtxfMYLcvaa/DL7qblOslvu2lWZD
	wR2da2av/5SBtK4rJFWGSX8+2ZObWeVso7/kixcVs+LHQ4HXx22+
X-Google-Smtp-Source: AGHT+IEpDpUFtOBVRxAziPmxL4BsaHXTCxebYbK1exwOUJPejgWUwRRCbEDLbdQydsLRZ1dJd1tQCQ==
X-Received: by 2002:a05:651c:1a24:b0:2d2:396d:66f1 with SMTP id by36-20020a05651c1a2400b002d2396d66f1mr8456718ljb.47.1708500965056;
        Tue, 20 Feb 2024 23:36:05 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id z3-20020a2e7e03000000b002d0f99a7fc4sm1722330ljc.79.2024.02.20.23.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 23:36:04 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add Cudy
Date: Wed, 21 Feb 2024 08:35:21 +0100
Message-Id: <20240221073524.20947-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240221073524.20947-1-zajec5@gmail.com>
References: <20240221073524.20947-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_233607_224080_3A062135 
X-CRM114-Status: GOOD (  10.79  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy is a Chinese company providing networking products.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2dbcdc5f5d7d..cb4dd176bf41 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -332,6 +332,8 @@ patternProperties:
     description: Czech Technical University in Prague
   "^cubietech,.*":
     description: Cubietech, Ltd.
+  "^cudy,.*":
+    description: Shenzhen Cudy Technology Co., Ltd.
   "^cui,.*":
     description: CUI Devices
   "^cypress,.*":
-- 
2.35.3


