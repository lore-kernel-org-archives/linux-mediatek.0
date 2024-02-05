Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8B0C48291
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 09:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tU7gEcO5Zgme5BifBIK2ckMTS7sI+kwhhQ7BvALV+BQ=; b=X9+XR10gwWWYuMRDDTv/rjWwMx
	TxqHgort/kJAvG1ZzuBZahDMJNwpPEeqLwn2mavKV6oJp52z7Lpuusvynzlz3eVOGe6EFIXx/GXy0
	TYEYU5q679ObgNndZ+OTD5TJJwFhBRSfQnlj+RR/bP0FIXNhdNAArsi8lQzefDIZjHEm9RIttLlqK
	iDG8r4kY0RVSGt2/tF92+vq+AS81GlxW9JA9mswJ3DazpwaR6dkMtvfX57nw19DDKqJp1qcfCz8Z8
	ia0ixfsYtQHC12AaH/nqw9HkxU8HzuNqYJgMXRq8mejE/dZ5uhJ5F0EbAcYFW9CMWkSfYnZ0kOvlA
	brvh+Uow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWv0N-00000002Yd1-25wP;
	Mon, 05 Feb 2024 09:11:07 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWv0L-00000002YcI-1Qal
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Feb 2024 09:11:06 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id E72AA24F45; Mon,  5 Feb 2024 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1707124263;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=yYQNJBOw/54jzMpMzxPTOrp6AFdN9uFk5SJkVXdy4C2yH3Z1jiiWzDk7oyPi5VAlE
	 sCbsoklB4ISGbXYSOBdxNj1vH3xz7dACrAXyf/sex4yWsr2YNYKlfC48CzrQn+R5pI
	 NOpLCjrZpxjk3R7iumSTu2zG5Qzcxfl6E/efbHv97UrwTSYIyUfAMxVqrIs3zuygz0
	 5Qpq2ZzwZqQ0QTtJxShx+Xa4Pt4777EXMtp8JgYJxQmJEgX8CyXeKyX4J42khD3eLm
	 YmRh0DmFeFbAh62VPICb939/+Hd1uD0jy3cvyz7YrBW3KUDU2BzusT40Uk+kfitroa
	 5CxaUUlCEbM0g==
Received: by mail.synergyflux.pl for <linux-mediatek@lists.infradead.org>; Mon,  5 Feb 2024 09:10:51 GMT
Message-ID: <20240205074500-0.1.9m.1w6pe.0.phm5f47oay@synergyflux.pl>
Date: Mon,  5 Feb 2024 09:10:51 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_011105_546682_F79F2CB1 
X-CRM114-Status: UNSURE (   0.92  )
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

