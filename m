Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86932C3ABC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 May 2025 08:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=S2yg8ci/Yo31klWbpW5xUG1MlG
	ytecZsCNK6Uan63pML4eddTy4LDHqmYpOQWXvC5fK/t9fHEeG86oAePxVfrFAyizZ7qyIie0l5M1F
	5ia6DPjSUXWclIhFvUBkGAxuD0WVd2tDR6EKehA+Hd2OkfCm+8P4LGCvrmWDCqp/tQt+nolP+e9WD
	vAS2kgTAq3jeWuhkxuxkQDFOrketYCY3wVQfkHkbZRk+V5EOoYXqpOPO57qHw0cHjDfKyNeTZhQLJ
	p0BAH86GTu+gEh+IS6WwXYsTQGXbNtCc/owsZMS1r0/+5yWrIjicgYVhnqbPqeIdBnmbab8EhdAlJ
	YLDa1o3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkcO-0000000Biet-2fmU;
	Tue, 13 May 2025 08:04:04 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEkcL-0000000BidQ-0DA7
	for linux-mediatek@lists.infradead.org;
	Tue, 13 May 2025 08:04:03 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id A7463A4995; Tue, 13 May 2025 10:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1747123240; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=Y8n6SKHbetKWW/qCQm/rmnA1cPEY4jkrnspBLIizumsFISzNh1FFDaSgRKOU7Gqt9
	 UtbocUUe9FqnkAY+LK405I5A3sU1JTBPJz4OBPaV2wBDhI4IVWIVjdZhrltRhQG0Bv
	 z9JsR3RBdJlJVuCGJwHWD5pREatpvpVrjZcsreJxnSKuz+pkbbtzjcw5WNbrMN3byD
	 kWDX7QRE297PIbPwsbfe0lrQmQXqlOkWTvdFCi1Fc70UsL+QtHjLuxjFtjCYiyFZ+I
	 hDIvJSve87qbuaHUtuGYzi9z8yodfwgtGXbuCVZybKNk/RCZ3tU74SNUrrYuM77vd0
	 VMSQ5r6cCWw9A==
Received: by mail.novaplan.pl for <linux-mediatek@lists.infradead.org>; Tue, 13 May 2025 08:00:24 GMT
Message-ID: <20250513084500-0.1.li.1wfdx.0.ip106es90y@novaplan.pl>
Date: Tue, 13 May 2025 08:00:24 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_010401_778418_337F1C90 
X-CRM114-Status: UNSURE (   0.05  )
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


Z pozdrowieniami
Adrian Liszka

