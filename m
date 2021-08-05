Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DECDC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 13:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C787C6113B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 13:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C787C6113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEh+jr7PmwkGTsmq0PLAdxSdG4URhP1FEo6dFERwVKw=; b=r3Ta5M4pejaZk9
	cv8K42ks/1I+C8pKfNrXHdxsnPFq+hQ9nH1sx+yfdSjyo7wSEHV9LFeEuDbiVIO0K9zxSy3zJ4l5d
	Vg2IHWlXzQ9CpCpPpviyqG9VB6Vevdbpge3NIkPnFZA/gaje/2SFHwie4fSFHjaKF+H9BBRfklhYQ
	EvVPX9BC8IiuA8/ErTagr/ox2wYgTdTj6R0StcqAOdBBbTmiO1X6zZLXR7YborDfWWtXqaOfHPSep
	rqW6Ggi98akaY6Usx94pMUuUuxFHgne4HtDRySaG2ZXPekV0dqaM3u7M0T+gk/TvvgGZzjNo31dxD
	9ZVWqcGW9gNIz6le918g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBdGT-009eTn-3K; Thu, 05 Aug 2021 13:18:25 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBdGO-009eR7-Ac
 for linux-mediatek@lists.infradead.org; Thu, 05 Aug 2021 13:18:22 +0000
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
 by mail.holtmann.org (Postfix) with ESMTPSA id 3D855CECF1;
 Thu,  5 Aug 2021 15:18:18 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 1/1] Bluetooth: btusb: Fix fall-through warnings
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210805024012.18022-1-mark-yw.chen@mediatek.com>
Date: Thu, 5 Aug 2021 15:18:17 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, tedd.an@linux.intel.com,
 chris.lu@mediatek.com, will-cy.lee@mediatek.com, sean.wang@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, michaelfsun@google.com, shawnku@google.com,
 jemele@google.com, apusaka@google.com, mcchou@chromium.org
Message-Id: <D3F62378-3C5A-4CED-9EC4-6694752047D6@holtmann.org>
References: <20210805024012.18022-1-mark-yw.chen@mediatek.com>
To: =?utf-8?B?Ik1hcmstWVcgQ2hlbiAo6Zmz5o+a5paHKSI=?=
 <Mark-YW.Chen@mediatek.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_061820_587667_C71C50D0 
X-CRM114-Status: GOOD (  12.45  )
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

SGkgTWFyaywKCj4gRml4IGZhbGwtdGhyb3VnaCB3YXJuaW5nczoKPiBkcml2ZXJzL2JsdWV0b290
aC9idHVzYi5jOiBJbiBmdW5jdGlvbiDigJhidHVzYl9yZWN2X2FjbF9tdGvigJk6Cj4gZHJpdmVy
cy9ibHVldG9vdGgvYnR1c2IuYzo0MDMzOjM6IHdhcm5pbmc6Cj4gdGhpcyBzdGF0ZW1lbnQgbWF5
IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4gNDAzMyB8ICAgdXNiX2Rp
c2FibGVfYXV0b3N1c3BlbmQoZGF0YS0+dWRldik7Cj4gICAgICB8ICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jOjQwMzQ6Mjog
bm90ZTogaGVyZQo+IDQwMzQgfCAgY2FzZSAweDA1ZmY6ICAvKiBGaXJtd2FyZSBkZWJ1ZyBsb2dn
aW5nIDEgKi8KPiAgICAgIHwgIF5+fn4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBtYXJrLXl3LmNoZW4g
PG1hcmsteXcuY2hlbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gZHJpdmVycy9ibHVldG9vdGgvYnR1
c2IuYyB8IDIgKysKPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMgYi9kcml2ZXJzL2JsdWV0b290aC9idHVz
Yi5jCj4gaW5kZXggYTRjZWU4MzI3Mjk1Li44OWZmOTE4MmI3ZTIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ibHVldG9vdGgvYnR1c2IuYwo+ICsrKyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0dXNiLmMK
PiBAQCAtNDAyNyw3ICs0MDI3LDkgQEAgc3RhdGljIGludCBidHVzYl9yZWN2X2FjbF9tdGsoc3Ry
dWN0IGhjaV9kZXYgKmhkZXYsIHN0cnVjdCBza19idWZmICpza2IpCj4gCQkgKiBzdXNwZW5kIGFu
ZCB0aHVzIGRpc2FibGUgYXV0by1zdXNwZW5kLgo+IAkJICovCj4gCQl1c2JfZGlzYWJsZV9hdXRv
c3VzcGVuZChkYXRhLT51ZGV2KTsKPiArCQlmYWxsdGhyb3VnaDsKPiAJY2FzZSAweDA1ZmY6CQkv
KiBGaXJtd2FyZSBkZWJ1ZyBsb2dnaW5nIDEgKi8KPiArCQlmYWxsdGhyb3VnaDsKCnRoaXMgb25l
IGlzIG5vdCBuZWVkZWQuCgoKPiAJY2FzZSAweDA1ZmU6CQkvKiBGaXJtd2FyZSBkZWJ1ZyBsb2dn
aW5nIDIgKi8KPiAJCXJldHVybiBoY2lfcmVjdl9kaWFnKGhkZXYsIHNrYik7Cj4gCX0KClJlZ2Fy
ZHMKCk1hcmNlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
