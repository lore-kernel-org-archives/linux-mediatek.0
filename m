Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715C8C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BBOBdZP+ceKvUSZ5M0y2zeZD8oA4P0aYlWHEp8UMMQ=; b=hec8aw8P5lviKk
	hZ0ikrB7RjkWpdDO4IFYCeAXtFquMzqMoRxpmCNrH2TEi1qIxOdBQ61a8LfbJvLVR6vL1GaBr7ou1
	vV/dnemfquDpa/ZQugrZBeX2obLdUOi2JrQsHuxFjHf9/uiLq5ijIQKp/Kz7zFMSQziPUsLC31w+S
	uOqXXBsVRVzW8zfy7GugQ1xtSDsPA1qbmM7dOJBDIDo3BXbYbgRPThIQFPz+Tu+Ru+Wqze52Lht+u
	1CCzuBMaWDFo/5xeXoU6trKFOY2MH9nZ4z0IbazqQkn4UtxWdpzUxU1Zn3dwNl2TLpVyqupPoxyrY
	5GL+LR8bpGVFv4WY6rlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmwGz-002wFD-IV; Fri, 06 May 2022 11:37:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmwGw-002wDF-OV; Fri, 06 May 2022 11:37:24 +0000
X-UUID: d82a81f0a01e404f9576c093e22f4a4e-20220506
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:115c249d-4743-478d-9a10-81ba1effcec6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:f75e7816-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: d82a81f0a01e404f9576c093e22f4a4e-20220506
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1567815252; Fri, 06 May 2022 04:37:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 6 May 2022 04:37:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 6 May 2022 19:37:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 6 May 2022 19:37:07 +0800
Message-ID: <fc564f68194b5cc668bb9e7a88cc097d38c9b128.camel@mediatek.com>
Subject: Re: [RESEND PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol
 interface
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>, Sudeep Holla
 <sudeep.holla@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Borislav Petkov <bp@suse.de>, Michal Suchanek <msuchanek@suse.de>, "Cristian
 Marussi" <cristian.marussi@arm.com>, Etienne Carriere
 <etienne.carriere@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Simon Trimmer <simont@opensource.cirrus.com>, "John
 Stultz" <john.stultz@linaro.org>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>, YC Hung <yc.hung@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>, Curtis Malainey <cujomalainey@chromium.org>, Mark Brown
 <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <alsa-devel@alsa-project.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 6 May 2022 19:37:07 +0800
In-Reply-To: <YnQ9UzeyMTkmyGgD@kroah.com>
References: <20220505053048.13804-1-tinghan.shen@mediatek.com>
 <20220505053048.13804-2-tinghan.shen@mediatek.com>
 <YnQ9UzeyMTkmyGgD@kroah.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_043722_852209_28CB09A3 
X-CRM114-Status: GOOD (  20.80  )
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

Hi Greg,

Thanks for your review.

On Thu, 2022-05-05 at 23:10 +0200, Greg Kroah-Hartman wrote:
> On Thu, May 05, 2022 at 01:30:48PM +0800, Tinghan Shen wrote:
> > From: TingHan Shen <tinghan.shen@mediatek.com>
> > 
> > Some of mediatek processors contain
> > the Tensilica HiFix DSP for audio processing.
> > 
> > The communication between Host CPU and DSP firmware is
> > taking place using a shared memory area for message passing.
> > 
> > ADSP IPC protocol offers (send/recv) interfaces using
> > mediatek-mailbox APIs.
> > 
> > We use two mbox channels to implement a request-reply protocol.
> > 
> > Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> > Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> > Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > Reviewed-by: YC Hung <yc.hung@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/firmware/Kconfig                      |   1 +
> >  drivers/firmware/Makefile                     |   1 +
> >  drivers/firmware/mediatek/Kconfig             |   9 +
> >  drivers/firmware/mediatek/Makefile            |   2 +
> >  drivers/firmware/mediatek/mtk-adsp-ipc.c      | 161 ++++++++++++++++++
> >  .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 +++++++
> >  6 files changed, 239 insertions(+)
> >  create mode 100644 drivers/firmware/mediatek/Kconfig
> >  create mode 100644 drivers/firmware/mediatek/Makefile
> >  create mode 100644 drivers/firmware/mediatek/mtk-adsp-ipc.c
> >  create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h
> 
> Why do you have a .h file, and export symbols in your .c file, yet you
> have no user of these symbols or header file?
> 
> Without a user, we can not take this, sorry.

MediaTek have adsp client drivers on 2 chips that use symbols from this module.
We were planned to upstream them after Linux community accept this module.
I will add those client drivers in next version.

> 
> This should just be one single .c file.
> 
> Also, why a whole subdirectory for just one .c file?

Ok, I'll move the souce out and remove this subdirectory in next version.
Thank you very much.

Best regards,
TingHan

> 
> thanks,
> 
> greg k-h



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
