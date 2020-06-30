Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BB7C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 21:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCB052074D
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 21:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j/pqCi3C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCB052074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gwBKxbrsdQCSbTBknIDWZJyHhlFte/NkzBOd38NrWZs=; b=j/pqCi3CbXADyEY1RCxpCVwIN
	P6VX00s3FoVpL1b7kDF2+fb0Klv7X2M3TZbnqhC/8lQttfMlmTVgzoMl9zTREBYWUQyRu5UFTTV7I
	3/8eKbyQDSG4IprIYyjHMjlEdo7hjG0txE9ugLm3lzWa43LTz95EtIjcMQ0kbz9VjMNhygIUqEiN/
	nGr07DFx1YyHPytSjk1X3HglbNo/nA2K6jq257xfkB+hRYfop72+YQC9/ktdRna7e/nP9pHX3cuaY
	2ZyktM0lFe4VkNLiTJ4+2oI7X1De2nTP516UKEUWdzP5z95awtRJPSG3n4L56/dXHVDp6RgjE+k0d
	isKDAfMDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqNOx-0006dU-RH; Tue, 30 Jun 2020 21:02:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqNOt-0006cj-6h; Tue, 30 Jun 2020 21:02:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 70B3F2A3C6B
Subject: Re: [RESEND PATCH v4 0/7] Convert mtk-dsi to drm_bridge API and get
 EDID for ps8640 bridge
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20200615203108.786083-1-enric.balletbo@collabora.com>
 <20200620213302.GC74146@ravnborg.org>
 <593a4666-d6aa-7d16-f3a0-ba3713047d84@collabora.com>
 <CAAOTY_9ZHemp0U76_oPjwy-XoTRXW108UMD_9JVnNXndNNsiTw@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <43e5b273-d156-beea-bcfb-cc61b190a671@collabora.com>
