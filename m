Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7704FC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tla+QFcP97ewfTbQi7g23xuxojyfOlpLXvPFzq8Qwg4=; b=KN/MbGTk3IKolDx7RLSBXRLv8h
	+g0Fhm7y3BIriCKFHv0BW1iDJl2k5n245TYdcIeT8BeylhGPHe4GpKkvXcOCzRkLnTQWN8PylE9W5
	hjy1hjSz6vlaJPokim5EKnSvE336vl7dIWXjHuElD98LmVHmT2IibH3Xhflm3dcsQZ7kYq8iFFJr+
	uCbpyYvPLpJqVcznylX4TpAavO1SDJIvCKHE9dsb6AoQXYLWuFnSrQlr7JwBUG6p2LuYfUizqrqZW
	4YgSjwvGZk5wg2sPA51fWF5shlR/t7udsX1bmJ6Pkj47KEYO9lBQnZcf4GF4xWgwko7ZtELsIfXWV
	e6RufNUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7vF-00000006GVm-3uBj;
	Thu, 23 May 2024 12:51:53 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tC-00000006F6D-28y0
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:49 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-351da5838fcso5857637f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468584; x=1717073384; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tla+QFcP97ewfTbQi7g23xuxojyfOlpLXvPFzq8Qwg4=;
        b=kfq2KY5KZy2niEJcK/1eBqZ1Gt2SfETmSBTqaTT/iKjze9NPVwepa2o4oFzi33WM3t
         wnk/rIviSCl4N9AzqODscipsGXnKY7gb2p4/4zlByF7j6ZcblIE0W2jxia/NVIe8oeUF
         8HalXvCt/Tz1JH6+Yad+tzp6SF5fUL24tYxyorVh6PHNCUUiVOxCg6Cb4TMRgrvGVw8K
         NnB2a0UqaFsklxS1wZ7iLg4l5nzlgaCbb21dEioG4emuf/o6MzYmOlT0obVo+VDaRRV6
         Nz9XTB7t61KCIOJY8UfE7SB3kT0+IsOaoRw93saBqcC+nsyXgPNZ/jErx+4zbmoEjnFo
         i2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468584; x=1717073384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tla+QFcP97ewfTbQi7g23xuxojyfOlpLXvPFzq8Qwg4=;
        b=tGiZNa4d7eEY7PSyIvGxvep7/PEzagOhz/KlQpjyF1+UXgabvcjHRzcUjLE60ThC6V
         8bPwonJbcvS8jth5Nb75GeYNvxrF50ITzK5W2iF5UTAGRG1vEkoj97HGRvOwFGH1YZZp
         GGJlnYd7/o4iiEreEK7TJErRKWeHXKWY0NSvoeADUngEm1AjSrBZv8xFqOlr/ef2Qvvb
         wygMROQqPvF5WdoMenq0n1ZjlhieYLymA9pcdGh1AjgTj7cmuX+9u8noST8OsIptQNvQ
         52kJ1jQbqp/pJB2HzlvQVa6EzeCglDgcooH9Z2e+W/bheB3EkASzpSeVq8uOOlbV7FLT
         rjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlLXXHbwLfuOTCvPRHBMTLUMFSimnb6YREWNUIkHMECyF6hi9imSlkoblU05rqdtn1tdvnsTShQiDCIwa0VMM/4je7Mm22UoJUPrd03Pfwy7Nn
X-Gm-Message-State: AOJu0Yxxf3tRYHLu6IFGcyEvqLIBB6Ag7LJAugH8N/6RRvKmmrc2c5iM
	cW3J5mG0Sbvjbvd16gD5b4arlnREuhBu5BGnj3CISzna+AMzYyzwM/0J3q0Az38=
X-Google-Smtp-Source: AGHT+IFLhyC8Xpob3M3s4Cxdqi4ACW/Cye9oy07BDePPRH9xUy37KKFTstNcxwjc/zHabOXrMLcPSQ==
X-Received: by 2002:adf:ef8e:0:b0:354:f6f1:82d with SMTP id ffacd0b85a97d-354f6f10b38mr1729718f8f.67.1716468583878;
        Thu, 23 May 2024 05:49:43 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:43 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:26 +0200
Subject: [PATCH v4 13/15] arm64: defconfig: enable display connector
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-13-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=693; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=lT6J9gv517qEQpypdtd6Iu9RcuwU5IxfY3HAdtX+bNM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTj7oyWFDNqOH2/emBzEE6Rhg5Wol/HE4THuRE
 L+4q3siJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURZ8LD/
 sFyC5Joy1O1vuXzM9ubKBm4QaSmd7AWbmjAQLbyxBipVHccFjqq0cUG5F1a0/awy6JyazMrSGvTeaS
 Pw2cJiYytxRFt9wnaU95dJR0iBlzRsHJv9LegsXbVeDQhDdFs62sQoE/GYZx7xXQ+jewDmloFf0x+B
 WEbrMNiYBy+mNfXPakQRAkudGwHFaNjOjrjo84cdxcFaRw/Yj2VPqNejmLW44onVsu0oPAPKY16LCd
 3nDGa5pH4RFvtmh7q2bgdMZG6+EpV8vllDQD4C8rLQtbbgRlSWT6x+1MP/RfAx5fRrHPaA2cu7i1cu
 4uJOHNHTkMWr5Q9K5UcfowqO45Ngs/2QCu7gR8fgvpkVTE/7MsWqIxTr2SMEMJ2HjFWbUAeTEvW4d/
 SGohMB3IfKQt54delkSDE7qZCiBDCG+gJ3kAXdgwzmZYE/bwcjGQsFMeACBnC/buhruAT1hsJpulFQ
 /+S4osrgiCBiBRgvg3tggDrDuUrX8RMsyapeXXdkWJ30m+monbTvWJdlFeZtjBrFvGQdP04lwgUtts
 k2DG79Vq8DhBvHCZQkvAxGy2mE5WGFVTsoq/QCpQmdds8beUX5EgAzb/WfSFYww/d03x/B0kpmyCmJ
 jcQMzsE1Hex3G6qXQQCVaOFOJBfr8fWMLYQVZ5eCN7ggFPGVFzCVfyXlh4Ow==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054946_871167_A8E9F6C1 
X-CRM114-Status: UNSURE (   8.68  )
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

Enable this feature for the i350-evk HDMI connector support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6281975199c4..7dac8f92b0b9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -881,6 +881,7 @@ CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1


