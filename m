Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AA6C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:03:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E0B64F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7E0B64F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EFaN1J784a0NWNpDugcOltk/eICsr9sNmjpW48vb7pc=; b=F23dm2bcW30+J3M41Zg6MQW+B
	kRT2e+ZGzo39E06e8kvYLthFIv9n4S4nvFELjLXSpPwW0Rkiay/cG6OgW2qMupjCGhnjN1To5Uu5o
	nLPGAyc2EnuJRzmyY/2g0SyVpyY/ZCOAiHZNfDZ1o0vJ22vAGFw1bc6Xahn+wBsxMzn8Mfd+CTrFm
	xwqRtFNmgxZeg66DRdpEFlmw4kBlPh43/jaQWHVkCPnKreKx+RKvfKoqbXc1vZjIVXEp8POqXAfiI
	GP7YvloJavjE/A8bnh3pVrGnutiEtXkJRdqqrBTy3szTn+xkJ4bn17ERu5ODeZta7vE3/G6xUfEWh
	Y46RXVQdA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMg82-0048vP-4q; Thu, 18 Mar 2021 00:03:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMg7K-0048sx-D5; Thu, 18 Mar 2021 00:02:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EC4D64F26;
 Thu, 18 Mar 2021 00:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616025734;
 bh=vresu2JOh2P7GZ/rMBfA5rTS0ajtTjBCvoZV08Sk+io=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=je6CmOhaVM4p4tGNzDMHgEx0pYGEAjhtEWu9Q0qdlDUXnTIGpDK2Bydk3OjUFvhp1
 xc8b1Wv21q+6HkFj4ed+odlffSNg6Z/TscVV5viovfg0jLODgtIxXk4QSU9gXpLckx
 QPd7oxHEawOUuj8X08KNOEfmNERjlzy/u7k1iPVzfBElmAJ7b3Ie4n/gx4afV7AH6G
 lWBwQi17mqeofHOAJcavZbB8KqwsQ9wuSjPBBI8/BHBdMrCMr4m4X8+cSNrXSXLAog
 AM+H04t9NNykXep1a8u/s8Ujh9t+bSaLKbeRUwzGopUqD8Cef7ehLnU0uJVX7sSVpr
 fIKfdwlINGo9g==
Received: by pali.im (Postfix)
 id EFD9B8A9; Thu, 18 Mar 2021 01:02:11 +0100 (CET)
Date: Thu, 18 Mar 2021 01:02:11 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 maz@kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Sj Huang <sj.huang@mediatek.com>, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com
Subject: Re: [v8,3/7] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
Message-ID: <20210318000211.ykjsfavfc7suu2sb@pali>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-4-jianjun.wang@mediatek.com>
 <20210311123844.qzl264ungtk7b6xz@pali>
 <1615621394.25662.70.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615621394.25662.70.camel@mhfsdcap03>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_000242_025577_E86B0F2A 
X-CRM114-Status: GOOD (  34.59  )
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

