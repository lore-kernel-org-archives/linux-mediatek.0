Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE9AC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 17:42:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE9C9207FC
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 17:42:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdZcN2Rv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LKjtoMaz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="fc3E3HwH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE9C9207FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TKxwMAix/NUSI83Mk5V0dwsLoN0G2zdG/BjXqgP9Dn4=; b=jdZcN2RvlWery5KuAlGiVYUit
	EG4/pQZrlCyqsiQD5CeE+Mf6s6a/ITeQ3zcz8wjZffWB3HbZ0m6GPJuihZj76qEbVhlm9G2ILvQJl
	4M9DzceEkwhpTvxNa0e4kbA+ngzfT+Vywpn6bQ3CsCrbq/hA7JeiAGAKQ579hTCV8xh8aZB/mVTb2
	wnnvo9gKCRePkR3RRZOGvzqM5oyrhy71rKALCy3+Z6U0r7iKdJHcFAI3qaHEbcstuz3WYjA4pghVN
	vrgJ1NOGMZeUNYfJkYT7yAroUF54jwUNyxFbA5IkrKxW6+0nMZa5wkUJlOW2Ts+4mrhm87YlUR1TO
	tt4fzSfqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k30wk-0004C8-77; Tue, 04 Aug 2020 17:41:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k30wi-0004BY-Q8; Tue, 04 Aug 2020 17:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=tlNxxD5qzN1CQxQGMK0zRA9MTvzI7N88GHBMWTvEbc8=; b=LKjtoMazcpHyMvASboaX9hXw+U
 5ntJo2J1Uh4vvoou17VyQieXPUZhaiks2+UODEZxhT0pCiuzMwyXPVl7gbhl7GjMB2K8O39l+sHZb
 DtTuXzoQuyGR/4CsjKTxZ/8A2jhS/fVWOxmFXjv1BIGwuRBWl2dPkOuqMR1sfTkRcgzenD3VqlezY
 NvZ/O32tDz2Z4lKxwunQQEgBBPKjaTFeEuR+loztJBSsJhjxUMJ9sZoac03WOuczaNi8Owkar0MpB
 PN8V4Yqr7Wsp+H0/Gn7RUS8GfYIxksNo1CB0xsy3pJKi2KL/WAqE8Mu4RKegHn3K4yoOkQ/WnX99+
 DOWzEoRw==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k30we-0006z7-JG; Tue, 04 Aug 2020 17:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596562816;
 bh=xj2mO6FXcqa+VAPR3RpZMLHRpg7TKnj7zvekr6g51y0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fc3E3HwHvZK7xYq4qip9hx4hEQ2qNK2hpgOSVN6GDhNr002x7U3BDYznrUMjFsdl7
 ec6ljDUzeXcdJvyjsdyZbkl9DlZ7c/tFoO5qIW2NF+yKtCs6MR4iu1S5HN46Pb8iYa
 4FUL21dO0aT/+gm8jGK4IlbZzX8sd9bMWGGUfN6g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.119] ([217.61.144.119]) by web-mail.gmx.net
 (3c-app-gmx-bap28.server.lan [172.19.172.98]) (via HTTP); Tue, 4 Aug 2020
 19:40:16 +0200
MIME-Version: 1.0
Message-ID: <trinity-5335a61e-b8f0-4441-9fe9-0827cdd67ce4-1596562816887@3c-app-gmx-bap28>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: Re: [PATCH v4 6/6] arm: dts: mt7623: add display subsystem
 related device nodes
Date: Tue, 4 Aug 2020 19:40:16 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <3966b4f687f2fabf9041059dd5f39165177a6ef6.camel@infradead.org>
References: <20200804165555.75159-1-linux@fw-web.de>
 <20200804165555.75159-8-linux@fw-web.de>
 <3966b4f687f2fabf9041059dd5f39165177a6ef6.camel@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:cE3oyYRo7iHumadFLkcHlNNvUrLjo0Ue9IPpAdmst9Y1FT4tnAKLaXaNWUgBVzrY00Gxm
 9sEl45trA+gwdzPyqBA9uEG1EzcMTFkHajKljxhOoyiLziRoFgritPbipiZS241ElB28ug8hV2nd
 iN+CNpG5RX76zBM1e886lmE8QT3/J6eW0dacRzuWMCGkJIE5D+Qydg0vvjmhoOWF06bfreAhsJLa
 Ibb1cJwKgPCBBvv76uhqvjl51kNKqQIEafGEIOX2JOl83D2btgP0edCyiiCDI5ZfoIM2NwF2pAxh
 UA=
X-UI-Out-Filterresults: notjunk:1;V03:K0:vt70ifthSno=:7aBvSJ4cHShtukoqpqya+b
 jqkQg445TBJlwdMpcZMrOuVYr2f1xSOD+2I0jKcsaKU9oUpJhKt5qDLi3cMYKFD+ILa7bISev
 miuNSx16Fsi6jKm5gqG8nTWGh5rmHgZ2uaShiop2UCszl8GrX1HfYM93hcFS1XR4Vnwow+OYA
 ZKzSUWEIWJ3/1tO5MiFs8sT4JA69Tx5niAEOskzMgcv42FFVucbuWEeFenZrLIaFDkJdqNFnJ
 FNypNCdYdtgN8D/NgnVJweSijwRJk4wSvIFmKMC2QgLp9+6vL7MiAvtWQZmCcLpVlm6WnsS7x
 8C46fpsMwqY4eH4uUPLfhrB5LJAcsHwC+vH3T0nTXqE9auM+W7YN/OQM+tno7fPFs9LeyTw3u
 dCLvwHL7m2U0c2hjl75cYCpa+vt3ILot6r9qfAMXDvknkjM5iYtkAj42yCJ/+Tlo+VyvUEmjf
 y6SAjansKK7piBH0Lj7mHdaqNCl8Pw9ytrZs+coE8tXWj0aiPo8OOGwet87Em8JX0nawxD3wb
 nwWLKh3aEV+0orPdVEFrrBJX5uAJlYc1qxeUs+5TOMq4x0JsEoKSBEBfAwqQoYRDwc4lPi5u0
 cfg2JWiMs1NT0DV0utl0kBCvdoIEfRYyhwqskEWuTAdJV9oUayadq09mNPDsNb8Q3jjI+Y9D9
 VWXBcxCdKmlsdoOnTl1+m8V9IhWmQuPY0RDgTpgXpzP+/szSfGNoEyXQ/upDl4/fW8eg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_184148_932589_F59DF3A5 
X-CRM114-Status: GOOD (  13.44  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Dienstag, 04. August 2020 um 19:24 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>

> > +	mipi_tx0: mipi-dphy@10010000 {
> > +		compatible = "mediatek,mt7623-mipi-tx",
> > +			     "mediatek,mt2701-mipi-tx";
> > +		reg = <0 0x10010000 0 0x90>;
> > +		clocks = <&clk26m>;
> > +		clock-output-names = "mipi_tx0_pll";
> > +		#clock-cells = <0>;
> > +		#phy-cells = <0>;
> > +	};
>
> Doesn't this (and some others) also need status="disabled" since
> they're not present on MT7623A? Or maybe it's time to split mt7623.dtsi
> into a mt7623n.dtsi which includes mt7623a.dtsi and adds the extra
> components?

do you have a MT7623A board for testing? is there any list which components are existing on mt7623a? or should i disable all of them and re-enable them in bpi-r2 dts?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
