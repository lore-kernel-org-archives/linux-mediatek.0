Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A81FC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 11:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D0360FD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 11:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0D0360FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=as8ywg9Y5TV+9h5AzM1/30W1LfeK+QZOcIwIu17Hjhw=; b=kjNQJ4MEOGI1ruthhoUXUnRboy
	yQ3jE9r5VGz/7AoFOU9/S4JTziaHkewU52h20H+furTL1Ni710LF0mAjiXcEfZGbiw87vxtNMStg5
	Fw2KMh1tNFj02eFZc8GSM7QK2Gig++mX2TG764J7YgjxZ4hw7AFFbKumOC+wNECE3LlkXu4lSPIic
	4qHYPgnQF3aXFAHdTQMam8jzvhPKMJq4dWQ1Ytj09l81iAwwH1V2rryIKWLML+C/MKRf/PsOhR5LN
	Ns1JDPO9LiPMZ7R8D/VkpwVuJS87Sha2Q0Pwbk75NmafNWV/NC+M5cTQf1W2kYoAUU8X0EzFnvGGx
	WLVDHa0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL1Xa-0026KS-S7; Tue, 31 Aug 2021 11:02:54 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL1X9-0026Iy-RR; Tue, 31 Aug 2021 11:02:32 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [80.241.60.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4GzPR42l6zzQk9k;
 Tue, 31 Aug 2021 13:02:24 +0200 (CEST)
Received: from hefe.heinlein-support.de (hefe.heinlein-support.de
 [91.198.250.172])
 by smtp202.mailbox.org (Postfix) with ESMTP id 055C3353;
 Tue, 31 Aug 2021 13:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1630407742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFtP0SZ/TdIJGAu7wx7JpHy0mfa2Py8L4R4PbyzOE9w=;
 b=0JpVxrWdAY0ClDyJiZBUcRqALDn9x2pxolPxoLNpL4OZTY0q2pMbd58QII7TkZNzNcMsEi
 6GiP/VtUDGDyL4BEvMF8Bk3FQirhKoGLOVWu2KHSQk47Qis2aYpaYnXNMCgeDwovT7/bN3
 hZTWR2NGczB1Stxsxq2qfHWklomTzuNmEixLMSy7VoVEzacRerPYL7GaU+uZXciOnFdY9l
 h8JHgHgFWrWOx7pputohTeLt1GXY0mODTNldGQ3PunQVHbhK66OZM2nr99xwNyxiOY6UMn
 2/uBjinxXLAJeTNfjlpR4u9UcihELf/DC9jFtl3E7VEfoH6X6SwDGJKIIm+srQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp202.mailbox.org ([80.241.60.245])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id 3e6XqoWYfo9i; Tue, 31 Aug 2021 13:02:20 +0200 (CEST)
Received: from localhost (unknown [211.58.59.88])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp202.mailbox.org (Postfix) with ESMTPSA id 1EC6F267;
 Tue, 31 Aug 2021 13:02:15 +0200 (CEST)
Subject: Re: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
To: frank-w@public-files.de, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "b-liu@ti.com" <b-liu@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
 <20210830155903.13907-2-mans0n@gorani.run>
 <16f980b95e1f32bb8eb32448f1615bafdc51b792.camel@mediatek.com>
 <14C40B35-3607-49C6-970B-441F9093125A@public-files.de>
From: Sungbo Eo <mans0n@gorani.run>
Message-ID: <3d57ae38-9d8f-05e3-c5b3-58db73879f16@gorani.run>
Date: Tue, 31 Aug 2021 20:02:10 +0900
MIME-Version: 1.0
In-Reply-To: <14C40B35-3607-49C6-970B-441F9093125A@public-files.de>
X-Rspamd-Queue-Id: 055C3353
X-Rspamd-UID: 2b5930
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_040228_669169_B7EE7C2F 
X-CRM114-Status: GOOD (  13.64  )
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

T24gMjAyMS0wOC0zMSAxNzo1OSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiBBbSAzMS4gQXVn
dXN0IDIwMjEgMDg6Mjc6MTggTUVTWiBzY2hyaWViICJDaHVuZmVuZyBZdW4gKOS6keaYpeWzsCki
IDxDaHVuZmVuZy5ZdW5AbWVkaWF0ZWsuY29tPjoKPiAKPj4gSXMgdGhlIGR0LWJpbmRpbmcgcGF0
Y2ggYXBwbGllZD8gCj4+IEl0J3MgYmV0dGVyIHRvIHB1dCBpdCBpbnRvIHRoaXMgc2VyaWVzIGR1
ZSB0byB0aGUgbmV3Cj4+IGNvbXBhdGlibGUgIm1lZGlhdGVrLG10NzYyMy1tdXNiIiBpcyB1c2Vk
IGZvciB0aGUgZmlyc3QgdGltZS4KPj4KPj4gUmV2aWV3ZWQtYnk6IENodW5mZW5nIFl1biA8Y2h1
bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4KPiAKPiBIaSwKPiAKPiBJIGRvbid0IHNlZSBbMV0gKGFj
ayBmcm9tIHJvYikgaW4gWzJdL1szXQoKWW91IGNhbiBmaW5kIGl0IGhlcmUuCmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dyZWdraC91c2IuZ2l0L2xvZy8/
aD11c2ItbmV4dAoKPiAKPiBAc3VuZ2JvOiBwbGVhc2UgbGVhdmUgZHQtYmluZGluZ3MgcGF0Y2gg
aW4gc2VyaWVzLgoKSSdsbCBrZWVwIGl0IGZvciBhIHdoaWxlLCB0aGVuLgoKPiBZb3UgbmVlZCBu
byBuZXcgdmVyc2lvbiBvbmx5IGZvciBhZGRpbmcgdGFncyAoYWNrZWQsdGVzdGVkIG9yIHJldmll
d2VkKS4KPiBPbmx5IGZvciBjb2RlLWNoYW5nZXMsYnV0IHRoZW4gYWRkIHRhZ3MgZnJvbSBwcmV2
aW91cyB2ZXJzaW9ucy4KCkdvdCBpdC4gVGhhbmtzIGZvciB0aGUgdGlwLiA6KQoKPiAKPiBJbWhv
IGl0IGlzIGJldHRlciB0byB0YWtlIG15IG11c2IgcGF0Y2ggWzRdCj4gaW50byB0aGUgc2VyaWVz
IGFzIHdlbGwgdG8gbWFrZSBkZXBlbmN5IGNsZWFuZXIKCk9rYXksIEknbGwgdGFrZSBpdCBpbiB0
aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmtzLgoKPiAKPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwODA4MTIzODQwLjE3Njcz
OC0yLW1hbnMwbkBnb3JhbmkucnVuLwo+IFsyXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9yb2JoL2xpbnV4LmdpdC9sb2cvP2g9Zm9yLW5leHQKPiBbM10g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWF0dGhpYXMu
YmdnL2xpbnV4LmdpdC9sb2cvP2g9Zm9yLW5leHQKPiBbNF0gaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwODMwMTQ1OTU4LjEwODYw
NS0xLWxpbnV4QGZ3LXdlYi5kZS8KPiByZWdhcmRzIEZyYW5rCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
