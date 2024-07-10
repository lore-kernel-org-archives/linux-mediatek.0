Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6458C38150
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 07:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=; b=1uMKvUKH0RIEXL+BUJqHyjVbZF
	IW8lqv8KCpIhSXpVPXWnuiULPf+KW6E0hmDorQG1et1hvmzBny4l/ZUOvHtwQLrYUTpsH7jacIFHk
	vyQFLPJilmIsgYVC7jdwkI3i+YYe3Ad2R7mI5N1aTsJfXA2Gl82Lb2qVx+gVBjCLPVxwuRMsCE1vY
	06uG4JXf5GPbD2Qjr/zB2hRK/a2qNgMMAIdO6MLsyDlfFGJQGVhIiF7dE9DlxSX0iCXKlCCd97lkp
	CM0Gg8zTwW/A9c+btRqBWTZMCCDzPX472wMUTzmgOG5qXNIQyIUwPw1DMneRORjBdPAM+uHf1Z7y8
	HbNjCeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSEI-00000009ob0-27Ag;
	Wed, 10 Jul 2024 07:59:10 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSEE-00000009oZ1-3ZBN
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jul 2024 07:59:08 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 18D688A84D; Wed, 10 Jul 2024 09:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1720598243; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=NZJP2owSra1baFwpMeEdgBaxAvG2dR+aZVKXbhUHd4vKRXEzjuLfQl8a2SaR/asrv
	 qq93klAHEbUZh6UeiDPWlzowCoATOXSRtWTBRGM0Z/FmlkWSIobnKgRcwelgNOlvSw
	 DJ5bGpXNv994o62n5zEavkxqY6x8+5e68LApTbn9QShJyRL3e4Uhd+9pxAnbD/J4jt
	 4HTvKwUheGl8RMZbBoxeFIxc4OdjiIE9XTs99Y7o/PJV/dlrxEVGIaRc3YF/x4I17W
	 SABFbiHzBkrbpddwB1bqqm0ezWcuEvujP+BNniecT2t/h7p/wz+mxOFjBBMzI+maeV
	 w7VQ9qTt6Bm5Q==
Received: by mail.quirkbyte.pl for <linux-mediatek@lists.infradead.org>; Wed, 10 Jul 2024 07:56:25 GMT
Message-ID: <20240710084500-0.1.43.2ck0w.0.esjf02cund@quirkbyte.pl>
Date: Wed, 10 Jul 2024 07:56:25 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_005907_085586_D9DEE743 
X-CRM114-Status: UNSURE (   1.09  )
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
=20
Czy rozwa=C5=BCali Pa=C5=84stwo monta=C5=BC systemu fotowoltaicznego?
=20
Instalacja fotowoltaiczna jest najlepszym sposobem na obni=C5=BCenie wyso=
ko=C5=9Bci rachunk=C3=B3w za pr=C4=85d (pozostaj=C4=85 tylko op=C5=82aty =
sta=C5=82e) i zabezpieczenie si=C4=99 przed rosn=C4=85cymi cenami energii=
 elektrycznej. Jest to w pe=C5=82ni odnawialne i bezemisyjne =C5=BAr=C3=B3=
d=C5=82o energii, dzi=C4=99ki czemu przyczyniamy si=C4=99 do ochrony =C5=9B=
rodowiska naturalnego.
=20
Dzia=C5=82amy od wielu lat na rynku energetycznym. Przygotujemy projekt, =
wycen=C4=99 oraz kompleksowo wykonamy i zg=C5=82osimy realizacj=C4=99 do =
zak=C5=82adu energetycznego.=20
=20
Czy chc=C4=85 Pa=C5=84stwo pozna=C4=87 nasz=C4=85 propozycj=C4=99? =20


Pozdrawiam
Norbert Karecki

