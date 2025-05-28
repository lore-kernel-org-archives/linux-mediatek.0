Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9A5C3ABB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3R0DPJde5QP/N/HQ5yaIUnWadGPDvaKYjHWsht6yKtM=; b=q/NfspC7YiSUYzPsblOURlcT0O
	LrZOzYK7uMT2i6kCe4pPsNdphuK7pVdvCGOqXRk3A9wBrJBUGxIVwSke9zlXwafRY5jB+7KQ3K1Lk
	X3glt0XBRQOJ08W2TcWsmUeNqMjmcbQrBHvL9FA8USwbCpWFLugWliWCygPAffUOWGhChpy4HRIMf
	W2bJf0hpiPOjgt6B1PVCA7OAko6SSb8XRc4+XHa1xR/7TphfXP4a1m3wOsrE2uSTFMWJB8dKuyerT
	I+1JQGCi00tokNehrS/l9E0Pd1Q4+jfsEqgnUXVdktp/So4t6Aw3DaE+/jDpC2y2eg8yQvlDaccuH
	H5T29QMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBMP-0000000CS6s-1PrQ;
	Wed, 28 May 2025 07:38:01 +0000
Received: from mail.profinix.pl ([89.46.78.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBLN-0000000CS0n-1t3K
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 07:36:59 +0000
Received: by mail.profinix.pl (Postfix, from userid 1002)
	id CD38C83ADE; Wed, 28 May 2025 09:36:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profinix.pl; s=mail;
	t=1748417811; bh=3R0DPJde5QP/N/HQ5yaIUnWadGPDvaKYjHWsht6yKtM=;
	h=Date:From:To:Subject:From;
	b=D4LkoBLgYgTKJvS0aN1o1F6qLIGaFVsiraN+JEPOcc6I5ontA2vCX1phYR6kk3k7d
	 ygOmUqijjAcF0pvP4D2t+qWv0XgCVvGJ+2rcqH/D30I1HKfW2VUKiRmfsPUkByZ03y
	 PXEGQYjwoOhyB4dIN9raNuiE6o92o3p962YKdBvlbbNoTvV9wjxlFXYxpOgMcjPNnC
	 5hggFPJDGLtyB4NTbPv/DKam+RkQCCh2UTss4aXZu0yYTehThu/1KZd6wN3t6nFYRm
	 dJtTNf8Rjk4AfAZusPQ2FTo0tigXhEBSu4n1hpH9DAO+4A8U7b7K0F3iE6xZg7m9dN
	 SZvq652tx/e1A==
Received: by mail.profinix.pl for <linux-mediatek@lists.infradead.org>; Wed, 28 May 2025 07:36:07 GMT
Message-ID: <20250528084500-0.1.fu.5well.0.c62gh3n3nb@profinix.pl>
Date: Wed, 28 May 2025 07:36:07 GMT
From: "Filip Ostrowski" <filip.ostrowski@profinix.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.profinix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_003658_181068_FC47618F 
X-CRM114-Status: UNSURE (   0.24  )
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

Dzie=C5=84 dobry!

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re umo=C5=
=BCliwia monitoring ka=C5=BCdego auta w czasie rzeczywistym w tym jego po=
zycj=C4=99, zu=C5=BCycie paliwa i przebieg?

Dodatkowo nasze narz=C4=99dzie minimalizuje koszty utrzymania samochod=C3=
=B3w, skraca czas przejazd=C3=B3w, a tak=C5=BCe umo=C5=BCliwia tworzenie =
planu tras czy dostaw.

Z naszej wiedzy i do=C5=9Bwiadczenia korzysta ju=C5=BC ponad 49 tys. Klie=
nt=C3=B3w. Monitorujemy 809 000 pojazd=C3=B3w na ca=C5=82ym =C5=9Bwiecie,=
 co jest nasz=C4=85 najlepsz=C4=85 wizyt=C3=B3wk=C4=85.

Bardzo prosz=C4=99 o e-maila zwrotnego, je=C5=9Bli mogliby=C5=9Bmy wsp=C3=
=B3lnie om=C3=B3wi=C4=87 potencja=C5=82 wykorzystania takiego rozwi=C4=85=
zania w Pa=C5=84stwa firmie.


Pozdrawiam
Filip Ostrowski

