Return-Path: <SRS0=bt65=BM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8F2C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 23:38:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A1F2070A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2020 23:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0DDcpRn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EanpZdFe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02A1F2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iOWQwCrki0xnEmS9sKk4pqGh7rOqDZEKOWiB/QrYWTg=; b=b0DDcpRnxdKvzk2YrHbPan68b
	PO/pEU6MwqbVh6+WpCylfzg4+B0ylOAj76X/kkkxc1/omvw7EkqQq0G9JN4k8OZ0OUzlGwUayktKg
	xD/49eRHf0Qbj69PGi71OfV4nP7s34MlVrpCRxov7mdaEOgfKMuDfRzNP4MoscmuhgRrkuTwzXzdH
	VwQ5DDZS2QMhErt2jzyasIKwgRCNX0IyNElxU5TTuqoZrQJCnF71fBwsGrQyuSmgNoGMopxXDQWJl
	0qIvixXKvYpu6Udekbq60QJF2k/snArOWiTkK2C67WyDfclwe0Zsd6KAh2DXJ1kHCgsC4rkwXqCfZ
	tRxybh6sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2NYo-0003Bj-Vb; Sun, 02 Aug 2020 23:38:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2NYk-0003Az-It; Sun, 02 Aug 2020 23:38:31 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06CC52070A;
 Sun,  2 Aug 2020 23:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596411509;
 bh=AbG/PXAqhgPVuIkQmoLq+95PIZjq2tZT6mMRiYuDpWA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EanpZdFeb8rYupCfIPn6Fs/UavWempboc9Wa9k0ebsXRsV2H9jeABwmXiYO6CnaYH
 gyz8NtTLsPx94fS5ljo9Z1mH1kGafsh3r2+NXKbLtPuckKFideuy0iXvdqQ3tHuz8f
 jsOo28LALgxXoVrxFp4UU+SlG+lfPQ3VJHVWCpDQ=
Received: by mail-ed1-f42.google.com with SMTP id l23so12266145edv.11;
 Sun, 02 Aug 2020 16:38:29 -0700 (PDT)
X-Gm-Message-State: AOAM531BpUcfw+pTRtfcDo64jISVhtgwwC9gy6I5ygn/2LPDAyesvCiB
 /nTKm3ijgAYivSyLngUlfyYAhjZES6nm4Zfl5g==
X-Google-Smtp-Source: ABdhPJyFe20LlQFIDpRDCTfuWW+wEB+O/g/9f02O9oqUGPkMHjgGv4vDDhGCFULSLVE//K2Ox0J9Smx9kWnqwXl3DME=
X-Received: by 2002:aa7:c606:: with SMTP id h6mr713213edq.288.1596411507931;
 Sun, 02 Aug 2020 16:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200728111800.77641-1-frank-w@public-files.de>
 <20200728111800.77641-3-frank-w@public-files.de>
 <CAAOTY__7wCeTm0OY0P1VKZp-r7+d7yj=LLb79Nzr1pVVkOjy2g@mail.gmail.com>
 <6F0FD8AA-A582-45FC-BE1A-06B3812B3DEF@public-files.de>
