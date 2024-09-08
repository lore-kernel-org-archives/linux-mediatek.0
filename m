Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E473CD4F4C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Sep 2024 14:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmNCAE4Q1YMX3Tcl8gMK7BYQKsWpwsEcc2NsJh2xrh4=; b=4h2T5qm3XrxfVar7nwCl1RR9+7
	oPuG555pevTVwSwNfqmT8QE1mhCTnEKrAqflrx1pG/2YaH9hrwULJDUERfahbQhn/2Fy4rPWa/XyE
	qPO9Ktc2URdLh4jz+4rQsa53eg2KT7VibtAE3kBViZB79tTmLcndITjAm1z+2S7GgZwiUf8a3VemA
	7b72UiqHDEoR1s0YDl8kEOU6KOG2y8Zi2IrliFtK8CX/0utIH6oQiElNV2RdknoWsDEQqzUofkWpp
	4vRX1Q1bUUpTF2FC6zBnh7FCgvRGIt3N+Rp7wiLSkZnYKEWFiec8UGC/eM3sQPuO5sKr061rb/eI7
	sIoWzxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snIpX-0000000GwOF-0Ov8;
	Sun, 08 Sep 2024 14:23:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snInW-0000000Gvqg-3ZYM
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Sep 2024 14:21:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42cacd90ee4so2219585e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 07:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725805309; x=1726410109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmNCAE4Q1YMX3Tcl8gMK7BYQKsWpwsEcc2NsJh2xrh4=;
        b=fEvu1kO6l5okzH3/Uihn7iguiU8Ux+k/6RwrHrMgacvLX932mawBHS/cTe85YNMe1G
         JoOiHwEfTuCxmbAfp5lMschcPX4HBKXZdN4E/WjaitFOujxqNh2b074Y+ce3gLVH7kPA
         VItgU/kgdpXMJdDhyFMNwMlVBsQjEiUjUswihgHLqEElXS2K6+B4r+TOqx0yw9FIzNbn
         tW6j4cg9IOoAdI0YsPFtT2DY65pt41akOOHy0JRXIH4WyaltTirrAZQITcSPdUxJlwEz
         ecLf4CIJCulQRUeDKYHhyWRfjze0SJDJ9+e3inAkRnsiLOHS39HxDg7X+WWPg0/eRKVh
         yqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725805309; x=1726410109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DmNCAE4Q1YMX3Tcl8gMK7BYQKsWpwsEcc2NsJh2xrh4=;
        b=g4G3wFSbzKf2Gko8dAL9uXDdzeW1mj7D/qjb2pyRciqCyv4GNpkmiR90WiQYkHvESC
         LEMvcmdIRUkGXBtGsIBWfrKE6EDOiSmPDEgkmRhIuhT261D9m+W2fHsaetj0luw3VnRK
         e8Ll6O/+iPL+JTV4wOJDgBPtVg+18nSp6zpXy8R9snpCI/BNCZTEIZPnEgtRbd693rM2
         HcAX4D1AAF4iUXdU4oe2p+QAZDRifbEAlVAjcB5Q7lyiH17LlBadeqQxlE+JeEgpeXiN
         E8PIgqQL64sHSd97DSrK96HzH4XPkFIqP/vXtQIULGTzu/goukQs4R/5VAJtr3uEQRYo
         DrPw==
X-Forwarded-Encrypted: i=1; AJvYcCVCxeics5zmKA+uAdNNKz5WQUXkqBlpfeU7NcJJojaG4QGPF8Jxa3p8jZLv5s+do2QhacmnK8mMDQFvvJea6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDOqvZ7IVEuUP6ddscpUWpx5pl2JrJ3nE/Wm0dlyJ04DTTvf+a
	NLZI9tvB9zgR+miobkoQHYLWiHkT2vh9/Z6Wi+NezCkC/Y4lMH9eUS6X36QR4Xk=
X-Google-Smtp-Source: AGHT+IEfPYmeZxoWXAcFQnFIynwYI3IhFwp318lmX0rGJhOu4zCB8JiThVgRlAkTPUtEGTM66TbBWA==
X-Received: by 2002:a5d:5985:0:b0:374:c4c9:d501 with SMTP id ffacd0b85a97d-3788969f8famr2540273f8f.10.1725805308342;
        Sun, 08 Sep 2024 07:21:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675bc9sm3465092f8f.56.2024.09.08.07.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 07:21:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 08 Sep 2024 16:21:31 +0200
Subject: [PATCH 1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xt0kZ7eoXJhJeMpnCj+RSo+GXDsYwuHZwovewC7CyRM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3bLzifbiOLGTfi1rakImHboSKV6MijiY+nxNL
 64lIGN8Vw2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt2y8wAKCRDBN2bmhouD
 1z1VD/wOZ9MQKyB3Sw1CKjUwzx//foRb4DryywNPfnPq4l8A3dIm616OmVccvSkkz53RxzHsiSo
 Dw7eEnEx2HVoW7kyWifS/sxsqjS+ZJNu6o96aJZNPknaYTjCGqvsm31f+pa4nEJrbh5K6FiC34M
 jDlUbCSrH2rdiUg9gB8kqAX+93smcGE7+Z10Q8e+v7U3AOr+RRMuFrcAjN+fbvV85gIg4iU+3y/
 k+l+eWOMcpnaAdQPcSnMx/vgGKSJuJHpQO91fE04UmJyzAwR5F8QgYSVcKByRExvYTirjmiDD4k
 13HJUKlryiBKlnP/3dtY3lA1eJaLwhaBnMLGwWxL4msNZF3martYB6dBVDA5Q6erhi9JEytv3Ub
 Ck26TT6lop4XdFmACe9z7xCNOvZ2yBRaE6MEG6PRcBvu8mpDivvO5qgntKo9mxltoomeo1GYOCm
 6R1wWzMkLJdMhIqe7eamaJo2hVQ3ukJeC4co9VFodFrMVzTdfFqbMDmRQPgymuj/NrGyOszj9Wu
 BDuPkwp9WiHXiWR3TA7WFsOBTacW5opg8ZN4omiWyDM0FzJRydwvB1jYYMEcdoNasl/DdhxVwW1
 S+JC3i1S3tCLgePg2qs5HvIsCsX0OC1eAphTQ96Axhrg6L20JVzHESqtRnLYOmerln9EJal3X6C
 SIMxC/TjklYx1pQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_072151_138262_56B08E94 
X-CRM114-Status: UNSURE (   9.56  )
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

static inline dw_hdmi_dwc_write_bits() function is not used at all:

  drivers/gpu/drm/meson/meson_dw_hdmi.c:276:20: error: unused function 'dw_hdmi_dwc_write_bits' [-Werror,-Wunused-function]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5565f7777529..b75db829b1da 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -272,20 +272,6 @@ static inline void dw_hdmi_g12a_dwc_write(struct meson_dw_hdmi *dw_hdmi,
 	writeb(data, dw_hdmi->hdmitx + addr);
 }
 
-/* Helper to change specific bits in controller registers */
-static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
-					  unsigned int addr,
-					  unsigned int mask,
-					  unsigned int val)
-{
-	unsigned int data = dw_hdmi->data->dwc_read(dw_hdmi, addr);
-
-	data &= ~mask;
-	data |= val;
-
-	dw_hdmi->data->dwc_write(dw_hdmi, addr, data);
-}
-
 /* Bridge */
 
 /* Setup PHY bandwidth modes */

-- 
2.43.0


