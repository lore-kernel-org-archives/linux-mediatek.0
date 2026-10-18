Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF1BCCF2C4
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Oct 2026 05:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=; b=ADdZJebf6D3lNzzUlKBmCOxKJg
	Ppv7Hr4q0B31ZDlWYockuD6jg+iAKGY8FsWtJzQLQQKPeZBBlZpGavRZ9ER2NlAcqPLPkocMP9oXo
	fvYglnQz1+sDi7Fv0eyKoVNSPXHdWiBzQYJwYXSUZSiYf0xknNxte/aROkxtXZ+UH+vl/a0612hXq
	mput6eoZ7vs5yyuNqEr0sqULHiv1zHE0HS7Quor16RwukOPAP5sv98JVoxG+nNDSk+z9zPrOzk2c5
	iU+7QM4wcCXORqJ24Gk9u9o8+ruvV1A+h6OE6rU32qIEjY0oPKWR8mA+fbChCGPXAJ/uUjd3Rmka9
	oXZxFRMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrC-00000005ZXc-2znz;
	Sun, 18 Oct 2026 05:54:54 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIJrA-00000005ZVQ-1WDe
	for linux-mediatek@lists.infradead.org;
	Sun, 18 Oct 2026 05:54:53 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso656778a91.1
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Oct 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302891; x=1792907691; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=DSVg4WIIEEgr7K1f/xCV6wRMX5x7I5IJWu91Gmcl4cxgtTfUlEi7+qMeeBWQN9yfki
         AvHmwrPAyh+nBzTivKn8o/MK5MffCDWt8Lsnx96ZSEhaq5tA/AOH1uRb1B9VPuPIwxVl
         Ga1NNP53Vae77/PDP9IZSGm0zzNPVtONNUyHbx697NzmXoNA8hL890QVSQ2s3FcRP7uT
         VRqzNZF3YuS5ilUIAzKXXmMLFNwsHs+sSnutFRofURrDw4R3fLrSfMLUkpv2vg4fXzM9
         MstivmYC+esEpHMdXMC4aU+0OJbDQosZM3JGGRXtDoQuVI/HwMgXO0ZAVirjQH9aup8W
         C6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302891; x=1792907691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=IOhkDzaAYb6kYqQr3Up3VuYkIbLLHxQP7s1Xf6WezQ0fsvLXgD/Glbv8TIHAyr2m5x
         1I5Krp99o5dNZwUCt7F4BeRQRqvjnbmJwL/FsVVzQdLBd4jrrcJZ29yXMC2mgwbLkIhG
         X0L9qHPXGHTJO91lnUxfRN3gN5Ycxm8TLgaL+ZYcxe6+7xmWrrqi/ioAOkZQLPnOdvdM
         TMxvjKZCbYMSgEWTeQAucqhzr6Y+OIWTls96CgH73sA3zAJYhTHZXP4MOxaFdBBRPvcq
         YLCxWbcVT1OwRTj7/R3GqwbBIQTQ6yvQgWRWZqz9OkIf1SoBDE5wp1UQgOq/GZwOIQ8T
         VgNQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9IX0uRT8gtLg2xSzmpCHmw0DDz65NjLx+qcbrGC0LFYLGn1QfEYizXRmu3j83fZ0zKnPU+r51GIkR0IVGlg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJSlbi9SsIlJYh9pomw4/r807dLdbYSAXycqnwgEfC+dgkp2/H/
	g64UwBP9skNUlPKYESVx/gSePBGwXupqMxHl5vX4dL0f5Nj6LvzXWPuE
X-Gm-Gg: AYBFou0hWbsBPBoGKIusY7Vfsjb7KIGsAL/dHnwXgXGatqq44+ZmfM4/dhRV7fNEVFJ
	wYi6IexkTtchKHs19EjIapUJANKHQyPxKbFUSqSYYjPRz3MuXs0A+a5EEiGbc9Hm1Q/puFsvEdz
	nb/mlRj5Wb0NozIB5LdFEN+e58IvEfXYYTFbqgzPBESBxjeS2o7+E6zW0X82QpF4gX6jaf3G2F4
	JCQloGJDZwBxGjwxFf9KZp5JGvYAdpKhKBS5aIGZvJ/Y9VBzZlHcJwtvl45gel+/2X6AY1l+Z5V
	PlgaebiyPdl2UAJFoXnV0diBMuHAA1qDa9xZKeIFuqSU41lRQKPZ4+/IyoXdVPsfXKuWIB3AOmB
	zZEZGoaj+vARbu5+4vrWC0uDQFKM3wT+RMvjrU6sSaXuX3wLnY0tFS7bGHw9DmuU7Smxnel1cz/
	5v7NLTd8d3DYo7hwkk+wAVIW9q/oHMqGipdMoqRkTJWGjqU4eBRBq38hGCr8EOYW+5QI9apcZXh
	zTFncuEbsi9Ko5bc/KDirQkduI7z01MBb3siZ2e86oppDtYy0LQCu4z9l/YqWq0qn2o2HPuNVmN
	STGNiSLjutrlXz1GEbyWS78J/S83deAMwfZyw80ebNbbEg==
X-Received: by 2002:a17:90b:58d0:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3acef4fecf6mr3732599a91.44.1792302891525;
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:56 +1000
Subject: [PATCH v3 02/21] ASoC: dt-bindings: cs42l42: Document additional
 dai-common properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5IK2m6ZAqwOkwCJ6kC825xvIJPDhLKuUDHcpYolWipk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rlTeKpVfv6wUL6uLDBT3M/t/rxVmzZdc+bY0etwM
 WGyWP2BjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTvjGFkOC4T3xDivMi+Xp+N9cutX7f53geaWFz59lmMK0t9j0zUWoZ/Ju+z2xn
 DitQ87ulqlx/71RBsrtutrMOfZxNj/tP5rzQHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_225452_477482_1EA57174 
X-CRM114-Status: UNSURE (   8.90  )
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

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Document them with
reference to dai-common to keep the style checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..aba2121ac64a 100644
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
@@ -26,6 +29,10 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells': true
+
+  sound-name-prefix: true
+
   VP-supply:
     description:
       VP power supply.

-- 
2.56.0


