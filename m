Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D251DC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 22:57:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7795321473
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 22:57:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+H8mJPh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYL874Ft"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7795321473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aHiTSJ2pzjkFgkWxOjIaYklLvsRSE3mz5O713eI2LmM=; b=F+H8mJPhsSehBunHZs44UVSnl
	1ZzNOGWIrT9q2TJJZq+rkDeK+vwwmN3ejFp2QcahXrebINpPKY9qtkoihIezbyay5ee91P5oNm8lc
	NEq/vvAk+KPm2MPHoC/zgIlHRK6+6QxMdOsuDzC4FMw3BfSq5ZcP1d3yyXxeQ47O5HLCvTwcIJANX
	5PyuQFtuOFI/9K/2x/84MmYNO5LCD4Bf8qH0MHd7+Epi9K7OIFt03qCjDJ4VBh1erfppRVwxHNPFZ
	oD9TI+RxT0e86qs+WAN5IAJMfzBnfR/svwG6jnldy45yFUeW++htZ3tAND0PAxc63hj3ZU+TnTasg
	gT5tTk2DA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFQ4H-0003aB-RU; Mon, 07 Sep 2020 22:56:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFQ4C-0003Yf-Bu; Mon, 07 Sep 2020 22:56:53 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 005F0216C4;
 Mon,  7 Sep 2020 22:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599519411;
 bh=NSfi6wd9qqZTJhGfu2dBWUH/ZuOy9FYmKPjqOXlrGdY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DYL874Ft8lJajzJzSkE08InkYufgly609Dly2f3AmCFg0kllg6SfudOSXe7qRMWqI
 xAJPQVXK02BLjsfoDOaCNPQJIOwBt85PQQ+6cOclK8lu1CxEiMMxAwcxMiDFBc1SXZ
 1Pahyg0bnLv9oV4C/+D8CSqc7CPBTzlO8tk79p0w=
Received: by mail-ed1-f43.google.com with SMTP id ay8so14031083edb.8;
 Mon, 07 Sep 2020 15:56:50 -0700 (PDT)
X-Gm-Message-State: AOAM531nOGHAHMgKFg+u6CTv5LBUXhQGeMcioPmGnNp559di0nP9hE+k
 QXIuGm1egeUh8bjnBD+L5iEGNK80DTxDdYIYJA==
X-Google-Smtp-Source: ABdhPJy5CZYbL8ciYgmudWTBCh6+c6fY0KeeVANf0EFcV7pTO+zprkngyGmaklVX6wbgwtJoJPgINeDzP7xumcmZZLw=
X-Received: by 2002:a05:6402:1451:: with SMTP id
 d17mr23241583edx.48.1599519409620; 
 Mon, 07 Sep 2020 15:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200905083058.1631726-1-yukuai3@huawei.com>
In-Reply-To: <20200905083058.1631726-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 8 Sep 2020 06:56:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-BQx0rozw0qoGj1bt4hO2rFmYvKrjQHbA-K04txUWW+w@mail.gmail.com>
Message-ID: <CAAOTY_-BQx0rozw0qoGj1bt4hO2rFmYvKrjQHbA-K04txUWW+w@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_ddp_comp_init()
To: Yu Kuai <yukuai3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_185652_510222_07FC1173 
X-CRM114-Status: GOOD (  19.78  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, yi.zhang@huawei.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgWXUgS3VhaToKCll1IEt1YWkgPHl1a3VhaTNAaHVhd2VpLmNvbT4g5pa8IDIwMjDlubQ55pyI
NeaXpSDpgLHlha0g5LiL5Y2INDozMeWvq+mBk++8mgo+Cj4gaWYgb2ZfZmluZF9kZXZpY2VfYnlf
bm9kZSgpIHN1Y2NlZWQsIG10a19kZHBfY29tcF9pbml0KCkgZG9lc24ndCBoYXZlCj4gYSBjb3Jy
ZXNwb25kaW5nIHB1dF9kZXZpY2UoKS4gVGh1cyBhZGQgcHV0X2RldmljZSgpIHRvIGZpeCB0aGUg
ZXhjZXB0aW9uCj4gaGFuZGxpbmcgZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCj4K
ClRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSwgYnV0IEkgZmluZCBhbm90aGVyIHRoaW5nIHJl
bGF0ZWQgdG8gdGhpcy4KbXRrX2RkcF9jb21wX2luaXQoKSBpcyBjYWxsZWQgaW4gYSBsb29wIGlu
IG10a19kcm1fcHJvYmUoKSwgd2hlbiB0aGlzCmNvbXBvbmVudCBpbml0IGZhaWwsIEkgdGhpbmsg
d2Ugc2hvdWxkIHVuaW5pdGlhbGl6ZSBwcmV2aW91cwpzdWNjZXNzaXZlIGluaXQgY29tcG9uZW50
IGFuZCBwdXQgdGhlaXIgZGV2aWNlLiBXb3VsZCB5b3UgbGlrZSB0byBtYWtlCnRoaXMgcGF0Y2gg
bW9yZSBjb21wbGV0ZT8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+IEZpeGVzOiBkMGFmZTM3ZjUy
MDkgKCJkcm0vbWVkaWF0ZWs6IHN1cHBvcnQgQ01EUSBpbnRlcmZhY2UgaW4gZGRwIGNvbXBvbmVu
dCIpCj4gU2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggNTdjODhkZTlhMzI5Li41MjY2NDg4ODViOTcg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBA
QCAtNDk2LDYgKzQ5Niw3IEBAIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgI2lmIElTX1JFQUNIQUJMRShDT05GSUdf
TVRLX0NNRFEpCj4gICAgICAgICBpZiAob2ZfYWRkcmVzc190b19yZXNvdXJjZShub2RlLCAwLCAm
cmVzKSAhPSAwKSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiTWlzc2luZyByZWcg
aW4gJXMgbm9kZVxuIiwgbm9kZS0+ZnVsbF9uYW1lKTsKPiArICAgICAgICAgICAgICAgcHV0X2Rl
dmljZSgmbGFyYl9wZGV2LT5kZXYpOwo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiAgICAgICAgIH0KPiAgICAgICAgIGNvbXAtPnJlZ3NfcGEgPSByZXMuc3RhcnQ7Cj4gLS0KPiAy
LjI1LjQKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
