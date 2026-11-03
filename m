Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124DA606A33A
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jkRSCVL1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DT7TUbq8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=; b=jkRSCVL1HeX1Gz
	VBrWlIEUQrHjlVjfdZdRStKlZ0QeX5v0Lmd9T3zZN1heinm4IiZpfo4H3/HORtrGvTzJnXHLbVtga
	n+RdLos6XPWNaVkN4la52KqyI7Xp87XOUeMm0K5GAPwy8SZEzUi1Kn7icvuhQ8G/j7s6SfqELax/f
	+e9WOdt2zUfdrS+RKojRJ9lfiyCnzJC5XG+djaEBD8dgJf8JwltiwUYhSDhy6+wU3BBxxM3zH4eOM
	RoNLhMofE27xa7UFnTXoqXYhA+uiGfE7Gl4z82tgUwS2E5HefWxEhNzBcSasNrWAgC/ed4CIWwwRk
	lcrXQ6iH1m8qo0v83uHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98I-00000001Lef-3JWo;
	Tue, 03 Nov 2026 07:40:38 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO987-00000001LWe-3V1s
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:37 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-cc4dbda1e5dso1294540a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691627; x=1794296427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=DT7TUbq812wDbpsm5ZVcIZCeltOQuztKPegynw0L7Y0SJfJKgN5X9visz+TBTXvdNr
         ahJ3k6MNrcdwErXNAhpLIdyjpd3eP9JPNOZFnTb4gGOSfn9fqDiHqHywRTPz8zvPkjWp
         LQUVjqR/Anuape6W7cL/70F3A8x86UIvM4CE8LaBiGh6sed4JLmNA9TAoy/zy8EohiM/
         oPtRYihZhJPg/FndelFI4PrfUFxWph/3B7UJP1T/4wPQw9JoTCWGvF67NVHNrXVwQFDS
         8+POo5u+1QdMejkggwakl4ZsnaQ+0thC2vfwTf+WKJ2Qt6KvzMfIdWVeS+Mrup1rA++r
         d3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691627; x=1794296427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=bIGyIUviucHL66KEicLyoYJg8uAyf3SSe80r8SeUuDSjGD2AJ1KmNBbgF/ilgDNpkD
         QircHL7JjVcO+1P/dGfeJVG/iJ/kf7BDYng7NjYVNv8mzeHbS1BoTu4iT0RRRWGaweVI
         ensIG0E53ffTOoS2ZWCkTniA2ZAw3fLJR5zP8uExt2YUXvqVBlKtwgPPiTYv0Civkwbx
         oXGtq5V3TfwINYIq1ckftZJeiRJFoZJ/IiGoga2MgMh/DBqEvGTbLP2SAas/zZlifPgz
         n1+aqbL0qW0dtsXJmSUUX7fnEswUUL+F9YLEOFYFhrHWivQobYagP3z7yiLZZPucPzN5
         iwkg==
X-Forwarded-Encrypted: i=1; AKwUvByBHPjY3nSLsBE3YNat27wVw7ZHzmGQOpe1KoUSEybYA+fOZUyP15xpX36QiqyK9seiG1Rk+EXlFKToQw9XEw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9ldOYTvUqWNA+9wXbw++rTKVw2OGsdHAJ4fjqdKxy73p32HrMI
	fjCBdRUd5zLip/cFHG/XBard/fK91zmjvaV6SEZYdNlNkY4lzs5GUOFUZXMexQ==
X-Gm-Gg: AYBFou0NoEMDXZ0NoSSXK6eN2Ry2Oq57TCRJPWDqSz8kidSdw0X4xxQodpkq6snrao2
	ND3bGuBHMGEIgE6PruoZzQC3otyMamn1MjPoMbj0EZZHfzDolGlAW8o0Sfy9MA95N1CFodf1BNe
	7B2X3SgVQ9TWIBQdyCBjRqPcJUbJt/PXdI6q0orN4aqdHwC+lRr6wa9WeULWExlWUwcPQjPRaYV
	TiR460ivYzXJA25wUZ/6jO1YNCkCDGOYccy9oeo+0gWXISvJi5Ka6D8KrQizuHc3EzOxppzcXeF
	zrAuX29GyPajMP5w46erDVErdiZk/Qxx0jlPMHloJs7y+R72uNeeUJRzmWiyPEdNtEfYp1X5z3M
	3gNYDEq/Xs/siWABhu2Ul6qo5RsMuMGrSSR8F+LuGkOOxU4P9bseN7O/mfQRMDPohB3JNkonuZf
	rYoslh1nmh3cwbY7BSM77fUUvq8ZgoNNDVpTqUQopAdX4admaCltRSGH9GzT3U87s8Q4JZZxuo0
	8uaqE+zmd6Km5js9yyQcwnKF1bPy0428sZFadZgOpYlMuk4AMM6OYZV+AwgYzZqB2oYzpBAv+IZ
	zhsVbLHeTDuuZVxyfEgqPByviFQroh4Ycqg8OZm6Pr5ZypthLqFViVon+pqo2iBMymv/n/ql3Oc
	7kS7SFPiu89grkBCYomtU7ir5rU09sFd+AYnATA44LIJci5wL3qx0j9qhpTmnEqjRrxUYfxgIlc
	ZjRSs=
X-Received: by 2002:a17:90b:35c6:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ae89536bdbmr10927084a91.4.1793691627024;
        Mon, 02 Nov 2026 23:40:27 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:50 +1000
Subject: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-2-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ryTg7qu92xHmjo1HEk78arPtD12ewJvnTCmnNMpKI2c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+GpzjrzeRvYWVum1gj5HNzyuvK1hVdiudFLu8N0
 n3S1ebdMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoLSxgZrl/hNrrKf2TVhzo7z237FA8e3jH3Nf/qtR/St39hfNBQ0sHwV3TNTE5
 f7x852/mjXWfWXk/xiHl+5AhnQ2rTYwn9Iv0OLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234029_541083_E130F71B 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Allow this by refrencing
dai-common.yaml and allowing its properties to be used.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..4ac0af34c464 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description:
   The CS42L42 is a low-power audio codec designed for portable applications.
   It provides a high-dynamic range, stereo DAC for audio playback and a mono
@@ -193,7 +196,7 @@ required:
   - VL-supply
   - VA-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0


