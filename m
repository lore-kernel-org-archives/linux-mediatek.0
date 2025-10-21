Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6ECCCD184
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Oct 2025 07:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xZTLqM3E7aVDYIB/jnD5MiDi3FAIGgatFm751EDj2YQ=; b=fWZQ40dqjd5KzYK4Yd14CwolZM
	+q8oD79WJctsqL9NemCo41TTwtb/45JJKXdJYtA7f7e9BLZ4XwLNc1k5clOv51Z1pmqvc+YzNZU64
	7lm7Z5tqHxbokWJk5UtfNYwz8Bhj2gSxHdlAWAkz9PlZuNLDlppXh3K4Twe++luKL9xY8DI4YExYq
	Q+oj5Sp1AMdFKPDqFHFDHFiAHGyjayP3wL2ik1z4f0e9UTBPaf8mxrWAOmyleF3rXE9QVz/DF/ZE8
	4WXSVWasrqR5OcmsvOkGEAokT2lMXJXSg3JItfQ7i1qklWd8qLWt3BKaIOc7y63iQ1gLDW4Oz0Y4+
	jJebJcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB712-0000000G6e3-2rKs;
	Tue, 21 Oct 2025 07:42:44 +0000
Received: from mail.zynotix.com ([79.137.80.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB710-0000000G6dY-1QPo
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Oct 2025 07:42:43 +0000
Received: by mail.zynotix.com (Postfix, from userid 1002)
	id E8B362561D; Tue, 21 Oct 2025 09:41:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zynotix.com; s=mail;
	t=1761032483; bh=xZTLqM3E7aVDYIB/jnD5MiDi3FAIGgatFm751EDj2YQ=;
	h=Date:From:To:Subject:From;
	b=b5xzEeSUzMdtEX86b6Db9krVJgv3z4Ikz1AZI2fLo7ajXtq6Q5VD0wFI16rGiYKU0
	 bGpzuj1wpsvDfYs/zOv7+cfBHN2YD+WVsmIo+JbxOkpeBIBJKcPMzq0FGQf5rRcviq
	 FiPPRwCkzoAnpjBagNe/eUPEorKyKK9WjEio3g8/ypTrAZR6yYsUtOlDo/48k11bKJ
	 nN5GjXaSt0UiBU2qav8Z9dIajRrMcajEkP3DcW/1MNn9I+qlA4AN2EReKYEBs2GKRw
	 VVd/FWUkQOwyHB6FHnerYEaO66MeBctpUR4tuCKTTb9i61cZoGGU0PMeNcZ4NFUwoq
	 M9F+5tKfakwkg==
Received: by mail.zynotix.com for <linux-mediatek@lists.infradead.org>; Tue, 21 Oct 2025 07:40:46 GMT
Message-ID: <20251021084501-0.1.ck.ungu.0.kwo18bal1s@zynotix.com>
Date: Tue, 21 Oct 2025 07:40:46 GMT
From: =?UTF-8?Q?"Magdalena_Ko=C5=82adczyk"?= <magdalena.koladczyk@zynotix.com>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Informacja_z_ksi=C4=99gowo=C5=9Bci?=
X-Mailer: mail.zynotix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004242_671415_2DBE8720 
X-CRM114-Status: UNSURE (   0.17  )
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

prowadz=C4=99 biuro ksi=C4=99gowe, kt=C3=B3re specjalizuje si=C4=99 w obs=
=C5=82udze biznesu Pa=C5=84stwa formatu.

Wraz z zespo=C5=82em zapewniamy wsparcie, kt=C3=B3re wykracza daleko poza=
 samo przygotowanie rozlicze=C5=84 i procesowanie dokumentacji.

Redukujemy do minimum czas i =C5=9Brodki, jakie nasi Klienci przeznaczaj=C4=
=85 na obs=C5=82ug=C4=99 finansowo-ksi=C4=99gow=C4=85 i kadrowo-p=C5=82ac=
ow=C4=85.=20

Z racji mojego do=C5=9Bwiadczenia przy wsp=C3=B3=C5=82pracy z firmami o t=
akim rodzaju dzia=C5=82alno=C5=9Bci, chcia=C5=82abym przedstawi=C4=87 kil=
ka warto=C5=9Bciowych i sprawdzonych rozwi=C4=85za=C5=84.

Czy mo=C5=BCemy porozmawia=C4=87 o obs=C5=82udze Pa=C5=84stwa firmy?

Pozdrawiam
Magdalena Ko=C5=82adczyk

