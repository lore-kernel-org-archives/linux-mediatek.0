Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CAF606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vkuL1ZBL;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=G3cyFj0t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XGfLENNooPzAeNtm0T33ShCUIPvqc0XdxS3hZepn6W4=; b=vkuL1ZBLlkDf+Q
	eV/bhipJ25X3ZC987ZM7R40iFVMcK446oVKL9/aJfyFiuI+hLt4vb9hCtBo7qsQjNZRvqplQbqbz2
	zRdkSZ/wwR59GBiTujex6WShJC+nhUSai2nOLcxg8ScrE6DUR+vJUZEra7FQ369SZUy9shTrnEe/f
	p60XzxhzI8LHkkzv6BLx22J/75KMaTlq5dOmCyu03eHBfaMm7q1BLCSnBvoFfwYRpkxpWZnyCWnrY
	3TOFUA7e8TmqzUa5hhz8XCZMLD35gfaeOM4ierMS2q9emQ4z+XLx/4YnHztygJl8Cu0ENIYXpETcI
	LxLzw1nF34VmYYvtyT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBP9-0000000FzGL-2eX1;
	Fri, 23 Oct 2026 09:17:39 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBP5-0000000FzEo-3KMP;
	Fri, 23 Oct 2026 09:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=XGfLENNooPzAeNtm0T33ShCUIPvqc0XdxS3hZepn6W4=; b=G
	3cyFj0tPc+iMbXGv6JK6l0/UoTCLmSmKsejmKIzPhr5dHdtWngfLbaZTOY2Tv5J+
	Q2jQyvaXxhL3qVwsgmuxUaGdz2O5P2yRxwzC3C/dVNqaq5EagcacZpwk96UsLvYz
	bgImFHXXrlT08Y20IkB5Ak64gve5Bn7n6ElDnlxKRo=
Date: Fri, 23 Oct 2026 17:17:12 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Felix Fietkau" <nbd@nbd.name>
Cc: "Lorenzo Bianconi" <lorenzo@kernel.org>,
	"Ryder Lee" <ryder.lee@mediatek.com>,
	"Shayne Chen" <shayne.chen@mediatek.com>,
	"Sean Wang" <sean.wang@mediatek.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re:Re: [PATCH] wifi: mt76: mt7996: stop radios after add failure
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <7aeeaf3b-7a06-4e06-b5d1-94b97fd081ae@nbd.name>
References: <20261019013146.1488644-1-yaojiale02@163.com>
 <7aeeaf3b-7a06-4e06-b5d1-94b97fd081ae@nbd.name>
X-NTES-SC: AL_Qu2SAPufuEgo5CORZekcn08ShO49XMOyvfoi2YFTc8wEpyXixB0NU1p7LEDowtydLAKTmQelYAN08clCeqVbv4yZX5T9ZHrotfu9GHoqlQ==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <12f79a9f.8251.1a1680ccf4d.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: figvCgD3_2cYJttqJmpfAA--.6100W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BghW2rbJhgJ1AAA3A
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_021736_201204_0A11FB25 
X-CRM114-Status: UNSURE (   3.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRmVsaXgsCgpBdCAyMDI2LTEwLTIwIDE3OjU4OjA4LCAiRmVsaXggRmlldGthdSIgPG5iZEBu
YmQubmFtZT4gd3JvdGU6Cj5PbiAxOS4xMC4yNiAwMzozMSwgSmlhbGUgWWFvIHdyb3RlOgo+PiBB
IG11bHRpLXJhZGlvIGludGVyZmFjZSBjYW4gc3RhcnQgb25lIHJhZGlvIGJlZm9yZSBzdGFydGlu
ZyBhIGxhdGVyCj4+IHJhZGlvIGZhaWxzLiBhZGRfaW50ZXJmYWNlIHJldHVybnMgd2l0aG91dCBz
dG9wcGluZyB0aGUgcmFkaW9zIHN0YXJ0ZWQKPj4gYnkgdGhhdCBmYWlsZWQgcmVxdWVzdC4gbXQ3
OTk2X3J1biBjYW4gYWxzbyBsZWF2ZSBmaXJtd2FyZSByYWRpbyBzdGF0ZQo+PiBlbmFibGVkIHdo
ZW4gc2V0dXAgZmFpbHMgYWZ0ZXIgcmFkaW8gZW5hYmxlbWVudC4KPj4gCj4+IERpc2FibGUgYSBy
YWRpbyB3aGVuIG10Nzk5Nl9ydW4gZmFpbHMgYW5kIHRyYWNrIHJhZGlvcyBuZXdseSBzdGFydGVk
IGJ5Cj4+IGFkZF9pbnRlcmZhY2Ugc28gdGhleSBhbmQgdGhlaXIgbW9uaXRvciBzdGF0ZSBhcmUg
cm9sbGVkIGJhY2sgb24gYSBsYXRlcgo+PiBmYWlsdXJlLgo+PiAKPj4gRml4ZXM6IDY5ZDU0Y2U3
NDkxZCAoIndpZmk6IG10NzY6IG10Nzk5Njogc3dpdGNoIHRvIHNpbmdsZSBtdWx0aS1yYWRpbyB3
aXBoeSIpCj4+IFNpZ25lZC1vZmYtYnk6IEppYWxlIFlhbyA8eWFvamlhbGUwMkAxNjMuY29tPgo+
VGhpcyBkb2VzIG5vdCBhcHBseSBwcm9wZXJseS4gUGxlYXNlIHJlYmFzZSBhbmQgcmVzZW5kLgoK
SG93IGFib3V0IHRoaXMgb25lLCBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjEwMjMw
OTE0MTAuNjI3MTc1LTEteWFvamlhbGUwMkAxNjMuY29tLwoKPgo+VGhhbmtzLAo+Cj4tIEZlbGl4
CgoKSmlhbGU=

