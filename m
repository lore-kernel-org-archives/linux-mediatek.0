Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88ACC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 14:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA38B2077B
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 14:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ycla+nSu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA38B2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ge9uu3Mj+EINWnzCtxI0NqLm35plICVKXwe14XjDyKU=; b=Ycla+nSuRyCsVA
	sy1tA7zqE920yryEZWPYumOdUd73OL3+ANZQddMX6O7jpKszmu9Mb9BYpP8NSOmfwKYcR6ZNvAQdr
	4dbS+URG4HKR5aeBSxuBOLohW3afKBpMjwy8masH8TU/Hbbq4O2QDgJzSkjOVixspaSXNqmKwcTDj
	/MOv/HtYfAEWNHcFvwGY6MRhJF9GLbP5sDtWSPXmEKplwtHqLhJsCHT88h7/EP/mb9IubTRbM42w4
	ssaDf4WVtbXsaTzSV5o3kPqxZFjoBmiJ/NyATodQKgCMuhSsDSeGlmmwRBLKbPZVxyxO9xsY3vANR
	Rwvwi0J47Vooi6BYvQOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iegyk-0003A8-0K; Tue, 10 Dec 2019 14:59:10 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iegxc-00023k-2H; Tue, 10 Dec 2019 14:58:06 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B79AAC3E;
 Tue, 10 Dec 2019 14:57:55 +0000 (UTC)
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
Date: Tue, 10 Dec 2019 15:57:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191210132146.GF2703785@ulmo>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_065800_478008_A6CF6BDB 
X-CRM114-Status: GOOD (  21.77  )
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "palmer@sifive.com" <palmer@sifive.com>, "nsekhar@ti.com" <nsekhar@ti.com>,
 "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>,
 "rfontana@redhat.com" <rfontana@redhat.com>,
 "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "john@phrozen.org" <john@phrozen.org>, "robh@kernel.org" <robh@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "emilio@elopez.com.ar" <emilio@elopez.com.ar>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "swinslow@gmail.com" <swinslow@gmail.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "allison@lohutok.net" <allison@lohutok.net>,
 Aisheng Dong <aisheng.dong@nxp.com>, James Tai <james.tai@realtek.com>,
 Cheng-Yu Lee <cylee12@realtek.com>, "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "pdeschrijver@nvidia.com" <pdeschrijver@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "t-kristo@ti.com" <t-kristo@ti.com>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "kgene@kernel.org" <kgene@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "wangyan.wang@mediatek.com" <wangyan.wang@mediatek.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgVGhpZXJyeSwKCkFtIDEwLjEyLjE5IHVtIDE0OjIxIHNjaHJpZWIgVGhpZXJyeSBSZWRpbmc6
