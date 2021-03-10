Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62386C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 13:33:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BE1A64FD6
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 13:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BE1A64FD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N+f9FiZ65GELl4fQiyP5n3Si5ICYYJ/I651hgchne28=; b=XSCbM8uYdD06Br5CH/xHz/CT1s
	Tcw+Vkpl/yJa7d/YUZ0LqewaVS3Y1V2YL2nHn/LwdC3kQ/mnnbyuKOkpa1kuaWs1n38gTi7hoCVaO
	h9CZ9aXoYQy/BD97e8ZC7m7kFMnFZCEfK1Jc+LqwWR/75U5mTqhpBTyrjO6AthgbSnyy63wWHCjuz
	vNUYFPVl/Ox4AHhEl8rtATg/iEhLNfshPmUgNP/H3Ks8iPQMdf3jBMJVt6/bS3YWLKCO4lJHznPWP
	Cn6stq8YGpGsgyvpKIdBYnn0bVzasdyE1XKF+OqBwLbuwn5w3ffOLi/NHFl76TJqZzILWO1R+G49l
	UQDCgNOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJyy3-006wuc-Rg; Wed, 10 Mar 2021 13:33:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJyxn-006wre-E2; Wed, 10 Mar 2021 13:33:28 +0000
X-UUID: cc2524121b2f479aa241d9d16d57cac4-20210310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Pt2J+20v6GVPKCJ0bAa7201bPs7f/qhbVF3olTBYM2U=; 
 b=soRkGuScVpvOjOaFXLaZbIi6EbKpPnjm1sk3RI4x6vWgKPdwm1lQEkbn+ETVkjQenNbnDgxM26E0vSoNR7wOU4RU3xChXQgJp4k2+sCH1dxcA2NGD8rMrzk8LbJaAbZ8aZAU3WKbiQX9J3tPtNpN7dNmSer9OJqLIPXhY6Th8CM=;
X-UUID: cc2524121b2f479aa241d9d16d57cac4-20210310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 196565047; Wed, 10 Mar 2021 05:33:13 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 05:33:11 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 21:33:09 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 21:33:10 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Jack Yu
 <jack.yu@realtek.com>, Shuming Fan <shumingf@realtek.com>, Dan Murphy
 <dmurphy@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, "Argus
 Lin" <argus.lin@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Shane.Chien <shane.chien@mediatek.com>, Chipeng Chang
 <chipeng.chang@mediatek.com>, <alsa-devel@alsa-project.org>,
 <wsd_upstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH V2 0/2] Add mediatek MT6359 ASoC accdet jack driver
Date: Wed, 10 Mar 2021 21:33:04 +0800
Message-ID: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_133324_335590_F6A8629B 
X-CRM114-Status: GOOD (  10.69  )
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

All of 3-pole and 4-pole jack are supported.

change since v2:
  - fixs missing blank at Kconfig.
  - fixs comment format and spelling mistake.
  - changes private structure mt6359_accdet to mt6359-accdet.h and uses this
    data as function parameter.
  - removes compatible string declaration.
  - uses regmap_read_poll_timeout as polling timer.
  - simplify jack detection and key detection report function.
  - adds mt6359_accdet_enable_jack_detect for sound card jack initialization.

change since v1:
  - adds mt6359 accdet binding document
  - adds mt6359 accdet driver

*** BLURB HERE ***

Argus Lin (2):
  dt-bindings: mediatek: mt6359: add ASoC mt6359 ASoC accdet jack
    document
  ASoC: mediatek: mt6359: add MT6359 accdet jack driver

 .../bindings/sound/mt6359-accdet.yaml         |  164 ++
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/mt6359-accdet.c              | 1080 ++++++++++
 sound/soc/codecs/mt6359-accdet.h              |  128 ++
 sound/soc/codecs/mt6359.h                     | 1864 ++++++++++++++++-
 6 files changed, 3139 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
 create mode 100644 sound/soc/codecs/mt6359-accdet.c
 create mode 100644 sound/soc/codecs/mt6359-accdet.h

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
