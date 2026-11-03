Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FCB606A33B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dI6pCsS3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hQ0oszHL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=; b=dI6pCsS3DppQnj
	onwgnSVQntRIeiIU/ccPzuFjkywa2WlGRZujpXV4yc/LCMbZ4/lExiJK5nefq6WsPFMvrR4sDfNha
	qGb6LqYQ4WnDYn8pJoK4402scRpq+imhBPVHhNf80nwTadHDUU865EreHfRPYwhBbPQSf3sK/Nk05
	N86gbhN9+PRXdcYeAdgOWSs9CbrkXPRhGVUMg7JTKJVaRdyDoH3b5RCqOesXJ0ruQ9qHUmhFHlUNi
	aA7qisUUwEgtMw58Q6hJI68/Nq9c/nREIm60bYwHkHbC4L+686Aa+ZbL4nBPgmHK1ZoMtiQ27s4on
	vl0grcaRbnIT32Z0PrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO985-00000001LWa-2ZT6;
	Tue, 03 Nov 2026 07:40:28 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO97z-00000001LUr-1lxR
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so701835a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691618; x=1794296418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=hQ0oszHLUAPpbgBGc7MupgWlASo/pNVZheQuW7EU45K5BbJwRin+hP+To3ArWgvPn+
         pJ1PrvFE3BDBMVTmNFb3MIKspgj86kdncm6uk/+0fMULNBj07fibSXZq1fAFVX3vAdvF
         tW8T/WS2gfTOUv4zJ58cDdmOwsM9CPrCnOvgAksCm8TpbDlF+u0q+va20A79Dbn0+4BM
         22voNfJSdXaDEva7Sji3JFfNjOi3bvlMR/ScwbypyFV1LX5m8W7+GcuubnLVUTXPhSgs
         tiKABx4AVzPV6pTARCM3FrLxZ+4VldjHczlr3aLhpMkx/O6b36ZvH+vf4YF2M8We1jKx
         cQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691618; x=1794296418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=0TOCufKWUKCo5dN+QLtuDpkdo95BtfR/5B37ymD93KQ8Zb0wm12lq3BBvhA+FO5Dic
         uX2CdAHuq8MKF6XgpTIh+jeZI+gjwkvqzQlNo1KKYT4x0Le+gXn/+VyODfdbnC2aXraF
         m1diPAfwhViE6ZFW7Sx7x396xgoElJqc76Fc9UuHV4iCOcLuEh0kgQU1GhTKY/WWcMzO
         iybJHnRwo3a0IIUJGzkdrWFthqkIb2Ts0/xNaLzO6XZcJ5LNGZzgEsoVgD2U7HSg1C4D
         2AcGDcs63o8lM+MtYpojXwero38hiPBbKNJjuEDA4C3uMPaerJyt3zWywe5Fu5/ZN/sf
         IDBA==
X-Forwarded-Encrypted: i=1; AKwUvBylwwfTutKfK9V/M40NNt3uIc7zEiBW3VhcL3/ypC2gypkzY/qZ/DhSjKjjTXcef1nZkNF29O6GqHEggADwJA==@lists.infradead.org
X-Gm-Message-State: APuU4Z9PKGrE2y3cN8IeJSPWY7/08/jtaJOiDdyzWSPm58ST5Ce32kWS
	iFt9WMCBHLGHnXf7rBY1qhFuMy0twPw4Ctgt+9PRPG3A6KDjvb96GMmI
X-Gm-Gg: AYBFou2q+hxqSt3H3542HziQeg3UqlezERFEgVg9FCefuBG7UVfOn3s1fejGkqEANZi
	2A9cy4TQWUj6MA9NYUX2AJtFfBPXO1snWyezqOrXhaY2HwFeLiOUkiYJY/GLRu9WKdmWLO9ohDO
	fgN3LT2BMJ4g/Gva9cEyD5eOElKdQbpOsyvOSnwKcHBuOjlQayciMPBpkh3+4OMr0KUBjOh8WBI
	tACQRoS3h45Nm7Du3emeHp6peKbtMhsoVFKcpS4zeUCghI/Dtct0clnWy3w0GnNQoPVME6dn/s9
	QPoBvnRYSQWyVyvMlcAs9E8iJzkVmvVRxL7m3YLMwI2YwO+lKkm8d67HeU1KC6cU7WQSCu3ACvk
	3weHuY9kWUHVMUvrbHOEeU1n0NO7nUdH+PadU+L5Vq6kXiXlBnzFkUy3mB3YT0fLOrt7HTBbPJi
	WIw/PVb2WQ+xKBTyEiJ9+Wy1Fjw81UNZVT8rPYuSQNexn4IS8aMDqdnw6LtkEHVY4FBIgYATaDh
	ZKiUyYSpUvnP0aevQDBCweC56edZ0PD/PpHRLjtKoiKLC7JrK54OxoWXUW90MQ6zj+l58AvxGjo
	sSJA5wwdr7CyxTygtF2YPB3fFtH58SbCd4hWsP6qy5STDrOfV9hfUakpBj91mGfEyWUf1//U3vU
	vij52ImNP8guYfr1C1uYOoInjP8xuegQ1/lzl1OKVWdaYNuwcsiWzuvTvwJBEljz1Zm8Zpn/MJM
	YETIE=
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr9681387a91.29.1793691618392;
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:49 +1000
Subject: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
 dai-common properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-1-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fSXLE44RdgYerdaSvSI97z5S0Urixj0efXODzvWnMbw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+uzimxE9rIuctleWOHd6XpBtbrKs2M2dzt87ke7
 DI/p5jTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr3DQz/02ICznJcm/+k9ciposevG2vm7L/yXF3ud8sENTubx31fbBkZVsRWc1z
 fEHvLY2916xEr702FD3vrZ8gFMXfwbnqoa3eJHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234019_466334_D3F9C286 
X-CRM114-Status: GOOD (  10.29  )
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

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many and set #sound-dai-cells. Allow
this by allowing referenced properties from dai-common.yaml.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..66cae8b7db5d 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -29,14 +32,11 @@ properties:
   interrupts:
     maxItems: 1
 
-  '#sound-dai-cells':
-    const: 0
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0


