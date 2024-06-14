Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96363C27C6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jun 2024 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=; b=s+40fkfEgn3WKy8IyBfrBWkzcM
	sdis+Ssm7E3Hd/Ub0LowOmNz4UdjR7oIMGVPTjmvIsF1yh/X6XN8gNTlAN4KoIOgDG903YIbA+p/N
	ROwbMxoEhxxFU/k1rZ4XsHTW4pqN3RPBZRQuoaSkHXXu8EAKM8lT6p+0SW44dcNOuFn/kuH6dQlc1
	ZY5UHgiahAZ/1eWUIvnfUwW1rDXipLE7CFQgH4NCtKergllxckSq4GTmVJLFreL3tWluMhCamq3MJ
	bF9jz7O4TVt/UygHQWzfWEC+cPrJ4aui/Jy27cJ7gZd950lEwplmLVAPvKOvD032Tn7SaRfRIRYTn
	eAfpRV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1Ow-00000001nZu-36fJ;
	Fri, 14 Jun 2024 07:31:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1NX-00000001mmH-35GY
	for linux-mediatek@bombadil.infradead.org;
	Fri, 14 Jun 2024 07:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=; b=S5AFvwCMD2hJ864qzbjefQaZov
	ITQ/fT5C8StSmpGpjTY+rzIJWWmGhrU5/gKxGk/tCLbqSwkfxI4ivPK9HQmP+NpMca9BHPUTxq+7u
	bl3ett2a9yZZiU6849kNU2+qQSAW3flT4KbQFSWrFaZca7qT3hLl57/HJ8MFWMUu1iHgFwglWOZPT
	RZrMrO5zrE8Hzu5/bsm921YWrj+mP6nDgYpohwy6XjGiZx3hVUUlmCevISkdJbaQSubQlEh1d4ypm
	GooO/TB6wtgi5jG61I09tWrTNsUk4LVGcbM0B7t4VFTxw9gXrFWfwBGz8yVwpSfmfByFOuyjwp7PP
	BPdgXwWg==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI1MH-00000004Ae1-2USh
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Jun 2024 07:29:16 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-57a4d7ba501so2153589a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Jun 2024 00:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718350103; x=1718954903; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=QrTgSUb2s6x90kLy/Nl7hysnmRvNPP/CnRPmb/WpMdMt1ecajJz4g3WTUb+BlbtZrI
         FBOtu3iViW/5quLxtdYJF+f+mV55ZnuQI5rywl1PNbMN/GxfzHtqSTx38pdt1LxU6/Is
         y++ylgRxgwRblI0ZOsT2uiQToGInIv8mWHQD3GB3LOCJAKwmjBtT5KkszD5xEjQskDAC
         IBgF0XDM216KoV0Mh1h2aorE797qFVkclyZ1ZcXRAsV8S2XoSNoldmnapB6APjrKYCPM
         1CbIAcdx1SBhUFuu+Is2zKoTNHLWWNhuKzGFCeZwiqF4VSuTRFm5ZQqTv0e81c5movZz
         95HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718350103; x=1718954903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=mejh9zcagpvGYPyJag0HMXsKSBkewGhx3CpkY7BGhl47H44NWJUphUjbyHbFDf0Ggy
         7XgTAOP1Vh7X3lwKWiCVqAc83o7qPUU2FwuUshxHY/g65rrlUTx9twGQLMQZnm07dkM/
         Qpthp2tVPy+Ct/pV6J+R0p4HeGB6ntF8RZhtx63VXGXbZTu17uZqlYS2wMYbikk8Wb1Q
         pWRBC8R33Ww4LQvk1G7Fr8XMrWDj5Lct8jsVXiwwAM3TAk3jC2Uovzqn7IkUjNLu/8ao
         LrHxOcavhp5Q5HggIvkuscetDIWQlOmIUL1m7DboD2gX0bbNm/xx8KjnC3emqDiX+RDD
         pmTw==
X-Forwarded-Encrypted: i=1; AJvYcCWk5Tlq0OD+qj1wXKdXgbQ7tm0vv0ytjw0QY1IecT7Ekx4j3QFwoVsnUE6r3kGnNg94J9vvbqbJLQHywcMolSlB/KsFlfiJpQKvXeYA2pzIAyf1
X-Gm-Message-State: AOJu0Yy+Y0+7xwNt2nU6XK2vX3h0SEBGT2OaLSPnTwnwMBacKDC+WDuz
	XmaNj8L3liyBYaccNkUexkgVWNEah/SAri9q5Mj8yZRuDHJrjkPZ5G3M8LZeSPI=
X-Google-Smtp-Source: AGHT+IFF7UZbnKl3+wQb9W5FOXo2sWA/u52xRAvSHAyIN/89/MqgXnj2NWjofDEb78+kItH4lzx7Tw==
X-Received: by 2002:a17:906:3187:b0:a6f:1c81:e220 with SMTP id a640c23a62f3a-a6f60cf1dd6mr133571366b.13.1718350102791;
        Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36075104b2esm3535773f8f.101.2024.06.14.00.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:28:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 14 Jun 2024 09:27:57 +0200
Subject: [PATCH RESEND v5 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-14-54827318b453@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBma/D/bQ5cx0nOIhVEbANGr3El/UNuim3DeFvhVPKb
 JFG8LC6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZmvw/wAKCRArRkmdfjHURa3yEA
 CDE32G0UGXLh/zCKtDKPzFr8/qWc7jvkSuEWfcIKQwkkbJuN5PINlE3ttay+6s/8WyuhQ7yLjgYE+w
 ka/1r5I9VojODP5FQbafq/d2z1PgmEwlVM/DPZgJISbx95T2LXz70P1OAXy3qn1OFCURZz08Pc130t
 EZ0EUVTVD25KKj9sFO4yqZQkkCxontUtvWjKKT8IUqMvWVx2zcWiZBtPN0uDeuih+Klja88jWdyM9E
 ZEAAQdzwymlsVepAAeZCRAQlpq2DAqkKspALDJ82T/MEto3A/QEe7saTsVrIIVJHxT6kGx3xjOeiyQ
 Ez4T8CSIdgH7aWYe+Ae/PUq8VTHPBObS97Lc1wojdo6hkdRu4zMhAzu9gw6L2mbCkJXRwsOk8Rx2xK
 YiHPG7qzGlRsa+9p0J99BwttZkWUeIMPcQnl49bQKiucIPiaFo78hGeQe0DhXjYJiHwzBAqRshnL2T
 P/oJ1hck6i8j/oCoAdC6VM5yANe/18HHCq31zxuzKKk6IsMBHx5tG5wcOXpZR5pJZgCA6k8czo08oi
 QbY0Cu+y9bTgfKS5TVc5XgVi5VdsKwfb9VN35EIsw8TBvRicZmAWiWzEDN71DhjrWcPFoeEW3eMNyl
 vum3H/uX6pWwfl3EHe18p2uY0M2kYQcAkdAXOx8Dr5rD1dnDwb3/u87UCiDQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_082832_558707_2B592A4E 
X-CRM114-Status: UNSURE (   9.99  )
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

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57a9abe78ee4..24b4d1a4992f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -950,6 +950,8 @@ CONFIG_SND_SOC_MT8192=m
 CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
 CONFIG_SND_SOC_MT8195=m
 CONFIG_SND_SOC_MT8195_MT6359=m
+CONFIG_SND_SOC_MT8365=m
+CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m

-- 
2.25.1


