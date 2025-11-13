Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE82CD5BA0
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Nov 2025 09:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=; b=V1HuP/HYxKxwCdqrDoawztMwbD
	BafbDaEAxZClEEYgqbyVvDr5t4InO1UB2C2r9B35Y4gC4tfhApSPplv18SME7udL3J+xJ7xQblIZc
	i+Y7Pr0XbH/O1Yj1XxPT5f2xGLL3lBFIzSWdXiazCxfZOznb1Ow4KY0ru+YkD9FTg155S2yk8iW5o
	ePFyi7LCWNgilbTkB1KsJa7RG46I7OF2JVkUwR/kFVkuCnkMPAQ7EQX7A6fiYW35eeRH9a1Jplp85
	GxazxUDjCxcs1NJffMO7Y/o+v7T6oINqc2iZ9YWSA7DCOwsNHXF4y+eLmVs5dN7i04x/tlC5StXjJ
	RDkeLPTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTJv-0000000AAHP-0SSD;
	Thu, 13 Nov 2025 09:08:47 +0000
Received: from mail.fontri.pl ([51.195.90.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTJs-0000000AAGy-1HB4
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Nov 2025 09:08:45 +0000
Received: by mail.fontri.pl (Postfix, from userid 1002)
	id 8780CA8C4C; Thu, 13 Nov 2025 10:06:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fontri.pl; s=mail;
	t=1763024894; bh=Kb7u+lszG/nXqIAGpk/hByhDC/8HGhmWaIRwB9KIYkQ=;
	h=Date:From:To:Subject:From;
	b=VfrnL0dqSCHy1l/ZyXABQ6XHPN2zZWg7aJPZyeoHl+tCbcEzT8cNcY5NsMIks24Xq
	 zRxUjR9DyiJpaiWL/DjpYB+inieZaL6nT/9ta5FevAjGI40k3CtMTgcjQ2VY9o1+RO
	 6PXgf7tEUaE9BlxZ4sD2DdA0CurIkWQ8AALD9PopItXMNlwr1ooiEcOdDuf4qMidpR
	 +ZVMX9mCHmCIU0YWMAV9s+edwxip5AgtpTEwfFJH1lXbQQRjY4uiQxMIoeqr4CqTu1
	 o9dK4V1J8YqDURCkTHBQ7G0YJd8ol4mJADoMseJWiD/cP8NWvsgTWU/VJDDiKskLgf
	 1AZUgXW9MqjRg==
Received: by mail.fontri.pl for <linux-mediatek@lists.infradead.org>; Thu, 13 Nov 2025 09:06:25 GMT
Message-ID: <20251113084500-0.1.sc.5zr67.0.dqggc3na46@fontri.pl>
Date: Thu, 13 Nov 2025 09:06:25 GMT
From: =?UTF-8?Q?"=C5=BBaneta_K=C4=99dzierska"?= <zaneta.kedzierska@fontri.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Odbi=C3=B3r_w_paczkomacie_?=
X-Mailer: mail.fontri.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_010844_496839_1FAD313E 
X-CRM114-Status: UNSURE (   1.03  )
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

jako lider w us=C5=82ugach kurierskich w Polsce przygotowali=C5=9Bmy elas=
tyczne rozwi=C4=85zanie dla przedsi=C4=99biorc=C3=B3w.

Stworzyli=C5=9Bmy abonament =C5=82=C4=85cz=C4=85cy dostawy do Paczkomat 2=
4/7 oraz obs=C5=82ug=C4=99 kuriersk=C4=85 - jeden dostawca, jedna faktura=
 i przewidywalne, sta=C5=82e koszty.=20

Czy mog=C4=99 przedstawi=C4=87, co mo=C5=BCemy zaproponowa=C4=87 wzgl=C4=99=
dem Pa=C5=84stwa potrzeb?


Pozdrawiam
=C5=BBaneta K=C4=99dzierska

