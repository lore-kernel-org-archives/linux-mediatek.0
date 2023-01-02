Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD18C3DA7A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Jan 2023 09:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=798mLQgjXe76IQIl0wr8ZA1qTc0lXDNEYGL1jdAHpGk=; b=yXWjyL9txn3t7P+qepxfclBsBO
	qPzI63n7MmLy4nLR5ADjKSw8UxiCaRW2Vj+1+OjkmHAqeTRSPTRqHZ+l7xOxDHoKeloL3b/rg7X7L
	J8QQWR+0zQCOYnQ0vgagUQmBcMAO+Uny6oY99k9QK0ojDugPk0Kd3k/XHSHJthCtwdKZghI3D6wq2
	84I66AuJRrUZE7Wa3bTLd779NmSwC1m4eOFkYv+N7t3IoSrJskxdCZqeimJBWTSLuWWxgAww02AQq
	ZUPB2gVl/p9X4OIwj3+5MLxXJS/3E600W5jTVC5kOJ+9/Swxk2/EzEoeH1ptgiZfRjGyaPx86qJPW
	+xMlAxdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHSk-00A4wW-6U; Mon, 02 Jan 2023 09:50:34 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHQA-00A3UM-7a
	for linux-mediatek@lists.infradead.org; Mon, 02 Jan 2023 09:48:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id u19so65507883ejm.8
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Jan 2023 01:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=798mLQgjXe76IQIl0wr8ZA1qTc0lXDNEYGL1jdAHpGk=;
        b=NJYpMwRPyko6aCe368eAIO7/g+4UO4uk5POV4brMKD4XZrzurcTUCbhngGOJ2WwhYU
         7/6R7WMWMmgaQEv+arP/A4wcXTV+q5VSH8h3CIWShHzND4sWQcwl0aaBhzMS8TYcuiEU
         YeBv792gROYLskzFGF65ti3whrRNQaLc7lJn3xhzo/VkjpmX/T4oHTBsP6SoiAofo5lZ
         cqFHdW8FJXPol0achK/uxp2oHohFM4bKniyLW1wr6WR3ilEdzDPEWJ7/OapW4SzRKK5c
         0pdhdkTimsguFKH+8zkhccLhzG2GUI/ONYRjYLYSH/4APdzYK2O1FqgSOaoGoGrcDXjZ
         X1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=798mLQgjXe76IQIl0wr8ZA1qTc0lXDNEYGL1jdAHpGk=;
        b=MI0UNnQb2kQbQphAfb93L+sWk4w+5OMMLq7F5jyrtZ2OrImhRrD003Dk0viHkMcCKj
         aLf+IhgKn6ZUOJSnE7+C3zcA3knmoSUiMpuwIhXQxQictNg0joHdinoVYPV9rH55dAen
         oucKRhLh1yejn6LJjJRI+1s+LrENEP8+AA61MH6UPMlkKo3sOvgwlmuudM2C0dPWgsB4
         7OsHardhNT3A2+uGn0oOrT62+tGm46q+2Ap7vT9g2I/si/dXMwlfnNvbqc7ZWeJlzTCR
         L4QYN8dhsiVklHtKUvJWdP8G7D0I+8JOE6g686GtINu9czv4fy6Af3vd7EBL/cBZ58EA
         oF/A==
X-Gm-Message-State: AFqh2kos93U3apIdY5Y3xCpLk7/uH2+JFfryWNqRZqqIlcBocOY6I3bI
	jGiC33NRmM0IAZy3TIszMsnuPiZ6Eo4KKTg+0Q==
X-Google-Smtp-Source: AMrXdXsEqTDWE84pn5CWDM7F1VXEJwEbwLqkyP06zh2dhnPk+dBCWaB4caIGgpEh7HZmSdy7ldvk0RuzKgrGbr4DZ0k=
X-Received: by 2002:a17:906:4894:b0:7a6:fc0f:6fe6 with SMTP id
 v20-20020a170906489400b007a6fc0f6fe6mr2296433ejq.694.1672652870858; Mon, 02
 Jan 2023 01:47:50 -0800 (PST)
