Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEFCCA0EDC
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Aug 2025 08:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=; b=wjiY9xDYCjhYjqBjmN7dkhhAI5
	zACO7Uacm/bTu307J155/8O7Sr7pI45nUv1yGBbm9SQQ1AFA8q9LhBod2bex7Ij1Zjz/6kknuFijk
	Oed70kwa4hchBf8RUIaaDS0gCpPAydFC3NMgU21Qz/cOQB2hM4gismuJF9Agg6N1diVaXUKoeeatv
	A1uvx0goaWqqFRvOUOhc5FMh2O7BllCwoZkvKtebJm5V7GVbPcbAPmP+ltvTKKnhWxo7W1hQ8hR2m
	URwq9cB8FJeQDZ7p//TYmn7Xbk+R9BLCBJKd0sCvMp/q43w+5KXZPu/L5BE5pCrf2rJHsIdswgGlO
	Gyh1EjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTL1-0000000GFHG-2FsA;
	Thu, 14 Aug 2025 08:29:31 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umT2y-0000000GCjj-0KYw
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Aug 2025 08:10:53 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id AE41B4D005; Thu, 14 Aug 2025 10:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1755158875; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=PHcQRmuP4ijvUw3jtH7a/EmR8x1viquEkGdOI/gubLE0yRMVh9YUZFQA6Zu7xDFC8
	 Cc0FIrlby386V2Dnny9isoULtrxQgU89R+cG7LpVYaDeTlJZDhA85bRSiARGJeyxZo
	 5jLelufCsXMbC59axUfRqPFow6SvGRxHzO2CSb16LtJAZ67TNnNP0D/H/z2WtnzNOQ
	 lGH72dbtMiBf4WsSnRmdKvuAcQN+Nudo/WusZEBT/FSQjcb4X1k4dSk7ST1atGLpxY
	 TFTVTE0pT0FQBcUlj5Trk052NoZYPMYQxLFPA/Ni64MC2R3xwKNK/Fgqa9EK5oRsdn
	 8L90aJJNwdc2A==
Received: by mail.fintara.pl for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 08:06:03 GMT
Message-ID: <20250814084500-0.1.ba.36un7.0.kwa39nfhll@fintara.pl>
Date: Thu, 14 Aug 2025 08:06:03 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_011052_377857_932256B0 
X-CRM114-Status: UNSURE (   0.31  )
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
Dominik Lotka

