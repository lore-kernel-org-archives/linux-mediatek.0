Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8429EC4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 21:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jmp8NDmF70Ond7FA1WBESOc2bUOBaGwvXYCpWDNLU18=; b=GPmJfE2OsyhENx
	On/6XCxxc+WVVLR2eAAY0D5fcwMwPLPUyrT4JOwqo0THRxsQs8Q9WrJ7YsKCWlhNLlfiX2rEjfKOv
	PatjPjUxcrXEk9S0PMZDuv/t+3JfA909WFwCozTtmWaTWipZXxCNxowSTznpn+pvxHzVarXTe/E50
	WDN3ii34AxLwkUBSPJWu7UmkSod46Q9q2hNywMbw+FY7Dvo5nw2bZOWcJYffyiBOi5j73x1j0qwL8
	SH9QI1yNZa1wPBnWI1byDVoe2qedwQptI0yYYk2OlBda7PuV4JwCPlSG9oP1IGBFevTP0lxS8MZGS
	JdL4Oy4oDy9zPZF6vo4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAHxK-00Gf51-TX; Tue, 27 Dec 2022 21:57:54 +0000
Received: from [59.16.217.6] (helo=savemail.savezone.co.kr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAHx6-00Gf2P-SJ
	for linux-mediatek@lists.infradead.org; Tue, 27 Dec 2022 21:57:52 +0000
Received: from savezone.co.kr (156.0.212.38) by savemail.savezone.co.kr
 (2002:3b10:d906::3b10:d906) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 28 Dec 2022 06:57:30 +0900
From: Jacques BOUCHEX <sqladmin@savezone.co.kr>
To: <linux-mediatek@lists.infradead.org>
Subject: Re : Bonjour,
Date: Tue, 27 Dec 2022 22:56:15 +0100
Message-ID: <20221227225615.417F609781D0B5CD@savezone.co.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: savemail.savezone.co.kr (2002:3b10:d906::3b10:d906) To
 savemail.savezone.co.kr (2002:3b10:d906::3b10:d906)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_135751_691014_D50CE829 
X-CRM114-Status: UNSURE (  -1.95  )
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
Reply-To: jacques_bouchex@yahoo.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Bonjour,
D=C3=A9sol=C3=A9 pour cette fa=C3=A7on de vous contacter, je viens de voir =
votre=20
profil et j'ai pens=C3=A9 que vous =C3=A9tiez la personne dont j'avais=20
besoin. En bref, je m'appelle Jacques BOUCHEX, d'origine=20
fran=C3=A7aise. Je suis atteint d'une maladie grave qui me condamne =C3=A0=
=20
une mort certaine, un cancer du cerveau, et je dispose d'une=20
somme de vingt-cinq millions cinq cent mille euros (25.500.000=20
euros) que je souhaite remettre =C3=A0 un tiers fiable et honn=C3=AAte pour=
=20
son bon usage. J'ai une entreprise qui importe de l'huile rouge=20
en France et dans d'autres pays. J'ai perdu ma femme et deux=20
adorables enfants il y a 10 ans dans un malheureux accident de la=20
route. J'aimerais faire don de cette somme avant de mourir car=20
mes jours sont compt=C3=A9s. Veuillez m'envoyer un courriel =C3=A0=20
l'adresse suivante : jacques_bouchex@yahoo.com Que le Seigneur=20
vous b=C3=A9nisse.

