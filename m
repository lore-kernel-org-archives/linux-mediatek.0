Return-Path: <SRS0=w4bH=ZF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DD2C43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 03:26:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B00222CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Nov 2019 03:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WVW8OzOJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KpdFd4ld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B00222CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4MLkxKgLsQoO2X09wlPWrRVgdPjJAfqEEl+75uY2NE=; b=WVW8OzOJCEzzBv
	gsEbcaLyR8B+X47MwLnkQbo45/c8XZAQMi5fPHDLgU1z3P5ziSdNUrxdFM6W4nCvBAtD1XzBxWf6h
	YxIsjTDZ5YnFS4Vqz+eHlB8JOS+gWzOHeriuzE77QTSmJk1OiI9+tSM9Tk9cRPKZlp5omURwGrrGY
	RwuLb8rR7iXiV3ErnmfO5QFNGr5mq5in3A6tCip71h8rXq8YIFVhjvuuuMXp/zuTNC0nRp60SuK6T
	9AEK9oUjZy5xYn82Os8/0rtP+IJ6w1Bo4XzdM6lHZxQwYboQ0OcgKihkRueSmo7tsoNdNDZ/3PNUe
	oG7toE0dXgAKpJhPdGyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUjIH-0007l1-Bm; Wed, 13 Nov 2019 03:26:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUjI9-0007dS-Th; Wed, 13 Nov 2019 03:26:03 +0000
X-UUID: e7bf8c223cd34dd7924606d6a0acd979-20191112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rDIAE49LJSoVbQpJ0kmEv+2G5B5G2a/scFj/B11Af9I=; 
 b=KpdFd4lddrLeL7jARmsvUFFGiti8KhxBSFYDlmlt0tNxW5P4ELFzhsAQiHvfMd3DScmr2VHTpX7Z1694IFW7iw0P6wAEAXs7SN7u4sMxIpaiB/Sb57zBNGnt6msRwwT6J/wntWa/0RGnL6yQu2a5mh25RkuCDDOjaPPSDMdBsco=;
X-UUID: e7bf8c223cd34dd7924606d6a0acd979-20191112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1724042337; Tue, 12 Nov 2019 19:25:55 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 12 Nov 2019 19:25:54 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 13 Nov 2019 11:25:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 13 Nov 2019 11:25:52 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <lvqiang.huang@unisoc.com>
Subject: Re: [PATCH] ARM: fix race in for_each_frame
Date: Wed, 13 Nov 2019 11:25:54 +0800
Message-ID: <20191113032554.21034-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <64C83867-31FA-4243-A0EB-018AE9A83ACB@unisoc.com>
References: <64C83867-31FA-4243-A0EB-018AE9A83ACB@unisoc.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95B92524CD3366A2A5D654B2ED134B3B8F2C48BBE4E6AB8A5500FE4528A957B02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191112_192601_966610_15158DF2 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: kstewart@linuxfoundation.org, mike-sl.lin@mediatek.com,
 alix.wu@mediatek.com, tglx@linutronix.de, eddy.lin@mediatek.com,
 gregkh@linuxfoundation.org, yj.chiang@mediatek.com, phil.chang@mediatek.com,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, mark-pk.tsai@mediatek.com, info@metux.net,
 enlai.chu@unisoc.com, allison@lohutok.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBEZWFyIE1hcmssDQo+IFRoYW5rcyBhIGxvdCBmb3IgdGhlIHJlcGx5LiANCj4gDQo+IEFzIHNh
aWQgaW4gbGFzdCByZXBseSwgc3ZfcGMgY2FuIGJlIGEgbW9kdWxlIHRleHQsIHRoZW4gbW9yZSBj
aGVjayBuZWVkZWQuDQoNCklmIHN2X3BjIGlzIGluIG1vZHVsZSB0ZXh0IGFyZWEsIGtlcm5lbF90
ZXh0X2FkZHJlc3MoKSByZXR1cm5zIHRydWUuDQoNCj4gDQo+IEFuZCBiZXNpZGUgY3Jhc2ggYXQg
MTAwMywgd2UgbWF5IGFsc28gZ2V0IGNyYXNoIGF0IDEwMDEsIHRoZSBmcmFtZSBpcyBpbnZhbGlk
LiAoVGhlIGxhc3Qgc3ZfcHYgaXMgdmFsaWQgYW5kIHN2X2ZyYW1lIGlzIGludmFsaWQpLCB0aGVu
IG1vcmUgY2hlY2sgbmVlZGVkLiANCg0KVGhlcmUncyBhIGJhc2ljIGNoZWNrIGZvciBzdl9mcCBh
dCB0aGUgZW5kIG9mIDEwMDQuDQpCdXQgSSdtIG5vdCBzdXJlIGlzIGl0IGVub3VnaCB0byBwcmV2
ZW50IHRoZSAxMDAxIGNyYXNoIHlvdSBtZW50aW9uZWQuDQpTaG91bGQgd2UgYWRkIGEgdmVyaWZ5
X3N0YWNrIGZvciBzdl9mcD8NCg0KPiANCj4gQW5kIHdlIG9mdGVuIHNob3dfZGF0YSBhcm91bmQg
dGhlIGdlbmVyYWwgcHJvcG9zYWwgcmVnaXN0ZXJzIHdoZW4ga2VybmVsIGNyYXNoLiBXaGVuIHRo
ZXkgY29udGFpbiBhbiBhZGRyZXNzIG1hcHBpbmcgZm9yIGEgaHcgcmVnaXN0ZXIgYnV0IGNhbsKS
dCBhY2Nlc3MgYmVjYXVzZSBjbG9jayBnYXRlZCwgaXQgd2lsbCBjcmFzaCBhZ2FpbiBiZWNhdXNl
IGRvX2JhZCgpIGlzIGludm9sdmVkLiAoY29udGludW91cyBjcmFzaCBpbiBhcm0gYW5kIGhhbmcg
YXQgZGllX2xvY2sgaW4gYXJtNjQpDQo+IA0KPiBTbywgd2h5IG5vdCBjaGVjayB0aGUgX19leF90
YWJsZSBpbiBkb19iYWQoKSA/DQo+IA0KDQpPbiBvdXIgYXJtIHBsYXRmb3JtLCBrZXJuZWwganVz
dCBkaWUgYmVjdWFzZSB0aGUgVW5oYW5kbGVkIGZhdWx0IGluIGZvcl9lYWNoX2ZyYW1lLg0KU28g
SSdkIHJhdGhlciB0byBmaXggaXQgYmVmb3JlIHRoZSBjb250aW51b3VzIGNyYXNoIGhhcHBlbi4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
