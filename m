Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B01C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 16:32:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 002E0206DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 16:32:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mJxNevfh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt/puv9W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 002E0206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0EY1aJELPUmkE0ZnnUh45TOfWbopa5Lj4gxypzGfPK0=; b=mJxNevfhdGXFqic/v6v5hvJ8o
	vhdWyy3S3W9CKgFbmZseL5Ea+GTvmXS6AjR4L70nTN8rV0DidF4BQUQ1PU2oGAWX9NzJXK3Vmx5ja
	UTjpgSqpFMJ17au1IxX15khfONMJyYgkMqG6HrLX6HMXe+HcGcKFTJr8k8U6bHAjZkj+9ZqfBHM7C
	QPniVVqUYvvcsBKXLS0fGhlhyR4r50Fu0nbKsMJW5Tq+llD56NnvXgGPcFQMq5N0j4XifO51AZ74F
	cdGjJQAX2bc8h1iysFMmsJYt9Ag+KQEQQtlGyyG0UfDaVDUxjMEUWKA1Ik7G01XDhrYE0WF7Lz2Yb
	ld0ckcpzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtCzU-0003o4-Pt; Wed, 08 Jul 2020 16:32:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCzO-0003lW-2v; Wed, 08 Jul 2020 16:32:07 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1726206DF;
 Wed,  8 Jul 2020 16:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594225925;
 bh=H0Wu/BAz8vnX6yWwkCd9GCUvAWjGhNdK2uh35x2F+gY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vt/puv9WSgcAFnQCevVazOFMWEdNIStzG0eLIdImPSn2pTYfN9LfWO4TavwlYO8+5
 PcL9lHHK02+gd38OxHtt47Zqt4w45KXH4mk/pigiMmtBe44UDTiN4EbGNZZiUFwZOV
 tH7un04276lBm9oRAe3U6rcafKhgOCGHkKSIlyfo=
Date: Wed, 8 Jul 2020 09:32:03 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH] net: ethernet: mtk_eth_soc: fix mtu warning
Message-ID: <20200708093203.347bad78@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200708154634.9565-1-frank-w@public-files.de>
References: <20200708154634.9565-1-frank-w@public-files.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_123206_217240_F18EDDE6 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAgOCBKdWwgMjAyMCAxNzo0NjozNCArMDIwMCBGcmFuayBXdW5kZXJsaWNoIHdyb3Rl
Ogo+IEZyb206IFJlbsOpIHZhbiBEb3JzdCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPgo+IAo+IGlu
IHJlY2VudCBLZXJuZWwtVmVyc2lvbnMgdGhlcmUgYXJlIHdhcm5pbmdzIGFib3V0IGluY29ycmVj
dCBNVFUtU2l6ZQo+IGxpa2UgdGhlc2U6Cj4gCj4gbXQ3NTMwIG1kaW8tYnVzOjAwOiBub25mYXRh
bCBlcnJvciAtOTUgc2V0dGluZyBNVFUgb24gcG9ydCB4Cj4gZXRoMDogbXR1IGdyZWF0ZXIgdGhh
biBkZXZpY2UgbWF4aW11bQo+IG10a19zb2NfZXRoIDFiMTAwMDAwLmV0aGVybmV0IGV0aDA6IGVy
cm9yIC0yMiBzZXR0aW5nIE1UVSB0byBpbmNsdWRlIERTQSBvdmVyaGVhZAo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFJlbsOpIHZhbiBEb3JzdCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgo+IAo+IEZp
eGVzOiBiZmNiODEzMjAzICgibmV0OiBkc2E6IGNvbmZpZ3VyZSB0aGUgTVRVIGZvciBzd2l0Y2gg
cG9ydHMiKQo+IEZpeGVzOiA3MjU3OWUxNGExICgibmV0OiBkc2E6IGRvbid0IGZhaWwgdG8gcHJv
YmUgaWYgd2UgY291bGRuJ3Qgc2V0IHRoZSBNVFUiKQo+IEZpeGVzOiA3YTRjNTNiZWUzICgibmV0
OiByZXBvcnQgaW52YWxpZCBtdHUgdmFsdWUgdmlhIG5ldGxpbmsgZXh0YWNrIikKCkZpeGVzIHRh
ZzogRml4ZXM6IGJmY2I4MTMyMDMgKCJuZXQ6IGRzYTogY29uZmlndXJlIHRoZSBNVFUgZm9yIHN3
aXRjaCBwb3J0cyIpCkhhcyB0aGVzZSBwcm9ibGVtKHMpOgoJLSBTSEExIHNob3VsZCBiZSBhdCBs
ZWFzdCAxMiBkaWdpdHMgbG9uZwoJICBDYW4gYmUgZml4ZWQgYnkgc2V0dGluZyBjb3JlLmFiYnJl
diB0byAxMiAob3IgbW9yZSkgb3IgKGZvciBnaXQgdjIuMTEKCSAgb3IgbGF0ZXIpIGp1c3QgbWFr
aW5nIHN1cmUgaXQgaXMgbm90IHNldCAob3Igc2V0IHRvICJhdXRvIikuCkZpeGVzIHRhZzogRml4
ZXM6IDcyNTc5ZTE0YTEgKCJuZXQ6IGRzYTogZG9uJ3QgZmFpbCB0byBwcm9iZSBpZiB3ZSBjb3Vs
ZG4ndCBzZXQgdGhlIE1UVSIpCkhhcyB0aGVzZSBwcm9ibGVtKHMpOgoJLSBTSEExIHNob3VsZCBi
ZSBhdCBsZWFzdCAxMiBkaWdpdHMgbG9uZwoJICBDYW4gYmUgZml4ZWQgYnkgc2V0dGluZyBjb3Jl
LmFiYnJldiB0byAxMiAob3IgbW9yZSkgb3IgKGZvciBnaXQgdjIuMTEKCSAgb3IgbGF0ZXIpIGp1
c3QgbWFraW5nIHN1cmUgaXQgaXMgbm90IHNldCAob3Igc2V0IHRvICJhdXRvIikuCkZpeGVzIHRh
ZzogRml4ZXM6IDdhNGM1M2JlZTMgKCJuZXQ6IHJlcG9ydCBpbnZhbGlkIG10dSB2YWx1ZSB2aWEg
bmV0bGluayBleHRhY2siKQpIYXMgdGhlc2UgcHJvYmxlbShzKToKCS0gU0hBMSBzaG91bGQgYmUg
YXQgbGVhc3QgMTIgZGlnaXRzIGxvbmcKCSAgQ2FuIGJlIGZpeGVkIGJ5IHNldHRpbmcgY29yZS5h
YmJyZXYgdG8gMTIgKG9yIG1vcmUpIG9yIChmb3IgZ2l0IHYyLjExCgkgIG9yIGxhdGVyKSBqdXN0
IG1ha2luZyBzdXJlIGl0IGlzIG5vdCBzZXQgKG9yIHNldCB0byAiYXV0byIpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