In-Reply-To: <6F0FD8AA-A582-45FC-BE1A-06B3812B3DEF@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Aug 2020 07:38:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PZQLNFNfOPVL-YnvPNG6WjY7pcwK+wO0vEFkR=19txA@mail.gmail.com>
Message-ID: <CAAOTY_9PZQLNFNfOPVL-YnvPNG6WjY7pcwK+wO0vEFkR=19txA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] drm/mediatek: fix boot up for 720 and 480 but 1080
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_193830_708023_EB89AC2C 
X-CRM114-Status: GOOD (  18.59  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 chunhui dai <chunhui.dai@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKRnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaW
vCAyMDIw5bm0OOaciDLml6Ug6YCx5pelIOS4i+WNiDEyOjQ05a+r6YGT77yaCj4KPiBIaSwKPgo+
IEFtIDIuIEF1Z3VzdCAyMDIwIDAyOjA4OjQ0IE1FU1ogc2NocmllYiBDaHVuLUt1YW5nIEh1IDxj
aHVua3VhbmcuaHVAa2VybmVsLm9yZz46Cj4gPkhpLCBGcmFuazoKPiA+PiAtIGRpc2FibGUgdG1k
cyBvbiBwaHkgb24gbXQyNzAxCj4gPj4gLSBzdXBwb3J0IG90aGVyIHJlc29sdXRpb25zIGxpa2Ug
MTI4MHgxMDI0Cj4gPgo+ID5JZiB0aGlzIHBhdGNoIGRvZXMgdHdvIHRoaW5ncywgaXQgc2hvdWxk
IGJlIGJyb2tlbiBpbnRvIHR3byBwYXRjaGVzLgo+IEFzIGZhciBhcyBpIHNlZSxpdCBvbmx5IGRp
c2FibGUgdG1kcyBhbmQgc28gZml4IHNwZWNpZmljIHJlc29sdXRpb25zIGxpa2UgdGhlIHRoZSBv
bmUgYmVsb3cuc29tZSBvdGhlciAobGlrZSAxMDgwcCkgZG9lcyBub3QgaGF2ZSB0aGlzIFByb2Js
ZW0uCgpPSywgdGhpcyBpcyBvbmUgdGhpbmcsICJkaXNhYmxlIHRtZHMgb24gcGh5IG9uIG10Mjcw
MSB0byBzdXBwb3J0IG90aGVyCnJlc29sdXRpb25zIGxpa2UgMTI4MHgxMDI0IgoKPgo+ID4gSSB0
aGluayBldmVyeSBwbGwgaXMgZGVmYXVsdCBvZmYsIHNvIHlvdSBzaG91bGQgdHVybiBvbiBwbGwg
cmF0aGVyCj4gPiB0aGFuIGRpc2FibGUgdG1kcwo+Cj4gSXMgZGlzYWJsaW5nIHRtZHMgd3Jvbmcg
aGVyZT8gV2hpY2ggcGxsIGlzIG5lZWRlZCBoZXJlPyBXaGF0IGRvZXMgdG1kcz8gSSBnb3Qgb25s
eSB0aGUgUGF0Y2hlcyBmb3IgdGVzdGluZy4uLi4KCkkgZG9uJ3Qga25vdyBob3cgZG9lcyB0aGlz
IHBsbCBhbmQgdG1kcyB3b3JrLiBJIHRoaW5rIHlvdSBhbmQgbWUgYXJlCmJvdGggbm90IGZhbWls
aWFyIHdpdGggdGhpcyBoZG1pIHBoeS4gSSBhZ3JlZSB0aGlzIG1vZGlmaWNhdGlvbiBjb3VsZApm
aXggc29tZSBwcm9ibGVtLCBidXQgZG9lcyB0aGlzIHBhdGNoIGhhdmUgc2lkZSBlZmZlY3Qgd2hp
Y2ggdHJpZ2dlcgphbm90aGVyIHByb2JsZW0/IEkgbmVlZCBzb21lIHJlYXNvbmFibGUgZGVzY3Jp
cHRpb24gc28gSSBjb3VsZCBoYXZlCmNvbmZpZGVuY2Ugb24gdGhpcyBwYXRjaC4gdG1kcyBpcyBh
IGZ1bmN0aW9uIGluIG10MjcwMSBidXQgeW91IGRpc2FibGUKaXQuIFRoaXMgbWVhbiB5b3UgZGlz
YWJsZSBzb21lIGZ1bmN0aW9uIG9mIHRoaXMgaGFyZHdhcmUuIFdoeSBtdDI3MDEKZG9lcyBub3Qg
bmVlZCBpdD8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gPj4gd2l0aG91dCB0aGlzIFBhdGNo
IGkgc2VlIGZsaWNrZXJpbmcgb24gbXkgVEZUICgxMjgweDEwMjQpLAo+ID4+IHNvIGkgZ3Vlc3Mg
Y2xvY2sgaXMgd3JvbmcuCj4KPiByZWdhcmRzIEZyYW5rCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
