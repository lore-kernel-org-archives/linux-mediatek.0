Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D48C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwQ22b8Nr1nOkVeoMuuOuuiuzvEAnD1GlpwPb7e64as=; b=jjOAn1YZaUVBhOL7z1SfAIN3wj
	7T+q/egZ4EZyEnJbDNdmLE7m3r7hNIS/QT0O6A5xm9u0W7gc9HZcUGMqhjkpFuW7h5oOUdxLY9p5S
	DfaS5ftrLapNVaTnwoFC5/y4MlTdeb0gbXthpQl9BqZZzDz8kGmk8h0HS2nsJUZXRH9J88yFo4PIB
	VdzReQT1QV85RFzv+zcYurI9X/459V293NDIqU1QUMO1PnT13o8G5CbeeTiH/jATHaybIHQgtKg/m
	fKkky79QM+fz/X2qQuaFSRfDx22+Hdf87SYKqVtzmnYpEuoJWLTf1DxcfAc/4u+Q9RZx42PcxW+Ps
	0fFTk9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLPt-0033F3-5h; Fri, 13 Jan 2023 14:52:25 +0000
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:401::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGLPp-0033CV-F0
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 14:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=KwQ22b8Nr1nOkVeoMuuOuuiuzvEAnD1GlpwPb7e64as=;
	b=NnbFIHNQsE4SGlyOpADh5QOibw62s4YIpk8BfSxLHZkosThjDfZasg47Xf95DMgstg4iLLH91bCyA
	 s0tGTA6wMUOCvS5ytmDUTq15usC/vdlh1CBYHZ7zAZDDQN5qt40GbQalL76aWwVxkhA5Ldl7F93HT1
	 sISdwEfCKZu4YhbeMF76SfoCYSofMnYx4j46O4NqXIu+aZN/dWMKx7WgOAFvVhXoG5y1cQwSlCu8nS
	 AibyXw8+/MSQNMhds2N9oNgNn6mgSiSv/CS8xGWLoEO3qwQPcm76FklvC2cHQu2wejHu9eoIt1kwS7
	 HubLJxSep0UrRwLYmuStCShFOnvm/3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=KwQ22b8Nr1nOkVeoMuuOuuiuzvEAnD1GlpwPb7e64as=;
	b=jXTnJnPbpPvp28lUNFIDX6bN9rE1EJYDsoziEwow3qmbI5T60a0vGRZAw8SefUhP005zyh4s8JP9S
	 MqfcaBdCw==
X-HalOne-ID: dac2612b-9351-11ed-80f4-93f0a866dfbb
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2 (Halon) with ESMTPSA
	id dac2612b-9351-11ed-80f4-93f0a866dfbb;
	Fri, 13 Jan 2023 14:52:11 +0000 (UTC)
Date: Fri, 13 Jan 2023 15:52:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	yangcong <yangcong5@huaqin.corp-partner.google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Rob Clark <robdclark@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
Message-ID: <Y8FwGTWeYtX0j8MX@ravnborg.org>
References: <20230106030108.2542081-1-swboyd@chromium.org>
 <Y7nV+aeFiq5aD0xU@ravnborg.org>
 <CAE-0n50QOv_+j1Pe19xKj4Cx2Y5_Ak5Kt68UBJuZt10D-jQ44g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50QOv_+j1Pe19xKj4Cx2Y5_Ak5Kt68UBJuZt10D-jQ44g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_065221_676159_99A2DF93 
X-CRM114-Status: GOOD (  16.42  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Stephen,
On Tue, Jan 10, 2023 at 11:29:41AM -0800, Stephen Boyd wrote:
> Quoting Sam Ravnborg (2023-01-07 12:28:41)
> 
> >
> > For this case we could ask ourself if the display needs to enter sleep
> > mode right before we disable the regulator. But if the regulator is
> > fixed, so the disable has no effect, this seems OK.
> 
> What do you mean by fixed?
What I tried to say here is if we have a fixed regulator - or in others
words a supply voltage we cannot turn off, then entering sleep mode is
important to reduce power consumption.
But any sane design where power consumption is a concern will have the
possibility to turn off the power anyway.

> 
> >
> > Please fix the unprepare to not jump out early, on top of or together
> > with the other fix.
> 
> After this patch the unprepare only bails out early if the bool
> 'prepared' flag isn't set.
OK, then everything is fine.

	Sam

