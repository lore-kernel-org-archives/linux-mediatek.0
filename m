Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB411C3ABD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 May 2025 08:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=; b=FkZr0KEmqOCUEZXdTy+IIltjhn
	HQ8SMj3jRGEvJBx4tPMbjYlf69uI9VynhDMNKho5iYyqyYSajtzz2mjmSARYB5JZ0VTrmTSzP5BX3
	MRz3SYeWMkThbEGykytaiB4inr21rFTRbVpqSqhK05cPmGG/ZSTfkP+NxW/GbSnq53sLBba6w50sE
	GS4VUrW/OQ4KtfL5z62yKxAeUqOIeihmN0k3mQLDDyiwBTPSQTfx79++8c8C0vGOphAkxHAPlVPGg
	OGU5rQYVUzH6+7XSa3FoJwyShgpAMou3MstxhgGn1icouHERsQlt6iTvVJt1fETYpf7kDOCeH6OuE
	oas3MJQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOUe-00000008k9s-2ryL;
	Mon, 12 May 2025 08:26:36 +0000
Received: from mail.ventrixio.pl ([57.129.137.141])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOQH-00000008jJk-0UWk
	for linux-mediatek@lists.infradead.org;
	Mon, 12 May 2025 08:22:06 +0000
Authentication-Results: ventrixio.pl; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=ventrixio.pl; s=default; a=rsa-sha256; cv=none; t=1747037832;
	b=MgF4be+H2cEn7k6B0jKZP4dWYYsjVQ4CS/mbiD1/fkQqHu1vzNI/7Q62Kfd9yvtI+mmN
	 6bJoanWXuvH9B3NMCz9XVEywzJKYCzU3ZLuKOq4OmTOnVGECZdQqrBwyPiWY+08M9LuHJ
	 aLF3VaPaEkMiR1zd0ukfJYSiFdTjsTwR0MmaKf4dcMkHTa9NjCaGVxUikC0qyRycf92mS
	 Nm/ruBPhOlDxpf3BCQqk0gZlmqq/A5G6m4IR24DvOxUyrXcqeFr56gv8IpWz7sBXab4em
	 vix+/V1ozBd0SSL1zPfXS8q9a4Plx0Sp9piNS6KwHYxWDNIanFULY86soMfMb8mbGig==
ARC-Message-Signature: i=1; d=ventrixio.pl; s=default; a=rsa-sha256;
	c=relaxed/simple; t=1747037832;
	h=Message-ID:Date:From:Subject:From;
	bh=g/ZnFTuVYued68oe7XL8RDnKQ+ZMKy0qE+LfBacqvSc=;
	b=KZmmqVfmNnp5A3W/NmJSN7SbfVnnunG/1vy5zREc+c2gpk0AHf9y94wmdkmh+FHe7h4o
	 sNDl6nKSwtjPpe+5QQdLbajcEWny0XDeMAjDt/ZY8lGZ4kPTRci3ekUiNfUnis8u6vfIR
	 8fiCZjEB5xOqNDEo1BVJ+dtjdQ3zTnqv5bSi9HvTRsDd2EIv66LftbwA+74CLaLuq3k02
	 lSEYy0bH4iNBOF2wnLZw/Q0pCkCe64dcWjRgNv/e2P4x5EYjecHlxYLNKaqsGVKDPavti
	 3YHecNKdfPi6emHRSyrtbmsNV3FO4DtBRi2RrtDCw+XxWrFmiIwhwi/qv0lS5XA2dPA==
ARC-Authentication-Results: i=1; ventrixio.pl; arc=none smtp.remote-ip=127.0.0.1
Received: by mail.ventrixio.pl (Postfix, from userid 1002)
	id D9D1525DBB; Mon, 12 May 2025 08:16:25 +0000 (UTC)
Received: by mail.ventrixio.pl for <linux-mediatek@lists.infradead.org>; Mon, 12 May 2025 08:15:52 GMT
Message-ID: <20250512064500-0.1.26.m37i.0.pjwjj9giv6@ventrixio.pl>
Date: Mon, 12 May 2025 08:15:52 GMT
From: "Karol Bednaszewski" <karol.bednaszewski@ventrixio.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Mniejsze_wydatki_na_samoch=C3=B3d?=
X-Mailer: mail.ventrixio.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_012205_289097_3707CA0C 
X-CRM114-Status: UNSURE (   0.75  )
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

Dzie=C5=84 dobry!

Czy m=C3=B3g=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re umo=C5=
=BCliwia monitoring ka=C5=BCdego auta w czasie rzeczywistym w tym jego po=
zycj=C4=99, zu=C5=BCycie paliwa i przebieg?

Dodatkowo nasze narz=C4=99dzie minimalizuje koszty utrzymania samochod=C3=
=B3w, skraca czas przejazd=C3=B3w, a tak=C5=BCe umo=C5=BCliwia tworzenie =
planu tras czy dostaw.

Z naszej wiedzy i do=C5=9Bwiadczenia korzysta ju=C5=BC ponad 49 tys. Klie=
nt=C3=B3w. Monitorujemy 809 000 pojazd=C3=B3w na ca=C5=82ym =C5=9Bwiecie,=
 co jest nasz=C4=85 najlepsz=C4=85 wizyt=C3=B3wk=C4=85.

Bardzo prosz=C4=99 o e-maila zwrotnego, je=C5=9Bli mogliby=C5=9Bmy wsp=C3=
=B3lnie om=C3=B3wi=C4=87 potencja=C5=82 wykorzystania takiego rozwi=C4=85=
zania w Pa=C5=84stwa firmie.


Pozdrawiam
Karol Bednaszewski

