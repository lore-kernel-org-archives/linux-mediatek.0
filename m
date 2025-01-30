Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA1AC0218A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2025 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=; b=x82CMa1l9HhWIQBqsaKJXSdYk8
	Z2eihp+O0LkDVPb8ap7He3EwiS7As9t23xd0lGjiBcZS/8RnSgbdM7arjFPSCjDALpFWhMsT/gxZt
	m6vVRRQeL4eyqy6wJNxZHGYtYfTaM//y55TpHbDs0LLDOQNPFQHU3eV7pSyzd2brZfgQwGxizN5RX
	t4G+A/T/mFggXBGV8YwS0A7OPbz9WMyrPOx1Ser3XgG5ezcpXgm/nDKJcfYKrjcF6V9PJOpN/MYJ8
	2Sra7EhTtiQ/RI98pP6JV+BGbqmzE6cu1TuTAcjoYDmPhX/WKFCGGAIJEptsnnyuXuck8O9Ki18nL
	Lgfla/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQFw-00000008S8l-0eCL;
	Thu, 30 Jan 2025 08:50:36 +0000
Received: from mail.cybercitadel.pl ([57.128.173.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQFu-00000008S6t-2YRE
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Jan 2025 08:50:35 +0000
Received: by mail.CyberCitadel.pl (Postfix, from userid 1002)
	id 689E54D645; Thu, 30 Jan 2025 09:40:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=CyberCitadel.pl;
	s=mail; t=1738226566;
	bh=vUvp0ttX3lOxjdOrvZsKvJKNpHHNusfF6naBdS8j1E8=;
	h=Date:From:To:Subject:From;
	b=saLRhVWDZxc8+iKdy8n+Z2Scqd534HdkTwTB5BeBkl9giTdOoyeRo0TQyH+aYvdLm
	 f/KOb/s2TmAhX8ahQE8EsIHu5LLxIa+XwzS3d/RLQFYrgLhWOkPr3Rwtw+uz9QOFIa
	 34IHG/tjDiW7gX2i/b9uY8gzfiqmHrEBGgBLLcUxGCLtZ0/j2WnMDPrZZRQjSy7ChD
	 u98y8sNjbQiC2akaZACPTx9BVgM6HukSdNhHEKdGFEOHIevo4qf/5rvGB0pr0AhqFE
	 p/+X0mAYj8iuAofq7qih5kwdvWD9Jsn1wi1mepiD0ANq1xkmM7NPIzwRUlddrEzOrK
	 IucXxaRmII47w==
Received: by mail.CyberCitadel.pl for <linux-mediatek@lists.infradead.org>; Thu, 30 Jan 2025 08:40:22 GMT
Message-ID: <20250130084500-0.1.d8.2db15.0.36x1a5bahf@CyberCitadel.pl>
Date: Thu, 30 Jan 2025 08:40:22 GMT
From: "Marek Kucharski" <marek.kucharski@cybercitadel.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.CyberCitadel.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_005034_780402_1FAFB1C9 
X-CRM114-Status: UNSURE (   1.44  )
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

Czy jest mo=C5=BCliwo=C5=9B=C4=87 nawi=C4=85zania wsp=C3=B3=C5=82pracy z =
Pa=C5=84stwem?

Z ch=C4=99ci=C4=85 porozmawiam z osob=C4=85 zajmuj=C4=85c=C4=85 si=C4=99 =
dzia=C5=82aniami zwi=C4=85zanymi ze sprzeda=C5=BC=C4=85.

Pomagamy skutecznie pozyskiwa=C4=87 nowych klient=C3=B3w.

Zapraszam do kontaktu.


Pozdrawiam
Marek Kucharski

