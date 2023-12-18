Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC36C35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 08:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=; b=3a5MJbSOKj7nYQrKz8YtpAzKE7
	sYbact7Osw44WnIgG3/T8Wu8YJ/oNqe0EG9jHhlZutQSpBvECmqcqjJObK5arjd5XYQEWjsqbwQ57
	OJe0lmzFa1yTwh6JsgSEnarhMsUXMdFasEsL/hLwODeC8kc2T6WvmuHwbVzEAcyL6Y6gLGApkAs6S
	DXRLmrjgytFnR8NHyEozT0BTjOso6f0asNOzisej5DoTtbKZAv6+BR/8Exwm6MAa/tP2zJNyEyJMP
	L4toYESsS+V01k24Q5YjFGUQEUcfYY/x12fIIvWT8QmOk0bDtOO97+lXTL7e0sBht0f2NT+3IpL5t
	MvbnYx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9Mo-009Xhp-1E;
	Mon, 18 Dec 2023 08:52:50 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rF9Mm-009Xh9-0Y
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Dec 2023 08:52:49 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id E566783C33; Mon, 18 Dec 2023 09:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1702888978; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=AMOp33jkvhj4d7ctaV541t6Ysuu9per2d3DOalcrZTY9tocNvHAWFbZtlQaABP83p
	 i9wAW22NNZzKBDE2BgZUeEJnF0w1eD1l6nj2X0u+7VjRP0THCuwHvauUw7ltGD81qX
	 YpM7wHhHm05cB8QZEZYMiqt8GNqjYEgl2OJ7N5++ch+ljHvqTrPCzI0FFj7vJyVaZE
	 tKQmRJE1Ssk8L3oun5r4x1VjpdhJ4ICONHdsEDzukSGB9VBJkggWqea41GvcXOGhkG
	 bSSn9h6ge96vs70An7l6a5gQPhaASlTh89APVa/Ug+fC9RpiTzSMqMMBTqDDV7ooGZ
	 f3+j3HThe2WcA==
Received: by mail.quirkbyte.pl for <linux-mediatek@lists.infradead.org>; Mon, 18 Dec 2023 08:40:14 GMT
Message-ID: <20231218084500-0.1.8.1mc7.0.a08m7jchv7@quirkbyte.pl>
Date: Mon, 18 Dec 2023 08:40:14 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_005248_347497_B85E4DF6 
X-CRM114-Status: UNSURE (   1.42  )
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

