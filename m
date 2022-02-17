Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF6AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 14:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ct8vIKMRw2zOIVCV/+AK8J3wD2QA31gsgRDgwc8t1M=; b=0DZoIvYAbla2OU
	921ofHS6olFVTAzPqsV5OZUy4jnr946w4LX2TCG7x37jJ7mOIvH53POvZHIA3la5Z3sdXtSifuqiN
	3+EUkUm9mROVWHdIbu9oHILwJZHhMEjBg+S5/LnfFo013Alwkqt5bvhX8GBKh+MyMMj+qKSbRtXoI
	k9htLyNIoJUjBtICMd77HZjKdVe3hXkZVO35Tnl+mVqoDYFoaFGyX5k8NDUG54O/b09eJKp4+7KMT
	XMC9gpRR4LYYrHy5XUvIacEvj8eSsn0HL6QBZK/uAOCl4e2rKD07FUP9w7p0deGwzsqUHVpSSDsGg
	WUoyteZONChVSG5cd9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKi0u-00B70Y-UL; Thu, 17 Feb 2022 14:44:08 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKi0o-00B6wR-DX
 for linux-mediatek@lists.infradead.org; Thu, 17 Feb 2022 14:44:06 +0000
Received: by mail-qk1-x72d.google.com with SMTP id c7so2672915qka.7
 for <linux-mediatek@lists.infradead.org>; Thu, 17 Feb 2022 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=7Dm8/9xh+wmDmQBhMFT43NJgXO5tbOXeBqNcPHzywpk=;
 b=ZICFIWA9Sbi45aOvx4dcDKut/wdPr6VMVnR4U4cb/kJNSc5ETL1ImhYOA8svydp4va
 RzN0pqQOm5Dq4JA7d4pON7G9eyLMCXEsZuWHjnT9Fj9mCm+TUeulRj9lF2p9y2RbrWcw
 Zdpbnbp0nBhk0+kYOrKKXdR396nWX9LG40kL5OO0Sx5HRmFULTOjGINNiVDkIXxd4+xP
 TOWJ3oYmeQRu60z0DluHgDjZgUZAXTPIUOGK3h/aHozSzMAyMRLTYmepfzaIg3ggnHGr
 dP2iJfjIiPWmJy73uFUWoYnY+wyUm1t2ktREy2fqVLd/EgvXbdq9nYV+GFUVOklwgQKe
 rgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=7Dm8/9xh+wmDmQBhMFT43NJgXO5tbOXeBqNcPHzywpk=;
 b=rfGggfqSCzzOwJQglo/UvjltwCcwW7OUFhfc9EUNFjvfFbT1tWMEfPlzKoNdd5eRg1
 wzTw2if34ztg8CLtKQI5ZWVJ3yWb0fTIl43FjwjZcQwql1w1UcCwtWwv01OziSobc2aJ
 33Mwj8vtCgfNjpzK5BGbj2V8LbC4Cs9wsc5N0OgZDd3H9LGzzi+rbYsCkBqAJ1U1R5sz
 epNd6gMT88A53//tNft/U8walK14pQ8AAXmGq7DMFSBTEdiym20qJUe4McTXD2qBwFZz
 dIxBeI4HjYbPlVyhVcQ0z8kjdJUYV7dJmJGY81RyamdcKrrU7sRAlG5c62ocU80++1aK
 9VBw==
X-Gm-Message-State: AOAM531fAnUYADoUpXa5d2vzq1Vq6EfHdGWG3v/PUvIdhZbYYX73cPbw
 dgzwLeKXU+JzVdn8wdvgBA0PoA==
X-Google-Smtp-Source: ABdhPJxLj1ldRMkUKspCf3+BTfjxi/lSWLS/APEjil4eZvdWbgL26ckX1Mt84cdeQha/7dTmRgmWsw==
X-Received: by 2002:ae9:edc6:0:b0:60c:8807:712f with SMTP id
 c189-20020ae9edc6000000b0060c8807712fmr1821761qkg.14.1645109039947; 
 Thu, 17 Feb 2022 06:43:59 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168])
 by smtp.gmail.com with ESMTPSA id h19sm13099450qtx.12.2022.02.17.06.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 06:43:59 -0800 (PST)
