Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC21D3B7F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=; b=Sg8bOYf/TEmFOBdbUn3EPyYtfJ
	jl5MFYJNXsW3aVaULSITx+Yug1aYsKeUbBbnOVI+oNZrLbJFq7roFTZlKIDrf0EFYv9XxIEZlAGRT
	XbK1HpAusz6wTTPSyPw4kRGIVQtNSUDMNVgpjR+kjPYGH2l2mBGSzgicVOHHxLkt5DCPtq/TxTfcS
	kkkAlpBLGwn5FpseGeIBkE2DrJ4g5ndFtXKY12Bf2elNgqA8cSpqrjW2E0HCTxckZvRsFFfpsMKFU
	SUGfAV57aAAG1jTMWsvHd5QvWBGVpuQmJ8zOwrSJucs93bT43SvED/DTmwBxX5FjyZ3VUpgg9kujq
	QYygzFEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV8U-00000007Vo1-3FrN;
	Mon, 25 Nov 2024 09:12:02 +0000
Received: from mail.sharpwise.pl ([5.249.155.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV8R-00000007VmQ-21cm
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Nov 2024 09:12:01 +0000
Received: by mail.sharpwise.pl (Postfix, from userid 1002)
	id B60CA84077; Mon, 25 Nov 2024 10:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sharpwise.pl; s=mail;
	t=1732525877; bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=syd1YDtRVUoCXOvwGsVE/WERMcFh4dYWr0oih2enKzyT3yNP2yst4AGXjbdJZssol
	 jI+Z6/jwuWYtx8rYXcuzH8aahHzDI63AV4nTzybtdMNz9qgK+37I82arnuXvgQKvVE
	 8MX3Vtu3KhMRiGaxq/1XtmfyuVu+ElEG1lu8qCOHf+7mC0mxwnqOjMAosnM1yerv/k
	 mfHtcoM235SCmX3JjV7ekHvnT/cjZ8ptY6U5nQDWRL4pl2CebFnvzJQe9FAM3m9EGi
	 xmJGeWdJ6uaLiXN/z1vwsLwi/o2gkDDlXmdxp0UvoBEsnOvFhVT8gPkBBcNLZ8tk0D
	 V1QD1Plblw4Sg==
Received: by mail.sharpwise.pl for <linux-mediatek@lists.infradead.org>; Mon, 25 Nov 2024 09:10:51 GMT
Message-ID: <20241125084501-0.1.82.1akgc.0.ti2fk744q0@sharpwise.pl>
Date: Mon, 25 Nov 2024 09:10:51 GMT
From: "Patryk Wysocki" <patryk.wysocki@sharpwise.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.sharpwise.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011200_212444_7BD1F674 
X-CRM114-Status: UNSURE (   1.90  )
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

