Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98230C83F25
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jul 2025 07:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=; b=UF8QfOM34UCw8adNMsnudVOwwm
	y0n+vvJZSqDmsgmxuvtMr1Q8E6SgmHtqr/ojXN7wRuG+lPEOeywMFuElOHIB2KmzN0Vx6tjv/9BnW
	XnsjYRiQHA/Ca9FYYyDERSGyeN8etiAP5Pf2Yb9MImPNgioRP9qTQygT8w2QLZZsYYT7salg/v4SS
	qVydoqXK2NC1VMy1xgoqLSwMlOdkrRq2W+lmmBtRQfhzwQbu1osvfQtqQSdlJk8u0My9LTgUivxks
	O2RrHCltGmh6GPlfJW/ebBljGyUeq/OlQ8FkHBSqtWdGyU5cq0rweS9AGT1UQ8EzfncjTTd/PqNQL
	ORHImy/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7oO-00000001k2N-2Frj;
	Tue, 22 Jul 2025 07:53:20 +0000
Received: from mail.quantro.pl ([51.195.47.38])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7nH-00000001juV-2MFC
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Jul 2025 07:52:12 +0000
Received: by mail.quantro.pl (Postfix, from userid 1002)
	id AAE4425E3B; Tue, 22 Jul 2025 09:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quantro.pl; s=mail;
	t=1753170074; bh=nKFyL6kHGsUkO+q8agC+zR0Go57BP4LT86ehYkplXn0=;
	h=Date:From:To:Subject:From;
	b=jY4sZmjOKNEgPAO8n5B/cAHzoAcvGLWBaE6S20/cHgyPI9qLX8nFESjcimDFT50Bc
	 H6Qr00lP9AV6cbkfUQGPYGjd9TecOBLweOV5DJJytGY2LUY1QbVmPIG2IMba794fBz
	 SsbxXFbLFSMZKk3TA7Zg8bduFneXnKH+dmpobXaTdBxkDtwjNoJJW2XO2kAXokNgfz
	 RbpDxEwh8W0dsMrL3fTa2hBDwoZCgnLJw+wFiTTeozlBIW1l3RVewK2NFug2Vuxdko
	 I2SO9OGp9FMuXqoigUS2Ox2dLXc4xTBp/9OTE3YlgENKNh2T/YwyBc8AQEM12/ZYPp
	 YRdkftWDsVZkQ==
Received: by mail.quantro.pl for <linux-mediatek@lists.infradead.org>; Tue, 22 Jul 2025 07:41:04 GMT
Message-ID: <20250722084501-0.1.iw.5w1q1.0.e0o6027c6i@quantro.pl>
Date: Tue, 22 Jul 2025 07:41:04 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@quantro.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.quantro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_005211_746754_AD7929F8 
X-CRM114-Status: UNSURE (   0.28  )
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

Szanowni Pa=C5=84stwo,

czy zastanawiali si=C4=99 Pa=C5=84stwo, jak zwi=C4=99kszy=C4=87 zadowolen=
ie pracownik=C3=B3w i jednocze=C5=9Bnie zaoszcz=C4=99dzi=C4=87 na kosztac=
h zatrudnienia?=20

Obecnie jest mo=C5=BCliwo=C5=9B=C4=87 zwolnienia z op=C5=82at ZUS a=C5=BC=
 do 450 z=C5=82 miesi=C4=99cznie na ka=C5=BCdego pracownika poprzez dofin=
ansowanie posi=C5=82k=C3=B3w.=20

Za pomoc=C4=85 karty lunch pracownicy mog=C4=85 p=C5=82aci=C4=87 w restau=
racjach, zamawia=C4=87 jedzenie online, korzysta=C4=87 z cateringu czy ro=
bi=C4=87 zakupy spo=C5=BCywcze. To doskona=C5=82e narz=C4=99dzie motywacy=
jne, kt=C3=B3re tak=C5=BCe wyr=C3=B3=C5=BCnia firm=C4=99 na rynku pracy.

Ch=C4=99tnie opowiem wi=C4=99cej na ten temat, czy mogliby=C5=9Bmy porozm=
awia=C4=87 w najbli=C5=BCszym czasie?


Pozdrawiam
Ewelina Koprowska
Senior HR Manager

