Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97968C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Apr 2022 05:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tzoxSqNQ3w6detiPIbx8d7vZfiH4JC8Mj7R91uXx5Pk=; b=wzOswxhkpzsJj3
	7UwrHHsgmPwolUQjaeWC+AGm0T49dJBDu7Dpzi378WBPjYnBIMpGjC16WuL6PlJCGm+u81IxhPy83
	jXvjAe36QO/r0AGUJFroQpxneDxUG0UZ/6AZqAJo4HEe+xfE9NXUlPhoZ59ZlX0f7pOaM8jFvHS9r
	mFrVHy7li20CmeRLeTkhIUEEkUNibgN5SgaFRsOh0SjaTWb6ddmBRjSu7IjK6r0Vb7LPYAwqhcYvb
	PoRpXoBzMexR3K3wZECyXNktk3lJrmbDJvTKEXHrW5uPqfoQiVEFU5iU3k3KmgbrOnnwOqX0FSkvv
	e48lih4syCzRxSnKf+vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naWJB-0085MY-NE; Sat, 02 Apr 2022 05:28:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naWJ9-0085L9-4H; Sat, 02 Apr 2022 05:28:20 +0000
X-UUID: 96fff378bb9c411d85ac4a29e943895f-20220401
X-UUID: 96fff378bb9c411d85ac4a29e943895f-20220401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 615877557; Fri, 01 Apr 2022 22:28:13 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 22:18:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 2 Apr 2022 13:17:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 2 Apr 2022 13:17:56 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <tzungbi@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [v8 0/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Date: Sat, 2 Apr 2022 13:17:50 +0800
Message-ID: <20220402051754.17513-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_222819_230278_C561A6BC 
X-CRM114-Status: UNSURE (   9.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The series reuses mt8192-mt6359-rt10150rt5682.c for supporting machine
driver with rt1015p speaker amplifier and rt5682s headset codec.

Changes from v7:
  - "mediatek,hdmi-codec" is an optional property, the code and the
    binding document should match.

Changes from v6:
  - "speaker-codec" changes to "speaker-codecs" due to there may be two
    speaker codec.

Changes from v5:
  - "mediatek,headset-codec" and "mediatek,speaker-codec" drop prefix
    and move to properties from patternProperties.

Changes form v4:
  - split a large patch into three small patches for easy reviewing
  - correct coding style

Changes from v3:
  - fix build error: too many arguments for format
    [-Werror-format-extra-args]

Changes from v2:
  - fix build warnings such as "data argument not used by format string"

Changes from v1:
  - uses the snd_soc_of_get_dai_link_codecs to complete the
  configuration of dai_link's codecs
  - uses definitions to simplifies card name and compatible name

Jiaxin Yu (4):
  ASoC: dt-bindings: mt8192-mt6359: add new compatible and new
    properties
  ASoC: mediatek: mt8192: refactor for I2S3 DAI link of speaker
  ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of headset
  ASoC: mediatek: mt8192: support rt1015p_rt5682s

 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    |  32 +++
 sound/soc/mediatek/Kconfig                    |   1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 199 +++++++++++-------
 3 files changed, 153 insertions(+), 79 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
