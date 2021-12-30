Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8769CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=57GUycBBTGPB3na+P23haT4wF+SUFUSJIFeIP1ufYTg=; b=aSwFMAKmsPnPMO
	iL/yUItf0+/AuZN5CKRq8svncui1L+ByLISl28P4eyT3EuoQk5iTbYnTHN9N+pgELZHTxVKBS2PDu
	gg2jGuEW+LL6ZxXRakgEV/6iegYdu/emyNVejHdPm2BB6g9i77L/rwOhcMBk5QrJtWeUd9eTS63lz
	p0ID4JiGrKbHykHWararNTKGXTQZHiTgrD1qIPTA4h3UOxiAh6ukkmZymUkv1kX0fIc6DEIBzQWBh
	yOjNHMMqwObcEgXZ+ny4cLHMl9TTQvRnHpmUU3oWabNZ3Woev3h226dBLVup2naM/mOXQjKQ2neKb
	KO9fhDXiXlOfFVG0eSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2r69-0042EC-Bm; Thu, 30 Dec 2021 08:47:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2r65-0042CF-Ax; Thu, 30 Dec 2021 08:47:44 +0000
X-UUID: 65140a9a546d42a791513b837619ae94-20211230
X-UUID: 65140a9a546d42a791513b837619ae94-20211230
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1348181385; Thu, 30 Dec 2021 01:47:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 00:47:36 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 16:47:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Dec 2021 16:47:34 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: mediatek: mt8195: repair pcmif BE dai
Date: Thu, 30 Dec 2021 16:47:29 +0800
Message-ID: <20211230084731.31372-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_004741_403873_41B2CFA7 
X-CRM114-Status: UNSURE (   7.10  )
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

This series of patches repairs some problems for pcmif BE dai.
The unexpected control flow is corrected, and the missing playback
support of DPCM is added.

Patches are based on broonie tree "for-next" branch.

Trevor Wu (2):
  ASoC: mediatek: mt8195: correct pcmif BE dai control flow
  ASoC: mediatek: mt8195: add playback support to PCM1_BE dai_link

 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c    | 73 ++++++-------------
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      |  1 +
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      |  1 +
 sound/soc/mediatek/mt8195/mt8195-reg.h        |  1 +
 4 files changed, 24 insertions(+), 52 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
