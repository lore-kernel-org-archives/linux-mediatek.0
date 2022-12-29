Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528DDC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 17:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYh2NJvWZas8YI4a4QyIuQl5Ayz1JsLDPfcZD8+PXLs=; b=cHhCLZGW4ul+Zskgdq6fiKUhST
	N9gpVBWfR10k1s6pdTx0D0za/9g0zFt9Sas5X8ZCTMHPojY6kHV7E1Es7Vxox4b2lFk/XFQeBKVLb
	cGWGfUP+VG+8+kc8BntxVm6EOuC3iYVKoZnOFHUEG/HcvBaMojjMvKox6nVzyyWBLMg6xFl64dTcu
	Vdm2OFha5jz+W7IuBgyVnsNgFt1BLOaaL07Z/BMJlB/PSvWFXe/ujB2itE+fjHq9xOOMBNrGsX1OW
	Ix7JhViobA3YxR/GMjfq+EFvZqeFPZ+LLTCqcM5F2h7xQMIex7HLQ8ob/8Ou3UyGzkXG9YaayIy3Y
	EZZlnUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAx82-000X10-4I; Thu, 29 Dec 2022 17:55:42 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAx7y-000Wvp-QP
	for linux-mediatek@lists.infradead.org; Thu, 29 Dec 2022 17:55:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id fc4so46592301ejc.12
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 09:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LYh2NJvWZas8YI4a4QyIuQl5Ayz1JsLDPfcZD8+PXLs=;
        b=MBHGJH1/ixTYpAHbR/CCk9je2PaztiCDJ20MA1CDaO0YOZ/yEa+DJ7h0bhMKPr89wY
         NNsHFBRGLBsSB5C7zczmcFLe/0rVsEzzF0rT2PvG6cGQn94DWec0q9xDWaLNUaobVNXh
         rdOFNEin9pS2Wr8WNVM78+ke7W5GDJLr45hz92Oru0QrGq+JeuTAd+jM8vA79Gw2Xqqs
         8mTGrpEih0VVy5pNdPQYoHQxKCLtMBZSw3sjHXMQTp1H87kO+X8IJFvcC7eI45oYfFfk
         ttrwBGKUCE+7OUHB19q39XlmvHENkH2oLK6D8NFJkTYuR5fQR8UTNLcw1nTLFVbmUgNe
         CP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYh2NJvWZas8YI4a4QyIuQl5Ayz1JsLDPfcZD8+PXLs=;
        b=5ElR4JOwLHDX6eaOkYGc76eoNFtUYSn9FW/r4/QaiPXYnpZVYnW3DTQ10Y1Rx4GrCB
         h3FSVN+6QzhW6LPkKgDTlo2z2FuRbbjW7D5df2u+u+TWDIBE8GI6uUaTGH4Gjh9y+GW4
         hztaiq7wrGZFxEHX8469SiUjOWC4N1ydIhUHyFLkAspCskeKRH/RFw5ctUGvhCVNShv8
         54f7+CZ1SszFlb10TtLwJy8yF/izZ+BGs2F9/EYQP//7bhN09fBvrXvvX4l+z8BiGpHh
         wPZIHV8IhDHl7SuhkajyzXGFPmy/k99DJYuyzKvQ677ltg8uwk5O8HIx9yssT3jmMPnH
         rb+Q==
X-Gm-Message-State: AFqh2kp6vy3kiQFLN+jG3/DsMXIEiz4EqHLhRhR69pLQZlve8OrvxM7X
	wBEEt/oKSng2xiD2/eBXlXptAI5dfPyOQ7zd9g==
X-Google-Smtp-Source: AMrXdXu6dRS3u/srGDYhPBnVsq7v/UC7iXVwcN+ZqAsRxsBxkwewgFIXTHo9cBn1W4PhAdmycaMh+6lzKzADQSQrzXU=
X-Received: by 2002:a17:906:4894:b0:7a6:fc0f:6fe6 with SMTP id
 v20-20020a170906489400b007a6fc0f6fe6mr1734540ejq.694.1672336534454; Thu, 29
 Dec 2022 09:55:34 -0800 (PST)
MIME-Version: 1.0
References: <CAMWtyy1sSHc_DYQ3kq+FWMJKK5Wo3QEgO1yd6wQXx3x0Lp4Uog@mail.gmail.com>
 <Y6isrKS7zgMrNe3S@makrotopia.org>
In-Reply-To: <Y6isrKS7zgMrNe3S@makrotopia.org>
From: Vishal Rao <vishalrao@gmail.com>
Date: Thu, 29 Dec 2022 23:25:23 +0530
Message-ID: <CAMWtyy2EhZMd7Yf6CWXpM7f6EbzbYDu+ifpAnwpDiAP8zPoP0g@mail.gmail.com>
Subject: Re: Wifi 6E 6ghz not working on MediaTek MT7922 (AMD RZ616)
To: Daniel Golle <daniel@makrotopia.org>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Vishal Rao <vishalrao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_095539_014907_869A8037 
X-CRM114-Status: GOOD (  21.62  )
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

Hello Daniel !

Thank you for your response - apologies for being slow to follow up -
I will post the info you asked for soon [tm] but I note there appears
to be some new firmware for the mt7922 (a few hours ago) which I will
also try when gathering the info.

Off the top of my head the regulatory info/region is set to US while I
am located in India and I have tried the latest firmware off git
master as well as another (?) location suggested by Nick Morrow with
no luck (same results) but allow me some time (likely this weekend) to
re-check and get back to you.

Regards,
Vishal

On Mon, 26 Dec 2022 at 01:34, Daniel Golle <daniel@makrotopia.org> wrote:
>
> Hi!
>
> On Sun, Dec 25, 2022 at 08:19:15PM +0530, Vishal Rao wrote:
> > Hello!
> >
> > Using Ubuntu 22.04 LTS based distro elementary OS 7 with the latest
> > available Ubuntu mainline kernel 6.1 RC5 build the wifi does not
> > connect to the 6GHZ band (Wifi 6E) and it only even shows the 6ghz
> > SSID name *after* I have connected to the 5ghz wifi band.
> >
> > This is on a new ASUS ZenBook laptop model UM5302TA with the AMD Ryzen
> > 6800U CPU platform which includes the AMD-Mediatek co-developed RZ616
> > wifi chip I believe.
> >
> > Pastebin of lspci -vvnn output: https://pastebin.ubuntu.com/p/QwM58ZkptG
> >
> > Let me know what further information I should provide - happy to do so!
>
>
> Please also share the output of `iw list` which will tell if we are
> dealing with a driver problem or a regulatory/configuration problem.
> Did you configure the wireless regulatory domain the device is located
> in?
>
> To have access to 6 GHz bands the regulatory region needs to be known,
> I read that on Ubuntu it works like this:
>
> https://askubuntu.com/questions/701709/how-can-i-change-my-wireless-cards-regulatory-domain-dbm-higher-than-30



-- 
"The World is a book, and those who do not travel read only a page." -
St. Augustine.

