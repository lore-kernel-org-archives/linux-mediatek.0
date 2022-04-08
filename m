Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EB9C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 01:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rOZ8TRLdFJjPB85ZqsW9qamFuta1Z8JHKtKkoWqS8/E=; b=0nexNsopfsJYhc
	uZBoL8KaWWGt6lWWg9Yeh0gvpbHlHpDxLxNUc7g8JE+8XY4sLHbRwV/HS+zTdeVkqRaPvuofSMtAk
	9qAeqmuTcf4roiMKqyFcGc/T2p+hg5caWOJODtf2FXJ/1GSrZ+kvOltwJfgJ3SyotYAFGxQfMlLny
	asbKutxByrG12jr4ymtIIgYXdDFZzlFFxhGGzuKFNq86c6mNNAYMYjTGkbAKGpNWylXWj2e92SJO2
	suzu/0yb86nARnfUgiQMXYuCA6iYcuZHMYFJiIlGgXjYSA0y/4BaI/pN2Dt+H+VRCgYTtrf7HnMcs
	yOOXr2H/1frX5uarvkvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncdcI-00EZ54-3S; Fri, 08 Apr 2022 01:40:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncdcF-00EZ47-MI; Fri, 08 Apr 2022 01:40:49 +0000
X-UUID: 76f1c0aca9fa42688989d26b668a2d52-20220407
X-UUID: 76f1c0aca9fa42688989d26b668a2d52-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1375037194; Thu, 07 Apr 2022 18:40:43 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 18:36:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 8 Apr 2022 09:36:17 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 09:36:17 +0800
Message-ID: <6afe7366ceffb77674d34c48f84aa85b1c088bc3.camel@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: dpi: Use mt8183 output formats for mt8192
From: CK Hu <ck.hu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <jitao.shi@mediatek.com>,
 <rex-bc.chen@mediatek.com>
CC: David Airlie <airlied@linux.ie>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <kernel@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 8 Apr 2022 09:36:17 +0800
In-Reply-To: <20220408011907.672120-1-nfraprado@collabora.com>
References: <20220408011907.672120-1-nfraprado@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_184047_779443_8DE53ECE 
X-CRM114-Status: GOOD (  19.31  )
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

SGksIEppdGFvICYgUmV4OgoKUGxlYXNlIGhlbHAgdG8gY29tbWVudCBvbiB0aGlzIHBhdGNoLgoK
T24gVGh1LCAyMDIyLTA0LTA3IGF0IDIxOjE5IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBUaGUgY29uZmlndXJhdGlvbiBmb3IgbXQ4MTkyIHdhcyBpbmNvcnJlY3RseSB1
c2luZyB0aGUgb3V0cHV0IGZvcm1hdHMKPiBmcm9tIG10ODE3My4gU2luY2UgdGhlIG91dHB1dCBm
b3JtYXRzIGZvciBtdDgxOTIgYXJlIGluc3RlYWQgdGhlIHNhbWUKPiBvbmVzIGFzIGZvciBtdDgx
ODMsIHdoaWNoIHJlcXVpcmUgdHdvIGJ1cyBzYW1wbGVzIHBlciBwaXhlbCwgdGhlCj4gcGl4ZWxj
bG9jayBhbmQgRERSIGVkZ2Ugc2V0dGluZyB3ZXJlIG1pc2NvbmZpZ3VyZWQuIFRoaXMgbWFkZQo+
IGV4dGVybmFsCj4gZGlzcGxheXMgdW5hYmxlIHRvIHNob3cgdGhlIGltYWdlLgo+IAo+IEZpeCB0
aGUgaXNzdWUgYnkgY29ycmVjdGluZyB0aGUgb3V0cHV0IGZvcm1hdCBmb3IgbXQ4MTkyIHRvIGJl
IHRoZQo+IHNhbWUKPiBhcyBmb3IgbXQ4MTgzLCBmaXhpbmcgdGhlIHVzYWdlIG9mIGV4dGVybmFs
IGRpc3BsYXlzIGZvciBtdDgxOTIuCj4gCj4gU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4g
QS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+IAo+IC0tLQo+IAo+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHBpLmMKPiBpbmRleCA0NTU0ZTJkZTE0MzAuLmU2MWNkNjdiOTc4ZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC04MTksOCArODE5LDggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTkyX2NvbmYgPSB7Cj4gIAkuY2FsX2ZhY3RvciA9IG10
ODE4M19jYWxjdWxhdGVfZmFjdG9yLAo+ICAJLnJlZ19oX2ZyZV9jb24gPSAweGUwLAo+ICAJLm1h
eF9jbG9ja19raHogPSAxNTAwMDAsCj4gLQkub3V0cHV0X2ZtdHMgPSBtdDgxNzNfb3V0cHV0X2Zt
dHMsCj4gLQkubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxNzNfb3V0cHV0X2ZtdHMp
LAo+ICsJLm91dHB1dF9mbXRzID0gbXQ4MTgzX291dHB1dF9mbXRzLAo+ICsJLm51bV9vdXRwdXRf
Zm10cyA9IEFSUkFZX1NJWkUobXQ4MTgzX291dHB1dF9mbXRzKSwKPiAgfTsKPiAgCj4gIHN0YXRp
YyBpbnQgbXRrX2RwaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
