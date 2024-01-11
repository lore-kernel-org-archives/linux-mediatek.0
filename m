Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9404C4707B
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 08:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=; b=flLIC6PcgDvxKUtCVsmxRAdbdS
	vNh5I5cBI8695cRrBwlyiQC0Rv1kpLt1NtWoYg1CZSGX3WFdvLQC0Hc6bVY4IxcHZlOPFdcCxbdLP
	SvMbELzQ1D/7Hx3s9iD0HSgqU5yAXTjWEZtrACZrmg2THqQWBUrZrfVIJd2aHsckVW16CN9SP++Q5
	CfS6CecdFF9yCUwvwJB+G4kbE4CiIbzUaR6onEKmblWzgWqjEpPlBe7EclsxmZHKWvIjRsim6x++L
	MJz49QDgB4fj3ZHBPdvSwqvV0Uk73NrEaEYptpYYr8i24S9mKcqsu+r/nAA5GGnkhDPYBC1Kfu+Zw
	J6C5zbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqZM-00GYhm-2b;
	Thu, 11 Jan 2024 08:37:44 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNqZG-00GYg6-34
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jan 2024 08:37:40 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 20B68840FB; Thu, 11 Jan 2024 09:35:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1704962247; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=WhIJ/40gHJefSyAOa1rPlawdFxs0RBoHcGpRNdfj+eL5vQwgWYRcQu5fbWOn1fscV
	 Svh/G8YXBETnzmtrRYuINOOWP7VfgOqMKxsZgvSKlN0XXT4ohVI7E5XtE57LnqFelW
	 4Ufa4wjkPDpBUuH0a70Ju2PCHALnDF5SQXNr5c3rD7XWCcwP1efpJWzSLIuIzw9RfR
	 00B3eYP1ifSMtSug8gKwgLwFTbMBWeKvpdrUZ4CgMvKAm30SOkAPMMN3/fdqtFUYZ2
	 QBq2bv4RxLRDDIn5NY2p+UipcnS3LA7ixuu3xII8uGet3qI0l5urP9/oS+KX2GUh8f
	 Zk9PTD0e3sekw==
Received: by mail.quirkbyte.pl for <linux-mediatek@lists.infradead.org>; Thu, 11 Jan 2024 08:35:27 GMT
Message-ID: <20240111084501-0.1.m.acdh.0.p1xu0b3w7t@quirkbyte.pl>
Date: Thu, 11 Jan 2024 08:35:27 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_003739_128504_070A3F07 
X-CRM114-Status: UNSURE (   1.69  )
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
=20
Czy rozwa=C5=BCali Pa=C5=84stwo monta=C5=BC systemu fotowoltaicznego?
=20
Instalacja fotowoltaiczna jest najlepszym sposobem na obni=C5=BCenie wyso=
ko=C5=9Bci rachunk=C3=B3w za pr=C4=85d (pozostaj=C4=85 tylko op=C5=82aty =
sta=C5=82e) i zabezpieczenie si=C4=99 przed rosn=C4=85cymi cenami energii=
 elektrycznej. Jest to w pe=C5=82ni odnawialne i bezemisyjne =C5=BAr=C3=B3=
d=C5=82o energii, dzi=C4=99ki czemu przyczyniamy si=C4=99 do ochrony =C5=9B=
rodowiska naturalnego.
=20
Dzia=C5=82amy od wielu lat na rynku energetycznym. Przygotujemy projekt, =
wycen=C4=99 oraz kompleksowo wykonamy i zg=C5=82osimy realizacj=C4=99 do =
zak=C5=82adu energetycznego.=20
=20
Czy chc=C4=85 Pa=C5=84stwo pozna=C4=87 nasz=C4=85 propozycj=C4=99? =20


Pozdrawiam
Norbert Karecki

