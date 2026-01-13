Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC834D29DF2
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=; b=0CIeXOpY+QifcuosGNVfSNCv35
	HaZVAbMESXqeR4PjC3842glZQUaJLrvi57TPQhneBlzs1+LZJQRj1L+ZLTmo1UkjsfmFF+dzyMzvV
	dJ3ig0zSLsZPBt43W0ApypmONLTAwM+1fQeXzqeua23I3KAt2j5ZWB3u4v74cSJlq/dRebO4K8zN7
	wZSEfJ6PehGFjf4wh6RsqZHYSRhfmOp955U/SbZ5l7o3FYFpGE48xIZ29FBnNUlsPRpHywE8lsFhS
	wrcI5zDfUHvp8pLZGYPk8oBbWmcBD6iPnPYXVXhXK0wDR62PnV49JFaTZNPm5gQBGEF4XL+uVkL2z
	IrZvovcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaX8-00000006pay-0GxH;
	Tue, 13 Jan 2026 09:17:50 +0000
Received: from mail.venturex.pl ([141.95.86.206])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaX5-00000006pZP-0GH4
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 09:17:48 +0000
Received: by mail.venturex.pl (Postfix, from userid 1002)
	id C594D29B1F; Tue, 13 Jan 2026 10:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
	t=1768295861; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Date:From:To:Subject:From;
	b=H5clSeulJ9S2jKv2olcfXEYzlOVBrHmhn/j8Qtqa2J8eRJUCo2JeFASmTkab1nQEJ
	 m9TuVQKDzAZhGiIUUzqJzJdbFtbp9piwlVCRyaIGoIVEY8vp9SpAkGE2UxRcDVguzh
	 CSB5V2Qxl6C5EExWTUaNGZCRfpsoRcnyo7SHWPAMOUI2c5qngPAHj8khPkGeKTsXpL
	 US+NLlSxKo5oulY6OSVt7flFscm2aeC6J0JzK3f20TS9aCIPkJx65IpCbTNOBZUdrb
	 LHoooqPFbQFd2NZUSbcRFHTX4pl22REDC8nDMlol/sjy4Y6Tr8J2atyvr6RxIt/sj9
	 M+NWv94PEKSDg==
Received: by mail.venturex.pl for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 09:15:36 GMT
Message-ID: <20260113084501-0.1.c1.2a5lh.0.r5qn1j0q9w@venturex.pl>
Date: Tue, 13 Jan 2026 09:15:36 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rak"?= <mikolaj.rak@venturex.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fundacja Rodzina a optymalizacja podatkowa 
X-Mailer: mail.venturex.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_011747_256862_8C0BB629 
X-CRM114-Status: UNSURE (   1.54  )
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

czy byliby Pa=C5=84stwo zainteresowani rozmow=C4=85 o mo=C5=BCliwych rozw=
i=C4=85zaniach dla swojej firmy i rodziny?

Nowelizacja ustawy o Fundacjach Rodzinnych otwiera przed przedsi=C4=99bio=
rcami zupe=C5=82nie nowe mo=C5=BCliwo=C5=9Bci ochrony maj=C4=85tku i plan=
owania sukcesji. Fundacja Rodzinna pozwala oddzieli=C4=87 aktywa od ryzyk=
 biznesowych, prawnych i podatkowych, a jednocze=C5=9Bnie zachowa=C4=87 k=
ontrol=C4=99 nad swoim maj=C4=85tkiem i zadba=C4=87 o jego trwa=C5=82o=C5=
=9B=C4=87 dla kolejnych pokole=C5=84.

Co istotne, po up=C5=82ywie 10 lat od wniesienia aktyw=C3=B3w do fundacji=
, roszczenia o zachowek przestaj=C4=85 obowi=C4=85zywa=C4=87. Ustawodawca=
 przewidzia=C5=82 r=C3=B3wnie=C5=BC liczne zwolnienia podatkowe obejmuj=C4=
=85ce m.in. dochody z dzia=C5=82alno=C5=9Bci gospodarczej czy wynajem nie=
ruchomo=C5=9Bci.

B=C4=99d=C4=99 wdzi=C4=99czny za informacj=C4=99, czy chcieliby Pa=C5=84s=
two pozna=C4=87 mo=C5=BCliwo=C5=9B=C4=87 stworzenia Fundacji Rodzinnej?


Pozdrawiam
Miko=C5=82aj Rak

