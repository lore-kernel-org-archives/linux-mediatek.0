Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B29CFD36B
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 01:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EfPcadKYCivxr5x/Ftxp3/Gc/w1pbCDzPPnYPjSkcmM=; b=mw1AA5pI9dSYzpEkvviI0aHMFE
	eFoa8z8gmCtKnyNV9WtEZ3w/Oasyc8UUUgaMq69+FmM2NVD+wYce9Vu8BYSd7DFsI1MdWUA87CONn
	JQCZIwD47e/KT6SZpfdsezaZErHGZUTIgQvDrhe/pYL9SX+nkKyLmDe/G2tu2AQF8fCuIkgH0mP4B
	65vol+3DgR60+QcFM1cnc+FehMQ3pNvPWLuiPesW+bVf3hq4pQzo8CuBNIvJG301RJ6FI0h7/vCE2
	2X27NpxCsPN31f7pGW0fjwi4r9+ZznH2vg4yaGmSDQV9UtCXHKP2eyBbC5OHa4AF3aw026fH4ZT8h
	9MR0GtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNiHL-0000000CaS7-0afW;
	Tue, 25 Nov 2025 01:55:39 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNiHI-0000000CaRT-0oL3;
	Tue, 25 Nov 2025 01:55:38 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowAC3SdyMDCVpUkn1AQ--.427S2;
	Tue, 25 Nov 2025 09:55:24 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] drm/mediatek: mtk_hdmi_v2: Remove unneeded semicolon
Date: Tue, 25 Nov 2025 09:47:40 +0800
Message-Id: <20251125014740.1059347-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3SdyMDCVpUkn1AQ--.427S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZFWDuF4rXw4DXFWDXFW7CFg_yoW8Jr1fpF
	4xK3yUAFWFyFW2kw4UAFn7Jw4Yyas7AFZ3GrWYgw1avw15XF1rJryaya4YyrWvyFW8u3Wa
	yF1qyr9xWa12vrUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_KwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUlYL9UUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_175536_604748_67476D48 
X-CRM114-Status: UNSURE (   8.45  )
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

Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
semantic patch at scripts/coccinelle/misc/semicolon.cocci.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index c272e1e74b7d..d510ca8cfc4a 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -746,7 +746,7 @@ static void mtk_hdmi_v2_change_video_resolution(struct mtk_hdmi *hdmi,
 	case HDMI_COLORSPACE_YUV420:
 		mtk_hdmi_yuv420_downsampling(hdmi, true);
 		break;
-	};
+	}
 }
 
 static void mtk_hdmi_v2_output_set_display_mode(struct mtk_hdmi *hdmi,
@@ -1157,7 +1157,7 @@ static int mtk_hdmi_v2_hdmi_clear_infoframe(struct drm_bridge *bridge,
 	case HDMI_INFOFRAME_TYPE_DRM:
 	default:
 		break;
-	};
+	}
 
 	return 0;
 }
@@ -1185,7 +1185,7 @@ static int mtk_hdmi_v2_hdmi_write_infoframe(struct drm_bridge *bridge,
 	default:
 		dev_err(hdmi->dev, "Unsupported HDMI infoframe type %u\n", type);
 		break;
-	};
+	}
 
 	return 0;
 }
-- 
2.25.1


