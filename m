Return-Path: <SRS0=GsAT=ZG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C53C432C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 03:21:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0AF9206F3
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2019 03:21:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQb3ecdi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2ZZqboLM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0AF9206F3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9XNVwit2UEcQRURlRDxBEkhkenHdZJ6SXo7SV/E0zE=; b=NQb3ecdi7YM2yO
	jQvhrSQie7uniA3wHgZ9u/PKDxfxNKyVs6wi/7Ho1Vim/EvZa3CMJrJRZbMYxq87jDOE+m8TWG0X3
	kownFsDB++olHV5xfQnxHRXd4cwGgccZWDg5dNKu8KFq4oq1eldmCJYRx4HezpSNlGrEiy7QcOJPS
	uUD8HlTZfhTTSlMzMaz3EtHpNEjRSR73fWPyyL15+KAsYmgtMRCN4wyX+Q3SP2Hd4y4N+cgEeSmJu
	Emn3FFKxa6hhLXGRBYGBzxBVErwgt0qn79No+uCnI1NeNGG20Beb4LGdig0hXSD6g4evC2daY+hJ2
	khNmAlf1BQikXUHUJNxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iV5hO-0002cW-Gq; Thu, 14 Nov 2019 03:21:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV5hA-0002Gq-JX; Thu, 14 Nov 2019 03:21:22 +0000
Received: from localhost (unknown [124.219.31.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FC8A206F3;
 Thu, 14 Nov 2019 03:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573701680;
 bh=FmT+xIiI8fjMzRISC6E96FWJYAdkxpETep6dx0aAOFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2ZZqboLMJesjq8BgSJ7MoVJfF7TgnYS/cpHL36P4jLxMYovM+i28jf1w3HevubntO
 CeDfpE3nKYFUIcb2Vwhkjbuo4IYsEvU7SVWvJfBdlElMiMJ5CCs+VgGXsWTotdq/qS
 w53jwTQdO8muQEOIrztPV0CPbjIZ2Oh5POjkNcYQ=
Date: Thu, 14 Nov 2019 11:21:17 +0800
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 12/13] usb: gadget: udc: gr_udc: create debugfs
 directory under usb root
Message-ID: <20191114032117.GA130252@kroah.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
 <1573541519-28488-12-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1573541519-28488-12-git-send-email-chunfeng.yun@mediatek.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191113_192121_239457_41A7329D 
X-CRM114-Status: GOOD (  17.65  )
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
Cc: Peter Chen <Peter.Chen@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Yangtao Li <tiny.windzz@gmail.com>, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Kevin Cernekee <cernekee@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Cristian Birsan <cristian.birsan@microchip.com>, linux-media@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org, Biju Das <biju.das@bp.renesas.com>,
 Felipe Balbi <balbi@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMDI6NTE6NThQTSArMDgwMCwgQ2h1bmZlbmcgWXVuIHdy
b3RlOgo+IE5vdyB0aGUgVVNCIGdhZGdldCBzdWJzeXN0ZW0gY2FuIHVzZSB0aGUgVVNCIGRlYnVn
ZnMgcm9vdCBkaXJlY3RvcnksCj4gc28gbW92ZSBpdCdzIGRpcmVjdG9yeSBmcm9tIHRoZSByb290
IG9mIHRoZSBkZWJ1Z2ZzIGZpbGVzeXN0ZW0gaW50bwo+IHRoZSByb290IG9mIHVzYgo+IAo+IFNp
Z25lZC1vZmYtYnk6IENodW5mZW5nIFl1biA8Y2h1bmZlbmcueXVuQG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiB2MjoKPiAgIDEuIGFiYW5kb24gbmV3IEFQSSB1c2JfZGVidWdmc19jcmVhdGVfZGlyKCks
IGFuZCB1c2UgdXNiX2RlYnVnX3Jvb3QKPiAtLS0KPiAgZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9n
cl91ZGMuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZ3JfdWRjLmMg
Yi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jCj4gaW5kZXggN2EwZTlhNThjMmQ4Li41
ZmFhMDlhNmM3NzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9ncl91ZGMu
Ywo+ICsrKyBiL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZ3JfdWRjLmMKPiBAQCAtMjA4LDcgKzIw
OCw3IEBAIHN0YXRpYyB2b2lkIGdyX2Rmc19jcmVhdGUoc3RydWN0IGdyX3VkYyAqZGV2KQo+ICB7
Cj4gIAljb25zdCBjaGFyICpuYW1lID0gImdyX3VkY19zdGF0ZSI7Cj4gIAo+IC0JZGV2LT5kZnNf
cm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShkZXYtPmRldiksIE5VTEwpOwo+ICsJ
ZGV2LT5kZnNfcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShkZXYtPmRldiksIHVz
Yl9kZWJ1Z19yb290KTsKPiAgCWRlYnVnZnNfY3JlYXRlX2ZpbGUobmFtZSwgMDQ0NCwgZGV2LT5k
ZnNfcm9vdCwgZGV2LCAmZ3JfZGZzX2ZvcHMpOwo+ICB9Cj4gIAoKVGhpcyBicmVha3MgdGhlIGJ1
aWxkOgpkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jOiBJbiBmdW5jdGlvbiDigJhncl9k
ZnNfY3JlYXRl4oCZOgpkcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jOjIxMTo1NzogZXJy
b3I6IOKAmHVzYl9kZWJ1Z19yb2904oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1
bmN0aW9uKQogIDIxMSB8ICBkZXYtPmRmc19yb290ID0gZGVidWdmc19jcmVhdGVfZGlyKGRldl9u
YW1lKGRldi0+ZGV2KSwgdXNiX2RlYnVnX3Jvb3QpOwogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn4KZHJp
dmVycy91c2IvZ2FkZ2V0L3VkYy9ncl91ZGMuYzoyMTE6NTc6IG5vdGU6IGVhY2ggdW5kZWNsYXJl
ZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBh
cHBlYXJzIGluCm1ha2VbNF06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNjU6IGRyaXZl
cnMvdXNiL2dhZGdldC91ZGMvZ3JfdWRjLm9dIEVycm9yIDEKCnNvIEkndmUgZHJvcHBlZCBpdCBm
cm9tIHRoZSBwYXRjaCBzZXJpZXMuCgpQbGVhc2UgZml4IHVwIGFuZCByZXNlbmQuCgpBbmQgb2Yg
Y291cnNlLCBhbHdheXMgdGVzdC1idWlsZCB5b3VyIHBhdGNoZXMgYmVmb3JlIHlvdSBzZW5kIHRo
ZW0Kb3V0Li4uCgpncmVnIGstaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
