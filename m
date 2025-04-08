Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FEAC369A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:To:From:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=; b=hJUER2FTrcBhFSq19Na8srTViz
	gto1s+Q+zHcRkP/bDAhm08EJtzJWvC7NnhuEDPFZmXl2J5NLBkbYrEYjOmh/pqLg5E2pp7WkHXaMF
	8YAbD6y+hjzEVCYidc5paOqiMmhnJ41TGsMM/HrEK9TKiLWP7CzSASpnW/J4d+szfGABQZBLTQx0q
	F6yXC3/sGCbmrfJy+awNyIKUve+5hhySql05RBwmXI44LLhY0s5cD5/ve68HRG4c0gp2eBEN6E1wE
	oysvZzQAnPo8CYaaxSrz+bGLMGZey3FM98SrCC6AHd1VSP4fGdDgJMlcg7c6b8YxVwzM0eLGBU6nS
	MOrmymmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u248l-00000003DVL-0tPu;
	Tue, 08 Apr 2025 08:17:03 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2447-00000003CKB-1BAj
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 08:12:17 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id DBC5EA3F29; Tue,  8 Apr 2025 10:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1744099918; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=I8qLzDY4jpVUGaCGpu0eD0ClPnTAO+8A8FA+y5mEbzcMYV7gngBQhZwSajkO3UW5B
	 BurpZ9l8EVEZccMljrzNENFXpD1EkfSOAoel3CnBsx7PN7bZ1YS8yAW70DtwPXLVlp
	 mcksyxX01QVS/qtrb2FIZsja380apKbuD4IyVEAhMr44gBitmyh/VqpdLBfMEcO8Hb
	 e2RcA0PPZugWB4KgRMd93TBlVrbai6dHvpvXwrt8s/QQSFNVqo7dKCE+eiPIHYYDIa
	 yh2V2upQToXFROUgq82T1DrsjJRP2PGpOWKlIU6+8wNAeIk+0dV84SZ+3piYQGrVAg
	 uNtef885YFjNQ==
Received: by mail.novaplan.pl for <linux-mediatek@lists.infradead.org>; Tue,  8 Apr 2025 08:10:26 GMT
Message-ID: <20250408084500-0.1.kw.1n7s0.0.q2k4x52hkp@novaplan.pl>
Date: Tue,  8 Apr 2025 08:10:26 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_011216_026862_D6856472 
X-CRM114-Status: UNSURE (  -0.00  )
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

