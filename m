Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE27C25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 07:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=; b=f9tTGPht79d0hIyAUSAqJQ1QkD
	S7gGBjhfijnp/tBGggFTVf7RkwUkp1lfeXOMbSKCD+1Vn5QBQ1Bb4DxbXchd0KVTRJimXhXuQ/RjO
	rMBsgYRBLWERFhT6pPdmeF0IgVfyX4iEww8g8JAn8Ifhs4UUyhwiMAkpYjFYNGND/UzC1HS4cpe57
	e2fCA9uAqz6YcgdNCwTrN/8j7VDFlMDvczf0yI891Jfbmw75TiR2eTaQ9rXUNIJaafQtODrtZHd3y
	RtQCuk0DNOxl/V6sicRDSamI+y9zrl9liYZKxYmQ5+vWIF4/kENfLzijDbdGdexcXe94cTHLrTngP
	mW8DJDPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPVy-00000008HWc-3FkD;
	Fri, 24 May 2024 07:38:58 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAPVv-00000008HTn-1Q8z
	for linux-mediatek@lists.infradead.org;
	Fri, 24 May 2024 07:38:57 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id DB9428402F; Fri, 24 May 2024 09:37:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1716536260; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=v3WwqFRYmtk/QY3L1ALOl3bF3NyWsTP7CZthbW28MC9yX0nl/YTIuQfdEbgIODvFR
	 Td6UL3C8poHK0dD23+3MDK//pxouOR1y+MVT3VIPuyiqI3v7SIPnKrm+SkaiOAPS7Y
	 hzTJz/+QC5/EYyaQA5mfc3VngAMi7ZW4QZIyhrA0qXBHk+BHX8K9CO88X0SGQKM3ev
	 ELvXdpwz6WukjK3015mxFtp/wgy0El9qvqu8ycnfOj3dG3QNbymowjOAHWdJ5IycS5
	 Lcf9w6Z069aMfw5Mfdq/5XzPGP4+FomZVevbIF0zKj3jzacGe3zyDDbhH4r2t+xiZt
	 Ee1pWwatqq7/w==
Received: by mail.quirkbyte.pl for <linux-mediatek@lists.infradead.org>; Fri, 24 May 2024 07:35:52 GMT
Message-ID: <20240524084500-0.1.37.1szkl.0.a6kj9467gl@quirkbyte.pl>
Date: Fri, 24 May 2024 07:35:52 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_003856_105877_24B7C2AB 
X-CRM114-Status: UNSURE (   0.30  )
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