Message-ID: <20a43338009164be793abb9fedd002f2e4c9a293.camel@ndufresne.ca>
Subject: Re: [PATCH v6, 06/15] media: mtk-vcodec: Refactor get and put
 capture buffer flow
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi
 Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Dafna Hirschfeld
 <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Thu, 17 Feb 2022 09:43:54 -0500
In-Reply-To: <353328c24f92a0690c8461a9b18c62166b769a40.camel@mediatek.com>
References: <20220122035316.18179-1-yunfei.dong@mediatek.com>
 <20220122035316.18179-7-yunfei.dong@mediatek.com>
 <b07ac9bebb1d2ecef8ddb1426f16f4ff3218a131.camel@ndufresne.ca>
 <353328c24f92a0690c8461a9b18c62166b769a40.camel@mediatek.com>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_064402_514316_E1E8B412 
X-CRM114-Status: GOOD (  20.83  )
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

TGUgamV1ZGkgMTcgZsOpdnJpZXIgMjAyMiDDoCAxNzowMyArMDgwMCwgeXVuZmVpLmRvbmdAbWVk
aWF0ZWsuY29tIGEgw6ljcml0wqA6Cj4gPiA+IC0JcmV0ID0gdmRlY19pZl9kZWNvZGUoY3R4LCBi
c19zcmMsIGRzdF9idWYsICZyZXNfY2hnKTsKPiA+ID4gKwlyZXQgPSB2ZGVjX2lmX2RlY29kZShj
dHgsIGJzX3NyYywgTlVMTCwgJnJlc19jaGcpOwo+ID4gPiDCoMKgCWlmIChyZXQpIHsKPiA+ID4g
wqDCoAkJbXRrX3Y0bDJfZXJyKCIgPD09PVslZF0sIHNyY19idWZbJWRdIHN6PTB4JXp4IHB0cz0l
bGx1Cj4gPiA+IHZkZWNfaWZfZGVjb2RlKCkgcmV0PSVkIHJlc19jaGc9JWQ9PT0+IiwKPiA+ID4g
wqDCoAkJCcKgwqDCoMKgIGN0eC0+aWQsIHZiMl9zcmMtPmluZGV4LCBic19zcmMtPnNpemUsCj4g
PiA+IEBAIC0yMjAsMTIgKzI2Niw5IEBAIHN0YXRpYyB2b2lkIG10a192ZGVjX3dvcmtlcihzdHJ1
Y3Qgd29ya19zdHJ1Y3QKPiA+ID4gKndvcmspCj4gPiA+IMKgwqAJCX0KPiA+ID4gwqDCoAl9Cj4g
PiA+IMKgIAo+ID4gPiAtCW10a192ZGVjX3N0YXRlbGVzc19zZXRfZHN0X3BheWxvYWQoY3R4LCBk
c3RfYnVmKTsKPiA+ID4gLQo+ID4gPiAtCXY0bDJfbTJtX2J1Zl9kb25lX2FuZF9qb2JfZmluaXNo
KGRldi0+bTJtX2Rldl9kZWMsIGN0eC0KPiA+ID4gPiBtMm1fY3R4LAo+ID4gPiAtCQkJCQkgcmV0
ID8gVkIyX0JVRl9TVEFURV9FUlJPUiA6Cj4gPiA+IFZCMl9CVUZfU1RBVEVfRE9ORSk7Cj4gPiA+
IC0KPiA+ID4gKwltdGtfdmRlY19zdGF0ZWxlc3Nfb3V0X3RvX2RvbmUoY3R4LCBic19zcmMsIHJl
dCk7Cj4gPiAKPiA+IHY0bDJfbTJtX2J1Zl9kb25lX2FuZF9qb2JfZmluaXNoKCkgd2FzIHNwZWNp
YWxseSBjcmFmdGVkIHRvIHByZXZlbnQKPiA+IGRldmVsb3Blcgo+ID4gZnJvbSBpbXBsZW1lbnRp
bmcgdGhlIHNpZ25hbGxpbmcgb2YgdGhlIHJlcXVlc3QgYXQgdGhlIHdyb25nIG1vbWVudC4KPiA+
IFRoaXMgcGF0Y2gKPiA+IGJyb2tlIHRoaXMgc3RyaWN0IG9yZGVyaW5nLiBUaGUgcmVsZXZhbnQg
Y29tbWVudCBpbiB0aGUgaGVscGVyCj4gPiBmdW5jdGlvbjoKPiA+IAo+ID4gCj4gQXMgd2UgZGlz
Y3Vzc2VkIGluIGNoYXQsIHBsZWFzZSBoZWxwIHRvIGNoZWNrIHdoZXRoZXIgaXQncyBwb3NzaWJs
ZSB0bwo+IGxldCBsYXQgYW5kIGNvcmUgZGVjb2RlIGluIHBhcmFsbGVsLgoKVGhhbmtzLCBCZW5q
YW1pbiBpcyBsb29raW5nIGludG8gdGhhdC4gRm9yIHRoZSBtYWlsaW5nIGxpc3QgaGVyZSwgaGVy
ZSdzIHNvbWUKcHJpb3IgYXJ0IGZvciBhIHNpbWlsYXIgcHJvYmxlbSBmb3VuZCBieSBkb3duc3Ry
ZWFtIFJQaTQgSEVWQyBkcml2ZXIgZGV2ZWxvcGVyLgpUaGUgZ2VuZXJhbCBwcm9ibGVtIGhlcmUg
aXMgdGhhdCB3ZSBkb24ndCB3YW50IHRvIHNpZ25hbCB0aGUgcmVxdWVzdCB1bnRpbCB0aGUKZGVj
b2RlIGhhdmUgY29tcGxldGUsIHlldCB3ZSB3YW50IHRvIHBpY2sgYW5kIHJ1biBzZWNvbmQgKGNv
bmN1cnJlbnQgam9iKSBzbwp0aGF0IHBhcmFsbGVsIGRlY29kaW5nIGlzIG1hZGUgcG9zc2libGUu
IEZvciBSUGk0IGl0IGlzIG5vdCBtdWx0aS1jb3JlLCBidXQgdGhlCmRlY29kaW5nIGlzIHNwbGl0
IGluIDIgc3RhZ2VzLCBhbmQgdGhlIGRlY29kZXIgcnVuIGJvdGggc3RhZ2VzIGNvbmN1cnJlbnRs
eSwKd2hpY2ggYmFzaWNhbGx5IG1lYW5zLCB3ZSBuZWVkIHRvIGJlIGFibGUgdG8gcnVuIHR3byBq
b2JzIGF0IHRoZSBzYW1lIHRpbWUKd2hlbmV2ZXIgcG9zc2libGUuCgpodHRwczovL2dpdGh1Yi5j
b20vcmFzcGJlcnJ5cGkvbGludXgvY29tbWl0Lzk2NGJlMWQyMGUyZjEzMzU5MTVhNmJmOGM4MmEz
MTk5YmZkZGY4YWMKClRoaXMgaW50cm9kdWNlIG1lZGlhX3JlcXVlc3RfcGluL3VucGluLCBidXQg
YmVpbmcgYWJsZSB0byBwaW4gYSByZXF1ZXN0IGFuZCBub3QKaGF2ZSBpdCBib3VuZCB0byBhbnkg
b3RoZXIgb2JqZWN0IGxpZmV0aW1lIGFueW1vcmUgc2VlbXMgYSBiaXQgZXJyb3IgcHJvbmUgaW4K
Y29tcGFyaXNvbiB0byB0aGUgY3VycmVudCByZXN0cmljdGlvbnMuIENvbW1lbnRzIHdlbGNvbWUg
IQoKPiAKPiBJIHdpbGwgY29udGludWUgdG8gZml4IGgyNjQgaXNzdWUuCgpUaGFua3MuCgo+IAo+
IFRoYW5rcyBmb3IgeW91ciBoZWxwLgo+IAo+IEJlc3QgUmVnYXJkcywKPiBZdW5mZWkgRG9uZwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
