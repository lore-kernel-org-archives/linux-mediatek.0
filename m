Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145B9E6748D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Dec 2025 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rBf3jQVFnGCeJlMPbA0E+WWQIPnf9AfAJW4UEB5U3Ig=; b=dGANriZrvYaBjPdIgY138r5SaC
	U2zcNZ9CORJRgVzNi5M1KeemaSX11fHOzFkJIN+jmlLrVS01NvVWsC19+j7Se3wyLblHkH1NeXzRQ
	3RN+5Pq3lD2Q2tcosuSqGFPjopajNOvYPwus1EES49iTpCdOA7vfG8TWbGJcKuuxzNaQVM5HByfbT
	V/JG5fJTYXPbAl+3/pokSt4aVRbg55+nXN3f5V/AjE+4Ufm3gp8H5nEVdythTNqJ5BYw1JDot21zs
	ftNluHqcY+3S7mAv6ot6RyPOnTviEsK0XLJGMNhYXH2hsZMvAVwbIkYWToHGt0iXhZef260qTYEDR
	p3LvvMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXboh-0000000DUpS-2zI7;
	Mon, 22 Dec 2025 09:02:59 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbof-0000000DUob-2kSU
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Dec 2025 09:02:58 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id E80F6A5B13; Mon, 22 Dec 2025 10:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1766394075; bh=rBf3jQVFnGCeJlMPbA0E+WWQIPnf9AfAJW4UEB5U3Ig=;
	h=Date:From:To:Subject:From;
	b=DNL3Jz5txvcx2H6EXhbZv0gnmb1eT/i9C4HDl9huRDpnpaBDmOP/f3rEBwUEcBdzT
	 +6W6PhKSItfzkeHFKU7pHx+BRp80iLvPNYBiTQw6p1qiswimrShQUH+KSPfjzfDhqg
	 nWxJJzc8jy6DM8r3bdy2T4V1z9VNSBg85G1i0zyqhWpe0igZ1z2FW2cqX+GUUL/0XC
	 ITvFYsifThpSBQ2dO/7ygU6tqAqg/1l0oX/+Yrt7j2pYZp0tsgo9rvbDMQS9213N8R
	 UNH1EsVgwYQ/gAhb4cyJLdsbMzSU9rJyD//ItTpVABZTNjntegll/bC1QPDntijiYU
	 Hpg0LjFAqKD1Q==
Received: by mail.vexro.pl for <linux-mediatek@lists.infradead.org>; Mon, 22 Dec 2025 09:00:58 GMT
Message-ID: <20251222084500-0.1.pc.4sj13.0.lo3xih0rgl@vexro.pl>
Date: Mon, 22 Dec 2025 09:00:58 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_010257_890086_6B47AE59 
X-CRM114-Status: UNSURE (   1.57  )
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

czy istnieje mo=C5=BCliwo=C5=9B=C4=87 porozmawiania z Pa=C5=84stwem o wsp=
=C3=B3=C5=82pracy?

Dostarczamy i wdra=C5=BCamy system, kt=C3=B3rego efektem jest obni=C5=BCe=
nie koszt=C3=B3w za paliwo, szybsze pokonywanie tras, skr=C3=B3cenie czas=
u dostaw oraz wi=C4=99ksze bezpiecze=C5=84stwo kierowc=C3=B3w na drodze.

Prosz=C4=99 o kontakt, je=C5=9Bli interesuje Pa=C5=84stwa poznanie mo=C5=BC=
liwo=C5=9Bci lub bezp=C5=82atny test tego typu narz=C4=99dzia.


Pozdrawiam
Adam Drzewiecki

