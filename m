Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529B2C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 08:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=; b=iVcItjeGAkOHVzZMjowhPuBtRi
	OybQ5K3Oc6XnHWe6x2jm+7GIGccPxk8TYoPE4OEf5Qly2/pTiOWN3aSms77E6GImGUo8/1mLZ+mhR
	6wHSj0aKLhd3dQCGzD9dxaUgNSttNKVzrevrX2drSv56x6wt+1ozfWfbaDmgjAMnMsFPOigeS0nur
	drno9FFMBbxTXL9DlAKDqrmfa8gLpkgKmBgl+xhtvUPTY/TIshIhfilajbR5ONQ8T3fHoo8qNY0RX
	AqGCVK3E7JbvmE/mAjZvGuuuGO5lTfnrdZ2RdphCFRWcZJlRj8H2ow+0Kcstcx6mJLDBLv2Ip85BF
	LajuSngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6j4-0000000D1nN-4BGb;
	Fri, 28 Jun 2024 08:12:59 +0000
Received: from mail.quirkbyte.pl ([94.177.238.152])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6j2-0000000D1ma-1gey
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Jun 2024 08:12:57 +0000
Received: by mail.quirkbyte.pl (Postfix, from userid 1002)
	id 58F0A8C7F6; Fri, 28 Jun 2024 10:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=quirkbyte.pl; s=mail;
	t=1719561966; bh=V4qwQGqC7KpJoyielzRpnopuINFIOvKXsSgJ3ZENIXU=;
	h=Date:From:To:Subject:From;
	b=Ievujduq10QfurXYw/oWvMXAEyLq8s6prgKRW8k6VLGtDhZfHcXX8M5KjOVj3IDgi
	 f3g+NZIgnuFDa5lEMPATaMrSH/PKF2ou16lt06fDVVvM+5FRNslPxVdDlOMThycF9v
	 F2AGqY+2D8gLygIEUFLzcGL4RgG1cAUb0KTEvoo8+6aJEvxlfhRnOCAzcLjpi50G3H
	 4LmsXcKW+d1Jcry2a1TJtrL/3yGsnEC3+8kg+sajDhk5h6riUbBUCdQeDgH7VKFX89
	 5X5BmfOZZaslmEOwgelGZAT0GAt0cDhEKgdHMpjHcPBfQNSxZ0MFptYUJr+1f0xSH1
	 ikhcpd9eSsf5w==
Received: by mail.quirkbyte.pl for <linux-mediatek@lists.infradead.org>; Fri, 28 Jun 2024 08:05:09 GMT
Message-ID: <20240628084500-0.1.3v.285dm.0.p1ieryjw3a@quirkbyte.pl>
Date: Fri, 28 Jun 2024 08:05:09 GMT
From: "Norbert Karecki" <norbert.karecki@quirkbyte.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika - propozycja instalacji
X-Mailer: mail.quirkbyte.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_011256_586960_4A026C48 
X-CRM114-Status: UNSURE (   0.64  )
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

