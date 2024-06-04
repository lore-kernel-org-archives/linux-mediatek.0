Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9634EC25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75atZ5FmlzeC0V+ciPMxXDA3LpQ2wg6e974n2Q9TZ+4=; b=3ygzSxqAjeOA+pIHb/WB3OD4eS
	wMyAu6SW6gaLSQp2LgD3PpI27kwlhH24LaSqvrD3nCsYKaFXQRCUxQkktY8B+b/F0juLk7PBrY7/D
	bp8vkWum9rZBu2JI8gtBzPe1qztrVRdzLf/ZGmr1++Hujirl52gsnfWqqPFNIeKN40gytocDeGs46
	cZCT0ZgW0xNliaa23EKxnmHD2vSrZB3zreRzlDC0UwTuNkg9usFfTlllUDDA32FEGujltBcEMeror
	SZVYcpH71JoTyRW3Ma6JJSbyyVXpJ53blTkEZjpJ3r0vfvqly7y0u/8CRGB2XZVdPkdWPp7KW7ocB
	w7E3HWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETJI-00000002HtV-0AwG;
	Tue, 04 Jun 2024 12:30:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETIy-00000002HhW-4ArT;
	Tue, 04 Jun 2024 12:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717504219;
	bh=fKt22plDiq37Whi44C+GK1htAfZF0xNWBNbbUorI/T0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dr+rYusLTtwGNRBZguQ9EKPGnhZ+NuVPaiSMHOrJpK4YD64f3Q8l3vuuwXW9d8q5o
	 6RINkfBJMkI804Ou/Xx1be0VIhtVKk4mz+m0IhCep/uLczfgFh0K15z6nPqXt8SLZ3
	 eXZA7LZ57VV3N3ZQz5o6hSibqOTS6XIYRFjTMp7MfeG/MiVmXkHL5YQ+HGkifqmadS
	 wKnWFw3pXdlK8bZv1dgFH+ZAtBNsklJ/aLXXqVoE2zSfMKbSH54eYAAlrJ1v6DWHzy
	 yJJ5HDBkvfgSmir6aXWG1AJMgB6bbwvrjHNkMCGdbFD3KLj6ODAcZ4BX07o8m6YWAt
	 8B2RftNyVDnFA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3A78B37821F2;
	Tue,  4 Jun 2024 12:30:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	bigunclemax@gmail.com,
	dlechner@baylibre.com,
	marius.cristea@microchip.com,
	marcelo.schmitt@analog.com,
	fr0st61te@gmail.com,
	mitrutzceclan@gmail.com,
	mike.looijmans@topic.nl,
	marcus.folkesson@gmail.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	andy.shevchenko@gmail.com,
	kernel@collabora.com
Subject: [PATCH v2 3/5] math.h: Add unsigned 8 bits fractional numbers type
Date: Tue,  4 Jun 2024 14:30:06 +0200
Message-ID: <20240604123008.327424-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
References: <20240604123008.327424-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_053021_288973_BD30F74C 
X-CRM114-Status: UNSURE (   7.77  )
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

Some users may be requiring only rather small numbers as both
numerator and denominator: add signed and unsigned 8 bits
structs {s8,u8}_fract.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/linux/math.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/math.h b/include/linux/math.h
index dd4152711de7..f5f18dc3616b 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -112,6 +112,8 @@ struct type##_fract {					\
 	__##type numerator;				\
 	__##type denominator;				\
 };
+__STRUCT_FRACT(s8)
+__STRUCT_FRACT(u8)
 __STRUCT_FRACT(s16)
 __STRUCT_FRACT(u16)
 __STRUCT_FRACT(s32)
-- 
2.45.1


