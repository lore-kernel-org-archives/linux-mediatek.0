Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C58DC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 07:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9KGuIG62LgzC9aYmjKxzocuYLRCVghXg6v9Q1q2LHec=; b=qRitUBIVysSuNAzkJXFiayTuh3
	PxIepPoee02n7aQhthcSsZ/1YjYXAT/avL3ya+4dOLjnV30SW0dn9OB3CaEVNt60797K2mYZj8IWP
	FTONY3zl/3choc8iT7bQ03ly8lxMVySekffBA9d0NNt2F7+WesAsywQe2o0Vt2QcfLifAQhvutNi+
	AvCVOjXmKyVBLE9OaX9JcRWkv7G0k0s83Z3cQU8l3pOO06vCSglRvQa5JIKG/59SOhtwLksABOGzs
	6s/LK8GuM3mbl5v/HvCIEF8r3bMBmXLKhSbBsX+UsLAZozev/nT15ft6Y/EhQX56pdr/kcW+S9BTo
	QvLoLelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHKT4-002c59-L4; Fri, 29 Jul 2022 07:31:30 +0000
Received: from mail.coredeal.pl ([51.75.73.133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHKSx-002c0k-0i
	for linux-mediatek@lists.infradead.org; Fri, 29 Jul 2022 07:31:24 +0000
Received: by mail.coredeal.pl (Postfix, from userid 1002)
	id 5C4E2A89F7; Fri, 29 Jul 2022 07:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=coredeal.pl; s=mail;
	t=1659079875; bh=9KGuIG62LgzC9aYmjKxzocuYLRCVghXg6v9Q1q2LHec=;
	h=Date:From:To:Subject:From;
	b=Bjn14GQJrBPmbOLybVHy+WrAAqyDI8bizNyTAltwZBd4UHtCX3gG04kyT1BUznWG2
	 61/YHz096PENw4VJl5Gm4l50f1icwlYAHoS2JuNG/EI/E2rl3z645DzQnJAYe2wMnW
	 pbkrtNmdflxkSdnyEuHbJJHI4882C0mbmNUSrQE/bouXZyJlc21EbXHW/pcAOrsBZR
	 ctFq46QwkOduiECkt3m98SQJzRLe1Vh8u/qTvpEcAskUNgEiTSZq601nksQIhwezrk
	 /kYSBN7WtR35JlKg/sR0pjXC0b1QsZWSjLo/5qySIoO1uDyhmRsWurobyavmIPJOjy
	 +zb259l2DXY7A==
Received: by mail.coredeal.pl for <linux-mediatek@lists.infradead.org>; Fri, 29 Jul 2022 07:29:16 GMT
Message-ID: <20220729063000-0.1.4l.1812r.0.dehbef28jc@coredeal.pl>
Date: Fri, 29 Jul 2022 07:29:16 GMT
From: "Krzysztof Maj" <krzysztof.maj@coredeal.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Biznesowy angielski
X-Mailer: mail.coredeal.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_003123_251720_477D6F49 
X-CRM114-Status: UNSURE (   0.68  )
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

czy rozwa=C5=BCali Pa=C5=84stwo rozw=C3=B3j kwalifikacji j=C4=99zykowych =
swoich pracownik=C3=B3w?

Opracowali=C5=9Bmy kursy j=C4=99zykowe dla r=C3=B3=C5=BCnych bran=C5=BC, =
w kt=C3=B3rych koncentrujemy si=C4=99 na podniesieniu poziomu s=C5=82owni=
ctwa i jako=C5=9Bci komunikacji wykorzystuj=C4=85c autorsk=C4=85 metod=C4=
=99, stworzon=C4=85 specjalnie dla wymagaj=C4=85cego biznesu.=20

Niestandardowy kurs on-line, dopasowany do profilu firmy i obszar=C3=B3w =
=C5=9Bwiadczonych us=C5=82ug, w szybkim czasie przyniesie efekty, kt=C3=B3=
re zwi=C4=99ksz=C4=85 komfort i jako=C5=9B=C4=87 pracy, rozwijaj=C4=85c m=
o=C5=BCliwo=C5=9Bci biznesowe.=20

Zdalne szkolenie j=C4=99zykowe to m.in. zaj=C4=99cia z native speakerami,=
 kt=C3=B3re w szybkim czasie naucz=C4=85 pracownik=C3=B3w rozmawia=C4=87 =
za pomoc=C4=85 jasnego i zwi=C4=99z=C5=82ego j=C4=99zyka Business English=
=2E

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 wi=C4=99cej szczeg=C3=B3=C5=82=C3=B3=
w i opowiedzie=C4=87 jak dzia=C5=82amy?=20


Pozdrawiam
Krzysztof Maj

