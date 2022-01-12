Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13ECBC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2IjyEYr+hwKP3K5wV4w68pXTYtrszdQN+PROdK5DGys=; b=VhwPYaQhxuecKUzm1LQ5HgzSSG
	cO+ZKJTtYS0cbTT6qCt91na2tEiF29aLUZ6OJjifIlbbvAA5/H5r6JoTgSNeFcjd6imXr8vsM1zfE
	NMMewI0nPHGqOFX88V4nDtT7CBq9sUZXrVfsLI46hNU3rs5VvMhmajiNxual5O7P7vaI3TWu8JRN+
	ENFWVG8DuRmksVxeRLBrQ3C/aq2KTy7mxmYDTKtKgdnQKIM77KC5+J+FeH6fTXPRJTykeFgU11yH3
	X0yWlmNZo2O978MIKBrOnD3EO88uXZHu1zXzM5ClM10DsaqodqI5YrXoapzwOs8oxdThx3uZQhuqz
	OnwHgWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7ghP-0039iP-45; Wed, 12 Jan 2022 16:42:11 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7ghM-0039gh-Aq; Wed, 12 Jan 2022 16:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642005728; x=1673541728;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fRrm1uZQrkX3U3iwIWdjmqt0HX6DyiPt9SbTXaP/1Wc=;
 b=YYykK6gmec0Za7Vjrxduh5mBy5gMIJK3Y6J4Yp9RtqBsvN/DkZzRJq7k
 YdjsHNpXVoLp70WJVmpQwqEFuh6sic1G2UlMX7XDghTR3fCdS413mzQiB
 KxbD0V1emVx+DnvOEMsyOrfj/Frthf6Ys6EaDk2tTWKAPahW7fxAXD4Yj
 5dijVfgFEzPe2816lrpnu8Zlu2fYJcPeEvrMLs+uYFI8yPLqN4zKdRwEq
 Rff79TGfKkotzdVUMIuMqrYLNbzwde6qQUlKKf6Rl62AASaHr0Cy+W53Y
 +7WTom2iTC/OPNHyjyxlmFFKVdsFgXyru2Ce5Wpo/6ZofZJ3S/FlBHPPg g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="242595561"
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="242595561"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 08:42:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,282,1635231600"; d="scan'208";a="529248449"
Received: from rfriess-x1c10.amr.corp.intel.com (HELO [10.212.33.247])
 ([10.212.33.247])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2022 08:42:05 -0800
Subject: Re: [PATCH v2 0/1] firmware: mtk: add adsp ipc protocol for sof
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, tzungbi@google.com,
 cujomalainey@google.com, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
References: <20220112113247.29135-1-allen-kh.cheng@mediatek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <61ba06c7-74e4-03f9-2fe7-f12f862c7942@linux.intel.com>
Date: Wed, 12 Jan 2022 10:42:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220112113247.29135-1-allen-kh.cheng@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_084208_462931_AC953003 
X-CRM114-Status: GOOD (  12.97  )
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



On 1/12/22 5:32 AM, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This patch provides mtk adsp ipc support for sof.
> 
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> changes since v1:
> - add comments for mtk_adsp_ipc_send and mtk_adsp_ipc_recv
> - remove unuseful MODULE_LICENSE
> - change label name to out_free

my comment was not on changing the label name, but making sure you only
free something that was allocated by using *two* labels.

> 
> Allen-KH Cheng (1):
>   firmware: mediatek: add adsp ipc protocol interface
> 
>  drivers/firmware/Kconfig                      |   1 +
>  drivers/firmware/Makefile                     |   1 +
>  drivers/firmware/mediatek/Kconfig             |   9 +
>  drivers/firmware/mediatek/Makefile            |   2 +
>  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 159 ++++++++++++++++++
>  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
>  6 files changed, 237 insertions(+)
>  create mode 100644 drivers/firmware/mediatek/Kconfig
>  create mode 100644 drivers/firmware/mediatek/Makefile
>  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
>  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
