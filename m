Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FB6C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:36:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A6532080C
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TcLA+MqT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A6532080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTdf6ElX45CBZXg06oFtNbF7ajWR3RtVUFo+ri/n7sU=; b=TcLA+MqTtxpoyZ
	T5nFSp393TEI84hAi/CORhE9w9B4Pk1DBHWboQBGtN+bcbDn1KrnnO9NZNLZFe9FINQixLUujuuuW
	XOEltiau+w2VppQpnYuHM5eDzVGNGnrCk0Ckj2XFjrOzfLVf3F/2rz9wAzp8ZrMzwKEu8OVh/7D2R
	Dae5S5TyeODUul+lYF7h6Zz+CFwMJuAYES/hG/VDDGgJtHPiDzBZ29OO+p25tOPsvliJ2Ffamdgd+
	kiNup1Rcka2BdicvNbQIcfbgI8M4pAaPuwB27Ca20u6GskOWR5yP5TOMx2o2AsplQb/wNqoiH4N3j
	MdBRfyR1O8TdrI8oNYTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmBZa-0001y8-VM; Fri, 19 Jun 2020 07:36:26 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmBZV-0001wO-M1
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 07:36:25 +0000
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de
 [91.61.38.56])
 by mail.holtmann.org (Postfix) with ESMTPSA id 5D6D7CECF1;
 Fri, 19 Jun 2020 09:45:51 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 2/2] Bluetooth: btmtksdio: fix up firmware download
 sequence
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <51dda3f7e6e3a01b20145c5e879e837cec78b7da.1592463595.git.sean.wang@mediatek.com>
Date: Fri, 19 Jun 2020 09:35:58 +0200
Message-Id: <2A034CCA-9FF9-4C78-B1D3-91B54CA271DC@holtmann.org>
References: <c9bf7346a060d8913b670bbed7ed9e60b592e16f.1592463595.git.sean.wang@mediatek.com>
 <51dda3f7e6e3a01b20145c5e879e837cec78b7da.1592463595.git.sean.wang@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_003622_132758_4C9B010C 
X-CRM114-Status: UNSURE (   7.32  )
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
Cc: Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
 Mark Chen <Mark-YW.Chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgU2VhbiwKCj4gRGF0YSBSQU0gb24gdGhlIGRldmljZSBoYXZlIHRvIGJlIHBvd2VyZWQgb24g
YmVmb3JlIHN0YXJ0aW5nIHRvIGRvd25sb2FkCj4gdGhlIGZpcm13YXJlLgo+IAo+IEZpeGVzOiA5
YWViZmQ0YTIyMDAgKCJCbHVldG9vdGg6IG1lZGlhdGVrOiBhZGQgc3VwcG9ydCBmb3IgTWVkaWFU
ZWsgTVQ3NjYzUyBhbmQgTVQ3NjY4UyBTRElPIGRldmljZXMiKQo+IENvLWRldmVsb3BlZC1ieTog
TWFyayBDaGVuIDxNYXJrLVlXLkNoZW5AbWVkaWF0ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1h
cmsgQ2hlbiA8TWFyay1ZVy5DaGVuQG1lZGlhdGVrLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBTZWFu
IFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+Cj4gLS0tCj4gZHJpdmVycy9ibHVldG9vdGgv
YnRtdGtzZGlvLmMgfCAxNiArKysrKysrKysrKysrKystCj4gMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCnRoZSBwYXRjaCBkb2VzbuKAmXQgYXBwbHkgdG8g
Ymx1ZXRvb3RoLW5leHQgdHJlZS4KClJlZ2FyZHMKCk1hcmNlbAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
