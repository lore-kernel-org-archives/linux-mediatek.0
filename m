Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788D8D68BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Dec 2025 08:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=; b=CaHd6GjuwB2n1uddS+wY9PUwN1
	soMOD4MuWQ85H2PQjpQariX+dhg98kH2QiXzvVG8RAW+1l71dOCKXBXidN1I990yPNd/xFuBhbWES
	S5WEP3HXxe33MM7eTKD8TVYwNRw8kf3dk+kH5knR3y5eC4sVsGMMVLqEHQD6or3z0Nh+1cXJn6ggz
	Ry4UWy8G71/mWQswnMCuo8WBdbQg85swQm2B0PyemVAdODIDInkvySIkZQQv+gv/FPQ4/bchcbL4J
	jTQC/X+YgosU1F76bzCEjbynG82HKqcAAU/5OlxbCh/z/Adoe65WHj1x7CQVvv13n9CM79RF9LX9Q
	CsIWxJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9jt-000000086CN-0smN;
	Thu, 18 Dec 2025 08:52:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9js-000000086CE-17dp
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Dec 2025 08:52:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=; b=iTrXOdPlb8ffIjKWjIfgI/JRsT
	QX1ee9a5c3mU/bwvWekBIjTYsOkInnXcepUa9NS+koJrrTZ5nu1a3g9PFBkxFYFYX1RRSW0JGdpIX
	LHhJSfgXQrM1U2L/314Kykr3qVshTHtUtuvk4ylq/429XP0XrkJEVJMi8P+/r5RkOhhN5feCS2Uo9
	H4pS2J7z3fOZ96Isuogzlcd44Y9GkN8LiXiRCdIsTG132A1DiEYdaRED86K6+dIfZBLdacqYielBB
	PEXAVKwPldoDHwxAq6n+W11k/GmpMV4snMsWdcRBM6EbT09A0vKwK3NFdIu8nDIXOQ4d1xni9EW1N
	uhMg4chQ==;
Received: from mail.torqly.pl ([51.38.112.117])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW8sD-00000008ObF-26Lp
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Dec 2025 07:56:35 +0000
Received: by mail.torqly.pl (Postfix, from userid 1002)
	id B2DF8ACB76; Thu, 18 Dec 2025 09:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=torqly.pl; s=mail;
	t=1766047698; bh=g+bJVIpt0gfvrKpvvpbdhzaZrLDQ51BQvCd8rNT5zDA=;
	h=Date:From:To:Subject:From;
	b=IQvYyYravJ5Oq+5HEVDVeUlFI7LST/HhV+nNNyBqm7BKFRlMGuasUpjyQ7nb3lY/X
	 vQzWL+QM6BVD4ZXVhY8UpYV6WvCdIhSRbzsk5IpreS7ejTp6rFhVRTkBC7L3J9q4IF
	 JntEoGSUjLmCSUc6Xo1CMwXz8iWMbV9EqlkhawTQkKtX90KRJ5AKJtrmIMHjoWtCeX
	 Fgh3aHa6tP5LyZHBwgWdASR4Qpc90CzqYi8coTBkF41eAy0OeRPChv23dHuCiCOsEW
	 Pmcht7WMqfNSR6RFX8kfFgqOBgl+vQI+LsMiCLsNoMLs9zjo5dBkvIqkCNfzKGbEBd
	 UYGoRJWwzq4RA==
Received: by mail.torqly.pl for <linux-mediatek@lists.infradead.org>; Thu, 18 Dec 2025 08:46:01 GMT
Message-ID: <20251218084500-0.1.tu.d9jjj.0.am4xl3yp5u@torqly.pl>
Date: Thu, 18 Dec 2025 08:46:01 GMT
From: "Tomasz Jaworski" <tomasz.jaworski@torqly.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Ulga_na_sk=C5=82adki_ZUS?=
X-Mailer: mail.torqly.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_075633_855576_D063217C 
X-CRM114-Status: UNSURE (   0.93  )
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

Dzie=C5=84 dobry,=20

chcia=C5=82bym wskaza=C4=87 Pa=C5=84stwu mo=C5=BCliwo=C5=9B=C4=87 zarz=C4=
=85dzania benefitami w =C5=82atwy spos=C3=B3b, poprzez nasze intuicyjne n=
arz=C4=99dzie, jakim jest karta lunchowa.=20

Nasze karty oferuj=C4=85 wygod=C4=99, oszcz=C4=99dno=C5=9Bci i zdrowe wyb=
ory =C5=BCywieniowe. Dofinansowanie posi=C5=82k=C3=B3w jest korzystne dla=
 obu stron. Karty lunch to dla pracodawcy realne oszcz=C4=99dno=C5=9Bci w=
 postaci zwolnienia z ZUS do 450 z=C5=82 miesi=C4=99cznie na pracownika.=20

Kart=C4=99 mo=C5=BCna do=C5=82adowa=C4=87 dowoln=C4=85 kwot=C4=85, a niew=
ykorzystane =C5=9Brodki nie przepadaj=C4=85, lecz przechodz=C4=85 na kole=
jny miesi=C4=85c.=20

Mog=C4=99 przedstawi=C4=87 ofert=C4=99, kt=C3=B3ra pozwoli zoptymalizowa=C4=
=87 koszty i zapewni=C4=87 pracownikom po=C5=BC=C4=85dany benefit?


Pozdrawiam
Tomasz Jaworski

