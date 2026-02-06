Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFDAEE2091
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Feb 2026 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=24FWoAmlTh3laz6QYPrpxhNNCwjmzExpnfPP6EfBfic=; b=jH3m6L71plYxgjucH/xUry64/i
	COYi2or5wJGixfAKGVHIuWJCzphvVT1827bMifSRPaKPgMI4hk8Puf582v4gxKbtAO3aZpw6mOkYG
	gWhaCKTidCeq3foD4Mt41W/wi5tOsgwMsx2/r3UGLmKNRKhpbZqjS3Lc0C7L5IdcDKfjnGxiUAKIx
	5lL0/5DNhOapcqJOH7sNgSQfZWq2dBHYgNWtnzrIWZtKulPTQTFAZzvnHjvCZRQcW2dINHjta6OEB
	CKhsoaBSuWcK4QpxjCM4ZDWPPqYUjT58AX7/TwCT5x1K8t+WYoB+iGCC80Q5qOHdoXS5J0ZwvNy5u
	u7QOIyBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKvN-0000000BJ6W-0mtE;
	Fri, 06 Feb 2026 12:27:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKvL-0000000BJ6L-3mxa
	for linux-mediatek@bombadil.infradead.org;
	Fri, 06 Feb 2026 12:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=24FWoAmlTh3laz6QYPrpxhNNCwjmzExpnfPP6EfBfic=; b=X6VMYL8bvnvVtQckJFzEzmEdP7
	G/e4bhk2GrEGeusxRcQuy980zCu0oe++RihAuVomAjOrEtTtolcY5H0STsjOBdhzeBTjUYL2b3syE
	swxDcfx4CybBnN+spvRM0wpRfkhdtwbsTyU8eUNe5oHOu5KlNGEuH63b6e+W4gZEYyJj3gTNNfdlK
	Y0he/h8m7Od3oMtuEGjGRMPS6Cz9d//4bBCIlG9v0z7rGaG/lI7za2+x5GtFcOF1H1szjhGNCswKm
	VfKCYVmSCbFjGzPru3h8SHJkfm2weqKoujFum42gdvizKU5C6VD1rV4X8Yiq66xUzEblpD9Tr/LbT
	sz92izrA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKvH-00000003mOL-2Hlf
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Feb 2026 12:26:58 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so7560165e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Feb 2026 04:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770380813; x=1770985613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=24FWoAmlTh3laz6QYPrpxhNNCwjmzExpnfPP6EfBfic=;
        b=mtUcyDe3WhoBYBGECPv7PfoPVhmmqyn3Bl8gcO7RRr+6qzY9k1Kr/7TqxJWdR4aFhh
         EUkpDRxmZXj0kod0dt70YmCA83AmVFvDmOjH/uXbDqsRIMmdAmRtwLF8mI9o7cXBwQAz
         2t9vaYV7f3SP0k2bam6KiUePVdXphG61aWHOldb1/aVI7F5ISgWdIiC9fHHDMsydeejB
         CLINUJEyQyCeAZgrlqj7T7TW3eoG6yGdHZ6/GgWGoxzAXhbuW6EPDw4x/UemN6Hr6M6S
         mc3+aa16glElKqX10SPfiYiIIJ7qa0sUt/Wf6sQ8SIKI0UUMlJbpClxX3+DTNAAoGhqt
         fIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770380813; x=1770985613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24FWoAmlTh3laz6QYPrpxhNNCwjmzExpnfPP6EfBfic=;
        b=F30YnKaQr2vEBN3a3GjVy7PRT8Fes9z1d6i/mBRozG1wFKozp8ms2ieX+slQE0f4Po
         1+NJbwxJ3xNgLKx6NnkuzorIVwMV1LICNtH6LcyBWCGFptkQeJriGgMAb8kw/Srjlsxx
         kreyk9iLBSoqmtIon9S2s/PK+namI2t+lmS99sTZmdxe7NVCDy16mzQIGOS2xp9vjdAQ
         psXJQaWy5J6yjoFSOFfd2c+vo7B80W+34oIjYfV3vsrEjmTjcxy7j5ns9Xd9AKPwCZPK
         WaPEE1gRFHqlppI2VcCaGsfKxrI+II5LE479b7lVTT9XU/mfk1Od39iIz7EjFFYpuOoW
         fOPA==
