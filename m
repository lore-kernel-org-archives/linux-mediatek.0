Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C314C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 02:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jWSvaZXO2Xm3Ne+M3tQb9M+JpQMbVLkeI9B2Nr3+ONQ=; b=cCokZbdlP7+Y1b
	h+cA1zk033U/nZ8ur+Fxgacq7x1l91vIgoIuJirTcyglIpsIby8b3vs7wYhbYBK6j7JqjI0SWUnfI
	YFHR/PoHIhbdYEYeiEz3LqenHFfMrjGpf9nYQth6i0kJlC/nsz3wDfseMj2nbuG5Ogh4HG1cI3RZ4
	BpW752zZ6jCtmTNttv5q3wZJDuJkKOBguXFXfsV+nt+8GyjAFrejlbIDB6qKIRWcQNaVFSIs7J1k9
	xu5wPrksLWprBSl2tXQWZvX4mSfdvMvxfppsTu0OiIJglHZiN4jTQS4U5mucL5R5xBBRmvSVKM1/p
	xMOMe4yIe/FH7/Serefw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSUqt-00EhQp-C0; Fri, 11 Mar 2022 02:17:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSUoL-00EgIo-31; Fri, 11 Mar 2022 02:15:22 +0000
X-UUID: 8bf15f1c4f8742678dcd7579ceb0d379-20220310
X-UUID: 8bf15f1c4f8742678dcd7579ceb0d379-20220310
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 68150700; Thu, 10 Mar 2022 19:15:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 18:15:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Mar 2022 10:15:11 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Mar 2022 10:15:10 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <linmq006@gmail.com>, <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.corp-partner.google.com>
Subject: [v3 0/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Date: Fri, 11 Mar 2022 10:15:07 +0800
Message-ID: <20220311021509.31669-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_181521_178003_18C386E3 
X-CRM114-Status: UNSURE (   7.61  )
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

From: Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>

The series reuses mt8192-mt6359-rt10150rt5682.c for supporting machine
driver with rt1015p speaker amplifier and rt5682s headset codec.

Changes from v2:
  - fix build warnings such as "data argument not used by format string"

Changes from v1:
  - uses the snd_soc_of_get_dai_link_codecs to complete the
  configuration of dai_link's codecs
  - uses definitions to simplifies card name and compatible name

Jiaxin Yu (2):
  ASoC: dt-bindings: mt8192-mt6359: add new compatible for using rt1015p
    and rt5682
  ASoC: mediatek: mt8192: support rt1015p_rt5682s

 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 204 +++++++++++-------
 3 files changed, 129 insertions(+), 77 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
