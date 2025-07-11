Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF2DC8303C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jul 2025 07:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HDVkD9F9d0LNuXby99FgApyHr5MULFRdKL2PW8Qg/Vo=; b=o02IPOghuhHjaDQK980HP9bLGv
	5ZV+bE2URu36+QBziyvG/OvK8nF6+2+wNa3ykIOAYdqKuNZwE1UeAmLxBOH7em0bnODENm9bI3LTW
	Qw2Lr69NwcBnxgLg2eK80zHbtyJJpyWUXlB+uUQTuukkiAl5MGIjO9oHVvxUYBGLTU6DbW0zl6e4T
	p9L563KmdF2KEg1nwwUCO5vKXiiYLk/7qfAfJUIxr1B2cQ2KSR6d5/smCk7o31raPWMijWgEb+Rwe
	9wh5hT1yf/sfnKDX19kYYZR2X5d4/tff/OXq/dAT/n7VbKlR2Q+OmB7OChCDz/cUmBOfmnC+I8/S/
	opbzNV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8df-0000000E3Ax-0PdB;
	Fri, 11 Jul 2025 07:57:47 +0000
Received: from mail.capitalcraft.pl ([57.129.67.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Jq-0000000Dztk-2NOA
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Jul 2025 07:37:20 +0000
Received: by mail.capitalcraft.pl (Postfix, from userid 1002)
	id 8062623964; Fri, 11 Jul 2025 07:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=capitalcraft.pl;
	s=mail; t=1752219434;
	bh=HDVkD9F9d0LNuXby99FgApyHr5MULFRdKL2PW8Qg/Vo=;
	h=Date:From:To:Subject:From;
	b=ChDY9kK3f9Nxz4pabOlZl88G7iXhgqzr9oDw2SO9pPT1kHY+ERn+zoWGrAYXUe3Cs
	 I5rsbu60fKj+tleL5Cd6ZLTK/TkI14zb8yh43uPQQSKvLT9bqCNpBXNCyfaaaHzObm
	 qDPhLX+2f3DkqiCzfARBXkwsfntubR3fNgl+ramO+2iCvdGlbT8Y1jmbxfeS+gmwAh
	 TsHe8bkIW8h0fqUy1BQG3PuK4prHvOEQfu7R6ru3mAE4Dh4hopH6S8dUJfFUZxZCbT
	 2p0IgP7YpNo5mMiCxkpubWZ0MwdOtIWxr4YYd607I8blXXeI9SOz5KNMzTNkEZCS+N
	 9Jto+bldO8BoA==
Received: by mail.capitalcraft.pl for <linux-mediatek@lists.infradead.org>; Fri, 11 Jul 2025 07:35:14 GMT
Message-ID: <20250711064500-0.1.3d.glan.0.lxdf0b4ljf@capitalcraft.pl>
Date: Fri, 11 Jul 2025 07:35:14 GMT
From: "Karolina Dylkiewicz" <karolina.dylkiewicz@capitalcraft.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Ochrona pracodawcy - prawo pracy
X-Mailer: mail.capitalcraft.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_003719_291731_0CAC6350 
X-CRM114-Status: UNSURE (   1.36  )
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

Drodzy Przedsi=C4=99biorcy,

w praktyce prawa pracy granica mi=C4=99dzy formalno=C5=9Bciami a ryzykiem=
 potrafi by=C4=87 cienka =E2=80=93 a jeden nieprzemy=C5=9Blany zapis mo=C5=
=BCe mie=C4=87 kosztowne konsekwencje.

=C5=9Awiadcz=C4=99 sta=C5=82=C4=85 obs=C5=82ug=C4=99 prawn=C4=85 w zakres=
ie prawa pracy =E2=80=93 tak, by=C5=9B mia=C5=82 pewno=C5=9B=C4=87, =C5=BC=
e Twoje dzia=C5=82ania jako pracodawcy s=C4=85 bezpieczne i dobrze udokum=
entowane.=20

Dzia=C5=82am sprawnie, rzeczowo i bez nadmiaru formalno=C5=9Bci =E2=80=93=
 wi=C4=99kszo=C5=9B=C4=87 spraw rozwi=C4=85zujemy zanim urosn=C4=85 do ra=
ngi problemu.

Czy mog=C4=99 przedstawi=C4=87 pe=C5=82en zakres naszego wsparcia?


Pozdrawiam
Karolina Dylkiewicz

