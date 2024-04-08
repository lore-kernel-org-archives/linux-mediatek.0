Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EA9C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 07:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=; b=I0iyOBlgom3afXIH+j829fW5Dl
	jgs32Q9RC89WRl6WPF03sPwHh3deQ9fpYmlAjyjPkOohHjP5bT8c5m1641KZB4Q6E6qvGTq2CJE1u
	5CDQatwwkWE1U9EyomDo+hHNqN+GaeRNk9ZzKBODcl6V0H+i7sfr9lAdGd9OX48HYuOMTooCT8XpE
	PCcahp5WBXLicOTqXucp6mk47e0E2kJMiW4veRQ8FSg4Q06/gCMz9Lh2vdmKGQCcj7BMB2g16fS3Z
	PFq6SoG5ikYKqFGtPJVClrhsX6sf1tS3fWpckA/Dpt9hsU9NKIdZlH6w/lTw8dxMjNJzBglc1EIuJ
	emFgyWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjdj-0000000Ei1A-0zfa;
	Mon, 08 Apr 2024 07:42:03 +0000
Received: from mail.haughton.pl ([195.231.81.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjd6-0000000Ehf5-2itO
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Apr 2024 07:41:29 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id F06E182EDB; Mon,  8 Apr 2024 09:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1712562082; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=c3tlvi4Ry7eKMOeB6l3pe3LzsQALh/AJq8hfWVr/hLGtG9txuR2IW8JsMemNVSkge
	 frpOPmuEQFxFu6DsE+vjWlDzPbpTCphxiQvkdiZzpl0wqVDU8BSXKIaOCzrRNrh3Nq
	 M8gpeyNp1q1fXn54RkNTKkQ0sH0MS2flCIwD7UsAycjNMiPHWdW/M962xdZ1VUoFWr
	 LwgQUGQ+G68LaNaFCiuVTFTCoMtxnH2VAmQwaWY9KMukLFAaVt6qyzHtd5QsmT2slH
	 O0e/4fr6peramTD/jwtGvREyw+i7b8a3ByRiDVrrMOzQK/Pp+2b2E/YMnswR1ExkVC
	 f1kRcXdmTdGdw==
Received: by mail.haughton.pl for <linux-mediatek@lists.infradead.org>; Mon,  8 Apr 2024 07:41:15 GMT
Message-ID: <20240408084501-0.1.1h.id12.0.0dhnyf4jr9@haughton.pl>
Date: Mon,  8 Apr 2024 07:41:15 GMT
From: "Patryk Wysocki" <patryk.wysocki@haughton.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_004126_487750_F6888E20 
X-CRM114-Status: UNSURE (   0.38  )
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

Pozwoli=C5=82em sobie na kontakt, poniewa=C5=BC jestem zainteresowany wer=
yfikacj=C4=85 mo=C5=BCliwo=C5=9Bci nawi=C4=85zania wsp=C3=B3=C5=82pracy.

Wspieramy firmy w pozyskiwaniu nowych klient=C3=B3w biznesowych.

Czy mo=C5=BCemy porozmawia=C4=87 w celu przedstawienia szczeg=C3=B3=C5=82=
owych informacji?=20


Pozdrawiam
Patryk Wysocki

