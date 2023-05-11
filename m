Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E486C7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYOWcd2IcetwoVsS4nntw9yoShUHzHzbCdiQYPACYvQ=; b=VII+V3gV/iEu5CJB1KMSTd8+Z2
	9jslGMbpfj7z6GHyxiO+BUORjF3s6JTVI4a38cDVWAqg57fDYGNgpjjxjUxSuqXthsAI3eqgn/Xlt
	LdUKUG67EOX2AnFY+tBpoYVTHEw34kUr3bCCCoPKzo0oL5p4vTpzS2SBo2CauYWS80gHhwlre5jIU
	6GBS13M+M61l45IK4dvTpwk8+OJTi5c4eildI1IZM24g4CiFe9zeWZEwyviNGjJNH860AMXjfgU5a
	VThH1t0lB7MFVJ4N6vE1w4BS9U0OK+iIGsZH9Z6iZ54nqf+wr1WfVeOMH570c5cc86/LsrDhSqsKl
	V+JHoKaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxA8E-009YYN-1d;
	Thu, 11 May 2023 17:31:10 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9B3-009Mgl-0c
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:30:03 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-966287b0f72so1175431066b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822599; x=1686414599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYOWcd2IcetwoVsS4nntw9yoShUHzHzbCdiQYPACYvQ=;
        b=ZF9H/wJcUTYOsPZAliicRUc2hsbwwvgP5Qr5cEGUu1insHuerQcBU8SH0FTChxAO2w
         IhHO4VCitosRKoY8VL4KvNnwE7aCJFd21v0mBLNC9/GVuhHEZraqYLC4RAT/zqbXBPSZ
         DUouMrdouZ9uKyXEiMjY062MI4XWaY4oaKERBLgRVAxlOMX2rA7pKljmNEOd2Chv5oWu
         eoH14uw1YfmbfuQdKNjuS7wXpnFQjpaXrL5eRZytVm+PdUbxfkf42yNbxEZq5W9dkz5M
         /OnLW59L8abxiJsDrpkBJHrJfyh7mJQKsU/gCC6vPUPQuVCKzCM8ggLmIx3Zbi4Hwuua
         nFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822599; x=1686414599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYOWcd2IcetwoVsS4nntw9yoShUHzHzbCdiQYPACYvQ=;
        b=MWvWyKUZwrPf/pAoaSsOP7Gp/5pyTj6w2wyPUCBUp+Ry2+1xJsRFzX6zytJgcegcrq
         Wd9+MRP6qCmWosbxxvmH1rHotl+s2yiwpzfl+214xwvyG81nMy1KM++ZwYPq+hiwWdR9
         zRcl0ANIoWYxsOFX0J2odY/n5extLwsWz2ZoX5RS/b58KzCB/OYETN3wMbFu1PbH7Yye
         dNXLp3VQX9yUIPXWtZu6eOi25iLV4rmJJkNIvDjwetLRc+PWENIeOGCrj8N9Xja6PDq3
         9uiTcRg6CY5aFReVcJWdH/ec34HO/eT8McMFCAPYEA5eUmYgLHlJt7p36S1VidV5prra
         /Ufw==
X-Gm-Message-State: AC+VfDwAcxFBiJQliRTjeHG6tKOn98Kavkwjy/5FNFqXpEpeHwVYni1t
	4aCJDeIfSCKfCJBw6k3VnuDOsg==
X-Google-Smtp-Source: ACHHUZ79EAj3WuEGlCvYgbOla4gcw7B6Z/enxW/Cr/EEA8IMPElYOLh8UszbcXKyN6DTr8kBvg/H4Q==
X-Received: by 2002:a17:906:5d09:b0:968:c3b5:8b92 with SMTP id g9-20020a1709065d0900b00968c3b58b92mr11798509ejt.57.1683822599655;
        Thu, 11 May 2023 09:29:59 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:29:59 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 11 May 2023 18:29:21 +0200
Subject: [PATCH v7 01/11] arm64: defconfig: enable MT6357 regulator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-1-98cbdfac656e@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=793; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=WTUqVHBR4HvQxOd4r/5AfIRd2ez+/KjC4aOa4tZxgIk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgE5cCRtuzrGfFZ/Qr8kg9BPfvi6jZ8Gy8XTJn5
 pRDvFXmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBAAKCRArRkmdfjHURTJID/
 0di662itmNlbKs6Yl//j80WfpsNpJ8cPea0z/HfM6Djf8G199KCC73u7VOs0VJMTHrt1svIoHaiOBp
 iB5yXTNt9UY3RBsnKJxtR1N/0QKVWGKzzLy2p6LO7PyJqapU9FejGrfOGEz/l++hGKQVUqiFrtjozP
 Jt/CnDQHQJwfoR5ga9qQMJ1ax64mulMS8ubrByPdbhGCZJVOVlCvTf6Y/48kZmlPfxUkIytfE6Yo8o
 KjQLsXtuwHtn89zGNyR4QAZLMH7g23K/m8Em2KJD7LOqfG7hJeWF2PmTdNSPg0AMMCqN1HISfAFqn6
 zJB13cI+XYVlMCoyfu3MRNeBjkPx75Bl3E7K97uhbiigq1Y+Y3HDOMWTDOvOZQxPf65nBZXuZ2/Tqc
 i0jyjXqAOJPiQpr8unFGIhl8rtBgPfENQ5PV2E3AyIR9LlVzoaNZVfXwagW8fS8mXDqOg+jn7mm003
 /gDJQkvj+V6nVXz1pymWbwn4p2xEads55yhXiSmvfVR9Zbd+svylywPiemJvxjh7jnXf4+ZUMqsIYs
 BTLBJTjN9ooSsUmEJ2eDHQLn7l7kuVKfirGm2FtXG5firM4+8KVboLVpqBZD3aTrdz6HuKbehi8wlL
 F3cqXy6lYJtjaobTsCTqgYF/iIEncaTfxmXAHqmp/txHgS4W4xPKSypTdoRQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_093001_454291_67138BA3 
X-CRM114-Status: UNSURE (   8.67  )
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

Enable the power regulator support of MediaTek MT6357 PMIC. This driver
supports the control of different power rails of device through
regulator interface.

Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a24609e14d50..ed3fca298314 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -708,6 +708,7 @@ CONFIG_REGULATOR_MAX77620=y
 CONFIG_REGULATOR_MAX8973=y
 CONFIG_REGULATOR_MP8859=y
 CONFIG_REGULATOR_MT6315=m
+CONFIG_REGULATOR_MT6357=y
 CONFIG_REGULATOR_MT6358=y
 CONFIG_REGULATOR_MT6359=y
 CONFIG_REGULATOR_MT6360=y

-- 
2.25.1


