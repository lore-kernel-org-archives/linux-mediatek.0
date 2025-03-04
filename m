Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34476C282D6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF/PaATiK0x9qPF++Y8jAW/yXaoAkToj5SY2XZUl4HE=; b=BA9tdw/n71OEk2rfJeJ2fhfAFK
	QQw4qGBH9mCJFQvzqFkRS7Kj5ZRJ/eDYUjtcavB0eGj/9Nz5CqdbGR4C3YbN3WfyxAJPLlWVxDd+P
	hiWV5Nq6kjUf76t6PAYHGMtpxK58uzBXDHyIIU5BXQmPOORTNk8VASiLL+8DQ1cuKLuebBroF05Y5
	oN9+OGABU7kJpypzrRKJkMcxGug+er4VM1UNlLzsWEaVBlq2uN09mhTV121I2M8Pyy2H4shH13se9
	G/N0/H1D6AJYCA0QDeg3YIjyeydDf4VQxrRXWlSosd2MMmoA1lDKMqkNsZpJLNwgjxocoewc5Dxwx
	G74INz4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUlR-00000005LOB-0ILW;
	Tue, 04 Mar 2025 16:05:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU16-00000005AHX-2ENs;
	Tue, 04 Mar 2025 15:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KF/PaATiK0x9qPF++Y8jAW/yXaoAkToj5SY2XZUl4HE=; b=bXOXcgij5YxTiXGIZMzc+OJRx8
	sHvXnMcF2E8+kydfEz9Rrxkr1Ucjc/lTfYxIQTL2okagIooftWtHLPX6AiBNdDtX7Vy4vGRky1y3z
	tQBgBEGyj5lt5YteD+5QoZ++6F//88kmY8gydR/h8YN0fK+z3+qsvzgO5B3TM8AdiFA1B1LCqgea1
	y7TPZ26ELrQo5975BT4wDfqd7Fm6vrTrIro1YZ7Zr+uONIhkIGU4epGPOu22zc3wM1R0M5Eq8Ewcw
	Gqq8kiYT/pxV89wl+7dMohTE+YBAEggouwzO336WUOhPrOqFZBnEPCV+nNZguku8V8u5KiNWUD0BB
	b+j3FuFg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU13-000000003mG-29Lt;
	Tue, 04 Mar 2025 15:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101423;
	bh=25TENqi8q+kBqzrzX/J7Q2+OaNY4swWOeoiOQighkU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PHFpKyfUhYm1j2LO3j/C7oEhRAUpKvlk8UTWZt5KktDPANZVjkNOTrOoRMZl0R0tZ
	 NkunvECiEw++g03QKtgqI5zHggRPqnswYfcrxq6eB+uAl8F8XcdbCLuBLAipC4xiIX
	 mEmNIdkWzRfw4Z4jrdecM+zRCE2ZGQ831EU/5yjDhYqSjHnPKLHWjMN2xEjwtXSjFi
	 vj+M/FtWvZIkg1PItEaPshjuP1wYihIdJwiJbkSK4XFMC4OQ99E8jkisdQdx5rHMUC
	 apvbRQX4DsPUHAn5Id69tJns0CRZ/5THzsY8+ohf/6vnu4UV2Gn+NKOYEO5PHy4bQ2
	 YnTaNTJ29rrhg==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 24B1017E07F8;
	Tue,  4 Mar 2025 16:16:57 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 12:15:51 -0300
Subject: [PATCH v3 10/20] ASoC: mediatek: mt6359-accdet: Drop dead code for
 plugout-debounce
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt6359-accdet-dts-v3-10-5b0eafc29f5b@collabora.com>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
In-Reply-To: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_151705_749742_5E684917 
X-CRM114-Status: GOOD (  10.19  )
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

The mediatek,plugout-debounce property is undocumented in the binding
and unhandled by the driver. Remove it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 5 -----
 sound/soc/codecs/mt6359-accdet.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 6b0178976d91e37c32540991693ebfd8e29c11f5..d78d7516342a5c2273b1c2962c0346646aa6390f 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -513,11 +513,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 	if (ret)
 		priv->data->mic_vol = 8;
 
-	ret = of_property_read_u32(node, "mediatek,plugout-debounce",
-				   &priv->data->plugout_deb);
-	if (ret)
-		priv->data->plugout_deb = 1;
-
 	ret = of_property_read_u32(node, "mediatek,mic-mode",
 				   &priv->data->mic_mode);
 	if (ret)
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 09e1072b61a4c929bf6b764b4fab3c4b26f7cf4a..54a33a0f0e084f80df33386b3df9bba9525fa880 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -72,7 +72,6 @@ struct pwm_deb_settings {
 struct dts_data {
 	unsigned int mic_vol;
 	unsigned int mic_mode;
-	unsigned int plugout_deb;
 	bool hp_eint_high;
 	struct pwm_deb_settings *pwm_deb;
 	unsigned int moisture_detect_enable;

-- 
2.48.1


