Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62F0C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 07:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=; b=sR+KH854qyAPaQvKU15CISLHOL
	rBrJFEVcMhza6eJW/V+FbBx6oag2qHtBpZmtyk/fpnrk4PYXbjs+8mL3uuPvhsK1X07OPB9V9l4uu
	j+OqLO8jLeVaDQfWsAxpGeuXvM6UZsk9/mU9gyZnczDdxEaDJM7EyAj5TYWcH9ATI/OY1p0pgkZFc
	uAokHSzwrliyN5fe13OkzVuoW5AX03epVyZV+9MN/d4c70NqLw1AN3X1RF+gJTmFCR06H1RYP2nE5
	uuw8llcMzK9QggTer3gUiRn3fwG0uLV/6V+8AwDWX5YxI8X4H/BklBqN7Dh5aSZ9/pY5nGQypcqbB
	PObd+Ihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ott-00Fp8x-7R; Thu, 30 Jun 2022 07:47:45 +0000
Received: from mail.olerise.pl ([46.183.184.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6otl-00Fp35-Gs
	for linux-mediatek@lists.infradead.org; Thu, 30 Jun 2022 07:47:39 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
	id 97A6D225AB; Thu, 30 Jun 2022 09:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
	t=1656575237; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
	h=Date:From:To:Subject:From;
	b=Y4AMWFeWxyXYd4ihRvBCQEjDPQumEcSaUoAHasHCrcmRKQosk0OzuqDFehE1CUYWe
	 +mDSMDa9AWP03A6xYdvgq0p8R4WBwxOAkc9bq+QtrmTvGwRzYvpGfgsOeNAfi56Sp8
	 Uc8FMl8rORYqmm14wUmicP1YIQs0hgCBqzicph8IE5F5rc8V2oMJx6/ZbUVeYOa2MI
	 FutKrwVmw18AG5ZPulo5EcCehci8zlUkvjKz1Fm0rjY01YQfmiB0zsfX5PMixpvlL0
	 zmHDchEG1WtBfuw+Ftiiq43XFrNuhKmVoBTcUdXfdmB/0Gjv9efNtUfT9WPfBVVKOP
	 5nYHsMYY8nC7Q==
Received: by mail.olerise.pl for <linux-mediatek@lists.infradead.org>; Thu, 30 Jun 2022 07:46:17 GMT
Message-ID: <20220630084500-0.1.p.bb8v.0.jf5p8x4cax@olerise.pl>
Date: Thu, 30 Jun 2022 07:46:17 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?= <przemyslaw.wroblewski@olerise.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_004737_830606_5C73C27A 
X-CRM114-Status: UNSURE (   0.39  )
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

