Return-Path: <SRS0=f9HX=7P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BF9C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 12:19:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A008320663
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2020 12:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uR0u4ynt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BB6Bogdy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A008320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z3yXasJBNWZ2YzRNZqRkD0c0WJ5XrQRqSgL0zHBCJAQ=; b=uR0u4yntZxcJqa
	Zw19Ej5FD8TdQepBZpHbLxiI04hkHHLafDjwJnkjOC2zBg3k6ZOE/JQBcFgl2uyEYVwdi6GMEbqm+
	wqLWSqotwqB9AETB10c+2yrpSlfa8UTQcRePfPm3seKL+PTmwtCQmJ6JGkAhdz8y3ErkJXU1Mryz+
	3fqdKD+gIPGTCyz1TFC1c6+YA1xo5c1kdFuZ1affhRGanOxXzDnXByaFLmUNLTbkRmDFOV79lISVY
	cDszeo3MzSAgbfoAZVmGTGCOxvzr5qd5PfOAH3F4rAECOqP4j5xlIzG61O58YyAbR2ijNrL0Zv/bH
	2vkBhiNR1D3iLH6b0d2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg5tC-0005nt-2K; Tue, 02 Jun 2020 12:19:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg5st-0005VK-0p; Tue, 02 Jun 2020 12:19:12 +0000
X-UUID: 20538f0663ef4e19a01fd01d07374fb6-20200602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
 bh=4h8fafRuCGTyIr/VCDupUiRjNszwNbo9UU/ty3wLFYg=; 
 b=BB6BogdypJebp2/YbfZk+8Pm2yPYmPU/qlQJKVt+/SfUJ1srvKxmfwtE7f7uXs/psdx6V5ThbEQywmEhtk9NoIPq95235ujRejWTgtmH16QQ1vvQn24vKSUNG4WTODUbipnMbSJs1aDCjQs1nxZQKylOrDpc+AMO5fXCmefny+k=;
X-UUID: 20538f0663ef4e19a01fd01d07374fb6-20200602
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 379828204; Tue, 02 Jun 2020 04:19:08 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Jun 2020 05:19:03 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Jun 2020 20:19:00 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Jun 2020 20:19:00 +0800
Message-ID: <1591100342.23525.8.camel@mtkswgap22>
Subject: Re: [PATCH] sound: usb: pcm: fix incorrect power state when playing
 sound after PM_AUTO suspend
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Alexander Tsoy <alexander@tsoy.me>,
 Johan Hovold <johan@kernel.org>, Hui Wang <hui.wang@canonical.com>, Szabolcs
 =?UTF-8?Q?Sz=C5=91ke?= <szszoke.code@gmail.com>,
 <alsa-devel@alsa-project.org>, <linux-usb@vger.kernel.org>, "Mediatek WSD
 Upstream" <wsd_upstream@mediatek.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>
Date: Tue, 2 Jun 2020 20:19:02 +0800
In-Reply-To: <1591098821-17910-1-git-send-email-macpaul.lin@mediatek.com>
References: <linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org>
 <1591098821-17910-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 12C71F8E9B7B63D4DF6727041F40092E70F89D4579A111C8EDEBB373FBDFE0332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_051911_079300_19A85C1E 
X-CRM114-Status: GOOD (  21.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On Tue, 2020-06-02 at 19:53 +0800, Macpaul Lin wrote:
> This patch fix incorrect power state changed by usb_audio_suspend()
> when CONFIG_PM is enabled.
> 
> After receiving suspend PM message with auto flag, usb_audio_suspend()
> change card's power state to SNDRV_CTL_POWER_D3hot. Only when the other
> resume PM message with auto flag can change power state to
> SNDRV_CTL_POWER_D0 in __usb_audio_resume().
> 
> However, when system is not under auto suspend, resume PM message with
> auto flag might not be able to receive on time which cause the power
> state was incorrect. At this time, if a player starts to play sound,
> will cause snd_usb_pcm_open() to access the card and setup_hw_info() will
> resume the card.
> 
> But even the card is back to work and all function normal, the power
> state is still in SNDRV_CTL_POWER_D3hot. Which cause the infinite loop
> happened in snd_power_wait() to check the power state. Thus the
> successive setting ioctl cannot be passed to card.
> 
> Hence we suggest to change power state to SNDRV_CTL_POWER_D0 when card
> has been resumed successfully.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  sound/usb/pcm.c |   11 +++++++++++linux-usb@vger.kernel.org,
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
> index a4e4064..d667ecb 100644
> --- a/sound/usb/pcm.c
> +++ b/sound/usb/pcm.c
> @@ -1322,6 +1322,17 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
>  	if (err < 0)
>  		return err;
>  
> +	/* fix incorrect power state when resuming by open and later ioctls */
> +	if (IS_ENABLED(CONFIG_PM) &&
> +		snd_power_get_state(subs->stream->chip->card)
> +			== SNDRV_CTL_POWER_D3hot) {
> +		/* set these variables for power state correction */
> +		subs->stream->chip->autosuspended = 0;
> +		subs->stream->chip->num_suspended_intf = 1;
> +		dev_info(&subs->dev->dev,
> +			"change power state from D3hot to D0\n");
> +	}
> +
>  	return snd_usb_autoresume(subs->stream->chip);
>  }
>  

The issue was found on kernel 4.14 (android tree). The test is to add
debug log in sound/core/init.c to check if the power state is
SNDRV_CTL_POWER_D3hot.

diff --git a/sound/core/init.c b/sound/core/init.c
index b02a997..a0bee76 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -1011,6 +1011,8 @@ int snd_power_wait(struct snd_card *card, unsigned
int power_state)
 		if (snd_power_get_state(card) == power_state)
 			break;
 		set_current_state(TASK_UNINTERRUPTIBLE);
+		pr_info("%s snd_power_get_state[%x]\n", __func__,
+			snd_power_get_state(card));
 		schedule_timeout(30 * HZ);
 	}
 	remove_wait_queue(&card->power_sleep, &wait);

After applied a work around by forcing the power state, pcm related
ioctl and parameter settings can be set to usb sound card correctly.
Otherwise a infinite loop will happened in snd_power_wait().

Here is the origin work around for verifying this power state issue on
kernel 4.14.

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 933adcd7af81..9acd50dd7155 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1274,6 +1274,16 @@ static int setup_hw_info(struct snd_pcm_runtime
*runtime, struct snd_usb_substre
 	if (err < 0)
 		return err;
 
+	/* avoid incorrect power state when executing IOCTL */
+	if (IS_ENABLED(CONFIG_PM) &&
+		snd_power_get_state(subs->stream->chip->card)
+			== SNDRV_CTL_POWER_D3hot) {
+		dev_info(&subs->dev->dev,
+			"change power state from D3hot to D0\n");
+		snd_power_change_state(subs->stream->chip->card,
+					SNDRV_CTL_POWER_D0);
+	}
+
 	param_period_time_if_needed = SNDRV_PCM_HW_PARAM_PERIOD_TIME;
 	if (subs->speed == USB_SPEED_FULL)
 		/* full speed devices have fixed data packet interval */

However, the patch I've send is meant to make sure the power state will
be corrected before snd_usb_autoresume(), It should be adapt to kernel
4.14 and later.

Thanks.
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
