Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C374C28B30
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 09:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=; b=d1HLp5AS19ylzSc2KsTHF0dhPb
	LnQ2OPRWFJ4LeeqQdAAxp5bJOlrNPImO/zYBZyoaZUxQCoh9yezetlXHSy8zjctaGHYO2EMbarCTy
	iBp9x6Qb1rxEAUDhDE6Txaex+GAljhkWgTN9fqDSh7NFHetNGxquEevfm61OCyYca3JbZkxEfHZ34
	XS2tXJkuiGrZ7Dqb2N72JaEQNDDpHDg9fLxDfIqWYqi6wxmG2RK3f7EjaCXC1Q9mB0pkU4TZKXr3W
	dIWt3by4AWu9DiXP8pCmTtdN6bNYmTJ9JwbgY2IaogQcd3Z1KIpEB3yj+2ac3jSigCMq58rqIv7Ny
	C4IXgfGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZH7-000000023Mr-17DN;
	Mon, 10 Mar 2025 09:18:17 +0000
Received: from mail.commetro.pl ([217.61.16.142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trZCQ-000000022Ha-1MmU
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Mar 2025 09:13:27 +0000
Received: by mail.commetro.pl (Postfix, from userid 1002)
	id AA5E583C7E; Mon, 10 Mar 2025 10:01:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetro.pl; s=mail;
	t=1741597322; bh=COht1CALZmZz8MRkow5xVDQUyVzx29Nu6ozA/Y0jgb4=;
	h=Date:From:To:Subject:From;
	b=J7N3QhEYeSYw1UeLOxq04mfIyyBX2RjELjyLJjkUUzYfNxbhIhvDTVrKXTO8XjcJt
	 w5JNjtg5rrwIdFfai16hfdhOw3bqNWys+5vhDJQ884kVhQJzFJI4AX471bA5LlQJPe
	 Pw9LQpy+Xb7O9mPY1eDoGGCrXGM/mtGYFO/C6dc6I2iyGUKn8LAcUKj/W8vt7jrxgG
	 qLDyRhSDK7a+2D/nofbKTBQdJnqresm4SxUmjWLyvzLQXhg9FdV4sDD5G9uw36bfpp
	 1GEfScTxcmMg7xnLnbH9894PYYs+joBXJaOdEhDmStNtNpAE3D3fTuRqoeGjdR8H1c
	 mqh1mC/1PMNhg==
Received: by mail.commetro.pl for <linux-mediatek@lists.infradead.org>; Mon, 10 Mar 2025 09:01:01 GMT
Message-ID: <20250310084500-0.1.1a.fat6.0.20pm28gvqk@commetro.pl>
Date: Mon, 10 Mar 2025 09:01:01 GMT
From: =?UTF-8?Q?"Jaros=C5=82aw_Kownacki"?= <jaroslaw.kownacki@commetro.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_ofert=C4=99?=
X-Mailer: mail.commetro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_021326_492292_3013E4EB 
X-CRM114-Status: UNSURE (   1.87  )
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