MIME-Version: 1.0
References: <CAMWtyy1sSHc_DYQ3kq+FWMJKK5Wo3QEgO1yd6wQXx3x0Lp4Uog@mail.gmail.com>
 <Y6isrKS7zgMrNe3S@makrotopia.org> <CAMWtyy2EhZMd7Yf6CWXpM7f6EbzbYDu+ifpAnwpDiAP8zPoP0g@mail.gmail.com>
In-Reply-To: <CAMWtyy2EhZMd7Yf6CWXpM7f6EbzbYDu+ifpAnwpDiAP8zPoP0g@mail.gmail.com>
From: Vishal Rao <vishalrao@gmail.com>
Date: Mon, 2 Jan 2023 15:17:39 +0530
Message-ID: <CAMWtyy21YoW=okaw=rL2OAn49NCT2KzvFGCJLM+1vJg+NpcaMA@mail.gmail.com>
Subject: Re: Wifi 6E 6ghz not working on MediaTek MT7922 (AMD RZ616)
To: Daniel Golle <daniel@makrotopia.org>, Nick Morrow <morrownr@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_014754_363265_180CBB6F 
X-CRM114-Status: GOOD (  31.28  )
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

Hello Daniel/Nick,

Here's the output you asked for: https://pastebin.ubuntu.com/p/kZGS227rdr

From my rudimentary/casual reading of the mediatek mt76/mt7921e driver
code it appears it's loading the 7921 variant (filename 7961) of
firmware and not 7922 so I tried to patch those few lines to no luck.

Also just tried copying over the 7922 files to the 7961 names and
tried with unmodified kernel (both 6.2rc2 and 6.1.2-xanmod).

I'm sure I don't know what I'm doing here, so if you have further
suggestions/info you need let me know?

Regards!
Vishal

On Thu, 29 Dec 2022 at 23:25, Vishal Rao <vishalrao@gmail.com> wrote:
>
> Hello Daniel !
>
> Thank you for your response - apologies for being slow to follow up -
> I will post the info you asked for soon [tm] but I note there appears
> to be some new firmware for the mt7922 (a few hours ago) which I will
> also try when gathering the info.
>
> Off the top of my head the regulatory info/region is set to US while I
> am located in India and I have tried the latest firmware off git
> master as well as another (?) location suggested by Nick Morrow with
> no luck (same results) but allow me some time (likely this weekend) to
> re-check and get back to you.
>
> Regards,
> Vishal
>
> On Mon, 26 Dec 2022 at 01:34, Daniel Golle <daniel@makrotopia.org> wrote:
> >
> > Hi!
> >
> > On Sun, Dec 25, 2022 at 08:19:15PM +0530, Vishal Rao wrote:
> > > Hello!
> > >
> > > Using Ubuntu 22.04 LTS based distro elementary OS 7 with the latest
> > > available Ubuntu mainline kernel 6.1 RC5 build the wifi does not
> > > connect to the 6GHZ band (Wifi 6E) and it only even shows the 6ghz
> > > SSID name *after* I have connected to the 5ghz wifi band.
> > >
> > > This is on a new ASUS ZenBook laptop model UM5302TA with the AMD Ryzen
> > > 6800U CPU platform which includes the AMD-Mediatek co-developed RZ616
> > > wifi chip I believe.
> > >
> > > Pastebin of lspci -vvnn output: https://pastebin.ubuntu.com/p/QwM58ZkptG
> > >
> > > Let me know what further information I should provide - happy to do so!
> >
> >
> > Please also share the output of `iw list` which will tell if we are
> > dealing with a driver problem or a regulatory/configuration problem.
> > Did you configure the wireless regulatory domain the device is located
> > in?
> >
> > To have access to 6 GHz bands the regulatory region needs to be known,
> > I read that on Ubuntu it works like this:
> >
> > https://askubuntu.com/questions/701709/how-can-i-change-my-wireless-cards-regulatory-domain-dbm-higher-than-30
>
>
>
> --
> "The World is a book, and those who do not travel read only a page." -
> St. Augustine.



-- 
"The World is a book, and those who do not travel read only a page." -
St. Augustine.

