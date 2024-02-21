Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EDFC48BF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Feb 2024 10:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=; b=GTSBARmD8HysGTi8jXLTNPsEi2
	sWNmmV4i8sKOA1PxqQRFx6rRNJ5Hwf14MDvscbMvlu1hyeTgfCo+t8q5EzxesLVxweZwwh6Enk4qJ
	Kzu+pQC/exfuVufUjJ6V4PWHh/2spSOsDGzk1PF4C+9Lp8oEnryEF7pfSiq87LqOnNklbam2Q26ry
	cIm+AHac5yzXWRZ88tA8caJ5Z59bNMhOrd/o2wz4JKsWE8He/XlSXBNqaojuFbGutwrmIw75V7Gng
	oBaB9SP5Q7kxcUzmDrYzRYYVonznqDHk2J2lHgQY04ZjUTkoJdYgxxjHANEbt8YMabLRxE/75P1O5
	sHRDd4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5sM-00000004OSE-2SMe;
	Thu, 22 Feb 2024 10:00:22 +0000
Received: from mail.thrivehub.pl ([164.132.48.43])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5sJ-00000004OPo-425E
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Feb 2024 10:00:21 +0000
Received: by mail.thrivehub.pl (Postfix, from userid 1002)
	id 1161E25B64; Wed, 21 Feb 2024 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thrivehub.pl; s=mail;
	t=1708505191; bh=m3ZUCTPRVLoDFM+cXi7VhHW+xNF3eUdGHrj1eDbLwQI=;
	h=Date:From:To:Subject:From;
	b=X8Qb1x3ASa4M+8lsEdyfo+ARGRdj1I/OLhM9m/czTSg8rJ9vNW+0XlQEh1LYWovlo
	 DoacGdx02GFLAX+Mi1NrMRKQ/Nv+MZMjfElnWMCeQbcBy6pYb16IMyquJTsXh0qE9f
	 k98Te0L6yYJz/g0778OitYQcy0isrp/tEm7xstkwgKct9eqFjm3QA2kVXFJaSy6rxA
	 ph8vIHvZG+0Lm4UILusuESXqu6u/ZgEG9bPT2tZ7hgvkpy+le+QS5xrS+aoYqfFu17
	 WnTUwmATlT4PMrRZoAQ/g5zSE7gol0SxN//275hq1WTbWH/JLkYm6hBDwZqtwh1CyO
	 Ql1ugryuPz40g==
Received: by mail.thrivehub.pl for <linux-mediatek@lists.infradead.org>; Wed, 21 Feb 2024 08:45:49 GMT
Message-ID: <20240221074500-0.1.4r.233mk.0.okjb07kelu@thrivehub.pl>
Date: Wed, 21 Feb 2024 08:45:49 GMT
From: "Szymon Jankowski" <szymon.jankowski@thrivehub.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.thrivehub.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_020020_159702_01A4216A 
X-CRM114-Status: UNSURE (   1.62  )
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
owych informacji?=20


Pozdrawiam
Szymon Jankowski

