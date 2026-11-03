Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBA5606A335
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M2D5z+i5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wzMt1m4d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=; b=M2D5z+i5gsHzYe
	L69QmdAScE5ADSKgPyhWwBj2/FFcDoC7lwy9mDvsNpvVyjfBCt7UlkrbmXUI/X8HJj90ym8iK8ex6
	3E1JlgQf+vj5mDbZ9tENCP7JBPF3Le9m8i7N84SrRJGK+R3LNkSm0jNnapntiTLE+f426vShu4XNN
	Hj4UB4r/8UoTO+HXWC4ikVYI4TsQWlS3ZXjl0t3EKmvy7tpzoaCa/G9faAJSgdfoCnY8BcBmtBaOQ
	6mVf2oBpAHMChsjzPmK47CdNQEsLS1SDeC2r9kpkYJ2vSgwdzg8kNi83DVInsAX337dyzRvFGNBC7
	WPNe70MyaqHwQzdAfYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98K-00000001Lho-44Ya;
	Tue, 03 Nov 2026 07:40:40 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98H-00000001LdO-3sjb
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:40:39 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1866576a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691637; x=1794296437; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=;
        b=wzMt1m4dQPe+R5J9zdTUuGvwmmkfdg5rydFHR7SxseUlqaDsbIzoftwI/NrWXCKYdg
         jVmYNk1KsjV1k1Vsveyr+CYLYnoZ4v1BdjfisZXXpitFUoJsfTTehxOZLflqIme9Tz6A
         DBvV6XeDdZsVf/fwfdBqYJAj7JSJVGYJ/u+zMsaDm2bTchxWH4mw8qaapjpfk65E3z6m
         yJKVNXfgs1hBOUe4lX3rErpR8YNRNMF6xt5Skz5u0Kv8rjR9CxFbe+ekYWFJRXV+KW5t
         C1GcGRPITjMT2IQJ32p8G+rEfq11jOQLZQHHEsN01U/H6C/i8ETHEHG+hzAZR8IXHxxp
         1Yfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691637; x=1794296437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=;
        b=dGkIDwlrdSTEZW1+K1NdJAcF4r8eMe2dRJVoxz3wWKJxA0H15EzP+UHFo+a1AwGZHm
         Fe13Rwm7nDiHpOZHT5afxOHEwR804d17U8WDNT5YLZEl5IpUHRUIYAldWHERdTOXoaym
         1E9RpQ0tZmUE7+6A/92bmYAeR5D8bRez0iFG2myvPalnXRBJ5rgL5QZSNi2IssuIcU14
         zfvOG7zGK1g4m7dWbwUcUiRKjt6MqtrcZ406LsiAxQS8FHkT9b9oe0KStk3U5OeuC+LV
         pTm6Up2Esa6whPGAyfv71YaWXnQ8naZo4WxHnx88gAKEtXbtGIVux8bhyGqDOjpvlfr9
         Ekkg==
X-Forwarded-Encrypted: i=1; AKwUvBwJB5BN2ea2OJBNKFbODJVVImwCgYz24N68UZZOx+1WyXkqrPVOEC3VMOva1YkyEv+Lmj0Af3M/UBwgAqx4iA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/qSC63mfq3EA9NNpWUUtvxw9SphJamFmBMhXK4gm02pTICIdqq
	l9AkJaZd/1r7zG0Wascgb6TgtNQgIhw9LCVCbMWiZSNvR6iaVy7jvE3y
X-Gm-Gg: AYBFou3JCzeArNy2t4ONy77n6SQGMbi4om1Mv+Ej46X+0c4jINfTsJBHIBwey1Cp9TZ
	8j1Afaub4nH5XQSJiO6bzdqBBIHv3Ot9kSPmz3gfQAwuSLK0UKujzo7lfVsy5rr1e2sGSsolkZ2
	Wwz/STy/YGqPPlm5urGzkSHR25Gdtf8nOOgA/adsMfHCoGBQVVLQreEBhjuzbac0fgtsEySmDJ4
	oluDZ8tfhdyn+I4kv+UcFefFu5v92vw4Gs8Bn9hYw7qA7Px3GMc2BpY/RERQ8TuG1DD7Np7KkwU
	fWHBTjlKAk1L/HZ/+dWmiv4JkUeYNSc5yXemi1cGc/WjuvLSIln1tb7cA4iYBbxi3O/LzbsIIt+
	2vC6xqTFpXOY9DwoDpWPWaybAW3qZT+mQE3ux4iVAYQ5W5lKBV6ydFieYMITtRFWBoADORp3haq
	VTC734oqbiGF7xGnKxetIj3xZ6XklQ2joiVtflTR4K/+CgCuccbR2QaXCTV4Xg/Nt4vpKbYKfkU
	G+ECjaxA5lcNbfCb1VlFa45mEIn/cNAwghwULSOc7WHbBCFAB32QeiLrf7bYUW4nr8NNwf1KbU4
	kPGzMYvtXqjy78Bh4fy7W07D9N7PuOsBQzqzBLG+oUkN1Ir3XDxtRmJ5WWZf+3BYFIo2CQyUnfH
	TPKga3HLrxWrr3tECy3a8wGg7eItFokZN52AwKoNij5RMzsGt0OwZCbVX19X2gfWQLrPBpKskfL
	jZzKa0R0PyPUBJoqtv2Gm1D002
