Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E35C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fClkhHu/p6gIm8tbpvFwCqGX3kXIMdqjiuDdSiYGEkk=; b=tl9d8kwqNDozi8VYQsivEfmU+V
	Sy9MrK1ciHmOsj97bX5n/N5WMMyoT3CiTrhD4wxesDOeY+nrnZkkv0+x60bP7G8QXerOTNX1oE6Jm
	GS2wB19vMknziZA1H4Op/b+TxVLAgikJJXQ8lDGvMSVlsgy7jGKNsTU7M8Ugk+6jk2jqjD28+yZxV
	i3Pic+76fBajK02X+SBD/0iFiHy3n/9Vr0ka5G4g4uYo0MchrruJb+tGcjHh6eZt005bIjTT6qHvR
	B8boVrWHbuJS4NxIRkGT6BBiuLn+wI47ITtF1DYoSsbVLxUWe/OarvvNNl9rWcnvYPsBUuiL0Z4wA
	HMPXnZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCVL-0099ng-38;
	Tue, 24 Oct 2023 08:11:11 +0000
Received: from mail.citycodes.pl ([158.255.215.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCVI-0099mW-2p
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 08:11:10 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id 8D21421588; Tue, 24 Oct 2023 10:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1698135067; bh=fClkhHu/p6gIm8tbpvFwCqGX3kXIMdqjiuDdSiYGEkk=;
	h=Date:From:To:Subject:From;
	b=LDKw3ayh4v021mTPq/LVY1ks2MEUdhvSAwZ/5wNUoIq8dApV3/JklnbIMSWMaGr3U
	 RCwoV/BrtU6e4jmQoJbZuoVasml7XjxCfFaIWYAJhoxaqbN1XdowjhFF2LfWuYmQHn
	 snI+N2MU64UtIMNv/gJXJpFK4MHyNT0ee19i0vIk1PpJxd4BCi/mJhX64LNy+Km1xh
	 9g8Wgagxb9tukp2nKXNuz36tlXG7/s9UrXGWSg3lzr0CholbnpOwk7ihtMCZT1ZEkf
	 xq4BXE2eLkpkAm56eOVmoK7spWM3GSc3Dwtpzl2q3EuB9ve/CTbru7D5LQDFmulZH5
	 eO7aoy4PjfxHQ==
Received: by mail.citycodes.pl for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 08:10:35 GMT
Message-ID: <20231024084500-0.1.8a.l88f.0.16gafj4jkd@citycodes.pl>
Date: Tue, 24 Oct 2023 08:10:35 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_011109_048045_D4B35321 
X-CRM114-Status: UNSURE (   0.74  )
X-CRM114-Notice: Please train this message.
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

Dzie=C5=84 dobry,

dostrzegam mo=C5=BCliwo=C5=9B=C4=87 wsp=C3=B3=C5=82pracy z Pa=C5=84stwa f=
irm=C4=85.

=C5=9Awiadczymy kompleksow=C4=85 obs=C5=82ug=C4=99 inwestycji w fotowolta=
ik=C4=99, kt=C3=B3ra obni=C5=BCa koszty energii elektrycznej.

Czy s=C4=85 Pa=C5=84stwo zainteresowani weryfikacj=C4=85 wst=C4=99pnych p=
ropozycji?


Pozdrawiam,
Kamil Lasek

