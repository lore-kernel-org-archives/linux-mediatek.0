Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B30C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 02:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467E22071A
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 02:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WcJ46Tmd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 467E22071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:
	Subject:To:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lATLRgjdfFlajDfi8PKSKxDXmMrluHymEqteiGQuoWI=; b=WcJ46TmdcJ3O0g
	aha/pCzP181OGyoJR8h82qR63W/hpdFs4N1HaeFdXrZY5/k6qUffXV6Dz9fLRKTvbICwAeLudUDhz
	376yJvPdUWggEKaRQ4sFn9BiGEOIJT2jG+3x/1IwS945IGwAoVDBx6l7YxL/E6kbuPMUAg3K9m94N
	/nviTD/Nwlkl/gGVzspegEvzE4Un6j21tJrbQXc6yMagzZh+Jl9DT0nFXUkeliqqnygPasUTTjWt3
	F2M7SyW/2rUfZWxZppQiteMEbUwePDwphEZQnSFM1Eujb/nVszapYtQflGNNZxJ8GNgoBOd/51/LZ
	rdKiwmmWKehIW85fSalQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jl1AM-0007gi-6B; Tue, 16 Jun 2020 02:17:34 +0000
Received: from m176149.mail.qiye.163.com ([59.111.176.149])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jl1AC-0007Zo-Ij
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 02:17:26 +0000
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
 by m176149.mail.qiye.163.com (Hmail) with ESMTP id 136E3281F35;
 Tue, 16 Jun 2020 10:16:40 +0800 (CST)
Message-ID: <AGQAVQB8CJTteCgzBUXE5Kra.3.1592273800065.Hmail.bernard@vivo.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gZHJtL21lZGlhdGVrOiByZW1vdmUgdW5uZWNlc3NhcnkgY29udmVyc2lvbiB0byBib29s?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 14.29.82.33
In-Reply-To: <CAAOTY__sSV2f4MqSLJYvSW9TGV=bCKXz+zELYREaEOFVjA6XQQ@mail.gmail.com>
MIME-Version: 1.0
Received: from bernard@vivo.com( [14.29.82.33) ] by ajax-webmail ( [127.0.0.1]
 ) ; Tue, 16 Jun 2020 10:16:40 +0800 (GMT+08:00)
From: Bernard <bernard@vivo.com>
Date: Tue, 16 Jun 2020 10:16:40 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU4YGh8fGhgYGRpKVkpOQklJTEhDS0tKSktVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kJHlYWEh9ZQUhDSEhKTExPTUJLN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6PCo6LSo5QzgxLw8eOBwBOS4jPk4wCRpVSFVKTkJJSUxIQ0tLTUhCVTMWGhIXVRkeCRUaCR87
 DRINFFUYFBZFWVdZEgtZQVlKT1VJQlVDSVVISFlXWQgBWUFOSUNCNwY+
X-HM-Tid: 0a72baea0b989395kuws136e3281f35
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_191725_034094_B5156F30 
X-CRM114-Status: UNSURE (   6.76  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Joe Perches <joe@perches.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cgrlj5Hku7bkurrvvJpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4K5Y+R
6YCB5pel5pyf77yaMjAyMC0wNi0xNSAyMjowMDo1MgrmlLbku7bkurrvvJpKb2UgUGVyY2hlcyA8
am9lQHBlcmNoZXMuY29tPgrmioTpgIHkurrvvJpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5j
b20+LENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPixQaGlsaXBwIFphYmVs
IDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPixEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
LERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4sTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhp
YXMuYmdnQGdtYWlsLmNvbT4sRFJJIERldmVsb3BtZW50IDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPixMaW51eCBBUk0gPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
Zz4sIm1vZGVyYXRlZCBsaXN0OkFSTS9NZWRpYXRlayBTb0Mgc3VwcG9ydCIgPGxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmc+LGxpbnV4LWtlcm5lbCA8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz4sb3BlbnNvdXJjZS5rZXJuZWxAdml2by5jb20K5Li76aKY77yaUmU6IFtQQVRD
SF0gZHJtL21lZGlhdGVrOiByZW1vdmUgdW5uZWNlc3NhcnkgY29udmVyc2lvbiB0byBib29sPkpv
ZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+IOaWvCAyMDIw5bm0NuaciDE15pelIOmAseS4gCDk
uIrljYg0OjQx5a+r6YGT77yaCj4+Cj4+IE9uIEZyaSwgMjAyMC0wNi0xMiBhdCAyMDo0MCArMDgw
MCwgQmVybmFyZCBaaGFvIHdyb3RlOgo+PiA+IEluIGZ1bmN0aW9uIG10a19kc2lfY2xrX2hzX3N0
YXRlLCByZW1vdmUgdW5uZWNlc3NhcnkgY29udmVyc2lvbgo+PiA+IHRvIGJvb2wgcmV0dXJuLCB0
aGlzIGNoYW5nZSBpcyB0byBtYWtlIHRoZSBjb2RlIGEgYml0IHJlYWRhYmxlLgo+PiBbXQo+PiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+PiBbXQo+PiA+IEBAIC0zMTksNyArMzE5LDcg
QEAgc3RhdGljIGJvb2wgbXRrX2RzaV9jbGtfaHNfc3RhdGUoc3RydWN0IG10a19kc2kgKmRzaSkK
Pj4gPiAgICAgICB1MzIgdG1wX3JlZzE7Cj4+ID4KPj4gPiAgICAgICB0bXBfcmVnMSA9IHJlYWRs
KGRzaS0+cmVncyArIERTSV9QSFlfTENDT04pOwo+PiA+IC0gICAgIHJldHVybiAoKHRtcF9yZWcx
ICYgTENfSFNfVFhfRU4pID09IDEpID8gdHJ1ZSA6IGZhbHNlOwo+PiA+ICsgICAgIHJldHVybiAo
KHRtcF9yZWcxICYgTENfSFNfVFhfRU4pID09IDEpOwo+Pgo+PiBHaXZlbjoKPj4KPj4gZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYzojZGVmaW5lIExDX0hTX1RYX0VOICAgICAgICAg
ICAgICAgICAgQklUKDApCj4+Cj4+IFRoaXMgaXMgbGlrZWx5IGNsZWFyZXIgYXMKPj4KPj4gICAg
ICAgICByZXR1cm4gdG1wX3JlZzEgJiBMQ19IU19UWF9FTjsKPj4KPj4gb3IgZXZlbgo+Pgo+PiBz
dGF0aWMgYm9vbCBtdGtfZHNpX2Nsa19oc19zdGF0ZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+PiB7
Cj4+ICAgICAgICAgcmV0dXJuIHJlYWRsKGRzaS0+cmVncyArIERTSV9QSFlfTENDT04pICYgTENf
SFNfVFhfRU47Cj4+IH0KPgo+SSBsaWtlIHRoZSBzZWNvbmQgb25lLgoKSGk6CgpUaGlzIG1vZGlm
aWNhdGlvbiBpcyBjbGVhciBhbmQgZWFzeSB0byB1bmRlcnN0YW5kLgpJIHdpbGwgdXBkYXRlIHRo
ZSBwYXRjaCBhbmQgcmVzdWJtaXQuClRoYW5rcyEKCkJSLy9CZXJuYXJkCgo+Pgo+Pgo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
