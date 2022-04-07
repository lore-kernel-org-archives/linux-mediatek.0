Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF08BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gu8xMqw8MOSsfyc9THr1+FZpnxc3lIdmEAI8jYwExZ0=; b=Il9+wvB7hfHFg5
	xAq1RTs6YAKErg0HRfsm9soOdkCFiAXWZyWhzwWUmnDtixY88YOBKxjy2rwZUTGFSKMRjuIwbgnhs
	rjH2t3FFtQdbtuzDpSXrESc7CWVvZh1Yf/ANqATcGgNRdx4W3mtPiXdeS7FHrMNwzS/o2/Oj0TefF
	FSQufhvW59/xobzIbl3XQmxSIZe5bvLKAakGaMmVElrCzFfyEHDOJQd0r7V2hTD/Hzf0APg5dvZY2
	wodkqgxEncnZX+zEtq8Bs4hcYj3NbxH2EeiiMjJfPPoiIXAxZA+32ZtVsBukI/TEAan6Xn0TUbEEd
	Jco5/Xhww67FzQQYXWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncT7G-00CMcO-Q5; Thu, 07 Apr 2022 14:28:06 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncT73-00CMWW-Dj; Thu, 07 Apr 2022 14:27:54 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1ncT6r-0000NC-PG; Thu, 07 Apr 2022 16:27:41 +0200
Date: Thu, 7 Apr 2022 15:27:35 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 cujomalainey@google.com, Kevin Hilman <khilman@baylibre.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 tzungbi@google.com, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v7 0/1] firmware: mtk: add adsp ipc protocol for SOF
Message-ID: <Yk701wLNKQs1DEVx@makrotopia.org>
References: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220407130338.28939-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_072753_513839_4C5A3B6C 
X-CRM114-Status: GOOD (  16.36  )
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

On Thu, Apr 07, 2022 at 09:03:37PM +0800, Allen-KH Cheng wrote:
> This patch provides mediatek adsp ipc support for SOF.
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> This patch was tested and confirmed to with SOF fw on MT8195
> cherry board.

... confirmed to **work** with ...
is probably what you meant to write here.


> 
> Based on matthias.bgg/linux.git, v5.18-next/soc
> changes since v6:
> - rebase to matthias.bgg/linux.git, v5.18-next/soc
> - Prefer "GPL" over "GPL v2" for MODULE_LICENSE
> 
> changes since v5:
> - fix WARNING: modpost: missing MODULE_LICENSE() in drivers/mailbox
>   /mtk-adsp-mailbox.o. Add MODULE_LICENSE in the last line.
> - Due to WARNING: Missing or malformed SPDX-License-Identifier tag
>   in line 1 in checkpatch, we don't remove SPDX-License in line 1.
> 
> changes since v4:
> - add error message for wrong mbox chan
> 
> changes since v3:
> - rebase on v5.16-rc8
> - update reviewers
> 
> changes since v2:
> - add out tag for two memory free phases
> 
> changes since v1:
> - add comments for mtk_adsp_ipc_send and mtk_adsp_ipc_recv
> - remove useless MODULE_LICENSE
> - change label name to out_free
> 
> 
> Allen-KH Cheng (1):
>   firmware: mediatek: add adsp ipc protocol interface
> 
>  drivers/firmware/Kconfig                      |   1 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/mediatek/Kconfig             |   9 +
>  drivers/firmware/mediatek/Makefile            |   2 +
>  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161 ++++++++++++++++++
>  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
>  6 files changed, 239 insertions(+)
>  create mode 100644 drivers/firmware/mediatek/Kconfig
>  create mode 100644 drivers/firmware/mediatek/Makefile
>  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
