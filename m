Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC71DC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 11:09:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1811160232
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 11:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1811160232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hv9g8yex94bRFUJTLjASZSlG4fasuuJFTkRmHxiFcWY=; b=bnbIWi/qhJo25uaorZEY2Z5Ps
	j7g9yhJPcPx9z2CjIYxYaiW0cRzyX06Rg6dljj+vQDooZKBwaQecYddF+MZbZ1FDKTu3qonzm90aN
	vXTh/YRzGaLdBQaRQgN5rr37fcFSafbUm5SAvpxUo2c2j+ntPpdfJX5sfZJQjrW7HZJSCv9DzttHT
	iIC7XcMTPOxhYDb39aEA4CShMpO+XA048D7FXpmBv96ktKdC71a5Um8sXik1zwx5HHCFihQpUCBfI
	3bET2nZ30LXktXuqEy7WpHHcLytn6fIrM76LSj4N6CEmIbP/i2J+31Pn9JeJ7nVIGfbMOAu//+0rU
	jQtOjPHdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYoFO-00Bw71-N3; Tue, 20 Apr 2021 11:08:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYoFD-00Bw5h-Tp; Tue, 20 Apr 2021 11:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Transfer-Encoding
 :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=aj2JEAwTkE4hLwGtXJNjRx4OF4u7gryo40Aqh8DMwf8=; b=SlDdJ1VjfOBNaELlAvxmxvUDWF
 dm0tsbIzidlH6UB1XprBi3ZE92ASRcCYlBJSXVWNHPk4FTIG34/uYQu8NCcWP9OiJqbLELB+4rOxD
 Y7ummn8SsSDLLybhoFn2AJH5oY/zeTYkPn6y1CvEIQHGFw1tyx5HmxctI0GmqJ7/ePDrBeTLvGQuO
 RN4avXTNrr3A6xT6bhSTUhpn67eIntqDlkc6QM30MtjrRInHHhMTWJKztoW3MGG/kDAMAu5fZNbE4
 W4PUMGrYC68X2i5CW58s89GRCIAcPRjmWIk/ZrN0vttX5yvGY7EThRG5/mNPqy77LKfoBhfAwSGvs
 sLc7acTA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYoF9-00C3Mr-Fd; Tue, 20 Apr 2021 11:08:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E1D86135F;
 Tue, 20 Apr 2021 11:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618916914;
 bh=tXNrVitqe9y0c4Nre12+HdYi0aoTIvIA9p8ok75STd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJT5uKEZWaLIAkjrQec3Kjt2ltJrVRIvQG7xBxcfY2hLdBOPOQ7Khc8DHxndVE+Na
 5IM+xOPitZ7Fk0NrjEc8Ij23WEXGyh7E//elp6fExjfi0KEVKiDoAVLkUt3NQAOH2+
 82zHkS4yWt6w/11jtKN6cKbgNOdIXh51BbOmGg+MgUwIIMq0kgdpq+zSs+AzkPGb/P
 SDfyjb7U20ih6qyOKSgiPvX6c5AWZdJceGc7DvYka5aIBkzeJreqJC8Hauvh2nFPQo
 Tzc8Tfy6uyHuIr7BJ803PdhZ8SKiMiOi1Gxfs03cpOtBRvpCMa+7NpUXskc+xDadSL
 /5i1hOiMnEq/Q==
Received: by pali.im (Postfix)
 id 31C55A2D; Tue, 20 Apr 2021 13:08:32 +0200 (CEST)
Date: Tue, 20 Apr 2021 13:08:32 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com,
 Krzysztof Wilczyski <kw@linux.com>
Subject: Re: [PATCH v10 5/7] PCI: mediatek-gen3: Add MSI support
Message-ID: <20210420110832.iyjck2m2s5jlit26@pali>
References: <20210420061723.989-1-jianjun.wang@mediatek.com>
 <20210420061723.989-6-jianjun.wang@mediatek.com>
 <20210420094402.hwdkbspl5wu4rtex@pali>
 <87bla9qky1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87bla9qky1.wl-maz@kernel.org>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_040835_630337_314BC5DE 
X-CRM114-Status: GOOD (  27.56  )
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

