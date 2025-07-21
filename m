Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD22C87FC5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 08:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=DZXwYClbLLB8tqHbCTOwEmkVz8
	ClOeSdqZJdkAlDKCDas6EtT9T0U1mR+jqQIut/Lh+8YDS9LV4OSRFcT3N3v1zT9wAm9Lhnuf+NaV5
	a3EMUbac3ZnuLcQnh7G8LX5qGddDLSjlx4XTwgJm+mn7AyANNZjWF1b4u6CW3RZyGOOOlNTQYcR6q
	z09+n03zN8CV+JmhTpLzi50nufKPXjAvu6MUvENKNt/x/KhpBe8pZwnFdUwQ8xdYMk/jabobYHgYM
	Mxxs4TdpZxFdITpT2ifYsdqUhCB7GVRE5XG2p+kQNy2SbmEpedgPnvOm6FAHE53DKYck//rW8kjbQ
	wVC/ck7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udm7N-0000000GhAa-2IFA;
	Mon, 21 Jul 2025 08:43:29 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udljf-0000000Gcal-0Rha
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 08:19:01 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id E39044A962; Mon, 21 Jul 2025 10:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1753085810; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=BTPwGB9tqGDI6Ain5oARsyZC/nCgt88rbNrK8/MdTGazUB6R4AR7hnhRV+v+dy57J
	 zVazNwHDnPVBWh93E8EtBlpBs/nId7IJrP3dL/TFsDV9q3rO26V2a5EsAmib1+jloA
	 c6LF4Uq6egO+IuW+q3moJE2Pfa4/SeLUEMK+zqHSATTG4AwafhgYm7vrw/l0ybp7TP
	 Mxn3EOlKVpZBqhPM8ho72AvmO1c5VFw5+0m+T3hUFjmsAPCO64Cmgf90b5SLARLZCC
	 Gke/ywgATI8jju24ZBKBd/Hhw53YjlgPInRq5//MLQ+w92TnQWlvnfAUXK5WnThjON
	 fBYYJG9YPiPgg==
Received: by mail.fintara.pl for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 08:16:07 GMT
Message-ID: <20250721084500-0.1.as.2w0qb.0.5eg6m9f85h@fintara.pl>
Date: Mon, 21 Jul 2025 08:16:07 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_011859_822172_10D7D3C4 
X-CRM114-Status: UNSURE (   0.54  )
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

Czy jest mo=C5=BCliwo=C5=9B=C4=87 nawi=C4=85zania wsp=C3=B3=C5=82pracy z =
Pa=C5=84stwem?

Z ch=C4=99ci=C4=85 porozmawiam z osob=C4=85 zajmuj=C4=85c=C4=85 si=C4=99 =
dzia=C5=82aniami zwi=C4=85zanymi ze sprzeda=C5=BC=C4=85.

Pomagamy skutecznie pozyskiwa=C4=87 nowych klient=C3=B3w.

Zapraszam do kontaktu.


Pozdrawiam
Dominik Lotka

