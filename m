Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4747AC25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28zbSoB8+Zxd+IxXtMzgHHKE2gbwNBphtmm6Xt7tCzg=; b=QEtcYpUh31Jygbo7Zmo4io9EZB
	28WQbWLovq3ytce/zARGzwo8lgBMYNVmKNsZtMfR++oXOTL3jbAgLhwgUi3fj0jHjGMpuavQ8uNii
	VObt3hudgC6Ovp7t4e44+sO3/kf8HC0M2SG5Yj+mIm+MKJw+0mfGiIEy05TspgG2fDK7hlGbJ4jyP
	cGGu0HsJCkZGdyI9w3gZk5bCrcQHIeu99xPPtMIjNSMT3ZSDSv8HTXArvHOhAQrTGAbVXWlqXDExU
	qRzHIp/GvPD5Clli3UCqflVwFAOb/6tXWHR6vvnVBWferoE0WFWm5nF2SKde9rG1KdTtoP3xezuJb
	Qe+4j35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7ud-00000006G9E-38EH;
	Thu, 23 May 2024 12:51:15 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7t8-00000006F3U-4AbP
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-354dfe54738so1384337f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468581; x=1717073381; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28zbSoB8+Zxd+IxXtMzgHHKE2gbwNBphtmm6Xt7tCzg=;
        b=gmyPLb4EN8g06nQB59qgZBx8pYf/fybsLpZhfXkuLDuqD0J1+zRDYYQvbg2PHtnZ6i
         bymGdsJ3OlmO8l2XfJKXy15wCAPAn6D4emfos0YAAQLjL6Z1pyr9r8IVDUdB4XZ82f8h
         F/Y14p0R3Oi5pKC0BN6LbPUdPdMjArpo54HAPrmuWbO7iQSJb/Boktnngye18mWdV416
         qwB0gX/XY1mRIVu2zz3mw1OUo6DMGoRh2puh1KpkSQdV3N6bfipgpvn51S1wbtBwAbGH
         aUYmRN043whSqYSD7KlHGtlqXtAZK+LrkkhfTpzt2JnME/5bsQ48OnvMAci1n/ZqEO1R
         J9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468581; x=1717073381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28zbSoB8+Zxd+IxXtMzgHHKE2gbwNBphtmm6Xt7tCzg=;
        b=R0WkZJxflKthMbDMeWrSLetBAIjAL3hx/qjDdPpwCbbEhzSkDeLwhXqoTdpySLTweH
         DeL+FyufE2SS8/MzIUfn/dr9WgKr7K7sd7egtpS+dTCI8kI8TSA8WwG+Z1zn0SW2dCNx
         JAp6aNu0omHV7PgrC5jxQXD2mCj3VF7YjzuS72nR7zMDxBIL1MVD9iBfXVdKycrR6uKJ
         ScenL0mQ2BlQHiJjqlZFtm5qKryTBkAhQjRcuK8PApepnBHg+/qZZ53q5TpcSdYC+J0d
         /sNFthD1Z7F95ddL/bN18fcow8E9EYkC/JAPvJHMxe/tHziS4miZQ/yWAgaciRrzaiuH
         KHWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6aXewL7js2XHuVSQ9duddBAegaw6wdKbKLujit/0SWErDHz71Dwa+zC7glR31DKrL5x7bzD73EbyjKNP8GRuNHzjpCQOOQtN/IKBbth3m5iyY
X-Gm-Message-State: AOJu0Yxzaw4fkdwnLnQj7NFBkDuPXtfNrzUUaSLJYWM2KOjABGFRKND2
	+VIZBwMFXeFqq+YTbo0soxzjwFsIyfDmwqwrq76O6ioV5TzekbEZzgL3wgZNouU=
X-Google-Smtp-Source: AGHT+IH9I1yKELxeEkwniF+9niwDJ4iWhtTnG+NlRhabW9VWGojLsvUwjFjxu/LmyLyU3/BR1jPY+g==
X-Received: by 2002:adf:e586:0:b0:34d:963a:12cc with SMTP id ffacd0b85a97d-354d8dbc8bfmr3661763f8f.53.1716468581288;
        Thu, 23 May 2024 05:49:41 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:40 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:24 +0200
Subject: [PATCH v4 11/15] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-11-ed82eb168fb1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=/0McRX6GoM2+nGIkWn2jaKs7S924L4q446vEYfmzgP4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTlpUBxrslkpM9KkVJFXYtjbSrCv5t3TWgUxI5
 XUvLM5WJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURWb4D/
 9wTBNeGwtAKm9fDQEgY3KlVoq3aw7N/I6ggPNiqm7lu48cT3alLmUEiAEH9cxr+ooYaOeF6xddtH9N
 Avqu+Na9+0o38iHIVyjOU/IB4Nrily2yDRjDJA1hvhAiygXW4A1rr7erHlTrJKuA6b2//3of5lwcpU
 C2WinPN+uvFvTf8s76ZBBRDLcMwz1YlFJDVcMZtHf9E+dCO1TDJ/LJ2LpyUQzYxDFC7dL9ClMU7bDh
 aRUcvXBSGYj02LWSk2KUBxbt8uL0pLsU5egoPTh0lwNl9Q/okAbJ31MY9AXCM02DXK/fha8WOx3xTw
 JhcIVPZo1pHFDMBCXeO00MmXu5eMyLfszMWYIpgAVBUZN7zkaJTlpoGza91wmPCNW7lZPpZLunm67n
 EjdgwfwctDV8gmmcaZagkU1NzGw/gQPe1/Nq6L/Xvp0LLsWKkYd7IlR/WS8XGhf3akmBJ+njq09a50
 DygPcXf13zXLX9yQoQPT499tok9k750eiHUe7iwpZRUlxp//nSGY7rK7GyWBCNjVD488SyNYYHpOxd
 3ZvRpJi4DnKnKauaFbFvyIFAJZDd7xzJn7haovlEAzvWt1bhVWvKVhImKpOcepGVrhBx73DT2+2SkV
 LVMKKq0yd/o08BjawyKMV9I+MVYefWOReRhG1sp/k3yb1r9aGKSO7tNJcPQQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054943_283807_8D969CC3 
X-CRM114-Status: GOOD (  12.19  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e036d9394c23..cb546a9e9419 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -643,6 +643,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1


