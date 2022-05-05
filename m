Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AE7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 22:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1FN70ugZ3KQbPW7bBnwSlnnsrfImJHgrgX/SAgLLDo=; b=foWNYwmpiCZoLV
	N8Gc/2yQeC/x4RIFdWGZFCDtgqwR3htUMPwkVNeYbXAoFdH1AheKJnqdpD+sgXiGlqbyc5mTWm5CR
	xcRu+soB0bHNbhQF9zZ3p6cwIp01IlV83t8gBM58g2HLCp8wVja0oB85U+KWt0KKSVh8sgCFNOMbE
	e/VjjsV7wviUZAwZNQv93B69ukdBPeLTpkaYjAA9SV76O3PTQ5Mbdkw2kMNGM6aAffrR8MrfsiNje
	DtCcw2VYN7cyuAKbLefmkm4+h74k9rK3Vfd0qowW67oFP4Y6LYg0IVJ5psSy4NUB5JyZ8R96Pnxa3
	r2AgzajxkukvUjPbQQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmk3k-000Q6e-9Y; Thu, 05 May 2022 22:34:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmk3Z-000Q2u-1e; Thu, 05 May 2022 22:34:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CB3761F50;
 Thu,  5 May 2022 22:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4FAC385A4;
 Thu,  5 May 2022 22:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1651790084;
 bh=fIcmMOB4OTzUhPRJw5zxd1he8Ws9Ea91j5a5noC1OwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dDjiqn3iXIxsl95pJLRm9hrJchx4WfXEocyDn8SVGogcQ5ZgMmKnU384LgZ4FZvGP
 cjgJqRC9zMQbrvZDuSbZJQboS77aP9g4SNbH88A0AC0dxpNfh0xc6f9SX6tp/JwV94
 q2boySmrpnWmzzZqy8AB0OIdh4Qd7DbjWk6tC+fI=
Date: Thu, 5 May 2022 23:10:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Borislav Petkov <bp@suse.de>, Michal Suchanek <msuchanek@suse.de>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Etienne Carriere <etienne.carriere@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 John Stultz <john.stultz@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 YC Hung <yc.hung@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [RESEND PATCH v7 1/1] firmware: mediatek: add adsp ipc protocol
 interface
Message-ID: <YnQ9UzeyMTkmyGgD@kroah.com>
References: <20220505053048.13804-1-tinghan.shen@mediatek.com>
 <20220505053048.13804-2-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505053048.13804-2-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_153445_206090_33C31E1C 
X-CRM114-Status: GOOD (  16.04  )
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

On Thu, May 05, 2022 at 01:30:48PM +0800, Tinghan Shen wrote:
> From: TingHan Shen <tinghan.shen@mediatek.com>
> 
> Some of mediatek processors contain
> the Tensilica HiFix DSP for audio processing.
> 
> The communication between Host CPU and DSP firmware is
> taking place using a shared memory area for message passing.
> 
> ADSP IPC protocol offers (send/recv) interfaces using
> mediatek-mailbox APIs.
> 
> We use two mbox channels to implement a request-reply protocol.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Reviewed-by: YC Hung <yc.hung@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
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

Why do you have a .h file, and export symbols in your .c file, yet you
have no user of these symbols or header file?

Without a user, we can not take this, sorry.

This should just be one single .c file.

Also, why a whole subdirectory for just one .c file?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
