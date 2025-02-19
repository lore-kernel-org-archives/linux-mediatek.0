Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD62C021AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2025 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=; b=PHzufk8kn9hDc5AT8UuPOmaTq3
	H+CH6roMMICRQMwP2yXxhIE8R9Y7ixq+fD+mko9mtpHL11vXUjmrasEzDNJAqcwSRmc8SP0Pf0GWA
	KMTzWr3V36dQ+KHPTfmicSylC90urdbx45DBiVi24Wu2ahrex6ySi2X84fIzdXhPXPmYP7pM++K1n
	qrMAsO16LwenhEKO3xvgGh7ErT7KczAmtmCQSbMOBDlydQeCXw6W0cFlqrRDK3FLRJdyJCxBb9dVw
	lM/EjM2qCG+DT4QSQtYbKmyyamMFp15HYrdiEt07sR7SWXqmePR9H0UH02kn4pPPhtWlagd6nVwJg
	fxHbVNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgKY-0000000Bpxg-1crb;
	Wed, 19 Feb 2025 09:25:22 +0000
Received: from mail.corporix.pl ([151.80.59.204])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkg7i-0000000BlA8-250P
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Feb 2025 09:12:08 +0000
Received: by mail.corporix.pl (Postfix, from userid 1002)
	id 05095243A9; Wed, 19 Feb 2025 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corporix.pl; s=mail;
	t=1739955993; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=PjJVq5oXvPzvDjjZaQuWc8JtOe07kBgUTlwewFA9RXIx3FpnecGevvmhxw5GLtouS
	 bwzVNKW9rTAO0w07EZzQC7ip7uGwbNmltvk7k0SyorteLp9UO1IpbgegcbB/j7sCJe
	 PdQsHt6v+Fse6n5teXsamhR2ljLbwrg4OoFWy2jhFaGo2WduMcP4LiCYHMx64q3p0t
	 0P8RtjfLce+6SM+Pifjbomq9ZEkNWtC61fUV1ly99ZOpYS5m1Hfpl9STgehB/qdCqU
	 JvjfoxQAvXT1iRND9FXVNwd7o0qB5hBnU4W0qQsf4REgFHfnahL06QWQD4/NPFcXKh
	 AMHjN4KfnmdNg==
Received: by mail.corporix.pl for <linux-mediatek@lists.infradead.org>; Wed, 19 Feb 2025 09:06:02 GMT
Message-ID: <20250219074500-0.1.h.4e6v.0.22u7uvk57n@corporix.pl>
Date: Wed, 19 Feb 2025 09:06:02 GMT
From: "Patryk Wysocki" <patryk.wysocki@corporix.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.corporix.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_011207_157779_2DD047CF 
X-CRM114-Status: UNSURE (   1.52  )
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
Patryk Wysocki

