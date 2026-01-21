Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ACFC44501
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jan 2026 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q8rYVmzeb0BIhBpMFUreKtfVcFEbEBQ1myveAe1Z1DY=; b=FVUwRRrySrsL+ZnSfVJKBFp9Rb
	lodceoeMA3/95Dy/Z08Bj2e0jAxA1YjRJ5fs+60MYLt3TbbAUNHQcAaIeHbKlFQEEfnDdkw8RgfC/
	OKi/O/V7snGSTYCrXBS9OwDj6rusES1dn75rHvu0UrhwdwR7aFLu9iSCz+ZZXosB2zgliL3dPiCKT
	wlAH0YLGJqj3mMFK9AQyVdlOPNOK7iWI4e4zJqIK4u4m9PYIzy3vsevx2CFVFsHrIirNmT+u5r3vE
	+0c1hiQslpTwI4mPQoQdG0JM7tkiyX3hHrlI9cP1iHEvK1ETdGCi+jYpFO60NLmKph4TTjxSn44t6
	uxGbxpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUKP-00000005Aa5-1UUZ;
	Wed, 21 Jan 2026 09:16:41 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viUKN-00000005AYv-0U4J
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Jan 2026 09:16:40 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id E661FA63B2; Wed, 21 Jan 2026 10:11:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1768986761; bh=Q8rYVmzeb0BIhBpMFUreKtfVcFEbEBQ1myveAe1Z1DY=;
	h=Date:From:To:Subject:From;
	b=hzmIrf21ZeGBPAJHBRXv4Qb4XRZW3+97V4bNJUOC4VrFnwQafB28XLvbn+2SvMF09
	 Hazlgm7UKbLkAG+U3+vqPk83RxDnxpPOmV0hE6oB0n/X4I35MFXrRaeFiXoZClRWDp
	 RGgHeaZmQrX55AcRbyaFSVq26kQuh91FpgYBAWeDWxXWTYh4Ti8RAFBe8VcIMw4WwB
	 Q0epy/hgtV8Jge5HzdrgeEjL5zr2s91e/q904N25lV7BuKymqF+1xOF++sPpfBSSRv
	 WRvYZ6qk8B256clvIT/u//LTZ0GcaJ7UsVsgnOH9xi6SHgu1nuQwPMKh00S97WMb/j
	 6ppVhyGCLEheQ==
Received: by mail.vexro.pl for <linux-mediatek@lists.infradead.org>; Wed, 21 Jan 2026 09:10:50 GMT
Message-ID: <20260121084500-0.1.pt.4z2gd.0.d2nue21284@vexro.pl>
Date: Wed, 21 Jan 2026 09:10:50 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_011639_294032_A9926B66 
X-CRM114-Status: UNSURE (   1.71  )
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

zajmujemy si=C4=99 wdra=C5=BCaniem systemu, kt=C3=B3ry zapewnia pe=C5=82n=
y nadz=C3=B3r nad pojazdami w czasie rzeczywistym, usprawnia planowanie t=
ras i redukuje koszty operacyjne.

Platforma automatycznie generuje raporty, wysy=C5=82a powiadomienia o sta=
nie technicznym aut i dostarcza danych wspieraj=C4=85cych decyzje zarz=C4=
=85dcze.

Czy byliby Pa=C5=84stwo zainteresowani kr=C3=B3tk=C4=85 prezentacj=C4=85 =
lub bezp=C5=82atnym testem systemu?


Pozdrawiam
Adam Drzewiecki

