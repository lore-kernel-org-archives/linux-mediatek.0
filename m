Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC24CFC274
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=; b=aGWoln6zk6M8tEfP8UUXiMIekI
	MVCW6ENUFyFE8NPzMROrTA/RbtQrXD0/f1XgpA650N1WfqdyK9vIauL1H+TkqpNnVrar/9eDw/NRk
	dJaokExP+scNjAGqI8VbzwczMI59Rm+hpf/QMHf7Q0pUEbRgdlnKx3pETQJb63OK1uJOkLkwTCq2Y
	a5lvGZdoCNNA1AnnRL/c5fUqEmGB4XiTMf24SsX8aEvWOnjplj8N3GLBgPDfnm4tzFndGS7kK5bRs
	RJw3H9XviWXB7d4esiGUce+T2bGhaK8uvyQfV97XSMnDiN/zAgIypXM2H8nOGFaRG1/uGDdua039w
	xcHFm2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0caL-00000007RMS-2akY;
	Tue, 15 Oct 2024 08:07:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cUl-00000007QS9-07od
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Oct 2024 08:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:To:From:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=; b=StI2rezmMiMVdgZOitgbrK+GQS
	8WWNpA5rELmuRh+rLDc90gJXPhDGZUgYEB6FhDNqt6FqcKVvu+E8VTIrU1lwK7dSKfbu09YHFuPWX
	et/J4QjrpaKui2BEmD7QPGquVehc+KEjfIfuKTJjSKREf/6VQcac+sD2hA9gwPXgAEyWfqQiDeMm4
	t/ZisS25VS4kNZF+UQNHEXxNyE1SILgyKady8+S99ULefE4gIKxSDf7GSv7ji1yoWNVt5mZP6MBeG
	M15J7gZ2O0Al9acEU4X13q8Qq6T4hEl6S5n1yz8cKphdly3rxEEaCunoaYXupcstKOoobJlxSos96
	B8WJpN1g==;
Received: from mail.geniusthrive.pl ([217.61.112.199])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cUf-00000006VSZ-2WjY
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 08:01:29 +0000
Received: by mail.geniusthrive.pl (Postfix, from userid 1002)
	id 90F2986EC9; Tue, 15 Oct 2024 09:56:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniusthrive.pl;
	s=mail; t=1728979064;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=Hcv7j+t1Zo+8BgoSz/HyqiD01pFVHKqK0h73vq+mDdxFyKIwZOUERzoC9HhgNdn3B
	 8NP450qVRhKIxB2/KIgf84qKkeSukhyLZUlHWm2vbcMi4KNK2xoXHg0jNouIO6NK7E
	 sElEAbyYOH7P8251Vrp6L0CNj4T8wWbaqmn9rUDXu0hWntB1NuJOqASUR0mBWkggyX
	 54XG6fn4P/sRb2tyOM3cWI1XuQboDQI+zTK1AMF1KhMDrRSoU9eSgxSJJXeFGlvLpd
	 akJHSOLBfcWKQZmp/lp3NYZn1HnFdocGyKO3x83fgHYLi54WGTCSMqhPfBwRUoHxSJ
	 Oo0Sw47uYYzCQ==
Received: by mail.geniusthrive.pl for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 07:55:30 GMT
Message-ID: <20241015084500-0.1.aa.1gs1z.0.csvsgfolmc@geniusthrive.pl>
Date: Tue, 15 Oct 2024 07:55:30 GMT
From: "Patryk Wysocki" <patryk.wysocki@geniusthrive.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.geniusthrive.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_090125_838479_67405FE4 
X-CRM114-Status: UNSURE (   0.46  )
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

Pozwoli=C5=82em sobie na kontakt, poniewa=C5=BC jestem zainteresowany wer=
yfikacj=C4=85 mo=C5=BCliwo=C5=9Bci nawi=C4=85zania wsp=C3=B3=C5=82pracy.

Wspieramy firmy w pozyskiwaniu nowych klient=C3=B3w biznesowych.

Czy mo=C5=BCemy porozmawia=C4=87 w celu przedstawienia szczeg=C3=B3=C5=82=
owych informacji?


Pozdrawiam
Patryk Wysocki

