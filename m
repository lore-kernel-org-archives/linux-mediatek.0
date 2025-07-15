Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C4DC83F1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 05:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKkYf0pf9SiiYQLjJSXZhHpp5J+CagnmvAcX4Q1WL1E=; b=tYQ6GJYTYMI54YWcb69RsFS/wb
	DU2wPfTAukWM6V1WVLg6klZd/EgtV+FiQMQqpqYunifKnLTGWOhtn+yLEAzCzr7dWEVdm8pVCOCaw
	oTwwZKh43NF0gdgF6p2EsfzxjGN3Xwbf68AHe1r2KO34wXPnTCwADbs+/HGrV2dVKbw2sRMMLJNTz
	EVP9u8xEKAAzYwx6o9YuNPPesGLk61UFAZx4kKzj3ycfILFGuyjuAf0gCoMeZ3D0TJUZUGOKjAs6t
	T8YgPtAvhjiaRWtgJen/pLBSmvsPdVHkZvKn/czIjO+20Mbl5V2vazTx+ApD3j5NIkxUgSUYBT/6O
	R6r2Jm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYeJ-000000049K2-3uMX;
	Tue, 15 Jul 2025 05:56:19 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYeG-000000049I1-0WhA
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 05:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=2AAMJf9maUaSbdg1Sv1it05urNJplT7iXxy+4HxO3a4=; b=V
	X+QduDYHn7WI5C8WTm1hyejbxQyFZJk0I9jYC9AHKiHCgkkLtItpylL5oEU/aO4B
	JIfz+agsJfJg4r7VWDAXKdNlf7cFSoKUvJ5xxz8ET4HInT/k7g6mZ93DEPOnmO9A
	H1Sejfa5f0jIdX51i1lAoLnWoP4s9CtD98mCHptK2g=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-109 (Coremail) ; Tue, 15 Jul 2025 13:54:29 +0800
 (CST)
X-Originating-IP: [58.22.7.114]
Date: Tue, 15 Jul 2025 13:54:29 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	mripard@kernel.org, neil.armstrong@linaro.org,
	dri-devel@lists.freedesktop.org, dianders@chromium.org,
	jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
	p.zabel@pengutronix.de, simona@ffwll.ch, victor.liu@nxp.com,
	rfoss@kernel.org, chunkuang.hu@kernel.org,
	cristian.ciocaltea@collabora.com, Laurent.pinchart@ideasonboard.com,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
	"Andy Yan" <andy.yan@rock-chips.com>
Subject: Re:Re: [PATCH v3 2/2] drm/bridge: Pass down connector to drm bridge
 detect hook
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <85ple2ju6m.wl-ashutosh.dixit@intel.com>
References: <20250703125027.311109-1-andyshrk@163.com>
 <20250703125027.311109-3-andyshrk@163.com>
 <chznjpcx6p2vn3i5jt52peikhipzjiwzlr74gx6mzp3wjstr6p@6zhhknnl3zek>
 <85ple2ju6m.wl-ashutosh.dixit@intel.com>
