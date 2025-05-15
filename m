Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2666DC2D0CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3R0DPJde5QP/N/HQ5yaIUnWadGPDvaKYjHWsht6yKtM=; b=kOc6JTzuRWlwH6s0s0Q+kZp9h+
	FAX9SPvZrNLWf/10Ivslr0DDMtp+Y6Yt27XeLU3e3yyCLxg4CA2b3WBqYDRj3miKdN3KQrQtp7py2
	txu2NV/alYaO5r5rf744Gk91Qo2YOpaFjm0d1o1D9ciefS2h0x4Nq+ErqRuOPCSpat3uUe3FGhlkB
	KswVEBHqN/d7KdD1KgK0zEeT9cG0AEcSd3RNWUV2sudusK+N9lL6lpdhTuW63meJnUeXS7spxwPgU
	iE68/37nop+kyifyYfUKX8JpHGpTOP3MoaDlb/GLdLGDvI/bU3pAkVjC2DQuWFMwkCGUIOLkr6WnK
	NLmWfXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTq9-0000000HUu6-0IjG;
	Thu, 15 May 2025 08:21:17 +0000
Received: from mail.profinix.pl ([89.46.78.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTe1-0000000HSeH-35CU
	for linux-mediatek@lists.infradead.org;
	Thu, 15 May 2025 08:08:47 +0000
Received: by mail.profinix.pl (Postfix, from userid 1002)
	id AD55182D83; Thu, 15 May 2025 10:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profinix.pl; s=mail;
	t=1747296324; bh=3R0DPJde5QP/N/HQ5yaIUnWadGPDvaKYjHWsht6yKtM=;
	h=Date:From:To:Subject:From;
	b=dN80cqr0ryJy+V7SsKSlPe4oAlDlFa0VeskgWXh9DEhSokgECOOHrAP2jqSRvU5Or
	 asO7LZIME9ypqGvg2wMULef9YiuQtQyuR2ScvT+yZNHOlz3+5JTqnRqUSMZP8oRxLa
	 DPViCi7P4+xA4UC/H7KHTLf8pZfgySiylA9yMLvgB5dUjgnAbS/Jcb4v3y27ZizxQn
	 vLZfBmvNlMSeDjXZljf3c3/DV8R+wxe+Icil0+MupQ4i39ISLdIoV/T//kK0w7YLC/
	 Uj2EvldT4TVT/nTzeV/jnCoHU1ba0N0+VwcIj8EG1gLSCJH9TIr4yCHl0+Z1N9MCON
	 yz+cKhLqu1Kpg==
Received: by mail.profinix.pl for <linux-mediatek@lists.infradead.org>; Thu, 15 May 2025 08:05:22 GMT
Message-ID: <20250515084500-0.1.fl.5well.0.4qra8mvmj0@profinix.pl>
Date: Thu, 15 May 2025 08:05:22 GMT
From: "Filip Ostrowski" <filip.ostrowski@profinix.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Prezentacja
X-Mailer: mail.profinix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010846_462181_7300FB5E 
X-CRM114-Status: UNSURE (   0.04  )
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