X-Gm-Message-State: AOJu0Yz6ScQzwTx8ESKgKHhWCoCAffIqLqX6pc4wtXTy2LZmHle8NW6d
	wQXMTAQWNeqHfDsMocdJHxdv59nlpxw4x/k7+gftL65f4yZg1B58DCHmpnxvEQ==
X-Gm-Gg: AZuq6aL68aGHldbTaU+niNgg8w4HvP0JdCMe5UoTCLLmCs60AgmO8w2mFFFY8leD+yo
	A5OR4MzEbYUH1uUaP7pxxWbQIdkgh00zwHa0WUJbbhM8+KZ+RsvFxDJEIRn+Vdc62TdXG5vzHdx
	afWUjpJP5A+XYudq8Z1ghurNHQnTwuWca9gfroBjWKf0Wuc2Am4NuneBrgcnS/NFPvQlOaMzOOK
	fGL9u/k9rORv60K8BHDpxDAVUch50Xaqd7ciiIjd9IXIy8P4uFUQuNDgrOKIj1VoeTujlfKZyjg
	WRr08+OVB5Vmm1Bz7k59iiV2/7254bv0DaK0ZpM0ubIx4yM37RZsPKfvjdxkI3e3QpdsHkKkacJ
	7F6CL/udb/rESNwI1m4id+x75HriaAxxddZvxN47Rj9DNweO4FNqhGOu4cCEwHdjHvdmzvMAVWi
	ViXljKMp0=
X-Received: by 2002:a05:600c:c16d:b0:475:dd89:acb with SMTP id 5b1f17b1804b1-48320216097mr35801865e9.22.1770380812676;
        Fri, 06 Feb 2026 04:26:52 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d299bfsm114441375e9.2.2026.02.06.04.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 04:26:52 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] soc: mediatek: mtk-mmsys: Restore MT8167 routing masks lost during merge
Date: Fri,  6 Feb 2026 12:26:23 +0000
Message-ID: <20260206122623.670023-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_122656_269253_1682F62C 
X-CRM114-Status: UNSURE (   8.59  )
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

The original patch at
https://lore.kernel.org/all/20201027160631.608503-2-fparent@baylibre.com/
included the values for the route masks, but they got lost during merge.

Fixes: 060f7875bd23 ("soc: mediatek: mmsys: Add support for MT8167 SoC")

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index c468926561b4..eef14083c47b 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -10,24 +10,29 @@
 #define MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x06c
 
 #define MT8167_DITHER_MOUT_EN_RDMA0			0x1
+#define MT8167_DITHER_MOUT_EN_MASK			0x7
+
 #define MT8167_RDMA0_SOUT_DSI0				0x2
+#define MT8167_RDMA0_SOUT_MASK				0x3
+
 #define MT8167_DSI0_SEL_IN_RDMA0			0x1
+#define MT8167_DSI0_SEL_IN_MASK				0x3
 
 static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
 		    OVL0_MOUT_EN_COLOR0),
 	MMSYS_ROUTE(DITHER0, RDMA0,
-		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_MASK,
 		    MT8167_DITHER_MOUT_EN_RDMA0),
 	MMSYS_ROUTE(OVL0, COLOR0,
 		    MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
 		    COLOR0_SEL_IN_OVL0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_RDMA0,
+		    MT8167_DISP_REG_CONFIG_DISP_DSI0_SEL_IN, MT8167_DSI0_SEL_IN_MASK,
 		    MT8167_DSI0_SEL_IN_RDMA0),
 	MMSYS_ROUTE(RDMA0, DSI0,
-		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_DSI0,
+		    MT8167_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN, MT8167_RDMA0_SOUT_MASK,
 		    MT8167_RDMA0_SOUT_DSI0),
 };
 
-- 
2.43.0


