Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23058C36010
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Apr 2025 08:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=; b=dvUC2diS3rq6rvyUiITZvHiCwZ
	K152cljJelpFTK1xMRwctG2n9hbcwW7O6IWoz75dKQELXc6gQgu6gwypLkjRiVSR1vefOsLM4vMHt
	zmJhCzmZbR1VTT9f0P9xHhl7OIuxd36tz6ktUYbqArqu732Jx20LzlNwcuxvvkWf6T4uAdYeWJ/2c
	t6FhJTY1hKQJo0Zk23z1FqZUSivbmxgpT631Ej/+NuSECjGk7ZXP8gFf2IxycGKeT/kvEUlgT7iap
	7Z69Bw8bKf7UFHI5WoFEMi9IHPNmpQ/spunFPWkTuC+Wta+A8zaBFjWOATNEb0KpNs4fchw9DlnRc
	PeF5/9qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39bI-0000000CziU-0Zfp;
	Fri, 11 Apr 2025 08:19:00 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39bE-0000000Czi6-0EkI
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Apr 2025 08:18:58 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id 0D437860B1; Fri, 11 Apr 2025 10:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1744358764; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=o3k+zVeVcpx8WA+CgVOsjsXwWyKBmE5DybmkjHEJBlCLsD6nzIPvWpSTlHMdtsu7J
	 zQELNYOXCgQ4JnlAXoPBJ3E62hjuk2KCEOAJBOTg8XLw6HLed4B5F9R06qOosR76/c
	 Vh+rcMfIAbyd341evSKV1bhnFchNpjNROdiQkTen4bswTuYhEkJCZKqRJAp2SzlJfs
	 YWbQ+UOKSMgySbxuXLcC3HULmcnFipdRkJB+P/gTiCBHiAC2oRvFJFdG8AKvir0TE8
	 RYGjbwUJcDKFHaeTle4PDrPFAEKxnIgElQSpi7XhO3e4FCotMjgzmkm+zqIgh+T//6
	 nXAuXXWcT3cBQ==
Received: by mail.commetro.pl for <linux-mediatek@lists.infradead.org>; Fri, 11 Apr 2025 08:05:47 GMT
Message-ID: <20250411084500-0.1.1y.mua4.0.f5b12rmad1@commetro.pl>
Date: Fri, 11 Apr 2025 08:05:47 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_011856_760929_6AA2C8B6 
X-CRM114-Status: UNSURE (   0.07  )
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

Czy potrzebuj=C4=85 Pa=C5=84stwo aktualnie nowych klient=C3=B3w ?

Skutecznie pomagamy rozpoczyna=C4=87 rozmowy handlowe z klientami zainter=
esowanymi Pa=C5=84stwa ofert=C4=85.

Zapraszam do kontaktu zwrotnego.


Pozdrawiam serdecznie
Jaros=C5=82aw Kownacki

