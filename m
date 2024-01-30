Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0297C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=; b=iNZN4HQF6C+AJtTCznMDwgBpAe
	T8Ghlty1oV0FI8GXCijEpRHUpT8GATPC/n9sCWeTg95hpZBUr545aZA7hbOHqoRazORUuJnOVnwG3
	ieZugNttKNdDrzDc2PM5GflJuLc4XPWL4h95GgDkri2YtWLnv/LAIvEaQFUOUjibTSAW3JnJtshln
	GnU8YCVO21tQrcvBq8IhzcAo013YOAcI85fPiop0B60m4AKkgO9K9at0Dtv5b6MOMOyLHhEYU5sxC
	XkL4NjTh3XSC25zfYG9pwT00HZsZcNdX+kn1EjzwA5LczDtDHV7svRHZLjju9QTQY90z4kzpxosmb
	Z8PaGmFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjiI-0000000Fkyc-29Fh;
	Tue, 30 Jan 2024 08:43:26 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjiD-0000000FkvA-3IXt
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 08:43:24 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 4FBF284EB2; Tue, 30 Jan 2024 09:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1706604115; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=adhe0bGM1EWdD6iX88TIw9xaoFHUmLbJdMbetYkll49fK9mKCyaI2CqVLFy28H6ri
	 qczMIxTmxpglIjKFQcYBjb25IyBU5denWTOWeA46JdRN3fEkHCMM5sp2ryEjLeWTSe
	 euKQHbnoXTdMZHIAeLxPKqlis5wQqZjahbPzW709HWsV0h0E9iYhAx678VQTjxaIjx
	 sUjSjtlbjlx8NxtlndzroLMNVXjgqlRsdjZ0DRNSY2xbEcGHBu19uKxbkPAXRVjL4d
	 AdByPNnooAzMeJVf93q63n+vlRxgRiGeS+RC89W8e7LwjF5zg730sHdRR+W2Bpr6z3
	 +Ns9FKk0gH98g==
Received: by mail.quirkbyte.pl for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 08:40:32 GMT
Message-ID: <20240130084500-0.1.z.ibp7.0.3nnhg67p4a@quirkbyte.pl>
Date: Tue, 30 Jan 2024 08:40:32 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_004322_591298_C41F3D1A 
X-CRM114-Status: UNSURE (   2.12  )
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

