Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B0CC54FB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 May 2025 07:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X+wkoA4YOELW9s6cx2H1FfY99BwZ9fmdzIT3K0wvljE=; b=cTrynvAEzozl79P3+7pRoOUElK
	DbiH0QprccWpG28CHL5xBY/Mh1L8dfMnH/PzJwrKcJE0/G3aXkhWnIAMeMvy7dVO6yk5xh+nyhSLP
	MPYT6YLR2GD/5qvnElkG6FKv/8r+q3UCK4NJHmgBEWggNquRyORckhQ7W2AJD0oRiSU0mfyvWbbWT
	V5y34TgK7OxUgW6/lC0rU6Cx3z8UOnU2xLov+ZMrpaUgs4mHiaffdy+j2fTGb/wAPTNasAydu5hFv
	FYmb0w9oxPGbwlzy4MdjDjh27LItG2IziV/qM0EXmUZoSTrZ12EU/ATKTzqprufRt93+05N5F6INm
	KEpEwo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY5V-0000000FDFT-2fBk;
	Thu, 29 May 2025 07:54:05 +0000
Received: from mail.scalenook.pl ([51.91.253.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKY3s-0000000FD1W-0woE
	for linux-mediatek@lists.infradead.org;
	Thu, 29 May 2025 07:52:25 +0000
Received: by mail.scalenook.pl (Postfix, from userid 1002)
	id 1807D23220; Thu, 29 May 2025 09:51:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=scalenook.pl; s=mail;
	t=1748505105; bh=X+wkoA4YOELW9s6cx2H1FfY99BwZ9fmdzIT3K0wvljE=;
	h=Date:From:To:Subject:From;
	b=eUO3Ho3uB4LqHcv8KtW4TLEoQoOyQYTlyEVxBl8l/9+/NyQ7KIwIa895pQZSWATMe
	 pillD4v3I4RQlEUDOMD4ChoqI3kgCnbr/jakpsPHi+Xn56e50+5sD12wjBYUIfTBJT
	 ND2fVprDNF2LCqv6RLtAPrxuyQj81HTUK/X30d+iGipTFU7rOHLo7trU4OEVjUs9C3
	 Px+xw8Zs/KOGL+6ne+9/2g4eZnbbgJPXEcf1TtWtoEhpgeRG8H6oQlw7pWeQDuASfe
	 hs16ULwm4uf5PDQt14ZQ5oVbufsERrzw3lCnzKP3kNsD9nLVyxA7umwAHcWVN52JBa
	 RITcGHGPjUGlw==
Received: by mail.scalenook.pl for <linux-mediatek@lists.infradead.org>; Thu, 29 May 2025 07:51:03 GMT
Message-ID: <20250529084500-0.1.gx.2225i.0.7p5ld3dofe@scalenook.pl>
Date: Thu, 29 May 2025 07:51:03 GMT
From: "Renata Nowacka" <renata.nowacka@scalenook.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.scalenook.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_005224_416680_9A6B1D98 
X-CRM114-Status: UNSURE (   0.18  )
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

Dzie=C5=84 dobry,=20

chcia=C5=82abym wskaza=C4=87 Pa=C5=84stwu mo=C5=BCliwo=C5=9B=C4=87 zarz=C4=
=85dzania benefitami w =C5=82atwy spos=C3=B3b, poprzez nasze intuicyjne n=
arz=C4=99dzie, jakim jest karta lunchowa.=20

Nasze karty oferuj=C4=85 wygod=C4=99, oszcz=C4=99dno=C5=9Bci i zdrowe wyb=
ory =C5=BCywieniowe. Dofinansowanie posi=C5=82k=C3=B3w jest korzystne dla=
 obu stron. Karty lunch to dla pracodawcy realne oszcz=C4=99dno=C5=9Bci w=
 postaci zwolnienia z ZUS do 450 z=C5=82 miesi=C4=99cznie na pracownika.=20

Kart=C4=99 mo=C5=BCna do=C5=82adowa=C4=87 dowoln=C4=85 kwot=C4=85, a niew=
ykorzystane =C5=9Brodki nie przepadaj=C4=85, lecz przechodz=C4=85 na kole=
jny miesi=C4=85c.=20

Mog=C4=99 przedstawi=C4=87 ofert=C4=99, kt=C3=B3ra pozwoli zoptymalizowa=C4=
=87 koszty i zapewni=C4=87 pracownikom po=C5=BC=C4=85dany benefit?


Pozdrawiam
Renata Nowacka

