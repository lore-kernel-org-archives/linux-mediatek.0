Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB236C5B543
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 08:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=lH25DWdXM3oMVsy59ByJf6LsiF
	S/+PkUI8/EFDMUMeKWTVY9c56Ce3sYP1Zyghty9mC6AKsWRYWocR1ao3LUPHd6LDYEwhrCNbd4ubc
	5Vx3h3hCvJj8dXhl2wP5NgUAX2uDf8Iy6N8fKgog5WEnLYgcjfq4yOsjn3erQ93xDkXRW+zbKN1wT
	r5+AkxYovlpZO3y8d4a87C7ydb2fBmsWLfjJUoTmRkp42fzlV1uq7dbk2VDCrt9YfDVVyxjRbD6Zh
	40g4x37klBwrvnpb7nOc2GBxqe8WDgiJxZdJCAPNxNhPiD8OzprpJANNM4kNXmNIQMeqMJf4qcl//
	expkOpKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtvH-0000000667j-0t7I;
	Tue, 10 Jun 2025 08:01:31 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOtqQ-000000065W9-3vT9
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 07:56:32 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id A4BB54A04D; Tue, 10 Jun 2025 09:55:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1749542185; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=SfqsE6/6F6nEySC3z9b+SrnhpqJNW7RuowRASFn6GrRkcQQIHwoLAfyKKnCbip+PF
	 e9LnBgnL1/nd7bqvS9ChVLoFhpNqVnYu5GJg1LWL8zdnrAAo95CR3AtnxZNOpsyCpI
	 KgWyJ5w3RfbxrwP4EcdvBC+oFyhx4Ktex0JJ0O1xiaEqflMCT5O9xEiRorJuyAIn6G
	 bE7zpyZ9EDUU0R0Mi3A8WZpIsniIvWdX6Vzd8YFswbB0KMJjMppcFOMgCDqAz24tRi
	 bqWpNj/BDUeYFFsy4JLkWPKHM01UGL0qCETLBNoWt0RETpDfoUorxgNl5vR+B5hUwT
	 tD4uLj6s1qkOQ==
Received: by mail.fintara.pl for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 07:55:17 GMT
Message-ID: <20250610084500-0.1.a0.2iy26.0.je2ila4n4r@fintara.pl>
Date: Tue, 10 Jun 2025 07:55:17 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_005631_653782_1EEEDD4C 
X-CRM114-Status: UNSURE (   0.45  )
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

Czy jest mo=C5=BCliwo=C5=9B=C4=87 nawi=C4=85zania wsp=C3=B3=C5=82pracy z =
Pa=C5=84stwem?

Z ch=C4=99ci=C4=85 porozmawiam z osob=C4=85 zajmuj=C4=85c=C4=85 si=C4=99 =
dzia=C5=82aniami zwi=C4=85zanymi ze sprzeda=C5=BC=C4=85.

Pomagamy skutecznie pozyskiwa=C4=87 nowych klient=C3=B3w.

Zapraszam do kontaktu.


Pozdrawiam
Dominik Lotka

