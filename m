Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B59C8303C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jul 2025 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFLqhBmGowcpiiQwNum256VPL08ZNDpLKbHxe0rNTSA=; b=a2o8XWWCT+yqyiYMI7vKy/ffDY
	l76fy6RYhcq3kQPWNvLOHTr/otIf+C5Fe7jTwDRIJin+nGaWJP/vtn/QDm16oeawy8OXMdwGiwDws
	IalUxNt5398NH1s6RJprygs04MaJFn8WUq513rTat3LHh3G2IJjaLqUPxR9UWWhiOGYB5B8z9SHTa
	zTdZMyvQaefmtnMlWt02uyRY2eiir5D01lhrL15ljEUZf7nUBBBIQnA288FFKYj6HYpEIXFxSlg0M
	/aiQt42+BuV5+pxU7mJqtQfrEzOMjeUv6bqCKiCZKcToS0IWNXCpVqEq8gmCXZ4cyKl76Q5R2Mjqe
	joEanDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Oz-00000004hfN-3h8g;
	Tue, 08 Jul 2025 08:10:09 +0000
Received: from mail.bizovo.pl ([217.61.16.222])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ3Ow-00000004hf0-3h4z
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Jul 2025 08:10:08 +0000
Received: by mail.bizovo.pl (Postfix, from userid 1002)
	id B123D862E8; Tue,  8 Jul 2025 09:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizovo.pl; s=mail;
	t=1751961386; bh=GFLqhBmGowcpiiQwNum256VPL08ZNDpLKbHxe0rNTSA=;
	h=Date:From:To:Subject:From;
	b=gWI6NlIQI5EhwmObmSxccwRG1davpO/z3C9dEIn9XmHmWLz5lp8SWRSSSMiQUEJLR
	 41R5dP6hiNu8qV81GbstWzozCauVa7oO+EoTTsY9Gng6VZPJ3CSfLW5QrTE/7qLs8d
	 fDu0UGeGy2VQX/4e8CmK0wesZzTyb8l5gVKK6sstEi8+Pf/n4EWo1lnKDPhZLbuRTm
	 kLcwr1ltbvneUAbPWRfhfZ0CT9ADCrm4fNF9zgVrCPx01HQbmUlx2HqTrkndGfvTdc
	 +ivt8L46QLTHFtBLvgmaWwXvdCuWNtG//eIWtu7AFxx/Ze0zztOht9TLkEfLXfUILI
	 t/Jtu9GeR2xAg==
Received: by mail.bizovo.pl for <linux-mediatek@lists.infradead.org>; Tue,  8 Jul 2025 07:55:28 GMT
Message-ID: <20250708084500-0.1.8u.1932w.0.mq3y8by1pe@bizovo.pl>
Date: Tue,  8 Jul 2025 07:55:28 GMT
From: "Wiktoria Bielaszka" <wiktoria.bielaszka@bizovo.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Zamro=C5=BCenie_ceny_energii?=
X-Mailer: mail.bizovo.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_011007_049241_23D6EE4A 
X-CRM114-Status: UNSURE (   0.94  )
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

czy planuj=C4=85 Pa=C5=84stwo optymalizacj=C4=99 koszt=C3=B3w energii ele=
ktrycznej w swojej firmie?

Chcieliby=C5=9Bmy przedstawi=C4=87 nasz=C4=85 ofert=C4=99 XPOT, kt=C3=B3r=
a mo=C5=BCe przynie=C5=9B=C4=87 znacz=C4=85ce oszcz=C4=99dno=C5=9Bci. Ju=C5=
=BC od teraz, mog=C4=85 Pa=C5=84stwo uzyska=C4=87 cen=C4=99 ni=C5=BCsz=C4=
=85 o 40,9% w stosunku do obecnej ceny ustawowej.=20

Nasza propozycja obejmuje lata 2025 i 2026, a start wsp=C3=B3=C5=82pracy =
jest mo=C5=BCliwy od zaraz. Gwarantujemy elastyczne warunki umowy (3-6-9-=
12 miesi=C4=99cy), zapewniaj=C4=85c minimum formalno=C5=9Bci.

Jeste=C5=9Bmy pionierem w sprzeda=C5=BCy energii w cenach RDN wed=C5=82ug=
 TGE dla ka=C5=BCdej grupy taryfowej. Przez ca=C5=82y okres trwania umowy=
 zapewniamy Pa=C5=84stwu dedykowanego opiekuna, a ca=C5=82y proces Zmiany=
 Sprzedawcy i wszelkie formalno=C5=9Bci realizujemy za Klient=C3=B3w. =20

Ch=C4=99tnie porozmawiam o tym, jak mo=C5=BCemy wsp=C3=B3lnie zrealizowa=C4=
=87 Pa=C5=84stwa cele energetyczne. Prosz=C4=99 o wiadomo=C5=9B=C4=87 w p=
rzypadku zainteresowania.=20


Z pozdrowieniami
Wiktoria Bielaszka

