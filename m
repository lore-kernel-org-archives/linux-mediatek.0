Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD1DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EP41tGFCYncj+yepJYZeQYAVSEKtXTKPD5ooGBWViEQ=; b=ofvZiefzmfyK7G
	CcLmlKmWaLL/KpXPP3ySz0Jw4QOJdPmAtNWjm9iv01qx3xNtTGXp4/BuNP6HhrX18CqO0CSDopUBx
	FnwP0s+NWxu1Z7/lwHk/DvwdySC1eiai+CzOBkYej8GQYJN7ePZRoITL9N2f9QXG289ljuZ0CMAA3
	0eXjwEnPLBRyJbHaZB9aVoth9+nO0CVRP9GPv3mKsj1kYO2La5Lh+xt8zg8WcqJMngLont5uVvmxv
	b6MyZCjJEF/72qAyhuIajX/R0F/UXArtk7DsGLwb5jTBmwGgENyfzWeAW5GZ4MtZ46w4XCyjyZz4R
	Usp34HgoA/wOOhGD5dtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvc4v-001K9A-LY; Fri, 10 Dec 2021 09:20:33 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvc4R-001JxJ-25
 for linux-mediatek@lists.infradead.org; Fri, 10 Dec 2021 09:20:04 +0000
Received: by mail-pl1-x62e.google.com with SMTP id q17so5859073plr.11
 for <linux-mediatek@lists.infradead.org>; Fri, 10 Dec 2021 01:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/mF1VPMo13JARvfkDjHr5/SisaG+Ir20CU/Tf/n9Bg=;
 b=SToSPaYYAt5mCO4LV8n0LNNwad0lFzIFdUv0esQWcpbEgkFZzuux3siphGame7FM2r
 Ay23dOwBhJXGiuOqpGZJ3A65aJoJ1QiXOc8OCOC565gJTZZ64qnda05vnB/tAyJi5/XZ
 oVXhMUWhBn+VmSstg/Uhpql8Iqk3ZW3a7eq951c8IwTrcgLLc3Ov2FG0gfxvQCu9ZIRS
 DVFvgSczXQv4wcIC43mb5t0XJFy5PdYBt4rThwBV/fHvWdAzkeeocm2HhJhhBRAFbzMx
 Kv+ZbDLXHpwV1wiKc5Y/+RuDN+65wiLJ3HoHpJ6LeX7ZJMTTl4O1hGPPp2490W992ct/
 Uiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/mF1VPMo13JARvfkDjHr5/SisaG+Ir20CU/Tf/n9Bg=;
 b=qoLgx1T7Pk1giEk8TICWyMHYBbjQd52HCtxEDeMLwmX7FFlhFyvkkq1OYbPey28Q09
 qHplSOVVF67tflGQhIb14v8yui+dWSN35imHLz7RY9ohTVrw6E0VDwxxDhA0Z+YVdoHX
 g0V8dxENpLNWq5RbOtMiIRC+HBwz3Fi3NuKpeJ8nXFv0q3Kir7YWmZk7KpU84A5om9/r
 Mn/A7833uWG/YqnKvNFPRu7RZw36z7Ce3mP6f4ZkMfWX7xr1a8ZPIvQcGd7edPAWTVZ0
 Mk55P8YXjosV8Uz69mtyEBqjYqz/NZqNP3Sj79W0MqieWX7esNoenTkgDHoOdpsqgk1f
 a02g==
X-Gm-Message-State: AOAM533q4QO5GPq1xu/z4GJBK35mJdGFFzOgR26WZyRGPphT4gYcQtIB
 GKkYgtkKfHltikzLwGwe4gi70gBRM7r65IyQOEXhUw==
X-Google-Smtp-Source: ABdhPJyR0qD6gQT9kxLS+TicnbMDkT3jme4w96GoC3u7hWvbtWBi6a1XLTQp9ydHVow7YRCzk+Jdqmz0eYrY2jqIEM0=
X-Received: by 2002:a17:90a:2fc7:: with SMTP id
 n7mr22476405pjm.141.1639128001613; 
 Fri, 10 Dec 2021 01:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20211210082247.977043-1-tzungbi@google.com>
 <8735n0oneg.fsf@tynnyri.adurom.net>
In-Reply-To: <8735n0oneg.fsf@tynnyri.adurom.net>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 10 Dec 2021 17:19:50 +0800
Message-ID: <CA+Px+wXbeeHw5TgOk4yY7EdL-BTc124HDgtR6bmmm1X4VQtqjA@mail.gmail.com>
Subject: Re: [PATCH] mt76: mt7921: reduce log severity levels for informative
 messages
To: Kalle Valo <kvalo@kernel.org>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com, 
 shayne.chen@mediatek.com, sean.wang@mediatek.com, 
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_012003_129528_8CC1B79B 
X-CRM114-Status: GOOD (  10.79  )
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

On Fri, Dec 10, 2021 at 4:49 PM Kalle Valo <kvalo@kernel.org> wrote:
>
> Tzung-Bi Shih <tzungbi@google.com> writes:
[...]
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > index 6ada1ebe7d68..99b144fd8db5 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> > @@ -882,7 +882,7 @@ static int mt7921_load_firmware(struct mt7921_dev *dev)
> >       dev->mt76.hw->wiphy->wowlan = &mt76_connac_wowlan_support;
> >  #endif /* CONFIG_PM */
> >
> > -     dev_err(dev->mt76.dev, "Firmware init done\n");
> > +     dev_info(dev->mt76.dev, "Firmware init done\n");
>
> Shouldn't that be a debug message? Hard to see how's that useful in
> normal operation.

I thought the message was an indicator of "the firmware is loaded
completely".  Sent v2 to use dbg instead.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
