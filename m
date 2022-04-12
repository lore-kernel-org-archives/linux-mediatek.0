Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CC3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=20HxK34+uIt1wSFhIYcQiYk3kUN9i+68VOsnikuzCO8=; b=K76eFM3VF6Xm1i
	MiJpgzrL48+CSrt5rdlopSvoinyTV0hVy9ldKMcUwbJtXfnxRzv/vybV5Iylpfsv1Kb+9x9lCDIaE
	nb5b97+uI3X+m4zwOIDRdc88cJMCHLqUFkpGNaqwC3GfDfUeIOl+0TEw6jSoH4TyG90vYNGaLe2M9
	dz6dt4tnYsdMGhNpUnjyLJtYCBAyFgY9OGzOypVKOTPVAxTFOJ+eMBMa8mRRdpVU/RTxJ3YdQoduZ
	Xa+ld/Ynay3o24K4pVT4xgTYs4Fgcg7ZAdfOilmuCA5aTOndeXoqzCIDKnKsmtbxgP2/lgBJr4oxT
	NAe90mvaDzMdKGIWJOAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBS1-00CPY4-Dg; Tue, 12 Apr 2022 08:00:37 +0000
Received: from mail.growthmindset24.pl ([212.237.36.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBOa-00CNYg-FY
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 07:57:08 +0000
Received: by mail.growthmindset24.pl (Postfix, from userid 1001)
 id E69CE8817E; Tue, 12 Apr 2022 08:56:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=growthmindset24.pl;
 s=mail; t=1649750222;
 bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=aXZyX7lmQEnRNP55crVvsxx03xJjJ9nKlxq8dG7oVjy+UYOp9jyK3X2Tqt+XudI8c
 JoMz6ReAV4FnRdQlpzKKKbh3CQAqd6lFRMJ+pOL+1qi2WVGopOL6LHzGghVYWoYowY
 zP1tYB3E1TjsnE4xUpCVFuWtSizNK5H9RZ1sUz3wo1QJISdVOOcF9F6tMavakkYn06
 DuYXHPcsUz3XjjcP+ieP2+DM34CtgwUkp0XGkRW3i+rhnE1L2Ey7wGjjkaN9K+8Z4k
 mDNnzoN9vfxjhSeDgFEbeysP6F0VGdtdd75WaHhsjlj5iwUsbehJAmu9Mqfj81MYF+
 LpUZIG3lVxZAA==
Received: by mail.growthmindset24.pl for <linux-mediatek@lists.infradead.org>;
 Tue, 12 Apr 2022 07:56:00 GMT
Message-ID: <20220412073001-0.1.2w.d8ig.0.igg02jmmpt@growthmindset24.pl>
Date: Tue, 12 Apr 2022 07:56:00 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@growthmindset24.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.growthmindset24.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_005704_725569_2729D78B 
X-CRM114-Status: UNSURE (   1.68  )
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
