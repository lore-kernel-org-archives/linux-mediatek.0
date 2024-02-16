Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AA2C48BEB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 08:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=; b=Tx/9o2heNYiZlGFNzs4qlPJdyt
	MzLjKPGd1DBJxF2Ecsgt6zqSJsZPBcdImI1xe7FnFDUTebzSEtdIQgjZVUjoP8ithjLtn9khhIwG5
	1Ng41RTd8kZRUx+TbBIIOCztvfn2Rreh4v0Iq+KvUpcflpuyWNEdqgX8q2kp0R9UcWGYtjti7ra1y
	D8+TfuJo08fHMWgTh65stTY3zy4XBqXYL4Tdo9D2cJ6yn9ttdREl+IQzYIkrF5vye7DXCZQMX0rHC
	GWkgVjEHUZVhF25o8u6/gTHzIARWRXRTfgOxOfuXMuCk4ZTn+jnQ9UW8X3q8yYdExJjDlcxidDnsE
	/AImp0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rau3C-00000001dop-18TP;
	Fri, 16 Feb 2024 08:58:30 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rau34-00000001diq-0ZT6
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Feb 2024 08:58:27 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 6B2E388120; Fri, 16 Feb 2024 09:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1708073789; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=yoQeGQzrpzHa03fvltj7PNruPzxrQ/kg2cpMhRvbEQFLZeR+86zL96eoVnBg3jsla
	 60OCv0HYajLxHd1j6oWWAYs6o4itC22kKu1zifl8y2jXEe2TIgLxiiGeFSe3q67ODR
	 1Y4+ni+JfcG34K42faOrl2hjWb83CII606bF386nZJ7r3fB6f342ukuQ5SW0N/rVxt
	 W26ta3aD+1fFw4OAvJuc1FRJjXT5WsAXdTg2FZ0+8ZnA/0g83Hg9WbFn7IPy1RhbOb
	 os6l+tDdRbpzbI6UP3NevHLmQHMlCdFgN6Sum774CL34vkrA81slLxkTyIWKR9v8y+
	 FqjSgqZtvZqQQ==
Received: by mail.quirkbyte.pl for <linux-mediatek@lists.infradead.org>; Fri, 16 Feb 2024 08:56:04 GMT
Message-ID: <20240216084500-0.1.1c.qbq1.0.p0nrs3y5en@quirkbyte.pl>
Date: Fri, 16 Feb 2024 08:56:04 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_005823_033413_389BB1D7 
X-CRM114-Status: UNSURE (   1.64  )
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

