Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D3DCD129C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORjGCzH/z+0lccA7K6wZO54EFsOktZ+W05TnMMd8cIg=; b=1Fbk1rOK4uoWh3GiakPlB5GGN9
	luuttKTWTJeGFE8pQhVtXn4Eb0KnBPJ66SbUf7vZX7/sma5r2CXP+1ZdKLWwACUXeh30d8n2WBn92
	Hfz8V++Y4QufJ30JFK1Dciw+ZrBhZXV0G8PcagssUgrnTMOGTtLtr4myW/pUvN4HHUClBhmuFobKA
	08RLtOvlTAj+KEBeMklOZsD+UXQMsrdkRHEthYOcmGpglpMStEwQotCtQZVj9jXtQ8mBeY+Vw2pgM
	2av/0tNi/zW+msdOlGt1eOwaoo3WwUk6zgvXgKqmDu19mBIY2YYFZ6Q2HFGQjqNaL6snrohgDVH32
	9enVtMnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9TJ-00000001cHD-4BsG;
	Tue, 09 Apr 2024 11:17:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8U8-00000001NUh-2dt6
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:13:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-416b7f372b3so592115e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657626; x=1713262426; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORjGCzH/z+0lccA7K6wZO54EFsOktZ+W05TnMMd8cIg=;
        b=IU2WLH5wqOll8tZm24SVJPKv+n2ue1UAlsbizcqSXnho/GReMEvUkG60gSsdevk5em
         dRL17k2VuRLSjAAarMkxXuLx9V6NzvIbhxTBFTGauE29Q4dI3A2vVyvpb+L8PRh/yNfI
         lB9mbChyvUNVlWSRLnq0huC4bRUYUoWsLjtj7bPUGWzFm6XeMOpy9NnaQyiyVobsmU8C
         70rOrP31YebwAlZsif/e1XBXRbRJK4krWo9CI30xilINGYT72ZXEWPLN3Ye1Bwk1uBVl
         k3Qd5OdqZbxfDh+Qr6f09r4v9ZruVtvzCZBTqE4gvc4wfTFPXYghj12+DV0WXqDAaxRp
         x8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657626; x=1713262426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ORjGCzH/z+0lccA7K6wZO54EFsOktZ+W05TnMMd8cIg=;
        b=HdyPlssN1yx5YYcw9Doda6UF3QoD1Cq8RbqG4KILGF1fLKaOW5mJYS4P5U4gRu3e8T
         eVOrEdsGCvGqBj8gYadiftKX/HWynEG7fuGDL47vKdwXbrIM3cwEMeF0kA+VmXFdwuyG
         76FkKa9jKjGLnmqzUumnKK+rfyrjBSWx+ntHGSI4nzHNxRo2hR1DkHuyZJ0lz/PsxKhS
         M6X8SLy0tm4d0IFQB7ciXIEek5vjnaM3R09GaqsCG0G6bNCiTpUnW2HMXCSH0XILqQOQ
         sYDt4fquqaRJL+z8EdQS5hQnJvyJNc8VOwS0n1FyJDz4QfJ1D4YYFNbuB9GHSiPCuihb
         73HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ebETHaV4/IM08QdifSNbHJ/OxNMWiwicDiMaHcRT8yS19WMUs0X5/0nIe0Cigh1mDe/KNuCN56+/bm11ptm4bcDhlA/mN9dDKY9ldOALHy7R
X-Gm-Message-State: AOJu0Yw9KbZhj9zMC8jmYSgDUEW1wePNi3zUY+4kUcgPGvDopkeSAqU2
	u0ndHdPMU+l/DWwlhzpQtPeisYhThzdqngDJkib5NYEE7QetgWwZRT32AHYEFtw=
