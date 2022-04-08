Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7E8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 11:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fv3WiMWv6bp0yBkFOBXEH+4jG6SajvPLaXn9Ipfal3E=; b=R5pSyafP8iF+c7
	KoKWPkmnD+vtmNzaAhAuQjvHT0SuggTVEtpjlB5Vda2zSBojG3orKBaZCslZiAFhHvh/4RD5oH2F+
	SXbHJsy50mTsvLcX+Gu3TVq6hou5AOzWrGqwb5dJhHojQjRk+BTScYdzcrOKsselxCAcjDXjp2hfJ
	vp53u1iXSjKORmNEAHFWsvZZfh2NUo/jyTsKtCG7jU6F1s3xwD6oDf5ObfLh1GAR8xgu5UPDLB4iY
	aQO6AJZHkLMsJRFZC/Y47q5C6WQwP1Go8zd7PuTANNWX/xUI9q5ANg8y6XinZTfS25mWrgVzqKWlN
	9dO0D2IE6Z1pHYu2xWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncmgW-00GXfu-4B; Fri, 08 Apr 2022 11:21:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncmgT-00GXeh-48; Fri, 08 Apr 2022 11:21:46 +0000
X-UUID: 7744f04d37e34cf8b6535683ac96176a-20220408
X-UUID: 7744f04d37e34cf8b6535683ac96176a-20220408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1546825399; Fri, 08 Apr 2022 04:21:40 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 04:11:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 19:11:37 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 19:11:37 +0800
Message-ID: <2ffb9949e47726d7c714666dc7755ed586720709.camel@mediatek.com>
Subject: Re: [PATCH v7 0/1] firmware: mtk: add adsp ipc protocol for SOF
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Daniel Golle <daniel@makrotopia.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>, "Kai
 Vehmanen" <kai.vehmanen@linux.intel.com>, <cujomalainey@google.com>, "Kevin
 Hilman" <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <tzungbi@google.com>, <linux-mediatek@lists.infradead.org>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, <linux-kernel@vger.kernel.org>,
 <sound-open-firmware@alsa-project.org>
Date: Fri, 8 Apr 2022 19:11:37 +0800
In-Reply-To: <Yk701wLNKQs1DEVx@makrotopia.org>
References: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
 <Yk701wLNKQs1DEVx@makrotopia.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_042145_202810_20A48527 
X-CRM114-Status: GOOD (  24.47  )
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

Hi Daniel,

On Thu, 2022-04-07 at 15:27 +0100, Daniel Golle wrote:
> On Thu, Apr 07, 2022 at 09:03:37PM +0800, Allen-KH Cheng wrote:
> > This patch provides mediatek adsp ipc support for SOF.
> > ADSP IPC protocol offers (send/recv) interfaces using
> > mediatek-mailbox APIs.
> > 
> > This patch was tested and confirmed to with SOF fw on MT8195
> > cherry board.
> 
> ... confirmed to **work** with ...
> is probably what you meant to write here.
> 
> 

Yes, thanks for your reminder. 

It appears that for some reason I forgot to add this part.

We had tested ADSP IPC protocol with SOF in
github.com/thesofproject/sof/tree/mt8195/v0.4.

The other mailbox control is patchwork.kernel.org/patch/12728222/

Thanks,
Allen

> > 
> > Based on matthias.bgg/linux.git, v5.18-next/soc
> > changes since v6:
> > - rebase to matthias.bgg/linux.git, v5.18-next/soc
> > - Prefer "GPL" over "GPL v2" for MODULE_LICENSE
> > 
> > changes since v5:
> > - fix WARNING: modpost: missing MODULE_LICENSE() in drivers/mailbox
> >   /mtk-adsp-mailbox.o. Add MODULE_LICENSE in the last line.
> > - Due to WARNING: Missing or malformed SPDX-License-Identifier tag
> >   in line 1 in checkpatch, we don't remove SPDX-License in line 1.
> > 
> > changes since v4:
> > - add error message for wrong mbox chan
> > 
> > changes since v3:
> > - rebase on v5.16-rc8
> > - update reviewers
> > 
> > changes since v2:
> > - add out tag for two memory free phases
> > 
> > changes since v1:
> > - add comments for mtk_adsp_ipc_send and mtk_adsp_ipc_recv
> > - remove useless MODULE_LICENSE
> > - change label name to out_free
> > 
> > 
> > Allen-KH Cheng (1):
> >   firmware: mediatek: add adsp ipc protocol interface
> > 
> >  drivers/firmware/Kconfig                      |   1 +
> >  drivers/firmware/Makefile                     |   1 +
> >  drivers/firmware/mediatek/Kconfig             |   9 +
> >  drivers/firmware/mediatek/Makefile            |   2 +
> >  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161
> > ++++++++++++++++++
> >  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
> >  6 files changed, 239 insertions(+)
> >  create mode 100644 drivers/firmware/mediatek/Kconfig
> >  create mode 100644 drivers/firmware/mediatek/Makefile
> >  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
> >  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> > 
> > -- 
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