T24gU2F0dXJkYXkgMTMgTWFyY2ggMjAyMSAxNTo0MzoxNCBKaWFuanVuIFdhbmcgd3JvdGU6Cj4g
T24gVGh1LCAyMDIxLTAzLTExIGF0IDEzOjM4ICswMTAwLCBQYWxpIFJvaMOhciB3cm90ZToKPiA+
IE9uIFdlZG5lc2RheSAyNCBGZWJydWFyeSAyMDIxIDE0OjExOjI4IEppYW5qdW4gV2FuZyB3cm90
ZToKPiA+ID4gK3N0YXRpYyBpbnQgbXRrX3BjaWVfc3RhcnR1cF9wb3J0KHN0cnVjdCBtdGtfcGNp
ZV9wb3J0ICpwb3J0KQo+ID4gPiArewo+ID4gLi4uCj4gPiA+ICsKPiA+ID4gKwkvKiBEZWxheSAx
MDBtcyB0byB3YWl0IHRoZSByZWZlcmVuY2UgY2xvY2tzIGJlY29tZSBzdGFibGUgKi8KPiA+ID4g
Kwltc2xlZXAoMTAwKTsKPiA+ID4gKwo+ID4gPiArCS8qIERlLWFzc2VydCBQRVJTVCMgc2lnbmFs
ICovCj4gPiA+ICsJdmFsICY9IH5QQ0lFX1BFX1JTVEI7Cj4gPiA+ICsJd3JpdGVsX3JlbGF4ZWQo
dmFsLCBwb3J0LT5iYXNlICsgUENJRV9SU1RfQ1RSTF9SRUcpOwo+ID4gCj4gPiBIZWxsbyEgVGhp
cyBpcyBhIG5ldyBkcml2ZXIgd2hpY2ggaW50cm9kdWNlIHlldCBhbm90aGVyIGN1c3RvbSB0aW1l
b3V0Cj4gPiBwcmlvciBQRVJTVCMgc2lnbmFsIGZvciBQQ0llIGNhcmQgaXMgZGUtYXNzZXJ0ZWQu
IFRpbWVvdXRzIGZvciBvdGhlcgo+ID4gZHJpdmVycyBJIGNvbGxlY3RlZCBpbiBvbGRlciBlbWFp
bCBbMl0uCj4gPiAKPiA+IFBsZWFzZSBsb29rIGF0IG15IGVtYWlsIFsxXSBhYm91dCBQQ0llIFdh
cm0gUmVzZXQgaWYgeW91IGhhdmUgYW55IGNsdWUKPiA+IGFib3V0IGl0LiBMb3JlbnpvIGFuZCBS
b2IgYWxyZWFkeSBleHByZXNzZWQgdGhhdCB0aGlzIHRpbWVvdXQgc2hvdWxkIG5vdAo+ID4gYmUg
ZHJpdmVyIHNwZWNpZmljLiBCdXQgbm9ib2R5IHdhcyBhYmxlIHRvICJkZWNvZGUiIGFuZCAidW5k
ZXJzdGFuZCIKPiA+IFBDSWUgc3BlYyB5ZXQgYWJvdXQgdGhlc2UgdGltZW91dHMuCj4gCj4gSGkg
UGFsaSwKPiAKPiBJIHRoaW5rIHRoaXMgaXMgbW9yZSBsaWtlIGEgcGxhdGZvcm0gc3BlY2lmaWMg
dGltZW91dCwgd2hpY2ggaXMgdXNlZCB0bwo+IHdhaXQgZm9yIHRoZSByZWZlcmVuY2UgY2xvY2tz
IHRvIGJlY29tZSBzdGFibGUgYW5kIGZpbmlzaCB0aGUgcmVzZXQgZmxvdwo+IG9mIEhXIGJsb2Nr
cy4KPiAKPiBIZXJlIGlzIHRoZSBzdGVwcyB0byBzdGFydCBhIGxpbmsgdHJhaW5pbmcgaW4gdGhp
cyBIVzoKPiAKPiAxLiBBc3NlcnQgYWxsIHJlc2V0IHNpZ25hbHMgd2hpY2ggaW5jbHVkaW5nIHRo
ZSB0cmFuc2FjdGlvbiBsYXllciwgUElQRQo+IGludGVyZmFjZSBhbmQgaW50ZXJuYWwgYnVzIGlu
dGVyZmFjZTsKPiAKPiAyLiBEZS1hc3NlcnQgcmVzZXQgc2lnbmFscyBleGNlcHQgdGhlIFBFUlNU
IywgdGhpcyB3aWxsIG1ha2UgdGhlCj4gcGh5c2ljYWwgbGF5ZXIgYWN0aXZlIGFuZCBzdGFydCB0
byBvdXRwdXQgdGhlIHJlZmVyZW5jZSBjbG9jaywgYnV0IHRoZQo+IEVQIGRldmljZSByZW1haW5z
IGluIHRoZSByZXNldCBzdGF0ZS4KPiAgICBCZWZvcmUgcmVsZWFzaW5nIHRoZSBQRVJTVCMgc2ln
bmFsLCB0aGUgSFcgYmxvY2tzIG5lZWRzIGF0IGxlYXN0IDEwbXMKPiB0byBmaW5pc2ggdGhlIHJl
c2V0IGZsb3csIGFuZCByZWYtY2xrIG5lZWRzIGFib3V0IDMwdXMgdG8gYmVjb21lIHN0YWJsZS4K
PiAKPiAzLiBEZS1hc3NlcnQgUEVSU1QjIHNpZ25hbCwgd2FpdCBMVFNTTSBlbnRlciBMMCBzdGF0
ZS4KPiAKPiBUaGlzIDEwMG1zIHRpbWVvdXQgaXMgcmVmZXJlbmNlIHRvIFRQVlBFUkwgaW4gdGhl
IFBDSWUgQ0VNIHNwZWMuIFNpbmNlCj4gd2UgYXJlIGluIHRoZSBrZXJuZWwgc3RhZ2UsIHRoZSBw
b3dlciBzdXBwbHkgaGFzIGFscmVhZHkgc3RhYmxlZCwgdGhpcwo+IHRpbWVvdXQgbWF5IG5vdCB0
YWtlIHRoYXQgbG9uZy4KCkkgdGhpbmsgdGhhdCB0aGlzIGlzIG5vdCBwbGF0Zm9ybSBzcGVjaWZp
YyB0aW1lb3V0IG9yIHBsYXRmb3JtIHNwZWNpZmljCnN0ZXBzLiBUaGlzIG1hdGNoZXMgZ2VuZXJp
YyBzdGVwcyBhcyBkZWZpbmVkIGluIFBDSWUgQ0VNIHNwZWMsIHNlY3Rpb24KMi4yLjEuIEluaXRp
YWwgUG93ZXItVXAgKEczIHRvIFMwKS4KCldoYXQgaXMgcGxhdGZvcm0gc3BlY2lmaWMgaXMganVz
dCBob3cgdG8gYWNoaWV2ZSB0aGVzZSBzdGVwcy4KCkFtIEkgcmlnaHQ/CgouLi4KClRQVlBFUkwg
aXMgb25lIG9mIG15IHRpbWVvdXQgY2FuZGlkYXRlcyBhcyBtaW5pbWFsIHJlcXVpcmVkIHRpbWVv
dXQgZm9yCldhcm0gUmVzZXQuIEkgaGF2ZSB3cm90ZSBpdCBpbiBlbWFpbDoKCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LXBjaS8yMDIwMDQzMDA4MjI0NS54Ymx2Yjd4ZWFtbTRlMzM2QHBh
bGkvCgpCdXQgSSdtIG5vdCBzdXJlIGFzIHNwZWNpYWxseSBpbiBub25lIGRpYWdyYW0gaXMgZGVz
Y3JpYmVkIGp1c3Qgd2FybQpyZXNldCBhcyBkZWZpbmVkIGluIG1QQ0llIENFTSAoMy4yLjQuMy4g
UEVSU1QjIFNpZ25hbCkuCgouLi4KCkFueXdheSwgSSB3b3VsZCBzdWdnZXN0IHRvIGRlZmluZSBj
b25zdGFudHMgZm9yIHRob3NlIHRpbWVvdXRzLiBJIGd1ZXNzCnRoYXQgaW4gZnV0dXJlIHdlIGNv
dWxkIGJlIGFibGUgdG8gZGVmaW5lICJnZW5lcmljIiB0aW1lb3V0IGNvbnN0YW50cwp3aGljaCB3
b3VsZCBub3QgYmUgaW4gcHJpdmF0ZSBkcml2ZXIgc2VjdGlvbiwgYnV0IGluIHNvbWUgY29tbW9u
IGhlYWRlcgpmaWxlLgoKPiA+ID4gKwo+ID4gPiArCS8qIENoZWNrIGlmIHRoZSBsaW5rIGlzIHVw
IG9yIG5vdCAqLwo+ID4gPiArCWVyciA9IHJlYWRsX3BvbGxfdGltZW91dChwb3J0LT5iYXNlICsg
UENJRV9MSU5LX1NUQVRVU19SRUcsIHZhbCwKPiA+ID4gKwkJCQkgISEodmFsICYgUENJRV9QT1JU
X0xJTktVUCksIDIwLAo+ID4gPiArCQkJCSA1MCAqIFVTRUNfUEVSX01TRUMpOwo+ID4gCj4gPiBJ
SVJDLCB5b3UgbmVlZCB0byB3YWl0IGF0IGxlYXN0IDEwMG1zIGFmdGVyIGRlLWFzc2VydGluZyBQ
RVJTVCMgc2lnbmFsCj4gPiBhcyBpdCBpcyByZXF1aXJlZCBieSBQQ0llIHNwZWNzIGFuZCBhbHNv
IGJlY2F1c2UgZXhwZXJpbWVudHMgcHJvdmVkIHRoYXQKPiA+IHNvbWUgQ29tcGV4IHdpZmkgY2Fy
ZHMgKGUuZy4gV0xFOTAwVlgpIGFyZSBub3QgZGV0ZWN0ZWQgaWYgeW91IGRvIG5vdAo+ID4gd2Fp
dCB0aGlzIG1pbmltYWwgdGltZS4KPiAKPiBZZXMsIHRoaXMgc2hvdWxkIGJlIDEwMG1zLCBJIHdp
bGwgZml4IGl0IGF0IG5leHQgdmVyc2lvbiwgdGhhbmtzIGZvcgo+IHlvdXIgcmV2aWV3LgoKSW4g
cGFzdCBCam9ybiBzdWdnZXN0ZWQgdG8gdXNlIG1zbGVlcChQQ0lfUE1fRDNDT0xEX1dBSVQpOyBt
YWNybyBmb3IKdGhpcyBzdGVwIGR1cmluZyByZXZpZXdpbmcgYWFyZHZhcmsgZHJpdmVyLgoKaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzIwMTkwNDI2MTYxMDUwLkdBMTg5OTY0QGdv
b2dsZS5jb20vCgpBbmQgbmV4dCBpdGVyYXRpb24gdXNlZCB0aGlzIFBDSV9QTV9EM0NPTERfV0FJ
VCBtYWNybyBpbnN0ZWFkIG9mIDEwMDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXBj
aS8yMDE5MDUyMjIxMzM1MS4yMTM2Ni0yLXJlcGtAdHJpcGxlZmF1Lmx0LwoKPiBUaGFua3MuCj4g
PiAKPiA+ID4gKwlpZiAoZXJyKSB7Cj4gPiA+ICsJCXZhbCA9IHJlYWRsX3JlbGF4ZWQocG9ydC0+
YmFzZSArIFBDSUVfTFRTU01fU1RBVFVTX1JFRyk7Cj4gPiA+ICsJCWRldl9lcnIocG9ydC0+ZGV2
LCAiUENJZSBsaW5rIGRvd24sIGx0c3NtIHJlZyB2YWw6ICUjeFxuIiwgdmFsKTsKPiA+ID4gKwkJ
cmV0dXJuIGVycjsKPiA+ID4gKwl9Cj4gPiAKPiA+IFsxXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LXBjaS8yMDIxMDMxMDExMDUzNS56aDRwbm40dnBtdnp3bDVxQHBhbGkvCj4gPiBb
Ml0gLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAyMDA0MjQwOTI1NDYuMjVw
M2hkdGtlaG9oZTN4d0BwYWxpLwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
