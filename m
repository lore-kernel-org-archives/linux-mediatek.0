Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F09606A331
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 03:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E4EDKOqr;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hDlLcj38
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JfvogYuBx2ioQGw2JVVRY053U98MXFmHHk44uXXHgBQ=; b=E4EDKOqrCtTFuDiAiyqN2RNa5j
	36aOepduPRMr6NkQ/mA7bkG6owdSJfLXKsJiBKDGZzyfxghclL1NN3wfhWZ4rfysLFhBBRNMdur8B
	5ymPyTjhtUPIAKth8rv30iE7i7BjFTOrI3SQg8RL4osgaP3BJbljPzQVK5bUiX8kVqng5+l4vTsZK
	0PYXnquQxjiyX8p7U7HpMJehNcnP89xwiLNP5HCgRTnC41G/5yoGkKuLsy+Om7coidLULxp4DYBCF
	oXyqEOfbO9NhrQZgkgdDicRoo2VV85l8mQqMbz7r43MfcJ9GrpbAbGnt8NZMseFaKzqeDVlqI0Sj0
	3x9YZTDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFzt-0000000HBSD-2mGX;
	Mon, 09 Nov 2026 03:24:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQFzr-0000000HBRC-3Due;
	Mon, 09 Nov 2026 03:24:40 +0000
X-UUID: 14bb0a82dbed11f1acbe4559397dec65-20261108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=JfvogYuBx2ioQGw2JVVRY053U98MXFmHHk44uXXHgBQ=;
	b=hDlLcj38NzHbt5/xM8IukqbS2voRoWnNDYFB7oosNNO2/Kr/8Ol14R7z7FX2flngh4Y7R5jsyr/B0i+F5BJwMVPhvs1X5FKHXNlTP575tuE3uCcYXm3PG7MwTnIeq+OfCCSvwHJ0iEG2Ra2BQj7KIyk9jL4k4xyxDwxUEO93+qY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:79001d77-6b39-44b9-8781-fb9546831a80,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:ba7788b5-7f9d-4542-82ba-5821e5e353ee,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 14bb0a82dbed11f1acbe4559397dec65-20261108
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1314921685; Sun, 08 Nov 2026 20:24:32 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Nov 2026 11:24:30 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Nov 2026 11:24:29 +0800
From: Cyril Chao <Cyril.Chao@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Nathan Chancellor
	<nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<llvm@lists.linux.dev>, Cyril Chao <cyril.chao@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>
Subject: [PATCH v1 0/1] ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks
Date: Mon, 9 Nov 2026 11:24:08 +0800
Message-ID: <20261109032424.625004-1-Cyril.Chao@mediatek.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_192439_820109_16431FA3 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This single-patch series declares the MT8189 DP and HDMI jacks as AV
outputs, matching the status reported by the HDMI codec and exposing
the video-output input switch when jack input devices are enabled.

It is based on ASoC for-next at:
  c937f492dd40a8398d955cf0f4f9e11d7268bcb5
No additional patch dependencies are required.

Validation:
- checkpatch.pl: 0 errors, 0 warnings.
- Exported patch applied with git am to the recorded base; the resulting
  tree, commit message and author metadata match the approved commit.
- Retained November 7 build evidence: arm64 defconfig with
  CONFIG_SND_SOC_MT8189_NAU8825=m and CONFIG_SND_JACK_INPUT_DEV=y;
  mt8189-nau8825.o built with Clang 22. The corrected commit has the
  identical complete source tree; no rebuild was needed.

Cyril Chao (1):
  ASoC: mediatek: mt8189: Use AVOUT for DP and HDMI jacks

 sound/soc/mediatek/mt8189/mt8189-nau8825.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: c937f492dd40a8398d955cf0f4f9e11d7268bcb5
-- 
2.45.2


