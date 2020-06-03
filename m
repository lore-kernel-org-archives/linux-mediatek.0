Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209CCC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 03:07:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1AC206E9
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 03:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZxmYaej";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bsqU+vnO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1AC206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDpmx5kW+807XTpnvy5mDszDAiW/xFPrd2/8mW4My9E=; b=rZxmYaejLjnaLx
	ke1PLYi5fQZhO/OTbLDxTTTDtHnHdhyZezN+AT/mNRpDKMUPMPc9sfwyG77eLDhPYJjwzkrUH42OM
	xyUqbfAmmFSlr1/lDExINhQEkoPdi5+7gN15/ykkJsEwC34dBIY5WeeyjMhXH6X8t/IdxJO3vfo05
	OZpIJuDnQ+WectDNwyNIvjJaF8tqjr8/zZK12TpVDWGbMqomnM4yPdaPFcEronsbfjDfTjkg0VE+K
	j0Q2bN0stFuRVYKnQt4kUcoRWdk28nOPagluGdUjy6wiWnk7shOr25sQ6c9/WudfjhnYjtxlYxLix
	OZrHXV8EwMMS7xrDyw+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgJkN-0006xF-Hg; Wed, 03 Jun 2020 03:07:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgJkJ-0006wm-J2; Wed, 03 Jun 2020 03:07:17 +0000
X-UUID: 1c24df93793b4c6ba72102acfa4547fb-20200602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W7tF7Mgc/fvciJgJ7QAqTgTQjhCvBLQ6CPGKAAjG2D8=; 
 b=bsqU+vnOXHhQMebXF/xNC92/xnQyY4mX2G8GXAquFzljwBgCumvf8HWzFMf9wUb20RRVPtPhBk0sw/DLu4uWDQ6jefnnU1d15PMvlgwl83BknphlRhk/6l3NaIwluCJjkJpIviBh9f0Lw9tt63SVRebUqkYRRidWFX3QwhKNzwk=;
X-UUID: 1c24df93793b4c6ba72102acfa4547fb-20200602
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1423210677; Tue, 02 Jun 2020 19:07:08 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Jun 2020 20:05:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 11:05:10 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 11:05:10 +0800
Message-ID: <1591153515.23525.50.camel@mtkswgap22>
Subject: Re: [PATCH] sound: usb: pcm: fix incorrect power state when playing
 sound after PM_AUTO suspend
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 3 Jun 2020 11:05:15 +0800
In-Reply-To: <s5hpnahhbz8.wl-tiwai@suse.de>
References: <s5hpnahhbz8.wl-tiwai@suse.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 586FA4C026DBFAB221D5480D4E6A63BFED753ABF860C0F7D852D822E2AAFD11B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_200715_632616_2BFCA477 
X-CRM114-Status: GOOD (  25.31  )
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
Cc: alsa-devel@alsa-project.org, Mediatek WSD
 Upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, Johan
 Hovold <johan@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Alexander Tsoy <alexander@tsoy.me>,
 linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Szabolcs =?UTF-8?Q?Sz=C5=91ke?= <szszoke.code@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-02 at 14:46 +0200, Takashi Iwai wrote:
> On Tue, 02 Jun 2020 13:53:41 +0200,
> Macpaul Lin wrote:
> > 
> > This patch fix incorrect power state changed by usb_audio_suspend()
> > when CONFIG_PM is enabled.
> > 
> > After receiving suspend PM message with auto flag, usb_audio_suspend()
> > change card's power state to SNDRV_CTL_POWER_D3hot. Only when the other
> > resume PM message with auto flag can change power state to
> > SNDRV_CTL_POWER_D0 in __usb_audio_resume().
> > 
> > However, when system is not under auto suspend, resume PM message with
> > auto flag might not be able to receive on time which cause the power
> > state was incorrect. At this time, if a player starts to play sound,
> > will cause snd_usb_pcm_open() to access the card and setup_hw_info() will
> > resume the card.
> > 
> > But even the card is back to work and all function normal, the power
> > state is still in SNDRV_CTL_POWER_D3hot.
> 
> Hm, in exactly which situation does this happen?  I still don't get
> it.  Could you elaborate how to trigger this?

I'm not sure if this will happen on laptop or on PC.
We've found this issue on Android phone (I'm not sure if each Android
phone can reproduce this.).

After booting the android phone, insert type-c headset without charging
and play music at any duration, say, 1 second, then stop. Put phone away
to idle about 17~18 minutes. Wait auto pm happened and the power state
change to SNDRV_CTL_POWER_D3hot in sound/usb/card.c. Then wake up the
phone, play music again. Then you'll probably found the music was not
playing and the progress bar keep at the same position. It only happen 
when power state is SNDRV_CTL_POWER_D3hot. If not (the power state is
SNDRV_CTL_POWER_D0), repeat the steps for several times, then it will be
produced at some time.

When it happened, sound_usb_pcm_open() will wake up the sound card by 
setup_hw_info()->__usb_audio_resume(). However, the card and the
interface is function properly right now, the power state keeps remain
SNDRV_CTL_POWER_D3hot. The suggestive parameter settings from upper
sound request will be pending since later snd_power_wait() call will
still wait the card awaken. Ideally, auto PM should be recovered by
sound card itself. But once the card is awaken at this circumstance, it
looks like there are not more auto pm event. And the sound system of
this interface will stuck here forever until user plug out the headset
(reset the hardware).

The root cause is that once the card has been resumed, it should inform
auto pm change the state back into SNDRV_CTL_POWER_D0 and mark the
device is using by some one.

> > Which cause the infinite loop
> > happened in snd_power_wait() to check the power state. Thus the
> > successive setting ioctl cannot be passed to card.
> > 
> > Hence we suggest to change power state to SNDRV_CTL_POWER_D0 when card
> > has been resumed successfully.
> 
> This doesn't look like a right solution for the problem, sorry.
> The card PM status must be recovered to D0 when the autoresume
> succeeds.  If not, something is broken there, and it must be fixed
> instead of fiddling the status flag externally.

Yes, I agreed, but after checking the code in sound drivers, 
it looks like there is only chance that auto pm triggered by low-level
code in sound/usb/card.c. In kernel 4.14, auto pm suspend is triggered
by snd_pcm_suspend_all(). In later kernel, it is triggered by
snd_usb_pcm_suspend(). However, it looks like there are no any resume
trigger to recover auto pm state when the card has been waken by
sound_usb_pcm_open(). The remain resume trigger in
sound/core/pcm_native.c were all static. I've tried to use these resume
function in sound/usb/card.c but it seems cannot get better result than
changing the power state when sound card is in use. 

I've replied another mail earlier includes debug patch and the other
work around to verify this issue. The issue has been found on
kernel-4.14, but check the code logic here in sound/usb/card.c and
sound/usb/pcm.c, I think the same problem still existed in 4.19, 5.4
(used by android), and in current kernel tree.


> thanks,
> 
> Takashi

If the above explanation were not clear enough, I'll try my best to
explain it in more detail. Maybe the better way is to send both auto pm
resume and runtime resume when sound_usb_pcm_open() is called. But
according to the current codes in card.c, we might need to call
__usb_audio_resume() twice in setup_hw_info().

Thanks
Macpaul Lin



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