X-NTES-SC: AL_Qu2eAPmet0At7yWRYOkfmkcVgOw9UcO5v/Qk3oZXOJF8jCPp9C0vUnNTMUnG6MWDDiCwnQiHWzVR6spgbahGYoQgR2kpPlq5MmA38IZpXJoXxw==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <23a4efde.4f62.1980ca61c5e.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bSgvCgD3n84V7XVo2yEEAA--.19921W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgGLXmh15WLOpAADs1
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_225616_533078_4CEA7821 
X-CRM114-Status: GOOD (  15.71  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpIaSBEaXhpdCzCoApBdCAyMDI1LTA3LTE1IDA2OjE1OjEzLCAiRGl4aXQsIEFzaHV0b3NoIiA8
YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPiB3cm90ZToKPk9uIFRodSwgMDMgSnVsIDIwMjUgMTQ6
Mjc6NDMgLTA3MDAsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6Cj4+Cj4+IE9uIFRodSwgSnVsIDAz
LCAyMDI1IGF0IDA4OjQ5OjUzUE0gKzA4MDAsIEFuZHkgWWFuIHdyb3RlOgo+Cj5IaSBBbmR5LAo+
Cj4+ID4gRnJvbTogQW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiA+Cj4+ID4g
SW4gc29tZSBhcHBsaWNhdGlvbiBzY2VuYXJpb3MsIHdlIGhvcGUgdG8gZ2V0IHRoZSBjb3JyZXNw
b25kaW5nCj4+ID4gY29ubmVjdG9yIHdoZW4gdGhlIGJyaWRnZSdzIGRldGVjdCBob29rIGlzIGlu
dm9rZWQuCj4+ID4KPj4gPiBJbiBtb3N0IGNhc2VzLCB3ZSBjYW4gZ2V0IHRoZSBjb25uZWN0b3Ig
YnkgZHJtX2F0b21pY19nZXRfY29ubmVjdG9yX2Zvcl9lbmNvZGVyCj4+ID4gaWYgdGhlIGVuY29k
ZXIgYXR0YWNoZWQgdG8gdGhlIGJyaWRnZSBpcyBlbmFibGVkLCBob3dldmVyIHRoZXJlIHdpbGwK
Pj4gPiBzdGlsbCBiZSBzb21lIHNjZW5hcmlvcyB3aGVyZSB0aGUgZGV0ZWN0IGhvb2sgb2YgdGhl
IGJyaWRnZSBpcyBjYWxsZWQKPj4gPiBidXQgdGhlIGNvcnJlc3BvbmRpbmcgZW5jb2RlciBoYXMg
bm90IGJlZW4gZW5hYmxlZCB5ZXQuIEZvciBpbnN0YW5jZSwKPj4gPiB0aGlzIG9jY3VycyB3aGVu
IHRoZSBkZXZpY2UgaXMgaG90IHBsdWcgaW4gZm9yIHRoZSBmaXJzdCB0aW1lLgo+PiA+Cj4+ID4g
U2luY2UgdGhlIGNhbGwgdG8gYnJpZGdlJ3MgZGV0ZWN0IGlzIGluaXRpYXRlZCBieSB0aGUgY29u
bmVjdG9yLCBwYXNzaW5nCj4+ID4gZG93biB0aGUgY29ycmVzcG9uZGluZyBjb25uZWN0b3IgZGly
ZWN0bHkgd2lsbCBtYWtlIHRoaW5ncyBzaW1wbGVyLgo+PiA+Cj4+ID4gU2lnbmVkLW9mZi1ieTog
QW5keSBZYW4gPGFuZHkueWFuQHJvY2stY2hpcHMuY29tPgo+PiA+IC0tLQo+PiA+Cj4+Cj4+IFJl
dmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29t
bS5jb20+Cj4KPlRoaXMgc2VlbXMgdG8gYmUgYnJlYWtpbmcgJ21ha2UgYWxsbW9kY29uZmlnJy4g
VGhpcyBpcyB3aGF0IGlzIGJlaW5nIHNlZW46Cj4KPi4uL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
bWVnYWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jOiBJbiBmdW5jdGlvbiDigJhnZV9iODUw
djNfbHZkc19kZXRlY3TigJk6Cj4uLi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21lZ2FjaGlwcy1z
dGRweHh4eC1nZS1iODUwdjMtZncuYzoxNDU6MTY6IGVycm9yOiB0b28gZmV3IGFyZ3VtZW50cyB0
byBmdW5jdGlvbiDigJhnZV9iODUwdjNfbHZkc19icmlkZ2VfZGV0ZWN04oCZCj4gIDE0NSB8ICAg
ICAgICAgcmV0dXJuIGdlX2I4NTB2M19sdmRzX2JyaWRnZV9kZXRlY3QoJmdlX2I4NTB2M19sdmRz
X3B0ci0+YnJpZGdlKTsKPiAgICAgIHwgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+Li4vZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9tZWdhY2hpcHMtc3RkcHh4eHgt
Z2UtYjg1MHYzLWZ3LmM6MTI0OjE6IG5vdGU6IGRlY2xhcmVkIGhlcmUKPiAgMTI0IHwgZ2VfYjg1
MHYzX2x2ZHNfYnJpZGdlX2RldGVjdChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLCBzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ICAgICAgfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+Cj4uLi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21lZ2FjaGlwcy1zdGRweHh4eC1nZS1i
ODUwdjMtZncuYzoxNDY6MTogZXJyb3I6IGNvbnRyb2wgcmVhY2hlcyBlbmQgb2Ygbm9uLXZvaWQg
ZnVuY3Rpb24gWy1XZXJyb3I9cmV0dXJuLXR5cGVdCj4gIDE0NiB8IH0KPiAgICAgIHwgXgo+Cj5D
b3VsZCB5b3UgcGxlYXNlIHBvc3QgYSBmaXggZm9yIHRoaXMuIE1heWJlIGRvICdtYWtlIGFsbG1v
ZGNvbmZpZycgdG8gY2hlY2sKCj5pZiB5b3UgaGF2ZW4ndCBtaXNzZWQgYW55dGhpbmcgZWxzZS4K
CgpUaGFua3MgZm9yIGNhdGNoaW5nIHRoaXMuIEkgaGF2ZSBzZW50IGEgZml4IGZvciB0aGlzOgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyNTA3MTUwNTQ3NTQuODAwNzY1LTEt
YW5keXNocmtAMTYzLmNvbS9ULyN1CgpBbmQgYmVmb3JlIHJlbGVhc2luZyB0aGUgZml4IHBhdGNo
IHRoaXMgdGltZSwgSSBoYWQgYWxyZWFkeSBlbnN1cmVkIHRoYXQgdGhlICJtYWtlIGFsbG1vZGNv
bmZpZyIgY29tcGlsYXRpb24gd2FzIHN1Y2Nlc3NmdWwuCgoKTWFueSB0aGFua3MuCiA+Cj5UaGFu
a3MuCj4tLQo+QXNodXRvc2gK

