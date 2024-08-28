Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5CDC5472D
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 08:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ9gN2dyG0tELFDyIaVWwxco35Ny0zFkmQvcfIA5lIw=; b=MNspx0fqQwVXL5WGdZOscho8wv
	bzvoFoPrZ60AOc0MLJJCLH58Qnww3CcXmIfVnkdoW2kxOeuiVh2NZyVKq6nkzZboiINjzo4ti1X87
	5aTHpvGj5e8KwuDJrMqefsW9MvIEwf51FWZNKUSF3G3r8sGym7TRvWLWEaQ/sgRBwC5q1SG3zBmMg
	ePspWaqC0Oq8DiYnbOpLynUvI8BBoOfnHLsiIOPSGoHQzdfIG17wHSwT/bOiXy7zBZWuj2kzyJoV8
	dNt9rwsAAbzDlgpUKFzO0sBCD7FHLltof3B884UsAbpJVZtKmw3XLR/BcVCBMaUveNSCGr7cHMPOM
	X/tDiyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDsm-0000000EVHs-0EXy;
	Wed, 28 Aug 2024 08:18:24 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDrx-0000000EV5J-3isZ
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Aug 2024 08:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724833043; x=1725437843; i=spasswolf@web.de;
	bh=HJ9gN2dyG0tELFDyIaVWwxco35Ny0zFkmQvcfIA5lIw=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eJZPsx1RySSUEgyds5+XOD9GkIHMzH6AYc4WK5/9l8p7j2cF/hzP1qw9xgOticWr
	 CyVT5dUiVAPT1tASK3b7RszrWNCbIhdZdnm/RZOefeRR25bcs4ZTJK3WtOO9pj3PQ
	 fHGP9o+0V5ZqLn58ztF3m1QIkkSDlfKX962aaUz+3R+gk0hvv24V9x9N+Ltw3+BBF
	 3uvZyHbFtM5fp/TR3H5rd0b1OMZ9a2F0/fqGvyVTgxxx6ug5dPIaiPh49N+rDxfMq
	 Ooa/Snb2/6dEvWqC4GYvevwl1YsahaNDencN9yvAg/Frh3zKsALI8q0ZgmhbIP08T
	 uproA0TRoHJ2Avp1lQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cLR-1s4bg73m1F-00wkGg; Wed, 28
 Aug 2024 10:17:22 +0200
Message-ID: <980698e0d6dfa1e0043edfed6e174ff17705e053.camel@web.de>
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in
 mt792x_mac_link_bss_remove
From: Bert Karwatzki <spasswolf@web.de>
To: Mike Lothian <mike@fireburn.co.uk>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com, 
	sean.wang@mediatek.com, deren.wu@mediatek.com, mingyen.hsieh@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	spasswolf@web.de
Date: Wed, 28 Aug 2024 10:17:20 +0200
In-Reply-To: <CAHbf0-HYi=x11bc-sMJFbZ4cbkdphMYQ_hjzD_wrPvJevVwyYg@mail.gmail.com>
References: <20240718234633.12737-1-sean.wang@kernel.org>
	 <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
	 <CAHbf0-Hn=ZyYpk7bS1yLK7K3ZpfWKgt3-t=c9Nhdj3Ov3H84mQ@mail.gmail.com>
	 <f7197c55d059cc8ddbf6c3def16dc414c5ec0b42.camel@web.de>
	 <CAHbf0-EBHERbxPGakY4-1jTQWqGqua3F0OYZjxcakdemJ5Soqw@mail.gmail.com>
	 <51e80bde6e3f3256ecdea2e5260463341e65578e.camel@web.de>
	 <CAHbf0-HYi=x11bc-sMJFbZ4cbkdphMYQ_hjzD_wrPvJevVwyYg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6oZ+XXROi7lRrCqTGJQrAaf7+UZos3uRqJi6w9SfVRwy3Ai+6+X
 VzH1v1dTV1y4A0Cl5+yWA5cmtgmRpW2t5ytde1rRiTN9cNqTtss/hmQucySD9gu+k15mH3a
 BZfb7GJYdp3aB8FgVb/GySZpvBBrCMi73kG/vIIt3bxxzHK1Y0Qn8yi4Ezt+szteelBQZOg
 mtdxWhT5F6uPFlxVtsD4Q==
