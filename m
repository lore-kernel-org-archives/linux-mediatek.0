Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FF8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=20HxK34+uIt1wSFhIYcQiYk3kUN9i+68VOsnikuzCO8=; b=YjL2bC3nSLBN9N
	41hIJuxFsGcw/og/gUKt8/p4PY176h828haMe5ef861+XavRKpbuCJE0mFy1o+LTHoEP7lCyArq05
	8L+XB2E+MYr/k/VwTug8RZoqbYNzoRbNE08aqbxdNDt/qgdJa/PZxlfkiM31yfcsM8k/X7i8rlI8K
	lzb+v1iz8t2Wvs92hDP9jSOZBXU3uHYdcLCqanKEADh/JMsveSMbQjHz/W5QvlZy63pe1gKHQ5t7e
	oF+T2ivyzof1zufiLgh15HCY2q4TTtEznqi+E+ML9culewU5dMhMtHan240rADxU2P1Djd24l8N8e
	Q77hzL/gpzYH5GiDRygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njc6c-000Gil-Rn; Wed, 27 Apr 2022 07:28:58 +0000
Received: from mail.fixingbiz.pl ([217.61.22.139])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc6Y-000GfT-TH
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 07:28:56 +0000
Received: by mail.fixingbiz.pl (Postfix, from userid 1001)
 id A8A36A4E60; Wed, 27 Apr 2022 08:28:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fixingbiz.pl; s=mail;
 t=1651044532; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
 h=Date:From:To:Subject:From;
 b=dJTOuu/YucK8x9u56h79UyFLOC4P6j6QbtSqmlpcH0tukLqmwHi4cFncwK/hG489c
 teUHp1iQ9QEGJuKGqKEB1ggHfymaN65PSFoLdTR5kXC16Xca2PjdbIMTNi6xkkh4by
 qxlTbAD5xgtTXmOLlxt0+MbzlEeZEAOwDLr90/TZZVWUN0xWP4pXHHUpFd6VgCQ97D
 CufoTfTu2JVGLufdER3NTbvG+3bRE6f98+d5apGco9ZThREuAxrFcjRTnnldT6xyd3
 bMKR9EpqI78zPU1IoUXRWIn3nQsZ5XnDV7Ryw4zRnE6d7/TbOuhwIrGdgyGyDnbFzu
 lD2CBGnOIrYag==
Received: by mail.fixingbiz.pl for <linux-mediatek@lists.infradead.org>;
 Wed, 27 Apr 2022 07:28:09 GMT
Message-ID: <20220427073002-0.1.22.aibi.0.pokf1g6rea@fixingbiz.pl>
Date: Wed, 27 Apr 2022 07:28:09 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?=
 <przemyslaw.wroblewski@fixingbiz.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.fixingbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_002855_118465_1C964910 
X-CRM114-Status: UNSURE (   1.66  )
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
