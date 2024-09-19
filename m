Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A483CE8D52
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=; b=AiBVnHS1VnwLQJPUxzZ9rkCJSb
	yIbSkOM6JyWwTWNPtIx7YiP2OXysDJXTjL1lv/aZI4IHPmWIP5ihGliDqpkVO/I3HqJZVin84rGPC
	FXD6D9emOr2Ih4zxxGZ3qMWhSQTOnVZBCp5a9e2Frho8IIBZJ+Zr3IPvNxBbxzDXKQze79VuDC7n7
	jA6Z+JJBlkwOh3mIEQKwbZQgp4oJ0NxbSne6+ovti3co1a9gplyFWk+NgtLx7UGe730d968lGyLOv
	E0IRJ071gPX/xHEY0tqZ98izhupo14PTziOqKqql02vQJUV8hP/EWtqllixI678Y9ZIQtB3jXIRKc
	DTwx9zvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srBj6-00000009fSl-03wb;
	Thu, 19 Sep 2024 07:37:20 +0000
Received: from mail.geniusthrive.pl ([217.61.112.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBj2-00000009fRJ-3Hlc
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 07:37:18 +0000
Received: by mail.geniusthrive.pl (Postfix, from userid 1002)
	id 5783683D21; Thu, 19 Sep 2024 09:36:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniusthrive.pl;
	s=mail; t=1726731389;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=d5DJG55trl50t1sjBMoh4xd55TahKGjHODfVjOZAwsDaVbTZXMzxEbhiYG5VdUVUS
	 s/TJmdsccSIh+nNghRQLjHrNDE6gGUuVXmuwUQYNpytbkYZC7U/uRCnYlSVdiM6n81
	 MT/9+HTT3yNSczkWofCL8NchBnbeW7aRHFleIBzyVUYB3fAmxH/PExbpboQvi9gW61
	 CVk2IJ0qwhdyzVAmelZZ4/YYYd98MKEir6eSUNOhi/5NpgPc4plRbcdGYyuapP9Rs4
	 3w4T+1JDzqwCjfw2kBMllU+9S5woe5yfOP2+2B2buYi7BLNbTKmTLelUrUE+vjj4fM
	 Ig9D7pqq0tdGg==
Received: by mail.geniusthrive.pl for <linux-mediatek@lists.infradead.org>; Thu, 19 Sep 2024 07:36:00 GMT
Message-ID: <20240919084500-0.1.9r.16cq5.0.st6rna0hau@geniusthrive.pl>
Date: Thu, 19 Sep 2024 07:36:00 GMT
From: "Patryk Wysocki" <patryk.wysocki@geniusthrive.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.geniusthrive.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_003716_958178_058C771D 
X-CRM114-Status: UNSURE (   1.10  )
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

