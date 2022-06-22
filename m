Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A38C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=; b=v4b/7dBKH5MH1e691FpMXUxVdi
	SL1l8tSan1LWtYuW26sG5VrinR2Y8F3tE5TdRoxBEF7EVtJE/tH4ALdedtexcqfye25RWO1PvSNsx
	LUI4BMsb2Pvgg2nFMY6ALjkWaxB+RLuVC9DIRcQwVWfV9tcA0Hou+ZeqKgoPGgBEnrvkqpbjRUWWW
	lAxO8eshTnpo3gd6Tz/nH9Q2SFJpqFQR+ihecwLZZjes5ouKn8FWGeGZfXfvrLa1MVn6oyh1CWxow
	i6v9m+X9d5CQLvjMPCH9rIIKpzqU+ccpogrpMz+gw98ymBFxwhR4AzDVGtYFiRTtm0queYIzDPS7u
	s5eRrfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vEA-0098aM-0L; Wed, 22 Jun 2022 07:56:42 +0000
Received: from mail.olerise.pl ([46.183.184.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3vE6-0098Yb-5K
	for linux-mediatek@lists.infradead.org; Wed, 22 Jun 2022 07:56:39 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
	id 3988127E4D; Wed, 22 Jun 2022 09:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
	t=1655884456; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
	h=Date:From:To:Subject:From;
	b=GWMvD2PPcUfV/muFeAia7vt5L6PdCK6afjQ5tydXBJx+tgAg2mj1f+C924THieTsF
	 2sp4o5Km/npnDvtsO75CvWyhayjBek0wpmDZpDt/Qr3IlC3+t+aSNWfwzXZSvtHcNR
	 7kpCECj7FQk3+fpziAZFsqqeNGejdA6kS2CrXkS3eCG1iSjxD+71Tf8nyAW+i/PGYb
	 KdT3qYfQCeqgbzvszArLeHyp715+aVzigKhRJ8QZVtu0Lluc4rvzvWhb0fL5zKE++B
	 50kXTNEMu/wd4Rc1YfAoby2zewi8GHcxNX1kmO+jW+KYfdLD00oSUqZHj8jpW82aaJ
	 1WgK14TaXbvgg==
Received: by mail.olerise.pl for <linux-mediatek@lists.infradead.org>; Wed, 22 Jun 2022 07:50:21 GMT
Message-ID: <20220622084500-0.1.j.bb8v.0.8ptiqa07jo@olerise.pl>
Date: Wed, 22 Jun 2022 07:50:21 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?= <przemyslaw.wroblewski@olerise.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_005638_410989_F6D9F7AF 
X-CRM114-Status: UNSURE (   0.59  )
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

dostrzegam mo=C5=BCliwo=C5=9B=C4=87 wsp=C3=B3=C5=82pracy z Pa=C5=84stwa f=
irm=C4=85.

=C5=9Awiadczymy kompleksow=C4=85 obs=C5=82ug=C4=99 inwestycji w fotowolta=
ik=C4=99, kt=C3=B3ra obni=C5=BCa koszty energii elektrycznej nawet o 90%.

Czy s=C4=85 Pa=C5=84stwo zainteresowani weryfikacj=C4=85 wst=C4=99pnych p=
ropozycji?


Pozdrawiam,
Przemys=C5=82aw Wr=C3=B3blewski