Cj4gT24gTW9uLCBEZWMgMDksIDIwMTkgYXQgMDg6NDQ6MzlQTSArMDAwMCwgTGVvbmFyZCBDcmVz
dGV6IHdyb3RlOgo+PiBPbiAwOS4xMi4yMDE5IDIxOjU4LCBZYW5ndGFvIExpIHdyb3RlOgo+Pj4g
VXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIHRvIHNpbXBsaWZ5IGNvZGUuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogWWFuZ3RhbyBMaSA8dGlueS53aW5kenpAZ21haWwuY29tPgo+
Pj4gLS0tCj4+PiAgIGRyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC1scGNnLmMgfCA2ICstLS0t
LQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC1scGNnLmMgYi9k
cml2ZXJzL2Nsay9pbXgvY2xrLWlteDhxeHAtbHBjZy5jCj4+PiBpbmRleCBjMGFmZjdjYTYzNzQu
LjEwYWU3MTI0NDdjNiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4
cC1scGNnLmMKPj4+ICsrKyBiL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OHF4cC1scGNnLmMKPj4+
IEBAIC0xNjQsNyArMTY0LDYgQEAgc3RhdGljIGludCBpbXg4cXhwX2xwY2dfY2xrX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+PiAgIAlzdHJ1Y3QgY2xrX2h3X29uZWNlbGxf
ZGF0YSAqY2xrX2RhdGE7Cj4+PiAgIAljb25zdCBzdHJ1Y3QgaW14OHF4cF9zc19scGNnICpzc19s
cGNnOwo+Pj4gICAJY29uc3Qgc3RydWN0IGlteDhxeHBfbHBjZ19kYXRhICpscGNnOwo+Pj4gLQlz
dHJ1Y3QgcmVzb3VyY2UgKnJlczsKPj4+ICAgCXN0cnVjdCBjbGtfaHcgKipjbGtzOwo+Pj4gICAJ
dm9pZCBfX2lvbWVtICpiYXNlOwo+Pj4gICAJaW50IGk7Cj4+PiBAQCAtMTczLDEwICsxNzIsNyBA
QCBzdGF0aWMgaW50IGlteDhxeHBfbHBjZ19jbGtfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPj4+ICAgCWlmICghc3NfbHBjZykKPj4+ICAgCQlyZXR1cm4gLUVOT0RFVjsKPj4+
ICAgCj4+PiAtCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01F
TSwgMCk7Cj4+PiAtCWlmICghcmVzKQo+Pj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4+PiAtCWJhc2Ug
PSBkZXZtX2lvcmVtYXAoZGV2LCByZXMtPnN0YXJ0LCByZXNvdXJjZV9zaXplKHJlcykpOwo+Pj4g
KwliYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwo+Pj4gICAJ
aWYgKCFiYXNlKQo+Pj4gICAJCXJldHVybiAtRU5PTUVNOwo+PiBUaGlzIGJyZWFrcyBpbXg4cXhw
LW1layBib290IGJ5IGNhdXNpbmcgbW9zdCBwZXJpcGhlcmFscyAobGlrZSB1YXJ0KSB0byAKPj4g
ZmFpbCB0byBwcm9iZS4KPj4KPj4gVGhlIG9sZCBhbmQgbmV3IHBhdGhzIGFyZSBub3QgZXF1aXZh
bGVudDogZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlCj4+IGNhbGxzIGRldm1faW9yZW1h
cF9yZXNvdXJjZSB3aGljaCBkaWZmZXJzIGZyb20gZGV2bV9pb3JlbWFwIGJ5IGFsc28gCj4+IGNh
bGxpbmcgZGV2bV9yZXF1ZXN0X21lbV9yZWdpb24uCj4+Cj4+IFRoaXMgcHJldmVudHMgb3RoZXIg
bWFwcGluZ3MgaW4gdGhlIGFyZWEgYW5kIGlteDhxeHAtbHBjZyBub2RlcyBtYXAgCj4+IHdob2xl
IGhhcmR3YXJlICJzdWJzeXN0ZW1zIiBhbmQgb3ZlcmxhcCBtb3N0IHBlcmlwaGVyYWxzLiBGb3Ig
ZXhhbXBsZToKPj4KPj4gICAgICAgICAgICAgICAgICAgYWRtYV9scGNnOiBjbG9jay1jb250cm9s
bGVyQDU5MDAwMDAwIHsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0g
ImZzbCxpbXg4cXhwLWxwY2ctYWRtYSI7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4NTkwMDAwMDAgMHgyMDAwMDAwPjsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAj
Y2xvY2stY2VsbHMgPSA8MT47Cj4+IAkJfTsKPj4KPj4gICAgICAgICAgICAgICAgICBhZG1hX2xw
dWFydDA6IHNlcmlhbEA1YTA2MDAwMCB7Cj4+IAkJCXJlZyA9IDwweDVhMDYwMDAwIDB4MTAwMD47
Cj4+IAkJCS4uLgo+PiAJCX07Cj4gVGhlIHdob2xlIHBvaW50IG9mIGRvaW5nIGEgcmVxdWVzdF9t
ZW1fcmVnaW9uKCkgaXMgdG8gYXZvaWQgaGF2aW5nCj4gbXVsdGlwbGUgZHJpdmVycyB0cmFtcGxl
IG9uIGVhY2ggb3RoZXJzJyBtYXBwaW5ncy4gV2hhdCB5b3UgZG8gYWJvdmUKPiBkb2Vzbid0IGxv
b2sgcmlnaHQuIFdoeSBkb2VzIHRoYXQgY2xvY2sgY29udHJvbGxlciBuZWVkIGFjY2VzcyB0byAz
Mgo+IE1pQiBvZiBJL08gbWVtb3J5IHNwYWNlPwoKSSBoYXZlIHNpbWlsYXIgY2FzZXMgd2l0aCBS
ZWFsdGVrIHdoZXJlIHJlZ2lzdGVycyBhcmUgc2ltcGx5IG5vdCBncm91cGVkCmludG8gY29udmVu
aWVudCBibG9ja3MgYnV0IHNwcmVhZCBhY3Jvc3MgbGFyZ2UgbWVtb3J5IHJlZ2lvbnMuCgpBbHNv
LCBGYWJpZW4gYW5kIEkgaGFkIGEgcmV2aWV3IGRpc2N1c3Npb24gYWJvdXQgdGhlIHZlcnkgc2Ft
ZSB0b3BpYyBvZgpzdWdnZXN0aW5nIHRoZXNlIGZ1bmN0aW9ucyB3aGljaCBpbXBsaWNpdGx5IGRv
IGEgcmVxdWVzdF9tZW1fcmVnaW9uKCksCnNvIHRoaXMgbWlnaHQgbmVlZCBzb21lIGJldHRlciBk
b2N1bWVudGF0aW9uIGZvciByYWlzaW5nIGF3YXJlbmVzcz8KCkZvciBzb21lIGNhc2VzIEkgcG9z
dGVkIHBhdGNoZXMgdG8gY29udmVydCB0aG9zZSB0byBzeXNjb24gLyBzaW1wbGUtbWZkLApidXQg
Y2xrIGluIHBhcnRpY3VsYXIgaXMgYSBkaWZmaWN1bHQgb25lOiBjbGtzIHN0aWxsIGV4cHJlc3Mg
dGhlaXIKcGFyZW50cyBieSBuYW1lcyByYXRoZXIgdGhhbiBwb2ludGVycywgYW5kIGhhdmluZyBj
bGtzIHNwcmVhZCBhY3Jvc3MKZHJpdmVycyBoYXMgaW1wbGljYXRpb25zIG9uIG5lZWRpbmcgdG8g
ZXhwb3NlIG5vbi1sZWFmIGNsb2NrcyBpbiB0aGUgRFQKYmluZGluZ3MsIGFzIHdlbGwgYXMgbmVl
ZGluZyB0byBtZXNzIHdpdGggX19jbGtfZ2V0X25hbWUoKSBmb3IgYWN0dWFsbHkKZ2V0dGluZyB0
aGUgbmFtZSB0byB1c2UgYXMgcGFyZW50IHdoZW4gb2J0YWluaW5nIHRoZSBjbGsgZnJvbSBEVC4K
SW1hZ2luZSBhIGxvbmVseSBjbGsgZ2F0ZSByZWdpc3RlciBhbmQgdGhlIFBMTHMgb3Igb3RoZXIg
Z2F0ZXMgdGhleSBhcmUKc3VwcGxpZWQgZnJvbSByZXNpZGluZyBmYXIgYXdheS4gSXQncyByZWFs
bHkgdWdseSBlaXRoZXIgd2F5Li4uCgpUaGF0IHNhaWQsIHRoZSBBY3Rpb25zIFNlbWkgcGF0Y2gg
MTYvMTcgdGhhdCBJJ20gQ0MnZWQgZm9yIGxvb2tzIG9rYXkuCgpSZWdhcmRzLApBbmRyZWFzCgo+
IAo+IFRoYXQgc2FpZCwgdGhlcmUgYXJlIGxlZ2l0aW1hdGUgcmVhc29ucyBmb3Igc2hhcmluZyBt
YXBwaW5ncyBhY3Jvc3MKPiBkcml2ZXJzLCBzbyBJIGFncmVlIHRoYXQgYXV0b21hdGVkIGNvbnZl
cnNpb25zIGxpa2UgdGhpcyBzaG91bGQgYmUgZG9uZQo+IHZlcnkgY2FyZWZ1bGx5LiBUaGUgZGlm
ZmljdWx0eSBpcyB0aGF0IHRoZXJlIGFyZSBjYXNlcyB3aGVyZSBkcml2ZXJzCj4gc2ltcGx5IG9t
aXR0ZWQgdGhhdCByZXF1ZXN0X21lbV9yZWdpb24oKSBieSBtaXN0YWtlIGFuZCB3aGVyZSB0aGUK
PiBjb252ZXJzaW9uIGNhbiBiZSBjb3JyZWN0IChhbmQgaW4gZmFjdCBhbiBpbXByb3ZlbWVudCks
IGJ1dCB3ZSBjYW4ndAo+IG1ha2UgdGhlIGFzc3VtcHRpb24gYmxpbmRseS4KPiAKPiBUaGllcnJ5
Cj4gCj4+IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzc3VlIGFmZmVjdHMgYW55IG90aGVyIHBsYXRm
b3JtcyAoaW14OCBscGNnIAo+PiBiaW5kaW5ncyBhcmUgdW51c3VhbCkgYnV0IGlmIHlvdSBmb3Vu
ZCB0aGlzIHdpdGggYW4gYXV0b21hdGVkIHRvb2wgCj4+IHBlcmhhcHMgaXQgc2hvdWxkIGJlIGFk
anVzdGVkPwo+Pgo+PiBCeSBteSBjb3VudCBpdCdzIHRoZSA0dGggdGltZSB0aGlzIGluY29ycmVj
dCBjbGVhbnVwIHdhcyBwb3N0ZWQuCj4+Cj4+IFByZXZpb3VzbHk6IGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDE5LzEyLzQvNDg3Cj4+Cj4+IC0tCj4+IFJlZ2FyZHMsCj4+IExlb25hcmQKCgotLSAK
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQpHRjogRmVsaXggSW1lbmTDtnJmZmVyCkhSQiAzNjgwOSAoQUcg
TsO8cm5iZXJnKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