T24gVHVlc2RheSAyMCBBcHJpbCAyMDIxIDEyOjAxOjEwIE1hcmMgWnluZ2llciB3cm90ZToKPiBP
biBUdWUsIDIwIEFwciAyMDIxIDEwOjQ0OjAyICswMTAwLAo+IFBhbGkgUm9ow6FyIDxwYWxpQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4gCj4gPiBIZWxsbyEKPiA+IAo+ID4gT24gVHVlc2RheSAyMCBB
cHJpbCAyMDIxIDE0OjE3OjIxIEppYW5qdW4gV2FuZyB3cm90ZToKPiA+ID4gK3N0YXRpYyB2b2lk
IG10a19wY2llX2VuYWJsZV9tc2koc3RydWN0IG10a19wY2llX3BvcnQgKnBvcnQpCj4gPiA+ICt7
Cj4gPiA+ICsJaW50IGk7Cj4gPiA+ICsJdTMyIHZhbDsKPiA+ID4gKwo+ID4gPiArCWZvciAoaSA9
IDA7IGkgPCBQQ0lFX01TSV9TRVRfTlVNOyBpKyspIHsKPiA+ID4gKwkJc3RydWN0IG10a19tc2lf
c2V0ICptc2lfc2V0ID0gJnBvcnQtPm1zaV9zZXRzW2ldOwo+ID4gPiArCj4gPiA+ICsJCW1zaV9z
ZXQtPmJhc2UgPSBwb3J0LT5iYXNlICsgUENJRV9NU0lfU0VUX0JBU0VfUkVHICsKPiA+ID4gKwkJ
CQlpICogUENJRV9NU0lfU0VUX09GRlNFVDsKPiA+ID4gKwkJbXNpX3NldC0+bXNnX2FkZHIgPSBw
b3J0LT5yZWdfYmFzZSArIFBDSUVfTVNJX1NFVF9CQVNFX1JFRyArCj4gPiA+ICsJCQkJICAgIGkg
KiBQQ0lFX01TSV9TRVRfT0ZGU0VUOwo+ID4gPiArCj4gPiA+ICsJCS8qIENvbmZpZ3VyZSB0aGUg
TVNJIGNhcHR1cmUgYWRkcmVzcyAqLwo+ID4gPiArCQl3cml0ZWxfcmVsYXhlZChsb3dlcl8zMl9i
aXRzKG1zaV9zZXQtPm1zZ19hZGRyKSwgbXNpX3NldC0+YmFzZSk7Cj4gPiA+ICsJCXdyaXRlbF9y
ZWxheGVkKHVwcGVyXzMyX2JpdHMobXNpX3NldC0+bXNnX2FkZHIpLAo+ID4gPiArCQkJICAgICAg
IHBvcnQtPmJhc2UgKyBQQ0lFX01TSV9TRVRfQUREUl9ISV9CQVNFICsKPiA+ID4gKwkJCSAgICAg
ICBpICogUENJRV9NU0lfU0VUX0FERFJfSElfT0ZGU0VUKTsKPiA+IAo+ID4gVGhpcyBsb29rcyBs
aWtlIGFzIHNldHRpbmcgTVNJIGRvb3JiZWxsIGFkZHJlc3MgdG8gTVNJIGRvb3JiZWxsIGFkZHJl
c3MuCj4gPiAKPiA+ID4gK3N0YXRpYyB2b2lkIG10a19jb21wb3NlX21zaV9tc2coc3RydWN0IGly
cV9kYXRhICpkYXRhLCBzdHJ1Y3QgbXNpX21zZyAqbXNnKQo+ID4gPiArewo+ID4gPiArCXN0cnVj
dCBtdGtfbXNpX3NldCAqbXNpX3NldCA9IGlycV9kYXRhX2dldF9pcnFfY2hpcF9kYXRhKGRhdGEp
Owo+ID4gPiArCXN0cnVjdCBtdGtfcGNpZV9wb3J0ICpwb3J0ID0gZGF0YS0+ZG9tYWluLT5ob3N0
X2RhdGE7Cj4gPiA+ICsJdW5zaWduZWQgbG9uZyBod2lycTsKPiA+ID4gKwo+ID4gPiArCWh3aXJx
ID0JZGF0YS0+aHdpcnEgJSBQQ0lFX01TSV9JUlFTX1BFUl9TRVQ7Cj4gPiA+ICsKPiA+ID4gKwlt
c2ctPmFkZHJlc3NfaGkgPSB1cHBlcl8zMl9iaXRzKG1zaV9zZXQtPm1zZ19hZGRyKTsKPiA+ID4g
Kwltc2ctPmFkZHJlc3NfbG8gPSBsb3dlcl8zMl9iaXRzKG1zaV9zZXQtPm1zZ19hZGRyKTsKPiA+
ID4gKwltc2ctPmRhdGEgPSBod2lycTsKPiA+ID4gKwlkZXZfZGJnKHBvcnQtPmRldiwgIm1zaSMl
I2x4IGFkZHJlc3NfaGkgJSN4IGFkZHJlc3NfbG8gJSN4IGRhdGEgJWRcbiIsCj4gPiA+ICsJCWh3
aXJxLCBtc2ctPmFkZHJlc3NfaGksIG1zZy0+YWRkcmVzc19sbywgbXNnLT5kYXRhKTsKPiA+IAo+
ID4gLi4uIHdoaWNoIGlzIGxhdGVyIHVzZWQgaW4gY29tcG9zZV9tc2lfbXNnKCkuCj4gPiAKPiA+
IE1hcmMgaW4gc29tZSBvdGhlciBwYXRjaGVzIGZvciBvdGhlciBwY2kgY29udHJvbGxlciBkcml2
ZXJzIGNoYW5nZWQgdGhpcwo+ID4gYWRkcmVzcyB0byBqdXN0IG1haW4gInBvcnQiIHN0cnVjdHVy
ZS4gSXQgc2ltcGxpZmllZCBpbXBsZW1lbnRhdGlvbnMgYW5kCj4gPiBhbHNvIGF2b2lkZWQgbmVl
ZCB0byBkZWNsYXJlIGFkZGl0aW9uYWwgbWVtYmVyICJtc2dfYWRkciIuCj4gPiAKPiA+IE1hcmMs
IHdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIHNpbXBsaWZ5IGl0IGFsc28gZm9yIHRoaXMgZHJpdmVy
IGFuZCBqdXN0Cj4gPiBzZXQgbXNnX2FkZHIgdG8gdmlydF90b19waHlzKHBvcnQpPwo+IAo+IE1h
eWJlLiBJdCByZWFsbHkgZGVwZW5kcyBvbiB3aGF0IHJhbmdlIHRoZSBIVyBhY2NlcHRzLCBhbmQg
dGhlIHNvbGUKPiByZXF1aXJlbWVudCBpcyB0byB1c2UgYW4gYWRkcmVzcyB0aGF0IHRoZSBlbmRw
b2ludCBjYW5ub3QgRE1BCj4gdG8uIEhlcmUsIHRoZSBkcml2ZXIgc2VlbXMgdG8gYmUgdXNpbmcg
c29tZXRoaW5nIGJhc2VkIG9uIHRoZSBwb3J0Cj4gYmFzZSBhZGRyZXNzLCB3aGljaCBpcyBnb29k
IGVub3VnaCBhcyBmYXIgYXMgSSBhbSBjb25jZXJuZWQgKHRoZSB0aGluZwo+IEkgdXN1YWxseSBv
YmplY3QgdG8gaXMgdGhlIGFsbG9jYXRpb24gb2YgbWVtb3J5IGp1c3QgZm9yIHRoZSBzYWtlIG9m
Cj4gZ2V0dGluZyBhIGNhcHR1cmUgYWRkcmVzcykuCj4gCj4gSWYgeW91IHdhbnQgdG8gZnVydGhl
ciBzaW1wbGlmeSBpdCwgeW91IGNvdWxkIHNpbXBseSB1c2UgcG9ydC5yZWdfYmFzZQo+IGFzIHRo
ZSBNU0kgYWRkcmVzcyBmb3IgYWxsIHNldHMsIGFzIEkgZG9uJ3QgdGhpbmsgdGhleSBoYXZlIHRv
IGJlCj4gZGlzdGluY3QuIEJ1dCBzb21lb25lIHdpdGggYWNjZXNzIHRvIHRoZSBUUk0gZm9yIHRo
aXMgc2hvdWxkIGdvIGFuZAo+IGNoZWNrIGl0Lgo+IAo+IEkgZG9uJ3QgYmVsaWV2ZSB0aGlzIHNo
b3VsZCBnYXRlIHRoZSBtZXJnaW5nIG9kIHRoaXMgZHJpdmVyIHRob3VnaC4KCk9mIGNvdXJzZSEg
SSdtIGp1c3QgYXNraW5nIGRldGFpbHMgdG8gdW5kZXJzdGFuZCBiZXN0IHByYWN0aXNlcyBhbmQg
aG93Cml0IHdvcmtzLiBTbyB0aGFua3MgZm9yIGluZm9ybWF0aW9uIQoKPiAJTS4KPiAKPiAtLSAK
PiBXaXRob3V0IGRldmlhdGlvbiBmcm9tIHRoZSBub3JtLCBwcm9ncmVzcyBpcyBub3QgcG9zc2li
bGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