UI-OutboundReport: notjunk:1;M01:P0:O3/Xpm7KHVc=;ysiL236UkqiGFos3wisn3TRiVc6
 GhTDxBq0Djzm9fPbS0xNeJwtQrVvhB+vRwQNb6+N/fdcROdszFTxugwasFNfn4gQAvpDHIcJL
 aoIzqHw/2Iq71Da21fBh6DQbs425oHcSYLxsSomUFn5nEA35tVwQalsycTkTRastmIYw7GzTs
 sQPwQvFdXoyGKmCeLhg2+Uw1kQkeQhh6l5uwiJ6zZ97VZikxqjvpQlBFFJlwg67rg4rTdUVaM
 8unT1Dmg/w2jMtpii8YDXpSttgDPAu5YqTsFlwtNEBKScvCRPqnU9iP7HKyUlX9sOQW2W8rd5
 7M6+408V9i6vBIE2doqJnqhkh72gpvX7VsCQ2btld3Ei+OLoYggLWXUnoG51YgyUpOWCGaHIn
 PnzdQV78WJP0kUM6KKirPCW3WGGDvenxBpBxLHzDhXFSE1a7ILHjh5O7U52Twda60xTB5Hr47
 AdNaNlsOGbHGzPzbY67EGUs4JVY2QVd3FIU9ygMCgFPOejMpZZuc1ZH21sfRGcLQUV6P4Dr0p
 Ocx4qBHM9KS/scxnIWNGOXufot7PegDlWDe5MgealQf1EHwUD1oYliMNBencoiFllqqyCZ5yj
 uKj7Y4JRXiImOu8ydcWY1K/YqCaR947FgBTy3L7r2RRp0wJSdojLTqJQ7Q/Z3LsVwuHXoRmbV
 80kcM4n6eCWWWvCsCjObQCKlPCoynUMTefRV9q9cFgMhhao6j/vaagnCDFNwHO/BhWl6Lq0cO
 d1Cx5UbRetKYW2fFL297XAm8D8/dHzu9XK9WHk8gPRq9B+zqBlN2rBi9Zb339xR/CLsSLjSrC
 edKkU4Y2rApJYpGJ4b35RZwg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_011734_331843_1FFE4221 
X-CRM114-Status: GOOD (  11.95  )
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

Am Mittwoch, dem 28.08.2024 um 00:38 +0100 schrieb Mike Lothian:
> But not the follow on fix which fixes suspend...
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> index 2e6268cb06c0..a85c19da77e5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1182,7 +1182,7 @@ static void mt7921_ipv6_addr_change(struct
> ieee80211_hw *hw,
>       struct inet6_dev *idev)
>  {
>   struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
> - struct mt792x_dev *dev =3D mvif->phy->dev;
> + struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
>   struct inet6_ifaddr *ifa;
>   struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];
>   struct sk_buff *skb;
> @@ -1205,6 +1205,9 @@ static void mt7921_ipv6_addr_change(struct
> ieee80211_hw *hw,
>   },
>   };
>
> + if (!mvif->phy)
> + return;
> +
>   read_lock_bh(&idev->lock);
>   list_for_each_entry(ifa, &idev->addr_list, if_list) {
>   if (ifa->flags & IFA_F_TENTATIVE)
>
> > > >
> >

That is interesting (or odd) because suspend (s2idle) works for me in next=
-
20240827 on this hardware:

04:00.0 Network controller [0280]: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E=
 80MHz
[14c3:0608]

are you using a different model?

[  272.780054] [    T848] wlp4s0: deauthenticating from 54:67:51:3d:a2:d2 =
by
local choice (Reason: 3=3DDEAUTH_LEAVING)
[  273.067438] [   T3437] PM: suspend entry (s2idle)
[  273.151140] [   T3437] Filesystems sync: 0.083 seconds
[  273.157029] [   T3437] Freezing user space processes

Can your the post the backtrace of your error (when commit 479ffee68d59c59=
9f is
applied)?

Bert Karwatzki