X-Google-Smtp-Source: AGHT+IEsJPu/054QzozXEcR3cAKbGmgbpg6X8FhQfUnUAHkjL52ZMV/yQQbc2f2sdvpHT1vGB9wzLA==
X-Received: by 2002:a05:600c:350c:b0:416:667d:4691 with SMTP id h12-20020a05600c350c00b00416667d4691mr4530196wmq.25.1712657626644;
        Tue, 09 Apr 2024 03:13:46 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:13:46 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:25 +0200
Subject: [PATCH v2 04/18] ASoC: dt-bindings: mt6357: Add audio codec
 document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-4-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ufC03TRzyDk5YR8DEBKesMFjVbHSKso6JjQ31AKWDaQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTTFKmit1LRHBjD3sVBNy1AD+EFSPxUwuPh5hBL
 llo/QJCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURRLrD/
 0UItyg9zwrmDQpm/gbTeRtQNNsOjxAl8PQIWG8EqnsHgcHKNZrT5vEhV+q6JscmsLBfKi1MnE3f3HX
 t2UyIjSKZTzyYdGRsCJEqMicDSryyY7IckznV0K7tVh8PNPNcCAtcS5y0BswhRRY/MsqEscAGm4X9Q
 0xfJfWpCXqVnfEz35io+YGQYh1pNdw+Sua5QmPXzWAJrd2ZMadxK6f6rjLEVPTjIrq16VYfEJuIlq3
 PPr/0cJx5AYi/70kI6NW1qds/TkjhJHMhcyVzG0yI6f2QGmhlru4byON2sRKKnoy/SKeqI7UJxW2bd
 ssbzSx4dxbtlzGwy0bFGjL9X5m3EN4oYAP5UTd5xR8pyG16Orv+/tLJaLX4dFEzkqtdCZXgnlY9Gki
 B4ohzq/yeLtxcLfZQwiIegbQWxTVOAxHIP+Q4uPLxCYD+FR/ZHVlVEbJ6QCmpK+sOGRzqiBv0kqY1C
 MUT1f6xaRnTvjkx3EfDKaXGUUV1sv71+gHTlrMz7q3gKyVaRHH6zYSWfIRD2PrzRfiZ66J5SU7IMxc
 FyKZHs9k/OWQ0E5jN0npkOcn0mqcrZ6iFWA1qK6xhyHu+61Xa6DKEkM6YcMLUQYwtP3/6o+JsQYnuN
 8a4gQu4guSBQODpZf9+jzZFOd1nf7gCoacIRWppbgdHhnfS9tvBXBVOcVI/A==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_031348_806909_2BA91AC8 
X-CRM114-Status: GOOD (  14.21  )
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

Add MT8365 audio codec bindings to set required
and optional voltage properties between the codec and the board.
The properties are:
- phandle of the requiered power supply.
- Setup of microphone bias voltage.
- Setup of the speaker pin pull-down.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../devicetree/bindings/sound/mt6357.yaml          | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt6357.yaml b/Documentation/devicetree/bindings/sound/mt6357.yaml
new file mode 100644
index 000000000000..f532a9e7dff5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6357.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6357.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6357 Codec
+
+maintainers:
+  - Alexandre Mergnat <amergnat@baylibre.com>
+
+description: |
+  This is the required and optional voltage properties for this subdevice.
+  The communication between MT6357 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+  vaud28-supply:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: 2.8 volt supply for the audio codec
+
+  mediatek,hp-pull-down:
+    description:
+      Earphone driver positive output stage short to
+      the audio reference ground.
+    type: boolean
+
+  mediatek,micbias0-microvolt:
+    description: Selects MIC Bias 0 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+  mediatek,micbias1-microvolt:
+    description: Selects MIC Bias 1 output voltage.
+    enum: [1700000, 1800000, 1900000, 2000000,
+           2100000, 2500000, 2600000, 2700000]
+    default: 1700000
+
+required:
+  - vaud28-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        vaud28-supply = <&mt6357_vaud28_reg>;
+        mediatek,micbias0-microvolt = <1900000>;
+        mediatek,micbias1-microvolt = <1700000>;
+    };
+
+...

-- 
2.25.1


