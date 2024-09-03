Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94BECD342E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 07:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tU7gEcO5Zgme5BifBIK2ckMTS7sI+kwhhQ7BvALV+BQ=; b=TQDYNasKRpwyPVK/X0Yf1ZNRaG
	m+ITrumRcbN7FjevT60H5YVaOOqP6mxbTlozTJIHRJSFaD+eIhcISJjshk0fQHvu7M3wCKEaUmZNz
	xpVP4QdwiVCHqmi4rFclTHBpVemJZT/dt6yRntYI5iCtF4kgYH0LsGfGN8D0iAX8puKIWUCTvHRlF
	nhAbh8gIPINRkLvodQ/tlFx2oJ3664Sg8p/rDIGMsmPwr4OlgMO2Og88gz7ZgRtFRwfCpxKt6um9C
	dpNaUekFSybvo94cp28mOe3X13d1KzyAie7uBZyyoem/qKy3Nh8NxSrTucaJROg74NC0+iUwThTJt
	+JlI4p8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOSA-0000000Gnfk-1oZj;
	Tue, 03 Sep 2024 07:59:54 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOQY-0000000GnI3-22vY
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Sep 2024 07:58:16 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 99910259F7; Tue,  3 Sep 2024 09:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1725350211;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=K8MuIZkWqctdTd8vfVnWyEJXBC9m6tmoykM25jiareSaLMQxP/dStW7zpVgV33XoR
	 krR17H8mrBxDLIjCM+tCbUsVYt/NmI+id5KiYomAXsjE7vl+jgILKVZLeQXFzPAKSW
	 6SivxgCXTiChsVVGXPbC/OZk9a3sRwuFy5r8dE6UerTCIjpVOh2uNPzcrUm091UwuO
	 WBftqCTfxDlfyQbZirYRvZqXfbZPe6yj3euDQPBxxduLZc65YrPsx9aGiyof7FoIF4
	 Ngjf+EnEJvFO7Z3sLZ3AlhhneAid0xO1O9b0GewtFN879Yi/OcPjeVlDxEMKSlIAlg
	 dX6TKWu633WKQ==
Received: by mail.synergyflux.pl for <linux-mediatek@lists.infradead.org>; Tue,  3 Sep 2024 07:55:44 GMT
Message-ID: <20240903084500-0.1.dp.3gcgy.0.u543kcg33o@synergyflux.pl>
Date: Tue,  3 Sep 2024 07:55:44 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_005814_689662_F5B58311 
X-CRM114-Status: UNSURE (   0.87  )
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

