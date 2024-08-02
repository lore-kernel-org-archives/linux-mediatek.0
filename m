Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79C1C52D6D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Aug 2024 07:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tU7gEcO5Zgme5BifBIK2ckMTS7sI+kwhhQ7BvALV+BQ=; b=UfoR18S/F1hk0WRgNQF6dKG5/1
	kQ/Vx9i7mVpOZ8BIMrjIKAXGgJA8meQ/7e0FvQ+xxFL79LrxF7B6X234vuEFn21Q+eeG7Olmw4ruC
	TF8cOa9RvDY7PUQFLogwUmIu8QDdCT1CJf4Hueh7EjbLxuL0EqQpQIwnn9v63F//nWGTea3Hgt9aT
	7Wb/Slkdunh8LbLUzVpqkOocXxLAuwnUpAsixmQTlmkqVs3GFls+YiXlVvaQB2WlCIexgwF5XbGM0
	3XhJDuLerfcnBdP/vSNTB6Pb3qyKRagBNEYCkpwM1RWwuGkMsXO3+isxVTn1cW6XbKFVzWiPSbA4x
	jlF/zAyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmpu-00000007ycD-1305;
	Fri, 02 Aug 2024 07:36:26 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmpq-00000007yas-3AT7
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Aug 2024 07:36:24 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 50AA225923; Fri,  2 Aug 2024 09:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1722584181;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=ioR5zKO2AuHow7KDM/v15W8g5YN2HXu4zcgqFB1uwbNOF9AizVda8QKmE3LITyONG
	 szWYlHNpvGOto9Ruh/8r+VgSjV9OXDIGHq7pADXkswUVG/PMspculwgpS/EoOxht3f
	 aUReLNrg8BrR2m3nystmh/eEr9r3SLrQStQvmnbxaiqjHCFsgZ4ELzGX6vUINbmJ9R
	 Mau9RuBy6OuAiQkZnqeHzPCgExY4dAawDBLmquZqEQrh284ze/svkNN7rCj732p+/e
	 fwAXV7Ix+9lgZuQb5VvqkUiPG70TnM7Idb+V6dgzUApk3m/2swsorqY8Lmz2YlqAlX
	 GToa0uz1dRGfQ==
Received: by mail.synergyflux.pl for <linux-mediatek@lists.infradead.org>; Fri,  2 Aug 2024 07:36:02 GMT
Message-ID: <20240802084500-0.1.d4.39hsc.0.lmqb03rpv3@synergyflux.pl>
Date: Fri,  2 Aug 2024 07:36:02 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_003623_262409_9A057351 
X-CRM114-Status: UNSURE (   0.40  )
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

czy s=C4=85 Pa=C5=84stwo otwarci na niezobowi=C4=85zuj=C4=85c=C4=85 rozmo=
w=C4=99 na temat fotowoltaiki?

Jako firma specjalizuj=C4=85ca si=C4=99 w instalacji i serwisie najlepszy=
ch jako=C5=9Bciowo paneli s=C5=82onecznych na rynku chcia=C5=82bym przeds=
tawi=C4=87 propozycj=C4=99, jak=C4=85 wsp=C3=B3lnie z zespo=C5=82em przyg=
otowali=C5=9Bmy dla Pa=C5=84stwa obiektu.

B=C4=99d=C4=99 wdzi=C4=99czny za wiadomo=C5=9B=C4=87 od Pa=C5=84stwa czy =
mo=C5=BCemy porozmawia=C4=87.


Pozdrawiam
Konrad Zieli=C5=84ski 

