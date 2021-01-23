Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6736EC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 00:18:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA54223B6B
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 00:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA54223B6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BW/Wm00OLTeGKVtjNJJlZQJ72t2wu7OOlJtW+QAcFno=; b=elporFFTqhvr9HSziwGg5D8Y4
	dW9XhdJseYo2BNC0+nrhzRCJ5Ww1oDC7Ryv/88FK2p3pBzLvqWq1ztTSHDPtR5Uom07O4osjGJdVO
	lx7lQ/6NHAMIxVQSkg3QhtpgL/YD2dYLgCT2G+wdvCzN4vG8y8rvWw5JoOBQQANLhBCWoKlwK9nQF
	n4pIXGnXca93AErVXggQ/1yGauFYyPsbFuHr+cpNfdlj6fcT9XZPhtB5kjaUvsdgsTpegf5oim/qV
	EErUbCqtnu0DZipt3ijwzbHFcMOEJyJ4JSOJ/p39fv4UVDrBuQmUJu3SFWFK02/07zHX5WCHcuV5r
	yzumFj4Sw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l36dH-0007bI-Cj; Sat, 23 Jan 2021 00:18:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l36dC-0007aT-1R; Sat, 23 Jan 2021 00:18:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E83C423B74;
 Sat, 23 Jan 2021 00:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611361099;
 bh=3fmahJcDJaiPzSHyzDHOPcnKdSO+Wsnj9uOP966Bbtk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=liFiRlK1dmu7SXiI7+zgcSv/0yuHKqgSkFQIcahP1Q6k0Na+kN4l3HJahI80wfh/C
 B+jh36ZoQ/LzBZI5yGsYn3rBEttkJCUg3vqTHOGeglGYuiN7b4ZRiaWMaCagAzjDxs
 E0Jnn2mA5Q4DQZwJ8momS8CaNrxpDgMryWBoALPY2tuRZFl9s/UDH9t2H9rkU5mIle
 ZlwaH2eYrT3yiVSHjwb2wi7Wa1ycrE9YwgktV6SsSPUacLZ1JQL5VVqKtjEtuafC1v
 P+e6YUTPpt+F2aUTG5TDMg+NdIvuXw4bbvNSQOH3DaF40bvOOLOdLxnRdNxL3bdYHq
 dztwobXituTLA==
Received: by mail-ej1-f44.google.com with SMTP id w1so10083228ejf.11;
 Fri, 22 Jan 2021 16:18:18 -0800 (PST)
X-Gm-Message-State: AOAM530taMz3wT0DyYvZHIgEeavwUwmAelLhQ5Fq1wWBMPqg+Q77Uxcp
 XkCg2XvqTjZuniUhCdufqRsE8CKkihqjo1QctA==
X-Google-Smtp-Source: ABdhPJwyuj40njyUKw3kugLNeH9sj5thS1bwHoAiyYKNnx7M1JVZ8MSIu28ADwY+9e5tY75fquHTE72s0CjW6QlAy/I=
X-Received: by 2002:a17:906:ada:: with SMTP id
 z26mr102199ejf.127.1611361097488; 
 Fri, 22 Jan 2021 16:18:17 -0800 (PST)
MIME-Version: 1.0
References: <20210122120323.4337-1-chunfeng.yun@mediatek.com>
 <20210122120323.4337-4-chunfeng.yun@mediatek.com>
In-Reply-To: <20210122120323.4337-4-chunfeng.yun@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 23 Jan 2021 08:18:06 +0800
X-Gmail-Original-Message-ID: <CAAOTY_84OF71QK6M5JT1M5YAFKED_xWVpx8B8t859OsVxE0cfQ@mail.gmail.com>
Message-ID: <CAAOTY_84OF71QK6M5JT1M5YAFKED_xWVpx8B8t859OsVxE0cfQ@mail.gmail.com>
Subject: Re: [PATCH next v2 04/17] dt-bindings: phy: mediatek: dsi-phy: add
 optional clock-names
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_191822_516375_26CDB717 
X-CRM114-Status: GOOD (  16.87  )
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
Cc: DTML <devicetree@vger.kernel.org>, Min Guo <min.guo@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIENodW5mZW5nOgoKQ2h1bmZlbmcgWXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMeW5tDHmnIgyMuaXpSDpgLHkupQg5LiL5Y2IODowNOWvq+mBk++8mgo+Cj4gQWRkIGFu
IG9wdGlvbmFsICJjbG9jay1uYW1lcyIgcHJvcGVydHksIGl0J3Mgbm90IHVzZWQgdG8gZ2V0IHRo
ZSBjbG9jaywKPiBidXQgc29tZSBEVFMgZmlsZXMgKGUuZy4gbXQ4MTgzKSBwcm92aWRlIGl0LgoK
SSB0aGluayB0aGUgbG9naWMgaXMgdGhhdCB3ZSBkZWZpbmUgcHJvcGVydHkgaW4gYmluZGluZyBk
b2N1bWVudApmaXJzdCwgYW5kIHRoZW4gd3JpdGUgaXQgaW4gZGV2aWNlIHRyZWUuIElmIGEgcHJv
cGVydHkgZG9lcyBub3QgZXhpc3QKaW4gYmluZGluZyBkb2N1bWVudCwgd2Ugc2hvdWxkIG5vdCB3
cml0ZSBpdCBpbiBkZXZpY2UgdHJlZS4gU28gbGV0J3MKZHJvcCB0aGlzIHBhdGNoIGFuZCByZW1v
dmUgY2xvY2stbmFtZXMgaW4gbXQ4MTgzLmR0c2kuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+
IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiBDYzogUGhpbGlw
cCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVu
ZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gdjI6IG5ldyBwYXRjaCBz
ZXBhcmF0ZWQgZnJvbSBbMy8xNV0gc3VnZ2VzdGVkIGJ5IENLCj4gLS0tCj4gIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55YW1sIHwgNCArKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRzaS1waHkueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvbWVkaWF0ZWssZHNpLXBoeS55
YW1sCj4gaW5kZXggNmU0ZDc5NWY5YjAyLi5hZjZlNTU0YzViNjkgMTAwNjQ0Cj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9tZWRpYXRlayxkc2ktcGh5LnlhbWwK
PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L21lZGlhdGVrLGRz
aS1waHkueWFtbAo+IEBAIC0zNSw2ICszNSwxMCBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgaXRlbXM6
Cj4gICAgICAgIC0gZGVzY3JpcHRpb246IFBMTCByZWZlcmVuY2UgY2xvY2sKPgo+ICsgIGNsb2Nr
LW5hbWVzOgo+ICsgICAgaXRlbXM6Cj4gKyAgICAgIC0gY29uc3Q6IHJlZgo+ICsKPiAgICBjbG9j
ay1vdXRwdXQtbmFtZXM6Cj4gICAgICBtYXhJdGVtczogMQo+Cj4gLS0KPiAyLjE4LjAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
