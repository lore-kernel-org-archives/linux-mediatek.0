Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45978C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:21:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3ED5619A9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 01:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3ED5619A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EePea3MqkAQ7Ea+8gpd4sDGpZWnEtTDARmqlm6M3wTA=; b=X43uGvtYvgcd8A6EZ3GKAQHek
	QXVvhOIQwpKCrENBxpJ1LlBk3D0qCxEtoQugh9lO7Vn7MZQ0/wEtLtq2AQJL0cGYG9VliIyatCRrX
	tI4yL1E8Ki7lLFm/35OlKAv25Upl8Gl7ANx9L1xZXuQNXWmwXgACiu5d2sp+piYtXt6FIrs3fCkRe
	FJ/usSY2iUe6yl2P0X5OPavoqBt/ETIviQ4EbSLA3xvMcL4kyFvMWZ5hYFFwwS46oo4c5gd/NZyfu
	DGdQY2Vxdp2WJBU/OU5jn095Mv0IN1Rq3fQ9hcHK1TezRraX3MudthWEVkMRjgar2q3waTDn9Hdju
	3oQrhv4tw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR34L-002Kzw-Ml; Tue, 30 Mar 2021 01:21:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR0qI-001njq-PO; Mon, 29 Mar 2021 22:58:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3E6761987;
 Mon, 29 Mar 2021 22:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617058718;
 bh=jhysSetweRUJdS8VenXWdDpmgxH3meIzQdLA2n+rNm0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NX3jpCkg50kc51Psd4U6zDewVQFQWSR2kXksn3BxHwIudf8SBsko8ehoG3HOi7ujV
 1slDQ533ySqgv5YqvAXuO11FrXhiX/iv+8p9oGHz0GvXy5Uz5DrB+c7W8mNRaBqYok
 5rY8oD3x8lYdsWu1EWHhKnk9cMTMQFDZRB/Cc56SH3eofsTWzNIA08RdWG1iAwwMbG
 sb5+OlZREYqIz19u8KIwGYX2lkDefSMoiTK33xlN84ZFTXcz5aapzHdjSxhVj3EyPC
 NA/XOqYB9xIMoLA5y+9MyJj1dDgdUoIkLq0F7f58WhJzmMP5BNjy2ixirK0Yxb+Qss
 VKMeJCgQHDZWA==
Received: by pali.im (Postfix)
 id 515CBA79; Tue, 30 Mar 2021 00:58:35 +0200 (CEST)
Date: Tue, 30 Mar 2021 00:58:35 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 maz@kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Sj Huang <sj.huang@mediatek.com>, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com
Subject: Re: [v8,3/7] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
Message-ID: <20210329225835.cv2ev5ou5szvrws2@pali>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-4-jianjun.wang@mediatek.com>
 <20210311123844.qzl264ungtk7b6xz@pali>
 <1615621394.25662.70.camel@mhfsdcap03>
 <20210318000211.ykjsfavfc7suu2sb@pali>
 <1616046487.31760.16.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616046487.31760.16.camel@mhfsdcap03>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_235846_254170_26836671 
X-CRM114-Status: GOOD (  21.91  )
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

