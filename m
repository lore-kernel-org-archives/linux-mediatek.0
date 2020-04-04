Return-Path: <SRS0=WnB0=5U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9CFC2BA15
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 15:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCF420644
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2020 15:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cY6DD4O2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvWQiF5F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DCF420644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYxZ+OTvEkIKhz/LCnk9XIOPonlO4QLekMs6yVuEBFs=; b=cY6DD4O25e7BfF
	GMUJdIjIB7YQ2/lm2LvNPW/YSsYpAP2T4M6qcwKuxEkhhNHfE5PeehTI/OjjOFdF/SaNCeXPBLuYd
	F/7RpHWgblyuHbcODB2jh41YDhC6eDP5FqFFuneVEC1L7qMntgAylx+iasXXfhMUAZ2i1aegVS8Wy
	5bnJmhnoqhbBwGE/scM4EZip4HPJb4jxT/Hna+NHfvDd+0F3t02Pi3AAcaFtz+/FaQ48mSYjV9ffx
	t+1U+iaorOo0psVU1Yk+ObO+XwNenZ11rR0jraCwn7f0CQqOCDeUvcBDt57gxz4pv6zFKkWokMH+g
	hewiFGeDASHHZ4Yk23Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKkot-0000cy-39; Sat, 04 Apr 2020 15:34:51 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKkom-0000HK-Ml; Sat, 04 Apr 2020 15:34:45 +0000
Received: by mail-ot1-x344.google.com with SMTP id t28so10586139ott.5;
 Sat, 04 Apr 2020 08:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wJJHt0CSx4rCuEsqr8ESfPqtz2SvcHs+oQjfrjV6kEc=;
 b=rvWQiF5F8bJnmlWbMT7R49NetVKvTAdp4EJoY3L86knHIuMiThiWt9GN38kOhTFKJh
 R/puK9Sr3rH99oncCgmc1eK4NIkt+fy8pJp82Uj0vAMSBEQnbAGzU5HSBYLjcU31y0Hq
 4yaatE2LPEJ5lgaSEd+1NuCPVvtORn+cSTnedW8fICKr4mMw9NT+KjMSLPPB7sN4dlZC
 dLsMVRtTOT7xshyqN4Uaiqm3NnxvOoKvRkQmkMqQn3LongPZHMloOdNa73uECn/jAC9x
 dkVQTIIDejHXp9ieN+gkTLpU7d54CHS/0Ks69XfSwNU+pS+nL+vefjtCj7Al4RwaRHRj
 jSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wJJHt0CSx4rCuEsqr8ESfPqtz2SvcHs+oQjfrjV6kEc=;
 b=kDkVZTgJZycb55OWoZUUTlGxXmebYkRs8fwTuszuxMR7Rdr61H445ZUGQFUhYnvj/y
 t6xTzRi6yaGy5rXbjszYFf3QA4Oi6jgxCIi0uzaQPlZTacg5ZJBApmDiHNp5z4VgG8s+
 F7Vidx93lX3C5opmWFbScg8qcPrRt/zKJXW4LmhgVjvJY2C01AjsePf4oBk6eij0ZXbl
 +c4tCBuvH1cQdWNFH175WpYO9J/V5pEOMhamHFzGgus3/qp2mYPbVURi1MgXAsVwZw5U
 ZVU0Ynm3q8Md0NuirCQNurlkM1TWtr1PX2StdGmqXlEqDXDF5j9snVMSzySijL+jzqnX
 N/Ag==
X-Gm-Message-State: AGi0PuZJQJuZv/PjmG7AXjYsrEpD92ekNCFMOqQwZ7Hh5uxyEKgv/U5q
 Qw+ag6fRAis3L+Aoc2d7DpRpGx4LGJhJoNKKJcw=
X-Google-Smtp-Source: APiQypJurN6kKeueDqM6o5vZ2pCFzzx2u9sVqqily6xPz9KLmAwCuSMsRcuswvGToxGksPlnBUBs6hgZxPamk8aeaiQ=
X-Received: by 2002:a9d:7a45:: with SMTP id z5mr10438979otm.181.1586014481828; 
 Sat, 04 Apr 2020 08:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200403112830.505720-1-gch981213@gmail.com>
 <20200403180911.Horde.9xqnJvjcRDe-ttshlJbG6WE@www.vdorst.com>
 <CAJsYDVJj1JajVxeGifaOprXYstG-gC_OYwd5LrALUY_4BdtR3A@mail.gmail.com>
 <20200404150810.GA161768@lunn.ch>
In-Reply-To: <20200404150810.GA161768@lunn.ch>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 4 Apr 2020 23:34:30 +0800
Message-ID: <CAJsYDV+NY90r=PV0dYRRaTEuxQAMTbakLvguX-1jOu3OQwYfSQ@mail.gmail.com>
Subject: Re: [PATCH] net: dsa: mt7530: fix null pointer dereferencing in port5
 setup
To: Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_083444_778821_F3C9915F 
X-CRM114-Status: GOOD (  10.43  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

On Sat, Apr 4, 2020 at 11:08 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > MT7530 tries to detect if 2nd GMAC is using a phy with phy-address 0 or 4.
> >
> > What if the 2nd GMAC connects to an external PHY on address 0 on a
> > different mdio-bus?
>
> In general, you using a phy-handle to cover such a situation. If there
> is a phy-handle, just use it.

If it's determining where switch mac5 is wired, a phy-handle is fine.
Here we are determining where exposed rgmii2 pins are wired.
It can be wired to switch mac5 or skip the switch mac completely
and connected to phy0/phy4.
Current driver is determining rgmii2 wiring on mt7530 using phy-handle
on *another unrelated ethernet node* which doesn't sound right.

-- 
Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
