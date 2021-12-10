Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A506C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gd09gV3SINAMyVvZKLhxGHErPgJgLMMCP0braMi3uLg=; b=pejV/KxJma79Nv
	hl/lku3PvoWDg4We4Qcqb7kZryPdsmTBccD87RZc4VGpG3WYvFmw/i26lqBhaanWOlom3m/0iEOMf
	CHZd0zldvGqtYHT3TBTCzRvTAf06DefEXKBCR7yTg2ZznZ5ZfG7Gx+o6dJfpC3qsk27UPcGQ+iIn3
	4G3YYFBz1yf1fNDsmSrlkSBFIX8pszkvwIMXtPcDccnP9elMLeJiyGFZBhUQnD88PuQeW0hmhOYxu
	WH+GrCnzJ+spZpsAqd4knzRsxvI4/fYziRvcPYf7TpATQKxPHYv/XjTIHPyg/2/6g/+agMuvNd8zJ
	Doh/orRk518SSZhk8r8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvbrL-001HwH-75; Fri, 10 Dec 2021 09:06:31 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvbrI-001Hus-Pc
 for linux-mediatek@lists.infradead.org; Fri, 10 Dec 2021 09:06:30 +0000
Received: by mail-ua1-x92d.google.com with SMTP id i6so15585997uae.6
 for <linux-mediatek@lists.infradead.org>; Fri, 10 Dec 2021 01:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9tGFC4LzWqCgm0WZvcBZCqbYx5+hs05WaoMGVHtCwSQ=;
 b=dzpOCEItnevmnc8O0NJ2fSw3n6TQ92XxO7pp66r2wpqtT5lx1yKL302TGJBZ+fRHur
 wrIK+V1zGgd2tRlm6qJgkI4PG417GtmPOwMQYTBT4kxCpHfZtsmIZkund8StmOt6DbLw
 gkl0/0hO55nO4rj6kPf/26O5z/2FSwjBNz47wBZ+79mv8fJ9lTNFFMQd9ZUKxB0MbvY8
 1dz5TJo0RllEyA0kSN82ISIyHcOnjYgfsDxTaeVdGSDAuPDD88B+tg8p4wnAXytE6bkX
 Dl2YXCnWW0EwEJExzaZIIZ5FOngJEg32AH2WWgogRr0Jk2NXNNu77PAOSNOfU3oHEGhE
 JPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9tGFC4LzWqCgm0WZvcBZCqbYx5+hs05WaoMGVHtCwSQ=;
 b=XTS3TDd0Z1eG8KsXk0QSskXKRZRLRryq6zjM5N2W3Of/AnNnSitQHvKAq/MIT+jETq
 +IZkgHNKdXuOclRIDkf3GxZ0DGEDRiDK2Z44yPW6+vx/TP28EWaRU/zq90CngrWsMzL0
 DLt1Oi8205ihicttvC7N4O7kLqrLvmVLmNWwPt/vdSDfm/y/MVf29mPc1qjHS36ipBmx
 hi54Dsyjt3rVS8zZtK6VnY2h/B7v1Kx5W6V9y9PpK01qBAMwta0Kt61Zq+caJHxBsNdJ
 GZZOnUVQ7GGu6veLX06ejPsecnBPFjFcyNUS+FcmDdfW5lmlceAPwmTphqirCZBbBK5w
 b10A==
X-Gm-Message-State: AOAM533KVCsFIs1asMOpO2eC97Yp8XO2wQyY4xo0SUCFluf7h91tZvv+
 ldMWcxJv1Y71Ibp3kwdT6R+faiu03dFl3366Ifg=
X-Google-Smtp-Source: ABdhPJwrzX4R908X787m5pCkNfhqt1pa0auQvUb6jSQ5RECJlas/hTNiNuMIw0lJZP+KkheO/qddaS1r4cuYm+MR/EA=
X-Received: by 2002:a05:6102:38ce:: with SMTP id
 k14mr14134171vst.70.1639127185051; 
 Fri, 10 Dec 2021 01:06:25 -0800 (PST)
MIME-Version: 1.0
References: <CALW65jbKsDGTXghqQFQe2CxYbWPakkaeFrr+3vAA4gAPjeeL2w@mail.gmail.com>
In-Reply-To: <CALW65jbKsDGTXghqQFQe2CxYbWPakkaeFrr+3vAA4gAPjeeL2w@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 10 Dec 2021 10:06:14 +0100
Message-ID: <CAMhs-H9ve2VtLm8x__DEb0_CpoYsqix1HwLDcZ8_ZeEK9vdfQg@mail.gmail.com>
Subject: Re: MT7621 ethernet does not get probed on net-next branch after 5.15
 merge
To: DENG Qingfang <dqfext@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Russell King <linux@armlinux.org.uk>, 
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_010628_851599_B8161512 
X-CRM114-Status: GOOD (  16.54  )
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

Hi Qingfang,

On Fri, Oct 15, 2021 at 4:23 PM DENG Qingfang <dqfext@gmail.com> wrote:
>
> Hi,
>
> After the merge of 5.15.y into net-next, MT7621 ethernet
> (mtk_eth_soc.c) does not get probed at all.
>
> Kernel log before 5.15 merge:
> ...
> libphy: Fixed MDIO Bus: probed
> libphy: mdio: probed
> mt7530 mdio-bus:1f: MT7530 adapts as multi-chip module
> mtk_soc_eth 1e100000.ethernet eth0: mediatek frame engine at 0xbe100000, irq 20
> mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> ...
>
> Kernel log after 5.15 merge:
> ...
> libphy: Fixed MDIO Bus: probed
> mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> ...
>
>
> I tried adding debug prints into the .mtk_probe function, but it did
> not execute.
> There are no dts changes for MT7621 between 5.14 and 5.15, so I
> believe it should be something else.
>
> Any ideas?

I had time to create a new image for my gnubee board using kernel 5.15
and this problem does not exist on my side. Since no more mails have
come for a while I guess this was a problem from your configuration,
but just in case I preferred to answer to let you know. I am currently
using v5.15.7 from linux-stable with some other patches that will be
for 5.16. Just in case, you can check the kernel tree [0] I am
currently using.

Best regards,
     Sergio Paracuellos

[0]: https://github.com/paraka/linux/tree/gbpc1-5.15

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
