Return-Path: <SRS0=yOeO=IO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311E9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 04:36:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD3C3650D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Mar 2021 04:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD3C3650D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WymgpRtCDtb2qWkjCRKlyxIo2AdiEG9WD+VKx+RXsu4=; b=NzaBQo0XNrL3tsUEyJnJ/R1kz
	fH8zeISstj8RzaFxTrVcUw2QWbzUP+Eye/L3xEmMqk/572AU/nLNyAAc6UWhEz5vm1T/zBaH98X2j
	FyDZLbzLEYbt4CYIlpTranEF+XL7YdHmN6tHmKbGhrmC5S0NTv0DR6EdoeFq1egqj4FBayV/P2z9g
	gIHCtvEX1Qyl5JjCy4Omx7eUPOkVDILqH9t1GoVX9M1S8AC3Kb/HN+3ZpKlRJNLazi/JG1mGGdWPV
	Tfxsytgx4i8l88Wsnr7Oi5RtTJMhmbg943x65NMQnWivjpGbrRYkvz83UPDsSKFnkUWpgy94GJ2xE
	zbF/ewlkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM1Rm-00HOvF-Fg; Tue, 16 Mar 2021 04:36:46 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM1Rc-00HOsy-8V; Tue, 16 Mar 2021 04:36:38 +0000
Received: by mail-io1-xd36.google.com with SMTP id o11so35871746iob.1;
 Mon, 15 Mar 2021 21:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xVtwrcyh2/TskgfBA/1goWIwsIJj+WbEku885ymod2c=;
 b=NjldcXh9x/r3ur8iRua7R1tmsWyqI+uS9FuYw2g607IHXNNT9sZyqn0qMegXJy4mFx
 NOxHoBoQ1HvvUXjQnYLOMjGKnkogx5eFrKC0QcMJLchcM5ferDu8N+sV1y/nz7+XVzUQ
 441yCVCcoc7fkCEWi5E3Vb+BgMYplW0e2mhddWqD94Rg3fjlxVCYI7vlnr8LyYW21LK7
 ME0IrkM/BbVoIeTrDVp6U1Z6JAONSbGAGe+dw57q5yDLQs1zQjQuDfYvp4kVSuQVZVRQ
 OPVtYNa5H9PdXHQFeX5s/qZP1eE4T0LHSETm3o+t+2uuACGU73HjOooAQ7Pax1SB7Bj9
 F5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVtwrcyh2/TskgfBA/1goWIwsIJj+WbEku885ymod2c=;
 b=KE7DGj7oeXyxy6JMyTHl661dkoXz+ECaQ/YsBdpJGK++YeznntekBbCml8/Le/hBQu
 eMu1LdHm6Ei1xQMfkIPrfcfo6iCm02VXv3KuzR7meGY9dNXE/sHqwfvm5e++BAsih7aH
 5UJuLxR0KErp894R49vIgG2fVa2FBBUt5sLbdhgQDoLdV1+cZS50CC4deGU9u87doHx0
 AhqloosygO0GjlUxmjTEMZIvrwLknOzSf4bt3au+njCi/G1nSa+GMIbKZniCm/UzwOsn
 1eZ4HoyOp5Bjah8O/Y74my+AMv8ZaHPTTccqUmSe9aujbd/qeW5drfuZtBbeupy2pEpc
 Fujg==
X-Gm-Message-State: AOAM530AD7h9e05ShxaP0iKSsW6Xd4iElbLgpkOe+JW11P30e3O+D70o
 qlpGNIW44NfIzBGuS/DCZuBGOftIztP/bd5dLD4=
X-Google-Smtp-Source: ABdhPJzpAjz7V8myg0zt/fX5zYzoWdIz1jJdEhY/c/yCUNT7F5ybwl851XDZ/omqS/1k9sLgJHJ2J13dPWmdHrqoDbo=
X-Received: by 2002:a6b:7a4d:: with SMTP id k13mr2072399iop.39.1615869394773; 
 Mon, 15 Mar 2021 21:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210315170940.2414854-1-dqfext@gmail.com>
 <892918f1-bee6-7603-b8e1-3efb93104f6f@gmail.com>
 <20210315200939.irwyiru6m62g4a7f@skbuf>
 <84bb93da-cc3b-d2a5-dda8-a8fb973c3bae@gmail.com>
 <20210315211541.pj5mpy2foi3wlhbe@skbuf>
In-Reply-To: <20210315211541.pj5mpy2foi3wlhbe@skbuf>
From: DENG Qingfang <dqfext@gmail.com>
Date: Tue, 16 Mar 2021 12:36:24 +0800
Message-ID: <CALW65jbZ1_A-HwzKwKfavQQUBfNZuBSdL8xTGuRrS5qDqi6j3A@mail.gmail.com>
Subject: Re: [PATCH net-next] net: dsa: mt7530: support MDB and bridge flag
 operations
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vivien Didelot <vivien.didelot@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
 netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_043636_377057_BC1C6504 
X-CRM114-Status: GOOD (  11.90  )
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

On Tue, Mar 16, 2021 at 5:15 AM Vladimir Oltean <olteanv@gmail.com> wrote:
>
> Actually this is just how Qingfang explained it:
> https://patchwork.kernel.org/project/netdevbpf/patch/20210224081018.24719-1-dqfext@gmail.com/
>
> I just assume that MT7530/7531 switches don't need to enable flooding on
> user ports when the only possible traffic source is the CPU port - the
> CPU port can inject traffic into any port regardless of egress flooding
> setting. If that's not true, I don't see how traffic in standalone ports
> mode would work after this patch.

Correct. Don't forget the earlier version of this driver (before my
attempt to fix roaming) disabled unknown unicast flooding (trapped to
CPU) in the same way.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
