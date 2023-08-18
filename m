Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BD2C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 08:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=; b=b2m833wlnva+GOvqyx24J9LSHS
	UqzL3mQ/swETCc8KPChy9/iXCzvnERzdVpXj32uqPM0LGeI7uGP/+nNXoNEmMksLW3cPhuB5lnT3U
	H5YmS8UNCx4RnH4ZbxLaBQW1qrDYkmLEvQXGf8X7wKXiDfzzv2EVIc65wi7IMLF+ErHQ+6jzU1VoG
	vWLWgT+XFe3AzjdrFn9y5vv5RiD87C1mWH3jXkBnrXhrUUIXHqRmZVIH/81UHbJL8Tjhe+ENr8ZQe
	aKSeZ9I5dVk/WdSaSIW32+t8vPqzUjQTeDZW3h2o+odJtGFb7tsqZnggxccqQKG9Dl6f5R8oOrvdU
	2IkAEGPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWugh-007ysa-35;
	Fri, 18 Aug 2023 08:18:31 +0000
Received: from mail.leachkin.pl ([217.61.97.203])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWugb-007yp6-2A
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Aug 2023 08:18:29 +0000
Received: by mail.leachkin.pl (Postfix, from userid 1001)
	id 7AF6F843EE; Fri, 18 Aug 2023 09:16:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
	t=1692346586; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
	h=Date:From:To:Subject:From;
	b=p1hBiLJ08sgl/1GnzTZrCCcGQlwo6WcwhMBtPGs8HyqNoa8yy1Bc57TJhPUSr0f3Y
	 e9auvHmE4FbLut+tsyGbjYThSaMekZpvegTZ0CPzykPFJLjj9lrM6RAtM9igwT1vPD
	 qcIw1cQE8KaDnZu50Iq73yrw8DhF54OIT5qMjpuDGT79TursCzGuY8QhmMVqmh1zMd
	 2YWVeYMJcex8bZGCzJIsDGnJv+you6pm196FvbIYRFwdxYmebd54lKS+zXzlwIstCD
	 hJ1yKjZWHMvdS77wxfGIttqRcY84judqOXuGgWK1XDrX3m1oJAYM6kz00DxLdeyFM/
	 dnIqrloA998Vw==
Received: by mail.leachkin.pl for <linux-mediatek@lists.infradead.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.cu18.0.niian7eb76@leachkin.pl>
Date: Fri, 18 Aug 2023 08:15:51 GMT
From: "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011825_851878_2BC3CB68 
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

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak

