Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A084FCCA476
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Oct 2025 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qsFkU/uX4KHJ4f1uzm2iz39kAHCe9u2uFgt0PtntkBE=; b=A93QX7/oHa1WxuyGS0QDo57Y6D
	VXqIut0iR9agrUTvcyezptC2DUijtWpf9WhJXnfaHNqytq2qH7RYaaKDG5H5d9M1sk8y2fFgyKNQh
	ENEiCzW7zpmr43gE357WXRmW8Uatdv3fDTlqAcHiVOFfnVM1e60zfWkbJ/C0Rs+Tfk1vla59su88q
	hlqjc/ukOv8NvVCsQqDCKmHbRWDlk9i5yQP4bTC4vCh8qWwaVvV79MeyqUz7a091PLcUo8D2DOd4I
	x/hxjLorgPqvd9c9Ioz4JBIkQseXFCGR1lKuh08WcdWqmFTkm4ofAJpXvWF05QZXKAwRAnDmuxOFP
	ENZkCl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78Kh-00000007xz6-49v4;
	Fri, 10 Oct 2025 08:18:36 +0000
Received: from mail.scalenook.pl ([51.91.253.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78Kf-00000007xyk-1Tof
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Oct 2025 08:18:34 +0000
Received: by mail.scalenook.pl (Postfix, from userid 1002)
	id DAB06277F6; Fri, 10 Oct 2025 08:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=scalenook.pl; s=mail;
	t=1760083699; bh=qsFkU/uX4KHJ4f1uzm2iz39kAHCe9u2uFgt0PtntkBE=;
	h=Date:From:To:Subject:From;
	b=YfhWbYyZ6OxpHSQrbrAsAS4aJpq2tIoqael0JGnLzQQrrArm7UI0ViJhTILL90bb6
	 xMH43JoBbIDkCA7uTJvjJ1hPRy6TcCq3598fmzSlRXVQtzXIEZIXL8iCdCdlnaKkSd
	 KZoAi7kNaiwdE77esG5MWJ2UNBrF8uZfxg2q3NF5get+EynNM9IxxPfpi09en7imrv
	 kKrdLeFE2VhuxCxZPrURcVKVxZeLkr0HbR715IWaJUhw/x7wOKSKPH2x+w6SkZRbDQ
	 zQxj5rmDtodIzU4vvhnbZRVf6uvlgEk36Mol3FNIO499X1iN7QhzYXebmTtmTdjYls
	 wGPV7n8bcoRUA==
Received: by mail.scalenook.pl for <linux-mediatek@lists.infradead.org>; Fri, 10 Oct 2025 08:05:48 GMT
Message-ID: <20251010064500-0.1.m.a6w6.0.uih14asosa@scalenook.pl>
Date: Fri, 10 Oct 2025 08:05:48 GMT
From: "Ewelina Koprowska" <ewelina.koprowska@scalenook.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Karta lunchowa
X-Mailer: mail.scalenook.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_011833_679915_5C2D4713 
X-CRM114-Status: UNSURE (   0.94  )
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

Szanowni Pa=C5=84stwo,

czy zastanawiali si=C4=99 Pa=C5=84stwo, jak zwi=C4=99kszy=C4=87 zadowolen=
ie pracownik=C3=B3w i jednocze=C5=9Bnie zaoszcz=C4=99dzi=C4=87 na kosztac=
h zatrudnienia?=20

Obecnie jest mo=C5=BCliwo=C5=9B=C4=87 zwolnienia z op=C5=82at ZUS a=C5=BC=
 do 450 z=C5=82 miesi=C4=99cznie na ka=C5=BCdego pracownika poprzez dofin=
ansowanie posi=C5=82k=C3=B3w.=20

Za pomoc=C4=85 karty lunch pracownicy mog=C4=85 p=C5=82aci=C4=87 w restau=
racjach, zamawia=C4=87 jedzenie online, korzysta=C4=87 z cateringu czy ro=
bi=C4=87 zakupy spo=C5=BCywcze. To doskona=C5=82e narz=C4=99dzie motywacy=
jne, kt=C3=B3re tak=C5=BCe wyr=C3=B3=C5=BCnia firm=C4=99 na rynku pracy.

Ch=C4=99tnie opowiem wi=C4=99cej na ten temat, czy mogliby=C5=9Bmy porozm=
awia=C4=87 w najbli=C5=BCszym czasie?


Pozdrawiam
Ewelina Koprowska