Date: Tue, 30 Jun 2020 23:02:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAAOTY_9ZHemp0U76_oPjwy-XoTRXW108UMD_9JVnNXndNNsiTw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_170243_431709_634140C1 
X-CRM114-Status: GOOD (  27.00  )
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKCk9uIDMwLzYvMjAgMTg6MjYsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4g
SGksIEVucmljOgo+IAo+IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNv
bGxhYm9yYS5jb20+IOaWvCAyMDIw5bm0NuaciDMw5pelIOmAseS6jCDkuIvljYgxMDozNOWvq+mB
k++8mgo+Pgo+PiBIaSBTYW0sIENodW4tS3VhbiwKPj4KPj4gT24gMjAvNi8yMCAyMzozMywgU2Ft
IFJhdm5ib3JnIHdyb3RlOgo+Pj4gSGkgRW5yaWMKPj4+Cj4+PiBPbiBNb24sIEp1biAxNSwgMjAy
MCBhdCAxMDozMTowMVBNICswMjAwLCBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIHdyb3RlOgo+Pj4+
IChUaGlzIHJlc2VuZCBpcyB0byBmaXggc29tZSB0cml2aWFsIGNvbmZsaWN0cyBkdWUgdGhlIG1l
cmdlIHdpbmRvdykKPj4+Pgo+Pj4+IFRoZSBQUzg2NDAgZHNpLXRvLWVEUCBicmlkZ2UgZHJpdmVy
IGlzIHVzaW5nIHRoZSBwYW5lbCBicmlkZ2UgQVBJLAo+Pj4+IGhvd2V2ZXIsIG5vdCBhbGwgdGhl
IGNvbXBvbmVudHMgaW4gdGhlIGNoYWluIGhhdmUgYmVlbiBwb3J0ZWQgdG8gdGhlCj4+Pj4gZHJt
X2JyaWRnZSBBUEkuIEFjdHVhbGx5LCB3aGVuIGEgcGFuZWwgaXMgYXR0YWNoZWQgdGhlIGRlZmF1
bHQgcGFuZWwncyBtb2RlCj4+Pj4gaXMgdXNlZCwgYnV0IGluIHNvbWUgY2FzZXMgd2UgY2FuJ3Qg
Z2V0IGRpc3BsYXkgdXAgaWYgbW9kZSBnZXR0aW5nIGZyb20KPj4+PiBlRFAgY29udHJvbCBFRElE
IGlzIG5vdCBjaG9zZW4uCj4+Pj4KPj4+PiBUaGlzIHNlcmllcyBhZGRyZXNzIHRoYXQgcHJvYmxl
bSwgZmlyc3QgaW1wbGVtZW50cyB0aGUgLmdldF9lZGlkKCkKPj4+PiBjYWxsYmFjayBpbiB0aGUg
UFM4NjQwIGRyaXZlciAod2hpY2ggaXMgbm90IHVzZWQgdW50aWwgdGhlIGNvbnZlcnNpb24gaXMK
Pj4+PiBkb25lKSBhbmQgdGhlbiwgY29udmVydHMgdGhlIE1lZGlhdGVrIERTSSBkcml2ZXIgdG8g
dXNlIHRoZSBkcm1fYnJpZGdlCj4+Pj4gQVBJLgo+Pj4+Cj4+Pj4gQXMgZmFyIGFzIEkga25vdywg
d2UncmUgdGhlIG9ubHkgdXNlcnMgb2YgdGhlIG1lZGlhdGVrIGRzaSBkcml2ZXIgaW4KPj4+PiBt
YWlubGluZSwgc28gc2hvdWxkIGJlIHNhZmUgdG8gc3dpdGNoIHRvIHRoZSBuZXcgY2hhaW4gb2Yg
ZHJtX2JyaWRnZSBBUEkKPj4+PiB1bmNvbmRpdGlvbmFsbHkuCj4+Pj4KPj4+PiBUaGUgcGF0Y2hl
cyBoYXMgYmVlbiB0ZXN0ZWQgb24gYSBBY2VyIENocm9tZWJvb2sgUjEzIChFbG0pIHJ1bm5pbmcg
YQo+Pj4+IENocm9tZSBPUyB1c2Vyc3BhY2UgYW5kIGNoZWNraW5nIHRoYXQgdGhlIHZhbGlkIEVE
SUQgbW9kZSByZXBvcnRlZCBieQo+Pj4+IHRoZSBicmlkZ2UgaXMgc2VsZWN0ZWQuCj4+Pj4KPj4+
PiBDaGFuZ2VzIGluIHY0Ogo+Pj4+IC0gUmVtb3ZlIGRvdWJsZSBjYWxsIHRvIGRybV9lbmNvZGVy
X2luaXQoKS4gKENodW4tS3VhbmcgSHUpCj4+Pj4gLSBDbGVhbnVwIHRoZSBlbmNvZGVyIGluIG10
a19kc2lfdW5iaW5kKCkuIChDaHVuLUt1YW5nIEh1KQo+Pj4+Cj4+Pj4gQ2hhbmdlcyBpbiB2MzoK
Pj4+PiAtIFJlcGxhY2Ugcy9icmlkZ2UvbmV4dCBicmlkZ2UvIGZvciBjb21tZW50LiAoTGF1cmVu
dCBQaW5jaGFydCkKPj4+PiAtIEFkZCB0aGUgYnJpZGdlLnR5cGUuIChMYXVyZW50IFBpbmNoYXJ0
KQo+Pj4+IC0gVXNlIG5leHRfYnJpZGdlIGZpZWxkIHRvIHN0b3JlIHRoZSBwYW5lbCBicmlkZ2Uu
IChMYXVyZW50IFBpbmNoYXJ0KQo+Pj4+IC0gQWRkIHRoZSBicmlkZ2UudHlwZSBmaWVsZC4gKExh
dXJlbnQgUGluY2hhcnQpCj4+Pj4gLSBUaGlzIHBhdGNoIHJlcXVpcmVzIGh0dHBzOi8vbGttbC5v
cmcvbGttbC8yMDIwLzQvMTYvMjA4MCB0byB3b3JrCj4+Pj4gICBwcm9wZXJseS4KPj4+PiAtIE1v
dmUgdGhlIGJyaWRnZS50eXBlIGxpbmUgdG8gdGhlIHBhdGNoIHRoYXQgYWRkcyBkcm1fYnJpZGdl
IHN1cHBvcnQuIChMYXVyZW50IFBpbmNoYXJ0KQo+Pj4+Cj4+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+
PiAtIERvIG5vdCBzZXQgY29ubmVjdG9yX3R5cGUgZm9yIHBhbmVsIGhlcmUuIChTYW0gUmF2bmJv
cmcpCj4+Pj4KPj4+PiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhICg3KToKPj4+PiAgIGRybS9icmlk
Z2U6IHBzODY0MDogR2V0IHRoZSBFRElEIGZyb20gZURQIGNvbnRyb2wKPj4+PiAgIGRybS9icmlk
Z2VfY29ubmVjdG9yOiBTZXQgZGVmYXVsdCBzdGF0dXMgY29ubmVjdGVkIGZvciBlRFAgY29ubmVj
dG9ycwo+Pj4+ICAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBSZW5hbWUgYnJpZGdlIHRvIG5leHRf
YnJpZGdlCj4+Pj4gICBkcm0vbWVkaWF0ZWs6IG10a19kc2k6IENvbnZlcnQgdG8gYnJpZGdlIGRy
aXZlcgo+Pj4+ICAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBVc2Ugc2ltcGxlIGVuY29kZXIKPj4+
PiAgIGRybS9tZWRpYXRlazogbXRrX2RzaTogVXNlIHRoZSBkcm1fcGFuZWxfYnJpZGdlIEFQSQo+
Pj4+ICAgZHJtL21lZGlhdGVrOiBtdGtfZHNpOiBDcmVhdGUgY29ubmVjdG9yIGZvciBicmlkZ2Vz
Cj4+Pgo+Pj4gUGF0Y2ggc2VlbXMgcmVhZHkgdG8gYXBwbHkuIFdpbGwgdGhleSBiZSBhcHBsaWVk
IHRvIGEgbWVkaWF0ZWsgdHJlZQo+Pj4gb3IgdG8gZHJtLW1pc2MtbmV4dD8KPj4+IE9yIHNoYWxs
IHdlIHRha2UgdGhlIGZpcnN0IHR3byBwYXRjaGVzIHZpYSBkcm0tbWlzYy1uZXh0LCBhbmQgdGhl
Cj4+PiByZW1hbmluZyB2aWEgYSBtZWRpYXRlayB0cmVlPyAoSSBob3BlIG5vdCkKPj4+Cj4+Cj4+
IEkgdGhpbmsgdGhlIG9ubHkgY29uY2VybiBpcyBmcm9tIENodW4tS3VhbiByZWdhcmRpbmcgcGF0
Y2ggNy83ICJkcm0vbWVkaWF0ZWs6Cj4+IG10a19kc2k6IENyZWF0ZSBjb25uZWN0b3IgZm9yIGJy
aWRnZXMiIHdoZXRoZXIgd2Ugc2hvdWxkIHN1cHBvcnQgdGhlIG9sZCBBUEkgb3IKPj4gbm90LCBi
dXQgdGhlIGRpc2N1c3Npb24gc3RhbGxlZC4KPj4KPiAKPiBJIGdldCBtb3JlIGNsZWFyIG5vdy4g
SW4gcGF0Y2ggNy83LAo+IAo+IHJldCA9IGRybV9icmlkZ2VfYXR0YWNoKCZkc2ktPmVuY29kZXIs
ICZkc2ktPmJyaWRnZSwgTlVMTCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKTsKPiAKPiB0aGlzIHdvdWxkIGNh
bGwgaW50byBtdGtfZHNpX2JyaWRnZV9hdHRhY2goKSBmaXJzdCwgYW5kIHRoZW4gY2FsbCBpbnRv
Cj4gcGFuZWxfYnJpZGdlX2F0dGFjaCgpIG5leHQuIFNvIHBhbmVsX2JyaWRnZV9hdHRhY2goKSB3
b3VsZCByZWNlaXZlCj4gRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SIGFuZCBpdCByZXR1
cm4gaW1tZWRpYXRlbHkgc28gaXQgZG9lcwo+IG5vdCBjYWxsIGRybV9wYW5lbF9hdHRhY2goKS4g
U28gd2hlcmUgZG8geW91IGNhbGwgZHJtX3BhbmVsX2F0dGFjaCgpPwo+IAoKV2h5IEkgbmVlZCB0
byBjYWxsIGRybV9wYW5lbF9hdHRhY2g/CgpJIGJlbGlldmUgZHJtX3BhbmVsX2F0dGFjaCgpIHdh
cyB0byBhdHRhY2ggYSBwYW5lbCB0byBhIGNvbm5lY3RvciwgYnV0IHdlIGRvbid0Cm5lZWQgdG8g
ZG8gdGhpcyB3aXRoIHRoZSBuZXcgQVBJIGFzIHRoZSBjb25uZWN0b3IgaXMgYWxyZWFkeSBjcmVh
dGVkIGFuZAphdHRhY2hlZCB0byB0aGUgImR1bW15IiBlbmNvZGVyLgoKTWFrZXMgdGhhdCBzZW5z
ZSB0byB5b3U/IFdoYXQgZG8geW91IHRoaW5rIHdpbGwgbm90IHdvcmsgaWYgSSBkb24ndCBjYWxs
CmRybV9wYW5lbF9hdHRhY2g/CgpbMV0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
djUuOC1yYzMvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGFuZWwuYyNMMTAxCgpSZWdhcmRz
LAogRW5yaWMKCgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4KPiAKPj4gVGhhbmtzLAo+PiAgRW5y
aWMKPj4KPj4KPj4KPj4+ICAgICAgIFNhbQo+Pj4KPj4+Cj4+Pj4KPj4+PiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9wYXJhZGUtcHM4NjQwLmMgfCAgMTIgKysKPj4+PiAgZHJpdmVycy9ncHUvZHJt
L2RybV9icmlkZ2VfY29ubmVjdG9yLmMgfCAgIDEgKwo+Pj4+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RzaS5jICAgICB8IDI2OSArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4g
IDMgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgMTg1IGRlbGV0aW9ucygtKQo+Pj4+
Cj4+Pj4gLS0KPj4+PiAyLjI3LjAKPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+Pj4KPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
