Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB2AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 08:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HkKdJ8hKEKJ+VqGmShNTolEoJXmAbeZTiqctGEBFZvY=; b=21tGOr6yBY7Tq/
	l7UY+qKLFHYUNQoC/fzo00xR4Q6XqstCY7utAJWkKvH/RUbevYxFqsP+6WQa+4k1w9VR8GPoj6gL/
	VpyLqfpKQHqv4f5B077GxnO1d7O1Ppgb9FHdPqDlu5g1SOOiRXXFfrvxy2uQQFVro6ckIOH0U8gBq
	g8ExBPoHNb0v3IASOgS/RKhoSELc1FOLz2bcCR4hymPq4lUFl3kFN1GxXAXn8TSm1TIDnylUW8XOl
	SFi2SjpqfGEl5lJCROrb3574clHrzrxcUPgJQZhQeHPooKuu0TwrCaAhBhyEBqgk3d6NU6snAs73J
	Ld6I+XocuFpKb3alng2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUGx-005ipE-9R; Tue, 07 Jun 2022 08:09:07 +0000
Received: from mail.forindustry.pl ([37.187.225.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUGr-005ilz-Rd
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 08:09:03 +0000
Received: by mail.forindustry.pl (Postfix, from userid 1002)
	id 68738A3F78; Tue,  7 Jun 2022 08:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=forindustry.pl;
	s=mail; t=1654589178;
	bh=Vw5jk5D1DE7WK/GNf/MxRQNyAyPYcC0rMJLibxKTj58=;
	h=Date:From:To:Subject:From;
	b=H/nM5mO1FiA/0i0PjE9UXSUwmIo1ElNaZj5wweNWHbazXL5k26tM3iT4NBUeZAWOR
	 tXFQqdoz+3AqXnVx0tcKkF+Xy5K+/ZKjbYh2QUerOjH+Ti3XwQGoEQWzK44WdYIMmG
	 a03woWPphMDgrr6OEKqjww5Jj4nkVTuIR2VRLZ4I2KDJ0wG1vz/f+1LG7jfl5dCsrp
	 1NPeajm/qgGT+jbgCIWkqycWgU6DZy2Vr66P4mPONW6hNLXU4yFOfDX1hPMmsYaVF9
	 724oKW7TgDKGelx+UznJVzQpIKpNHVx6oS/Z8XZPRV6PqomFMNs1gDbtYmzGUaWVAI
	 BcjPzo3K9YnJg==
Received: by mail.forindustry.pl for <linux-mediatek@lists.infradead.org>; Tue,  7 Jun 2022 08:05:52 GMT
Message-ID: <20220607064500-0.1.3o.od5v.0.rpp9y6i3ij@forindustry.pl>
Date: Tue,  7 Jun 2022 08:05:52 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?= <arkadiusz.sokolowski@forindustry.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.forindustry.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_010902_113547_C9282B10 
X-CRM114-Status: UNSURE (   0.99  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKc3R3b3J6eWxpxZtteSBzcGVjamFsbsSFIG9mZXJ0xJkgZGxhIGZpcm0s
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuCgpT
cGVjamFsaXp1amVteSBzacSZIHcgemFrcmVzaWUgZG9ib3J1LCBtb250YcW8dSBpIHNlcndpc2ll
IGluc3RhbGFjamkgZm90b3dvbHRhaWN6bnljaCwgZHlzcG9udWplbXkgbmFqbm93b2N6ZcWbbmll
anN6eW1pIHJvendpxIV6YW5pYSwga3TDs3JlIHphcGV3bmnEhSBQYcWEc3R3dSBvY3pla2l3YW5l
IHJlenVsdGF0eS4KCk1vxbxlbXkgcHJ6eWdvdG93YcSHIGRsYSBQYcWEc3R3YSB3c3TEmXBuxIUg
a2Fsa3VsYWNqxJkgaSBwcnplYW5hbGl6b3dhxIcgZWZla3R5IG1vxbxsaXdlIGRvIG9zacSFZ25p
xJljaWEuCgpDenkgc8SFIFBhxYRzdHdvIG90d2FyY2kgbmEgd3N0xJlwbsSFIHJvem1vd8SZIHcg
dHltIHRlbWFjaWU/CgpQb3pkcmF3aWFtLApBcmthZGl1c3ogU29rb8WCb3dza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
