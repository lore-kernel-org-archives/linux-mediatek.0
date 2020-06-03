Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40A3C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 13:52:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB21820772
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 13:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ozggpsnz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LhGZIho9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB21820772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bl4lEKxCWSGlTAT+eABOZWrYuI1lpYg2V/b6ENlDSv0=; b=OzggpsnzqqSwYc
	4FXSz2+duBaEe41j+fAql4WCQLyewuTk7UGLDmtsjS7lyodeNaXenK0f17wZcewpeWjvwq230C4Qs
	ELKfArVAyNqQEmcD4i98uw1mR0ONAhmFg5sd1tNMjcuvaBsp9Xdzy9PqfcGLf0td1uj7bjkvKhZZ5
	vUcKn1TWMbAzqGLHaxfsRc7BcAES/8f0x4WB57JttLPDVnGYJWEW5CcQNnOsxd0+I+5bLSdG+cFGX
	DoNjQFwqgZ3kbv5hY/utPG0TiJoTLSGDldP2FFDJLfhNX04zwKRlppJwccQS9+H7vb/RgklJNGUw1
	AUDZPwEEmfsWniBERHmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTp1-00071Q-Fb; Wed, 03 Jun 2020 13:52:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgTmn-0004x0-Gv; Wed, 03 Jun 2020 13:50:31 +0000
X-UUID: f647f560968e4e728582141d3a2b9606-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jwnn3BpiVJ43Pjm9A4aConW48lY8yM/F4kKqerAKBTc=; 
 b=LhGZIho9jN0hDjOABgQ8qTYDj9w5Iyvxpas89RSIL8YaBplgybUe38w+Wtt1TMK4LRXLjE7c7IKX9Fnqwd2Sou1EHmdf05KEUSNlIdlIgiHncoMYI/aRlVufxEX8pH0aVYaMquBjDMt+fH5zix3Ue4Q0zNXiLA5JhD8jJshexIA=;
X-UUID: f647f560968e4e728582141d3a2b9606-20200603
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 186649569; Wed, 03 Jun 2020 05:50:09 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 06:50:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 21:50:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Jun 2020 21:50:12 +0800
Message-ID: <1591192216.23525.72.camel@mtkswgap22>
Subject: Re: [PATCH] sound: usb: pcm: fix incorrect power state when playing
 sound after PM_AUTO suspend
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 3 Jun 2020 21:50:16 +0800
In-Reply-To: <s5hr1uwco4c.wl-tiwai@suse.de>
References: <s5hpnahhbz8.wl-tiwai@suse.de>
 <1591153515.23525.50.camel@mtkswgap22>	<s5heeqwfyti.wl-tiwai@suse.de>
 <s5hblm0fxl0.wl-tiwai@suse.de>	<s5h367cfsga.wl-tiwai@suse.de>
 <1591187964.23525.61.camel@mtkswgap22> <s5hr1uwco4c.wl-tiwai@suse.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B7292D25D0CC9D9E834BBB7EEEB79C45CDBB9BDCEBA293A96ABF504C88603DA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_065029_655233_19C2A044 
X-CRM114-Status: GOOD (  25.71  )
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
Cc: alsa-devel@alsa-project.org,
 Szabolcs =?UTF-8?Q?Sz=C5=91ke?= <szszoke.code@gmail.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 Alexander Tsoy <alexander@tsoy.me>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Johan Hovold <johan@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Macpaul Lin <macpaul.lin@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-06-03 at 14:47 +0200, Takashi Iwai wrote:
> On Wed, 03 Jun 2020 14:39:24 +0200,
> Macpaul Lin wrote:
> > 
> > On Wed, 2020-06-03 at 10:45 +0200, Takashi Iwai wrote:
> > > On Wed, 03 Jun 2020 08:54:51 +0200,
> > > Takashi Iwai wrote:
> > > > 
> > > > On Wed, 03 Jun 2020 08:28:09 +0200,
> > > > Takashi Iwai wrote:
> > > > > 
> > > > > And, the most suspicious case is the last one,
> > > > > chip->num_suspended-intf.  It means that the device has multiple
> > > > > USB interfaces and they went to suspend, while the resume isn't
> > > > > performed for the all suspended interfaces in return.
> > > > 
> > > > If this is the cause, a patch like below might help.
> > > > It gets/puts the all assigned interfaced instead of only the primary
> > > > one.
> > > 
> > > ... and considering of the problem again, rather the patch below might
> > > be the right answer.  Now the driver tries to remember at which state
> > > it entered into the system-suspend.  Upon resume, in return, when the
> > > state reaches back to that point, set the card state to D0.
> > > 
> > > The previous patch can be applied on the top, too, and it might be
> > > worth to apply both.
> > > 
> > > Let me know if any of those actually helps.
> > > 
> > > 
> > > Takashi
> > 
> > Thanks for your response so quickly.
> > I've just test this patch since it looks like enough for the issue.
> 
> Good to hear!
> 
> > This patch worked since the flag system_suspend will be set at the same
> > time when power state has been changed. I have 2 interface with the head
> > set. But actually the problem happened when primary one is suspended.
> 
> Currently the autosuspend is set only to the primary interface; IOW,
> the other interfaces will never get autosuspend, and the another
> suspend-all-intf patch should improve that situation.  But it won't
> fix your actual bug, obviously :)
> 
> > So I didn't test the earlier patch "suspend all interface instead of
> > only the primary one."
> 
> Could you try it one on top of the last patch?  At least I'd like to
> see whether it causes any regression.

I've tried both of these 2 patches together, and it looks okay.

> > Will you resend this patch officially later? I think this solution is
> > required to send to stable, too. It's better to have it for other stable
> > kernel versions include android's.
> 
> Yes, that's a general bug and worth to be merged quickly.
> I'm going to submit a proper patch soon later.
> 
> 
> thanks,
> 
> Takashi
> 

Thanks!
Macpaul Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
