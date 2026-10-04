Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59F6CA5FE6
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 06:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=; b=pAP9mjvKGDtDxOM2Bqu3m3DlvZ
	0YqWZYql5LSEePlfyQtAU9v5spTji6wJsbUH6TABLMRNEOwkAmxEpJzgeZbbI6+mEzgXQuwW8weMS
	RsiSJt5mr592/ioKVqe+0LRYoYL44ksXuhN9zJhtEdYJzU1m+JRFFgZO81iOPXt0A6epqyaylbXSP
	x6AmHK+4vHx00LDR9OyuHue/l7vrEgGnycZuT98HqJf3OtTSDs7drxZB1LymqIEB/ECzGJuvC41qV
	6ZmDW2W7GtAIDQvCQHUbyZGDfHJg3nYVD31RYUKmELerxg4cwTzDoJe3pmkG0GFJipBsirgjcKzYw
	y117D4Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLH-0000000ENJz-2gOQ;
	Sun, 04 Oct 2026 06:04:59 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFLB-0000000ENH6-3zmi
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 06:04:58 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so458671a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093893; x=1791698693; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=cmbNZfyMYEm9Y1H3w0lokXSd2nnjaW0Nd0olVPhFRPbq47/esfwpm5zIJmXhbh0l/n
         VThQGq1xKywonMxtPcNWjuOlg5UeJsJoJVNfO9RRWro5ny/IwDO908Pl3HGJtMb3ATvZ
         4ooYsYdniJawzgK6hmUoZABB0Z/UVWE88jf8BoCPQ08gin/EsCZ3tGHNFQwKp96k3tfw
         2Qvo6kBWnlhxfF5qiK7hQ9vyla07Le/93k2Dqe6QJPILZ85WG9KR2OCTNHyVpOnMJhYz
         Bkn9fmzlZNcmwqwHqPXERPRcGzcqqhxpZezT8aVZ+j5752VJtJWLMe8WLTPCxakn9kvm
         d9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093893; x=1791698693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=k0UtQfxuXBq9Ahp6iHhs8E5IN/ng06tsL9flqZg1zGFsItrmoDmCrKwD6D0H209YKm
         396lUziU/8ajHNyDPyQnCHczLTxOQH0zq393wltTLLBBVm6WTJTlMzrBDqQjOg/6lakg
         6oZsFkP1QpA/wyS1geidTnxGnieeJzZbXTnkWej+gSXoTVd9d2NgOQC2NAGMNc0Hw+Lc
         uS1StFN/Mnxw9oQtYu/hKsBpYUGYHBW8Yacs/paC3V6GLQUN6iOHKoGecS7hA8OP54GN
         d/+HzTUlx74GK083Rc7IuPuWZ1b4gzt6AWPtqa1tE9WoGj4ngoQAmUc+wCF2NBkqFMh1
         f9qA==
X-Forwarded-Encrypted: i=1; AKwUvBwpuANY0ftAmSkDuLrXNTLQrdxSnDlmkKq/nv3H6d+04O3L8nboGBl6BKMvMmAxMz2Gi0OHzdjOKeUCuXvG/Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYKkWYLalfKCwmQdeuhof4R7Fdi+NIFiqF1r3O4P8G+UWFmAJOtW
	RH4oIyt6wUGNnY7CgHbNdd3PB8x6skANf8Czoh7TkIwd77Q+ibTADzh5
X-Gm-Gg: AYBFou0bptFRWzEic92R2yxM1Fv0f5aweHasjEY+IZAjiKQGoUztobZmLAyU+NHe3Oe
	Wy/8Q+pYy01/pW/2zGQoeh3ucFchp9YRI6q+LI+BMk7o8eKkcvbZo4pL4SI5iuGqmw7+onPUkA4
	wyOflDqb6saDQbnmvFqwEeh01L0Zu36sVdMBEr2YLHbQubKO8yhJyVTcGdznVfn5RdvX4Ovy35L
	JA8WeABIDcPwHeYfWEOdYdGYJaD+lvP0pjHA8IH6UbP7kWJLH8FJ0d+ftJJ+b0IGbPv7NqY9Nl7
	teyH6QuG0/+6u9OZhqRhBXePm7aYcZ8BtbBf7HNgUAeIyIH1Ojup4lpTHoRGqUK24ojtpuc32p0
	M9YoDsAcToyWM74UIR4wisHWbXQSVtO7REbzQC/CjYoR+9zw3kXxtNusscb834esv8PR3/GkCIy
	aLTTOQn9z8+ejk+p7VP46s9CcwzCcZtwHebpZmx3KCfxA6pC3rUT/1O1IsZaPxmyaaqGCKmuRvR
	Mg0PtTJgJR2YcfYPJu8/aYx4HY/jsRmWtzzgpcxCCZGbd8dj7etC3IP5VtvSrUQxbdXR/1TnDxa
	aWsNCUW+ZodVnEYXsDsw6JQCcPtvIW2lt4T54pXbCp0V6Yo=
X-Received: by 2002:a17:90b:1fce:b0:3a7:f45:5cb4 with SMTP id 98e67ed59e1d1-3a70f4567cfmr3377395a91.26.1791093893061;
        Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:29 +1000
Subject: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip
 power supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sNwquOknKR60E7qr2ALmDm6xoE+cnxL/XwbQaJrtHA0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Qcf6e/dmXwp77y4Lcv86eFfgvnVs47fDFu24L67
 mtu71cu6JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1XjFGhhmGhdzFc/juOUVIeuyPiu5Z17TyhPiD4v0ezvfWXI1df5rhf815z4L
 A1HMdWqW/dt0u23Wm2JnNsO/ln7tnspkVu3je8wAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_230454_700925_25D837E9 
X-CRM114-Status: UNSURE (   9.16  )
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

Some integrators do not expose the power rails connected to the codec
in a way that can be expressed in the Devicetree. Do not require them
to be specified on such platforms.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..6c100cb36699 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -187,11 +187,6 @@ properties:
 required:
   - compatible
   - reg
-  - VP-supply
-  - VCP-supply
-  - VD_FILT-supply
-  - VL-supply
-  - VA-supply
 
 additionalProperties: false
 

-- 
2.55.0