T24gVGh1cnNkYXkgMTggTWFyY2ggMjAyMSAxMzo0ODowNyBKaWFuanVuIFdhbmcgd3JvdGU6Cj4g
T24gVGh1LCAyMDIxLTAzLTE4IGF0IDAxOjAyICswMTAwLCBQYWxpIFJvaMOhciB3cm90ZToKPiA+
IE9uIFNhdHVyZGF5IDEzIE1hcmNoIDIwMjEgMTU6NDM6MTQgSmlhbmp1biBXYW5nIHdyb3RlOgo+
ID4gPiBPbiBUaHUsIDIwMjEtMDMtMTEgYXQgMTM6MzggKzAxMDAsIFBhbGkgUm9ow6FyIHdyb3Rl
Ogo+ID4gPiA+IE9uIFdlZG5lc2RheSAyNCBGZWJydWFyeSAyMDIxIDE0OjExOjI4IEppYW5qdW4g
V2FuZyB3cm90ZToKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJLyogQ2hlY2sgaWYgdGhlIGxpbmsg
aXMgdXAgb3Igbm90ICovCj4gPiA+ID4gPiArCWVyciA9IHJlYWRsX3BvbGxfdGltZW91dChwb3J0
LT5iYXNlICsgUENJRV9MSU5LX1NUQVRVU19SRUcsIHZhbCwKPiA+ID4gPiA+ICsJCQkJICEhKHZh
bCAmIFBDSUVfUE9SVF9MSU5LVVApLCAyMCwKPiA+ID4gPiA+ICsJCQkJIDUwICogVVNFQ19QRVJf
TVNFQyk7Cj4gPiA+ID4gCj4gPiA+ID4gSUlSQywgeW91IG5lZWQgdG8gd2FpdCBhdCBsZWFzdCAx
MDBtcyBhZnRlciBkZS1hc3NlcnRpbmcgUEVSU1QjIHNpZ25hbAo+ID4gPiA+IGFzIGl0IGlzIHJl
cXVpcmVkIGJ5IFBDSWUgc3BlY3MgYW5kIGFsc28gYmVjYXVzZSBleHBlcmltZW50cyBwcm92ZWQg
dGhhdAo+ID4gPiA+IHNvbWUgQ29tcGV4IHdpZmkgY2FyZHMgKGUuZy4gV0xFOTAwVlgpIGFyZSBu
b3QgZGV0ZWN0ZWQgaWYgeW91IGRvIG5vdAo+ID4gPiA+IHdhaXQgdGhpcyBtaW5pbWFsIHRpbWUu
Cj4gPiA+IAo+ID4gPiBZZXMsIHRoaXMgc2hvdWxkIGJlIDEwMG1zLCBJIHdpbGwgZml4IGl0IGF0
IG5leHQgdmVyc2lvbiwgdGhhbmtzIGZvcgo+ID4gPiB5b3VyIHJldmlldy4KPiA+IAo+ID4gSW4g
cGFzdCBCam9ybiBzdWdnZXN0ZWQgdG8gdXNlIG1zbGVlcChQQ0lfUE1fRDNDT0xEX1dBSVQpOyBt
YWNybyBmb3IKPiA+IHRoaXMgc3RlcCBkdXJpbmcgcmV2aWV3aW5nIGFhcmR2YXJrIGRyaXZlci4K
PiA+IAo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzIwMTkwNDI2MTYxMDUw
LkdBMTg5OTY0QGdvb2dsZS5jb20vCj4gPiAKPiA+IEFuZCBuZXh0IGl0ZXJhdGlvbiB1c2VkIHRo
aXMgUENJX1BNX0QzQ09MRF9XQUlUIG1hY3JvIGluc3RlYWQgb2YgMTAwOgo+ID4gCj4gPiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1wY2kvMjAxOTA1MjIyMTMzNTEuMjEzNjYtMi1yZXBr
QHRyaXBsZWZhdS5sdC8KPiAKPiBTdXJlLCBJIHdpbGwgdXNlIFBDSV9QTV9EM0NPTERfV0FJVCBt
YWNybyBpbnN0ZWFkIGluIHRoZSBuZXh0IHZlcnNpb24uCj4gCj4gVGhhbmtzLgoKQW55d2F5LCBu
b3cgSSBmb3VuZCBvdXQgdGhhdCBrZXJuZWwgaGFzIGZ1bmN0aW9ucyBmb3IgdGhpcyB3YWl0aW5n
OgpwY2llX3dhaXRfZm9yX2xpbmtfZGVsYXkoKSBhbmQgcGNpZV93YWl0X2Zvcl9saW5rKCkKCkZ1
bmN0aW9uIGlzIGNhbGxlZCBmcm9tIHBjaV9icmlkZ2Vfd2FpdF9mb3Jfc2Vjb25kYXJ5X2J1cygp
LgoKQnV0IGluIGN1cnJlbnQgZm9ybSBpdCBpcyBub3QgdXNhYmxlIGZvciBuYXRpdmUgY29udHJv
bGxlciBkcml2ZXJzLgoKVGhpcyBsb29rcyBsaWtlIGFub3RoZXIgY2FuZGlkYXRlIGZvciBjb2Rl
IGRlLWR1cGxpY2F0aW9uIG9yIHByb3ZpZGluZwoiZnJhbWV3b3JrIi4KCgpMb3JlbnpvLCBhcyBt
YWludGFpbmVyIG9mIG5hdGl2ZSBjb250cm9sbGVyIGRyaXZlcnMsIGRvIHlvdSBoYXZlIHNvbWUK
aWRlYXMgYWJvdXQgcHJvdmlkaW5nICJmcmFtZXdvcmsiLCBjb21tb24gZnVuY3Rpb25zIG9yIHNv
bWV0aGluZyBmb3IKYXZvaWRpbmcgdG8gaW1wbGVtZW50IHNhbWUgY29kZSBwYXR0ZXJucyBpbiBl
dmVyeSBuYXRpdmUgY29udHJvbGxlcgpkcml2ZXIsIHdoaWNoIGlzIGRlLWZhY3RvIHN0YW5kYXJk
IFBDSWUgY29kZXBhdGg/IEluY2x1ZGluZyBhIHdheSBob3cgdG8KZXhwb3J0IFBFUlNUIyByZXNl
dCBncGlvPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
