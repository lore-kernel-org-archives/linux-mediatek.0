Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17EB8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:40:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A8060EE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4A8060EE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wfqlHW4nQxRSXEv86jo1Caik5Heg5kNZKS2+6nrhpII=; b=vnyR0q1Cd0E5jF
	oID59Yi1gWty+0a3D9YITmtm9XAVPGHcOBuAMI7LCCuJcCZA5qA7vAbGpaw0xYfsxuYqmyX3glzK7
	jm3qm1F0Y7rxwUIa3CPRRB2Qs78nrM1V5AcRO/h78TGx13hfS8/Z8AEfkzMKsvFTaclh9eixcbIix
	SdM+GUKnjYi1xnFwXiqM+7x8RR7fHuWCpZASdZK21rI+Dq5SD+kcSFrCIiPa4IV+t6FWwFBP13gsa
	9/wgxfWAaYMuIFh3V+K4Ku44AlbSBL4O5A/LM0Xmgc1/a4emvJCtpDCt9xcKUEujOswYtKQu9NQ2y
	+JGTlf5dgma9uvecOjIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcR0J-00FNlk-5R; Mon, 18 Oct 2021 11:40:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcR0C-00FNie-Tv; Mon, 18 Oct 2021 11:40:29 +0000
X-UUID: 07bc9cdd91f144fa8d24d8840cca097b-20211018
X-UUID: 07bc9cdd91f144fa8d24d8840cca097b-20211018
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 946262000; Mon, 18 Oct 2021 04:40:20 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 04:40:18 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 19:40:17 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Enric Balletbo
 i Serra <enric.balletbo@collabora.com>, Fabien Parent <fparent@baylibre.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, Sam
 Shih <sam.shih@mediatek.com>
Subject: [PATCH v7 0/3] Add basic SoC support for mediatek mt7986
Date: Mon, 18 Oct 2021 19:40:06 +0800
Message-ID: <20211018114009.13350-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_044025_019886_5A4C166E 
X-CRM114-Status: GOOD (  10.99  )
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

VGhpcyBwYXRjaCBhZGRzIGJhc2ljIFNvQyBzdXBwb3J0IGZvciBNZWRpYXRlaydzIG5ldyA0LWNv
cmUgU29DLApNVDc5ODYsIHdoaWNoIGlzIG1haW5seSBmb3Igd2lmaS1yb3V0ZXIgYXBwbGljYXRp
b24uCgotLS0Kdjc6IGFkZGVkIG1lbW9yeSBub2RlIGJhY2sgdG8gZHRzCnY2OiBzZXBhcmF0ZSBi
YXNpYyBwYXJ0IGludG8gYSBzaW5nbGUgcGF0Y2ggc2VyaWVzCgpBY2NvcmRpbmcgdG8gdGhlIG1h
aW50YWluZXLigJlzIHN1Z2dlc3Rpb24sIHRoaXMgcGF0Y2ggc3BsaXRzIHRoZSBwcmV2aW91cwp0
aHJlYWQgaW50byBpbmRlcGVuZGVudCBwYXRjaCBzZXJpZXMuClRoaXMgcGF0Y2ggaW5jbHVkZSBi
YXNpYyBkZXZpY2Ugc3VwcG9ydC4KCk9yaWdpbmFsIHRocmVhZDoKaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjEwOTE0MDg1MTM3LjMxNzYxLTEtc2FtLnNoaWhAbWVkaWF0ZWsuY29tLwot
LS0KClNhbSBTaGloICgzKToKICBkdC1iaW5kaW5nczogYXJtNjQ6IGR0czogbWVkaWF0ZWs6IEFk
ZCBtdDc5ODYgc2VyaWVzCiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFkZCBiYXNpYyBtdDc5ODZh
IHN1cHBvcnQKICBhcm02NDogZHRzOiBtZWRpYXRlazogYWRkIGJhc2ljIG10Nzk4NmIgc3VwcG9y
dAoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay55YW1sICAgICB8ICAgOCAr
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL01ha2VmaWxlICAgICAgICAgfCAgIDIgKwog
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc5ODZhLXJmYi5kdHMgIHwgIDM4ICsrKysr
CiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmEuZHRzaSAgICAgfCAxNDkgKysr
KysrKysrKysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmItcmZi
LmR0cyAgfCAgMzAgKysrKwogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDc5ODZiLmR0
c2kgICAgIHwgMTQ5ICsrKysrKysrKysrKysrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCAzNzYgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0
ZWsvbXQ3OTg2YS1yZmIuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDc5ODZhLmR0c2kKIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210Nzk4NmItcmZiLmR0cwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2Yi5kdHNpCgotLQoyLjI5LjIKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
