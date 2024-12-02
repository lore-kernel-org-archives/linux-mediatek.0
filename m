Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE3ED10DC0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2024 09:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4SsVKfavNtEL8KiAyuhM0WdCxWV7dwsn0eOpgkwr5fY=; b=HPmNBLH55iZpCn5GUZ47SWw8LS
	bFrWdkWaakTFRMzres5W/Np/US7BST2ZxFOpPMjFOYO9rYqHo8ZPtppuowyZeyNCRZvQ1Oh0IFkug
	NEFCjW8upUIqduNYUS7Fwc3W5c5E1eR4NQChyts3OUfpy6uJmuet4saF5+2MiJ58MSET3DfWAPP7Z
	Ca7Km2istgfOgtpXvFVj4VRMzblUvOvj+gMrJ68abiWhtH5A2DGIBVoBhA9Q3uYunSw1JUlJvlFKK
	GIyTz59dCijve8AM2uiKgayPlzJtZX11yyE02Y4kCfqK+QS5vFuf7Mc7WE1Z6ROd+juHDFML7QtUm
	XVn92D9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2IA-00000005Ua9-0Rdi;
	Mon, 02 Dec 2024 09:00:30 +0000
Received: from mail.finteras.pl ([5.249.155.118])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2I8-00000005UZH-01fT
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Dec 2024 09:00:29 +0000
Received: by mail.finteras.pl (Postfix, from userid 1002)
	id 90A1F82D3E; Mon,  2 Dec 2024 10:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=finteras.pl; s=mail;
	t=1733130026; bh=4SsVKfavNtEL8KiAyuhM0WdCxWV7dwsn0eOpgkwr5fY=;
	h=Date:From:To:Subject:From;
	b=bGB4V8SWTwq31xI+I+NKfJwIbv5Ak7/OnZi1sN2hpVV9boQSX/NKGNVjZNDdB6DeK
	 g4IFtpdSdy1Ea3BkrSTQu9WqFejzit142vATRDyZsIeRjznJXS9iP+T/b52EiKHMRz
	 fhWZs6TU/xm3yX1oN7HWhSsW/BpcuUiPvRfjv6RQA/S/RFuplsr6L2qZPd2zj0N5oI
	 q0FKm44iFRw4P5Uywv409ND4KO9YNa5gLpg3CR4j7Qgfv/MOeQ6U3UFc0mMpGOV+3J
	 GKHshIA1UZRWXBdXOFk7JbGya6G4I6XBAF7XbVIe6HlQaj+xFLEdCBx+Xspv5X++Rl
	 +2Orv//cvyWhA==
Received: by mail.finteras.pl for <linux-mediatek@lists.infradead.org>; Mon,  2 Dec 2024 09:00:12 GMT
Message-ID: <20241202084500-0.1.57.6r1b.0.64e934r8r2@finteras.pl>
Date: Mon,  2 Dec 2024 09:00:12 GMT
From: "Urszula Kurach" <urszula.kurach@finteras.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Pakiety_telemedyczne_dla_pracownik=C3=B3w?=
X-Mailer: mail.finteras.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_010028_188779_A30B63A5 
X-CRM114-Status: UNSURE (   1.46  )
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

chcia=C5=82abym zapyta=C4=87, czy byliby Pa=C5=84stwo zainteresowani dost=
=C4=99pem do nielimitowanej opieki telemedycznej pediatry, ortopedy, neur=
ologa oraz lekarzy wielu innych specjalizacji?

Oferujemy 3 r=C3=B3=C5=BCne pakiety, kt=C3=B3re zapewniaj=C4=85 dost=C4=99=
p do us=C5=82ug dopasowanych do potrzeb Pa=C5=84stwa firmy. Pakiet podsta=
wowy daje mo=C5=BCliwo=C5=9B=C4=87 korzystania z konsultacji internisty n=
awet w weekendy i =C5=9Bwi=C4=99ta, natomiast pakiet pe=C5=82ny obejmuje =
dost=C4=99p do lekarzy 42 specjalizacji, a tak=C5=BCe atrakcyjne rabaty n=
a badania laboratoryjne i diagnostyk=C4=99 obrazow=C4=85.

Dzi=C4=99ki takim rozwi=C4=85zaniom, Pa=C5=84stwa pracownicy zyskaj=C4=85=
 warto=C5=9Bciowy benefit pozap=C5=82acowy, a firma zyska zmotywowany zes=
p=C3=B3=C5=82, mniej absencji chorobowych i dodatkowe oszcz=C4=99dno=C5=9B=
ci.

Czy mog=C4=99 przedstawi=C4=87 wi=C4=99cej szczeg=C3=B3=C5=82=C3=B3w na t=
emat dost=C4=99pnych pakiet=C3=B3w?


Pozdrawiam
Urszula Kurach

