Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6336606A335
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KV9tn2p1;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPeIAGjP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=; b=KV9tn2p1+TqBGq
	pL1o3AEOE6Tt3b3t91kEMQAsuNCtpN1+mVnNtHsUOb3xCN9uga53jKArCrUpNQWxzCffTk+Ly0MSd
	w5XPUD9fNr//3nXrV7ivA6ZZkXo11QW9t4tMjr0bYhBzlVFlvJcxxkIV0tOEc06QUwuO0eznsZS66
	2+TzaFlcvS3GCqStaHKQoqKgVEiJo7gJ9NG/yAT3H4+o1gNXe2gelwVBSAy4rATEq0o4EEywadKz5
	/akfhEBrkeMfKf/fENNx4CbqYtgBXp5dSyHHNadMdWydmHd74QAg+ZgOo1zpW6a/JvSoKrnbYBTPk
	+kurJzdRtGgWIMWXszBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO99m-00000001NTu-2oeu;
	Tue, 03 Nov 2026 07:42:10 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO98y-00000001MOF-0u7j
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 07:41:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so1834077a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Nov 2026 23:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691679; x=1794296479; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=gPeIAGjPNZkmnuwoVH7TiINTaT44PYQzFxfUehhDivd6AduJojMPmyfrz6urq6MpLB
         GGYxAXn6U7ykpNP+M+xiSe6Ot7C9rKtDJNa47pdT1T5u2py6k1wzjbrcxjEHrHIrm2EA
         YLV+JFAa5Wa9hUXLufwFVRL0uEUrSX+cVOEbV/Dlfpx419z7/rQ2akkdlQpTa4zegY4P
         3h0kOUoE7JFXyaK+Dijj+p2lIG40E5z8bWSCuOXNl91KTCGoJuBmotwZIXPYnhpqZMTp
         3LbmCB1dp8c0XXx2230PpnjikVQubL3joQKweLdJ0fGbP/FpcUjkVXcikeYputqq5sYh
         oTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691679; x=1794296479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkVqZCyEHTkw0fLy5AgelSQiyen6kTUwAZLAvdHj+5g=;
        b=UHf2/XKZ7Jmxiv+H5dlb3/5L1UYSitSxkW/TlX+3tT9mMAaaFMTU9iLEFvYHrxiJaV
         cbtyuU1TuLPLkA23woJI+wukXeoIuOBZbhSbcmN33+QDiL2AL9vyfQXSWHPPZ9hk5HvC
         sq9akdaif3nEjifAyAD6O8U7wEiXSEfPeYyCgouWpyazkkB/0iyBcEVtSgsunkWBTHZR
         DM0uEvguvy0YXvVZAc5zOeeMevbo1ySp1WJON8jwsQDZURoxY48Q7I26Liyj/YPsHAxt
         XFWy1PrcRutCgIESXWXt8oae+/656WOfpDf26MhuFXuCZ9Jtaf+quUO7cU1pQA9yGj5r
         mPoA==
X-Forwarded-Encrypted: i=1; AKwUvByO0a8ygG06B6JWGC2Vkv7V+BEwsl3kCs53QwJ4nnHTf4Y9EOGNr3plamnwmqGEvnfYv8ZkhPR7BK5KJy23xA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+yvY+8u3Qj1ipBlWUPfH+1QGG7w30M1h4PItWI4O0ZC8JvVFjO
	HcmpM2YTW9XG0hK09oz4+1DX4yVpi/JysZeJIhzuYe7SJZQn49dBWfue
X-Gm-Gg: AYBFou25vdAHlGRRMDwATtiov0GnfP8C8bV8g/FuGFRDvtr3+jPGC7B0LrZxHdgtE/Z
	dg4iJIwwDNDZZaaYUORYtZJLl6wrlFB4CV7UO3ZWVbQRKq+LjUqh7e6P372Bvm8lajAeEnDj/J4
	1OrDtc31a69P1LU9x4kbwdtREXTzWRqy+lsq4dSnajnug5p5FiPgcCc7MNQFsNZdyPK0rS5nIU3
	X3Mpy/k7jh5yNeAE2qmmV5Ns5HCZEDYC7BgAxWNUv3mwdpoHSJDdbboT8X5PgEYqZ9/c3NRftui
	KeyQjMtulxXTReC3V/0YhvE8W01ioreSVmzJrDuoVH1qfpSJN9SHCds7BIKw+P/dxmmyr9L/DcK
	LOtUgfzb/PEFuKR8V8bmBT1LiNrwiegAF1RdpyTBjH0mb6KjgnXkyQuY1Sp5opf2+yLrO8+Hsr/
	qermArE50BF+mgi++VE+OZtVU8LyWn6M3bUx8YHRSL7WGB/rACQ1Ga6Yx6ddUv7vZMSDJbYUqkL
	qgUxAs3Y3Cg4PZE4Qiox+3LV3M7jB75YsGzG9uZB4Upxib1JnrzUmTcSTf506idm6eEgUS1b4lO
	9nlsX2k7CgkA6n58HOA10hUBGHRml0h2rWZsj9vdU0/B2eUIMFzbNxuGmeUxKxnPueednsH3tFy
	M9SPEXuJpmcdJ88mhbtXlYmb3NinAH6tI2nQmvyY9BA7J/jZNM3I9BkGd+90WRrnafX+BHFHOP1
	aKK9I=
X-Received: by 2002:a17:90b:1d0a:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3ae897f6e87mr9311929a91.44.1793691679407;
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:19 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:56 +1000
Subject: [PATCH v4 08/22] ASoC: tas2770: Add compatible for TAS5770L
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-8-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=758;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=69WolvDz8NBwzZIcSNN8FfeWXOxg6F1Zc88rX6gr6IA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/JT/yQMm+dq82UlFMPTp/2dY06tJip9pvC6e8Tp
 nCaxhnc75jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEy1TQbDf5dT0nnf72fPOLBj079/H7k1rpdmX7u6dl1j6XIjR4djR6oYGXqmvg1
 +8eCK2cYJOaER62doThWo8+3ycjEK+na7YN3RfVwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_234120_614248_3124332A 
X-CRM114-Status: GOOD (  10.38  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

TAS5770L is an Apple-specific variant of TAS2770 found in a number
of first-generation Apple Silicon Macs. Add a compatible for it.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67ff2dd949be..57de75115450 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -987,6 +987,7 @@ MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
 #if defined(CONFIG_OF)
 static const struct of_device_id tas2770_of_match[] = {
 	{ .compatible = "ti,tas2770" },
+	{ .compatible = "ti,tas5770l" }, /* Apple variant */
 	{},
 };
 MODULE_DEVICE_TABLE(of, tas2770_of_match);

-- 
2.56.0


