Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A90C04FFE
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 15:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlVm2DUZvHbif6Pq4uHc3DKM1FD6wia0Q9c386ZrYoc=; b=bVA+JvNxIndpw7HftULiOMlXLo
	i+ZcbOCbQjh+eeuoLJTyFck5c39iD78tl5yfNuG/so8gO7Oc7VEFtYsu2IlFFn677UiJmJ2dc02PG
	C8DP8FNfSLCOwTzsyeQHUXf1YHzCl6T7ZQqbxtCR+FmQI7yqZv8n9RT3XlyO0LeLdZqQ6Aoxthu+c
	y0xzI2xlutdcSo1SkH28FBmpNilvvvKqNep9gB4VLaG0znNMFCrs6nS5wL6anu/AUtzBJTZMFB9CE
	zEVG/glALLk9RMtZORl9RChaJt54kItxG5P1VBvgGXSBRlBaQoGWOHYW48VyHHi/Er1mxTnKxDzfr
	AH8oMiZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxTjW-00000002ni2-1xRt;
	Thu, 18 Apr 2024 15:31:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZx-00000002YiF-0gw6
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rlVm2DUZvHbif6Pq4uHc3DKM1FD6wia0Q9c386ZrYoc=; b=bEF/dNeWjkzPo18s3MuGmfO+R7
	aJkH9jCQdJ22DfMh6Vni11jHv737tMouIbYR5RCA9UOjfAQ4n7YohZnvbBYhLQj0Sz/ECViInMwDd
	uo+OG2KLMFosU+ap37JMrkVVRF6nwfNrYgr+d3mrIiYTO8+EZ7OGsZ17ltT5OVysvtlNLnVnoxKR4
	bd2Xh7S8bj8fJ4TL5cviPfgCU8g5MkfZmV5CBP+u4JbMRxM/4UfXnQceOQLHBwkqYuTolqKP3nBlk
	JSGEn9H2yKtrlsaBxt0cmnOtESuhDBecMPi3t9r+MhgJXNmBBupt/nvEu7M+2xcnICHvkyvZ1MoLx
	eQZ0F1tQ==;
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZj-0000000C24o-4460
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:31 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2d8a24f8a3cso11240461fa.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449838; x=1714054638; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlVm2DUZvHbif6Pq4uHc3DKM1FD6wia0Q9c386ZrYoc=;
        b=jJYLZjB8YGQwaONA3ZH8PgqtWAw9hbiFh+qoky/JTNHUG60TKLzXe7GhS5uc/zB4EE
         bEHRCZjtwZKDUqKtRLe5hDAl0U7dVIvSrMl/37keja5wXvgmawSEwULSI1HFjC+HgadV
         sBUZo6Cyf/K/qkr8q6pL75e8nisSOLDf9QVoC7ovCSINcrsoyTtJ0ylM92uLhPSlRmua
         tN73hMuEj5E1kUhkaziSgxfZ4ouvKC/47mJu8rieI+hnKyfceNwMaVOuWIIn3ayC26a2
         QDqHQCeX60hwSwgFD/W5aXnUqAMsaHcDIvwz8ORo9w/PuDklDJGYtutXvcWoSJDA/PMN
         GRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449838; x=1714054638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlVm2DUZvHbif6Pq4uHc3DKM1FD6wia0Q9c386ZrYoc=;
        b=Lc3ko9dEv4oh0MQYEqyxBeGDNJ+vLEbB+VlOygcI8Nq3hnj1AWWehFdqQqgr9cIAo6
         oOfVZt+3TOxFtXSKDgi0jrNDTWWCtCXI+r34YueohtGTqjZCSzovjmP27H9zLJhAI6yI
         5M4GcIK8OjqOodpX6JxviqhgeilhYQgMsEWp8KoszSxkL8kEqaDP4TvIFsOPrS1d3tis
         WbjZk8kxpd9CoQf75sm24xMaW5vYPyY8kSJqiBydGO09bei5kjtZBaIwlfNIVqJtuVBA
         AEowyC/MqPdA4YRNh9MRFdIqmuPQWTGH2iJbs83GIav6I1lpKynjGSuYnvSVHkIIYIBr
         79Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWCKVkzJqSm0Kszhi2P8zf8sbq0laHWOH4AakMS+M8Tw9KakQZPDBys6wvO6OLI15venf9Zo0rfFi5i/J6Smolg/+0nAX0ZPhUo34EaLxqPsXRY
X-Gm-Message-State: AOJu0YwCor9rQ0vQXpl7MujNz4U5EL1DxfQ8vbnndMZnTdWANQXe7W/m
	uJ0fRNXReDeudVd5tRYZjKKktCoECEf6Ovs6ogBMk/+W8ZFjX4VV92gRJJ3zEDQ=
X-Google-Smtp-Source: AGHT+IG29OVR9aeDUGbdzj3TNRPQowmj8/BArbOQQhnLP5iP4zpyAQRi7xFLgRXdY6/+8+QulNMbAg==
X-Received: by 2002:a2e:9113:0:b0:2d8:6104:f95a with SMTP id m19-20020a2e9113000000b002d86104f95amr1707719ljg.23.1713449837718;
        Thu, 18 Apr 2024 07:17:17 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:17 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:53 +0200
Subject: [PATCH v3 05/17] dt-bindings: display: mediatek: dsi: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-5-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=VLBa/QW0VMhizu6I6UwEaoKrZbEmjO1DzaRZBpi+k9Q=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiG3vDJ5hjSI1S9skJevxMqAzoslZvCwRiUMz/
 ha/l3HWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURbkQEA
 CrkzpBaKFv+sfRSX59WBpP/1SWDq7+EFOlk0CU1eVD0GSGXscbwRNrFZRQAmDsmEVPUVagzfH+pZnP
 ct3eaGmNSH2L+rCfXHCXfun2BJLq6DgTzwIVnhSA14kkSYc7pSA7x9pUqR7BRcRNTz9UZzaNEYdJ4k
 WbsDMt6LUdGx32iQCqFRPCjkOaJoMUa6jbDy5vXIFnAkti0QnVqaZAmHjydLRprruQ5NstgXTvWo+3
 ctdOcjOG/lwznUGT0OBjckvGKmi3XWTGh4Hc9cU95o5r1uSG1prY6QOAGN6pkjUfFm9GuDfdUkLv4h
 aerO9tB6wmEVRrCdJIBXRZqDDQKe/KlD9sBSjk2zKdblfkWHGef4ApvCCTKiaQoP+xmPjBx4VVz5vG
 YdnZ6zhxYg5E77TslY4/T0cDmmwqZxJ4RBFdzJKdJX1qi6Z/mDGbRrzXt1ROOjizpwdZ3QnhH5M+D8
 cSRVBkMcy2hmxjqs5xl31iFUOB4nVYZBTMtEO3CCsMTOxbGmxkYQfV1OcjPKF2icCpoiOWs3daI00m
 avkKjpD9lXLsMN/TAR1lKIaQtUhKUQycCSgZQohawoKjnV1A7TN1pscogLIT+IO5jV/p6dJyT5dUiS
 Cx+kAgmwbMv6CiXzug0cZiI8hMCrTYdkZbThFbKrZlq2JpkGwNU47/bQpP4Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151721_243905_7EE76AF9 
X-CRM114-Status: UNSURE (   9.12  )
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

Document the Display Serial Interface on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 8611319bed2e..a7aa8fcb0dd1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-dsi
+              - mediatek,mt8365-dsi
           - const: mediatek,mt8183-dsi
 
   reg:

-- 
2.25.1


