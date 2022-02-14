Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB67C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 06:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8F91V+B1zrppQuru3l2OIdRhVp673Z1J630kVUK7GIk=; b=pnw+IjYrahoSSB
	jmXBorGL01Ta1fFNDveLRt3q4GuVdkgb8MzD2UzlB5WYcgCZ1GL3lK3nM8pL0xLp2jAHmotzRJ+Ji
	4Ue07kqoKcDPS1Qky86IMTFrbEp6TQxUGu0j1cp3p3QjOYQTcqaob8bz3Vxdn9aFc6ucqZqvCiHhu
	BDUa4FYuBC0cYhuXDhd+Ja7/TyUfKpTu3+Pwep29x8MW54w7sdMfsPUT8BZ0BtWaVhW6amuVW44Vt
	ZuVL4PDZdK4mbbLp7ytHOrQBuALle/uFalugLkQgSzpCe+sQxQSbqKiKMKjUSQG0mygw5qmid/Ups
	X5cQiXxrkFBBGvlmjVcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJUjf-00DP4J-16; Mon, 14 Feb 2022 06:21:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJUif-00DOhM-DT; Mon, 14 Feb 2022 06:20:18 +0000
X-UUID: 168115e6d45d4e5498d856e3c51dfff7-20220213
X-UUID: 168115e6d45d4e5498d856e3c51dfff7-20220213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 801895153; Sun, 13 Feb 2022 23:20:13 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 13 Feb 2022 22:12:24 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Feb 2022 14:12:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Feb 2022 14:12:20 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
CC: James Wang <james.qian.wang@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 <iommu@lists.linux-foundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, <linux-kernel@vger.kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-mediatek@lists.infradead.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <linux-arm-kernel@lists.infradead.org>, "Stephen
 Boyd" <sboyd@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>, Tomasz Figa
 <tfiga@chromium.org>, <srv_heupstream@mediatek.com>, Rob Clark
 <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeremy Szu
 <jeremy.szu@canonical.com>, Werner Sembach <wse@tuxedocomputers.com>, "Hui
 Wang" <hui.wang@canonical.com>, Cameron Berkenpas <cam@neo-zeon.de>, "Kailang
 Yang" <kailang@realtek.com>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Sami Loone <sami@loone.fi>, <alsa-devel@alsa-project.org>
Subject: [PATCH 23/23] ALSA: hda/realtek: Make use of the helper
 component_compare_dev_name
Date: Mon, 14 Feb 2022 14:08:19 +0800
Message-ID: <20220214060819.7334-24-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220214060819.7334-1-yong.wu@mediatek.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_222017_485294_49BD490A 
X-CRM114-Status: GOOD (  11.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the common compare helper from component.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Jeremy Szu <jeremy.szu@canonical.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>
Cc: Hui Wang <hui.wang@canonical.com>
Cc: Cameron Berkenpas <cam@neo-zeon.de>
Cc: Kailang Yang <kailang@realtek.com>
Cc: Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: Sami Loone <sami@loone.fi>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 sound/pci/hda/patch_realtek.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 668274e52674..9da004d99cdb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6530,11 +6530,6 @@ static void alc287_fixup_legion_15imhg05_speakers(struct hda_codec *codec,
 	}
 }
 
-static int comp_match_dev_name(struct device *dev, void *data)
-{
-	return strcmp(dev_name(dev), data) == 0;
-}
-
 static int find_comp_by_dev_name(struct alc_spec *spec, const char *name)
 {
 	int i;
@@ -6595,7 +6590,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 					      "%s-%s:00-cs35l41-hda.%d", bus, hid, i);
 			if (!name)
 				return;
-			component_match_add(dev, &spec->match, comp_match_dev_name, name);
+			component_match_add(dev, &spec->match, component_compare_dev_name, name);
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
@@ -6644,9 +6639,9 @@ static void alc287_fixup_legion_16achg6_speakers(struct hda_codec *cdc, const st
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
-		component_match_add(dev, &spec->match, comp_match_dev_name,
+		component_match_add(dev, &spec->match, component_compare_dev_name,
 				    "i2c-CLSA0100:00-cs35l41-hda.0");
-		component_match_add(dev, &spec->match, comp_match_dev_name,
+		component_match_add(dev, &spec->match, component_compare_dev_name,
 				    "i2c-CLSA0100:00-cs35l41-hda.1");
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