X-Received: by 2002:a17:90b:4f8e:b0:3ac:7f4c:a690 with SMTP id 98e67ed59e1d1-3ae897dfcdemr8833525a91.35.1793691636036;
        Mon, 02 Nov 2026 23:40:36 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:35 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:51 +1000
Subject: [PATCH v4 03/22] ASoC: dt-bindings: tdm-slot: Allow indexed TDM
 idle properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-3-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lpUwLsyqda9INXeRL6PY6VLEX817T5qBt0mzKx25Jk8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+882p0/bfXvzvcc3vMICv64vqJBaIVJ45PaMIOl+0
 aK7r7k7OiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFP99h3D/9DvUYsCT528siPA3/Og83/xD+uzqmR/8m9/EH6Lp3dqyFyG3+ybZb5
 ebCpyWXD+8WpvzoYfbbyaIawF84VcgxrqJ9+TYgYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234038_007068_5BA478ED 
X-CRM114-Status: GOOD (  13.29  )
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

Some consumers may wish to configure a codec's TDM idle properties
at runtime based on specific dai-link-level conditions. This could
be achieved by doing something like

dai-link@0 {
    dai-tdm-idle-mode = "pulldown";
    dai-tdm-slot-tx-idle-mask = <0xf0f0>;

    cpu {
        sound-dai = <&some_cpu>;
    };
    codec {
        sound-dai = <&some_codec>;
    };
};

But what if we have a dai-link with multiple codecs across multiple
CPUs? What if the machine driver parsing the dai-link only expects
idle properties for specific codecs? We can extend the idle properties
with an index, allowing unique idle configurations for specific
components in the dai-link:

dai-link@1 {
    dai-tdm-idle-mode-0 = "zero";
    dai-tdm-idle-mode-2 = "zero";
    dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
    dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;

    cpu {
        sound-dai = <&some_cpu0>, <&some_cpu2>;
    };
    codec {
        sound-dai = <&some_codec0>, <&some_codec1>,
                    <&some_codec2>, <&some_codec3>;
    };
};

Extend the TDM idle properties to optionally allow this indexing.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../devicetree/bindings/sound/tdm-slot.yaml        | 34 ++++++++++++----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index 457a899e8872..dafa5fa77006 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -20,20 +20,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width, in bits, of each slot
 
-  dai-tdm-idle-mode:
-    $ref: /schemas/types.yaml#/definitions/string
-    enum:
-      - none
-      - off
-      - zero
-      - pulldown
-      - hiz
-      - pullup
-      - drivehigh
-    description: Drive mode for inactive/idle TDM slots. For hardware that
-      implements .set_tdm_idle(). Optional. "None" represents undefined
-      behaviour and is the same as not setting this property.
-
 patternProperties:
   '^dai-tdm-slot-[rt]x-mask$':
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -44,9 +30,25 @@ patternProperties:
       a mask. The first element of the array is slot 0 (LSB). Any nonzero
       value will be treated as 1.
 
-  '^dai-tdm-slot-[rt]x-idle-mask$':
+  '^dai-tdm-slot-[rt]x-idle-mask(-[0-9]+)?$':
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Idle slot mask. Optional. A bit being set to 1 indicates
-      that the corresponding TDM slot is inactive/idle.
+      that the corresponding TDM slot is inactive/idle. Can be defined on
+      a per-component basis.
+
+  '^dai-tdm-idle-mode(-[0-9]+)?$':
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+      - pullup
+      - drivehigh
+    description: Drive mode for inactive/idle TDM slots. For hardware that
+      implements .set_tdm_idle(). Optional. "None" represents undefined
+      behaviour and is the same as not setting this property. Can be defined
+      on a per-component basis.
 
 additionalProperties: true

-- 
2.56.0


