Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA2CC19F32
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Mar 2025 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=UqAQ+hKoIb4qN1V/DFzseljELO
	unfY+JX4iMrkAUNgSHBVnBowPMq+3HjvbfXhnfza1f3MFFrsnQivX38tzdnEix0uhM61cHRWe5XyR
	TEHofzhOxZWtbNpNEnmjCFGsPUQDSmc5MyqeLXjWmT7JA3gOoPq/YCX3r1s6tU3GBjRWDtl9cKELG
	lUoti6Z5gLnCrVXHtupjbnB7YBpWmxxtqUFFCwJmAXePuovVfp3Gwf6wImi0YKbIM0QKs+ALiu+h1
	RrM/gRkvOp3bpACr6CTTFXDri20GP6+QR9n1lkkGkoUSrP5uuH4qsj09wgi59PUBpWMpSC1/u8dWG
	CFNysTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTat-0000000DdsG-43oy;
	Fri, 07 Mar 2025 09:02:11 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTaq-0000000DdrS-0f2T
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Mar 2025 09:02:10 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 32F0DA461D; Fri,  7 Mar 2025 10:01:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1741338083; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=djKN2hOESpzpKqP0XSiNHPvxxXyTYTfIuUEZDrtvWdOVoVpac1HeK7XRoxwLt/x2F
	 HLKlCmcwUXpC5ud/s82VVuREL5FhFzUxoKYgWkPEbgwrfRHY+X/4BXWTKJkAvwFMGK
	 Pr6jlfcKXEPwPhxLswpt0kvHd5eAJZI9ihMxYuuEe7nqw8hL2tCkoqgrsi0VKlZzqN
	 VDOOOhag1MSpM2+L3qWXoERR77D/k+ugynQkYgppKS/4mLGd2BaMPa9S2CbW5IzvoB
	 2kQ0BeoUUAict0cMy86k/YxVMAmtM4SMwATcbhSzSu9pQzkH6mIOXJ79Mu7kVAaQut
	 a8C9f9+adeXmg==
Received: by mail.novaplan.pl for <linux-mediatek@lists.infradead.org>; Fri,  7 Mar 2025 09:01:07 GMT
Message-ID: <20250307084500-0.1.ka.1elx0.0.18re0u3m2n@novaplan.pl>
Date: Fri,  7 Mar 2025 09:01:07 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_010208_889848_C9FA3DFB 
X-CRM114-Status: UNSURE (   1.21  )
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


Z pozdrowieniami
Adrian Liszka

