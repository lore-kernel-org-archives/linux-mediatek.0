Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72067C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 14:27:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A8026101D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 14:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3A8026101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=17sMBEjIVSV5fXya/oMQOCUb2wwMNr0xCc/mqZ/qvWk=; b=pvsMDhCI4QdL5K9GKspAco6R/5
	qBTbPrl3piuBsHQuva8ouOvvDQAC3B10S5k0z5aDvQpH09AyODfD5meVn8PKowN+63ix3LhSFEbqX
	IAiEkCwgcwM38cGSgZxR98XiIi6EwMtLIFqPi/gO11QHcK8y59mRjz1PcrARkXWGrTQV3Zh9k3O1r
	TF+OKdWcPZsafpCbG0cTeg9n6iwIeNYxqsbUDd5Fgc2KiMFAtJzkdtGSDvuGLskf4ELJH0x0vv5nR
	4++ib4zyPwmaCqDWME+4c4W0XfGMKuHZbO9yMRyH6w1BAbEoL5ehxmx4lLaVcSR/10Fq3TUzH4KPw
	0L7zQ5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maIko-00DBhL-4s; Tue, 12 Oct 2021 14:27:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maIkb-00DBfO-1A; Tue, 12 Oct 2021 14:27:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 9B4F61F43B8C
Subject: Re: [PATCH v7, 00/15] Support multi hardware decode using
 of_platform_populate
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <73f83f00-5d49-ba77-f46d-9c0855dc5268@collabora.com>
Date: Tue, 12 Oct 2021 16:27:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011070247.792-1-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_072729_231804_715D148B 
X-CRM114-Status: GOOD (  14.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgWXVuZmVpIERvbmcsCgpXIGRuaXUgMTEuMTAuMjAyMSBvwqAwOTowMiwgWXVuZmVpIERvbmcg
cGlzemU6Cj4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBtdWx0aSBoYXJkd2FyZSBkZWNv
ZGUgaW50byBtdGstdmNvZGVjLCBieSBmaXJzdAo+IGFkZGluZyB1c2Ugb2ZfcGxhdGZvcm1fcG9w
dWxhdGUgdG8gbWFuYWdlIGVhY2ggaGFyZHdhcmUgaW5mb3JtYXRpb246IGludGVycnVwdCwKPiBj
bG9jaywgcmVnaXN0ZXIgYmFzZXMgYW5kIHBvd2VyLiBTZWNvbmRseSBhZGQgY29yZSB0aHJlYWQg
dG8gZGVhbCB3aXRoIGNvcmUKPiBoYXJkd2FyZSBtZXNzYWdlLCBhdCB0aGUgc2FtZSB0aW1lLCBh
ZGQgbXNnIHF1ZXVlIGZvciBkaWZmZXJlbnQgaGFyZHdhcmUKPiBzaGFyZSBtZXNzYWdlcy4gTGFz
dGx5LCB0aGUgYXJjaGl0ZWN0dXJlIG9mIGRpZmZlcmVudCBzcGVjcyBhcmUgbm90IHRoZSBzYW1l
LAo+IHVzaW5nIHNwZWNzIHR5cGUgdG8gc2VwYXJhdGUgdGhlbS4KPiAKPiBUaGlzIHNlcmllcyBo
YXMgYmVlbiB0ZXN0ZWQgd2l0aCBib3RoIE1UODE4MyBhbmQgTVQ4MTczLiBEZWNvZGluZyB3YXMg
d29ya2luZwo+IGZvciBib3RoIGNoaXBzLgo+IAo+IFBhdGNoZXMgMX4zIHJld3JpdGUgZ2V0IHJl
Z2lzdGVyIGJhc2VzIGFuZCBwb3dlciBvbi9vZmYgaW50ZXJmYWNlLgo+IAo+IFBhdGNoIDQgYWRk
IHRvIHN1cHBvcnQgbXVsdGkgaGFyZHdhcmUuCj4gCj4gUGF0Y2ggNSBzZXBhcmF0ZSB2aWRlbyBl
bmNvZGVyIGFuZCBkZWNvZGVyIGRvY3VtZW50Cj4gCj4gUGF0Y2hlcyA2LTE1IGFkZCBpbnRlcmZh
Y2VzIHRvIHN1cHBvcnQgY29yZSBoYXJkd2FyZS4KCldoaWNoIHRyZWUgZG9lcyB0aGUgc2VyaWVz
IGFwcGx5IHRvPwoKUmVnYXJkcywKCkFuZHJ6ZWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
