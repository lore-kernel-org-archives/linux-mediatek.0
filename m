Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4F7C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 07:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=20HxK34+uIt1wSFhIYcQiYk3kUN9i+68VOsnikuzCO8=; b=SO/Mxk92lKcdz/
	a0DsSzC6Cue7u3YPcrdJzglORxjZszO6OifhuAO7bJyvsenRXcDLhp0vI4dIm4LSH677xZrI22UX2
	mSvPyB0dMayZut87e46pnmhre6+7Rjc4COoQ+/sovjwBNl37pvxwLDo3BD5ej50QqMNM6xv2P8ujL
	mPZ2zk6dHVx1L99yRNUf+20rnAZRmr7FsakSzC7cb/Quoch4pY1qjqWB5Bs6VHPmRrmUuB4tPBPiE
	oe9JG/ccAPZPV46RDqcLnxQ/LN1yLPgmgAt/akgtAbX+Hik5l3sK2wkJMTgFcKCKfupBydmmWpAmh
	dVZJ52Bgg0DgOAPOiw5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh50A-007qfC-CG; Wed, 20 Apr 2022 07:43:50 +0000
Received: from mail.fixingbiz.pl ([217.61.22.139])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh4zX-007qKs-FM
 for linux-mediatek@lists.infradead.org; Wed, 20 Apr 2022 07:43:14 +0000
Received: by mail.fixingbiz.pl (Postfix, from userid 1001)
 id 0159CA2A65; Wed, 20 Apr 2022 08:41:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fixingbiz.pl; s=mail;
 t=1650440562; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=P//3PXgoFlo/pIai7toAgDnVASkI+1F2BPp/ZAzeA6dD3OCOyyXotyf1SW+ICgNeg
 QRZImiQ3bReUp2ZSzOZd0GaKUCCpJD7VDt/W66i8L1b7+06dKxnwZsvo0o9sjohSWB
 n7bSAXK6RF2IDmGnU4sDCn1/Iw9GK0PD/JZvI9a2sIX9APY0SeyR5rwyaSw+Y8zKia
 q9iPbsftkaHqzvRYSuZJF3z/hxttmBi/kap7CldeJMtmep4Mzuv3QqmePq9ztH4brz
 l2FIOebRmH/imZCnvBDrxyqF+qNMPsy97l47wJQxo+7CPjzMb9XXn7zfDIH+YiGvOc
 vqCC/XUD9EXew==
Received: by mail.fixingbiz.pl for <linux-mediatek@lists.infradead.org>;
 Wed, 20 Apr 2022 07:40:53 GMT
Message-ID: <20220420074501-0.1.1x.6u3i.0.gth9dvjp1h@fixingbiz.pl>
Date: Wed, 20 Apr 2022 07:40:53 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@fixingbiz.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.fixingbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_004311_736062_D493B336 
X-CRM114-Status: UNSURE (   1.84  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sClByemVteXPFgmF3
IFdyw7NibGV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
