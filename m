Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E72C61D93
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bshaVLl7I5VmG/9PhcP3nuXBjaqS8pv5wJ1Ry067DEY=; b=vVZ6eVDx6fGyKP8I3Gx1PQjtGQ
	bcJYNpAQvYMu5IPip7tGe4veECBhgkuyx4+LuqAfq/+ocIz9wN9W6twfasiapq/foRpyDYdniWY2D
	Z8qdPvw69WTIZpcMXQCBWP4H3BmBiXRTptZkTHB8yn9U96beCgHC1p/cV41TOH04FCHinDvgaWjQ3
	ne2EqoENIhjDO6H1bmyPcfvLg26HSdzN7D2WDUkf3sszV27hNH65pE2HAE3w7YXtbYrjq5eail/Qv
	bs+qjKiyyQAJ1aQf0fFzlmfjKgAChG/qV31UsDCfDfGdZ4zV4c3s5u2Vru3oWrkT+r0HNCmJuqh9r
	PSc+vP1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNl-00GduY-1j;
	Tue, 21 Nov 2023 11:57:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PN5-00GdCY-05;
	Tue, 21 Nov 2023 11:56:57 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D74B6607326;
	Tue, 21 Nov 2023 11:56:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567809;
	bh=P8X/98SRN6b58tyqRku7rqXinlOozOu5V7sRiK56qy0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dHgS1RJq0Qde42IELsuCTHqSQUUMs2O5o3pr6jsaRfeWgucPLnjDnNFC+734Mq2l8
	 ev3lxVepD9nZeneSZtjzM9cCNvo0vLgJh5rTGhiRsh/Aq1XNMzckz1syPTnrmkvOeN
	 badIDZ0WLaQGPbm9sRVl+I3MSUE/LrPj14tQEQOccy6XJqFy8x3KQW0RAaMX9uwumR
	 OGX/i75TqF4MZ8mlRJrzvgpeVRXxowj0odh5PX8/dK85bg6ds3rLu47pz12MGAV9a9
	 WWpEf6mwTIHCnv3Y4fXFfUmJz6iQlnQH1reXh2BtjImAQiFaxF7DnCTU8bIrmoCw2R
	 tICxMBVJU6E+Q==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v2 17/20] soc: mediatek: mtk-svs: Use ULONG_MAX to compare floor frequency
Date: Tue, 21 Nov 2023 12:56:21 +0100
Message-ID: <20231121115624.56855-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
References: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035651_245473_E4CCC2DE 
X-CRM114-Status: GOOD (  12.98  )
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

The `freq` variable is of type unsigned long and, even though it does
currently work with u32 because no frequency is higher than U32_MAX,
it is not guaranteed that in the future we will see one.
Initialize the freq variable with ULONG_MAX instead of U32_MAX.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 16a16c5a3f24..df39e7430ba9 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1804,7 +1804,7 @@ static int svs_bank_resource_setup(struct svs_platform *svsp)
 			return count;
 		}
 
-		for (i = 0, freq = U32_MAX; i < svsb->opp_count; i++, freq--) {
+		for (i = 0, freq = ULONG_MAX; i < svsb->opp_count; i++, freq--) {
 			opp = dev_pm_opp_find_freq_floor(svsb->opp_dev, &freq);
 			if (IS_ERR(opp)) {
 				dev_err(svsb->dev, "cannot find freq = %ld\n",
-- 
2.42.0


