Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749C5C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 09:20:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D781204EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 09:20:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipz6Xt9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D781204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kO4wZe/eO0aRhvgDe1+/5f5XP1f9MT4rwQcPjyYbfDE=; b=ipz6Xt9+nsBQ4GOPbDdHCQ1Lh
	4zvQ+QFe6e30OUyZ0GVn03pP5DcW7lIGYsFbFnRHhNKxC/qjmyJeMzNTSyNTKr4fLCMYppOV9ZXJ+
	W6iSAhOuUeZ/aW3rtvQAta9hU/mVwn1+dm7Sfi7cS2UhhLDi1J8XMhWP365ageXujMEI2QCQCZ5Kg
	SElC9OoNbGu59JJvKVvsFmwCew/uqdhaJ6jDASHL/wgWSHkBSDg07uI11C3zMsy36TMJpaUvWdSWM
	gkbEIlZUVO0ruGQDDIDkeF8fR4QAb1t9Mb6sPa2+8S+YAJHH+SkpP59tQAgyhGRxU9Jh1iqb4V4am
	fLl7yK3Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k93Dx-0007VO-Uh; Fri, 21 Aug 2020 09:20:37 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k93Du-0007Ud-4d; Fri, 21 Aug 2020 09:20:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id D96A029ADC8
Subject: Re: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
To: Marc Zyngier <maz@kernel.org>, Saravana Kannan <saravanak@google.com>
References: <20200819161907.1155110-1-enric.balletbo@collabora.com>
 <C9E59107-CE83-4554-9447-5DE5BEE09A3B@fw-web.de>
 <CAGETcx9_A-E5b-JxT2G142mGxqoo8xqFNEgT+CNWt=oOv0Z5+w@mail.gmail.com>
 <a23bac35d20eb002bdfb5263bf5dd213@kernel.org>
 <CAGETcx-NpRzzeXYN-UBP1eAsC3s_AofSQ9rXOEmCjhLhKLnxWg@mail.gmail.com>
 <14b8f4b9667d29ee25e25eb19c69e3f7@kernel.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <95ae0ae3-7798-d6d5-fc37-391862a0b4ca@collabora.com>
Date: Fri, 21 Aug 2020 11:20:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <14b8f4b9667d29ee25e25eb19c69e3f7@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_052034_289956_ADF22100 
X-CRM114-Status: GOOD (  31.66  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Jason Cooper <jason@lakedaemon.net>, Hanks Chen <hanks.chen@mediatek.com>,
 Frank Wunderlich <wichtig@fw-web.de>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>, Collabora Kernel ML <kernel@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWFyYywKCk9uIDIwLzgvMjAgMTY6NTMsIE1hcmMgWnluZ2llciB3cm90ZToKPiBPbiAyMDIw
LTA4LTIwIDA5OjA3LCBTYXJhdmFuYSBLYW5uYW4gd3JvdGU6Cj4+IE9uIFRodSwgQXVnIDIwLCAy
MDIwIGF0IDEyOjU2IEFNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4K
Pj4+IE9uIDIwMjAtMDgtMTkgMTk6NTEsIFNhcmF2YW5hIEthbm5hbiB3cm90ZToKPj4+ID4gT24g
V2VkLCBBdWcgMTksIDIwMjAgYXQgOTo1MiBBTSBGcmFuayBXdW5kZXJsaWNoIDx3aWNodGlnQGZ3
LXdlYi5kZT4KPj4+ID4gd3JvdGU6Cj4+PiA+Pgo+Pj4gPj4gaGksCj4+PiA+Pgo+Pj4gPj4gZG9l
cyB0aGUgZml4IHlvdSd2ZSBsaW5rZWQgdG8gbXkgcmV2ZXJ0IFsxXSBub3Qgd29yayBpbiB5b3Vy
IGNhc2U/Cj4+PiA+Pgo+Pj4gPj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0
Y2gvMTE3MTg0ODEvCj4+PiA+Cj4+PiA+IFRoYW5rcyBmb3IgcG9pbnRpbmcgaXQgb3V0IEZyYW5r
LiBBbHNvLCBtaWdodCB3YW50IHRvIGF2b2lkIHRvcAo+Pj4gPiBwb3N0aW5nIGluIHRoZSBmdXR1
cmUuCj4+PiA+Cj4+PiA+IEVucmljLCBDYW4geW91IHBsZWFzZSB0cnkgdGhhdCBvdGhlciBmaXgg
YW5kIHNlZSBpZiB0aGF0IHNvbHZlcyB5b3VyCj4+PiA+IGlzc3VlPwo+Pj4KPj4+IEkgdGhpbmsg
RW5yaWMgd2FzIGNsZWFyIHRoYXQgdGhlIGRyaXZlciBkb2VzIHByb2JlIGNvcnJlY3RseQo+Pj4g
KG1lYW5pbmcgdGhhdCBoZSBoYXMgdGhlIGZpeCBpbiBoaXMgdHJlZSkuIEl0IGlzIGV2ZXJ5dGhp
bmcgZWxzZQo+Pj4gdGhhdCBicmVha3MsIGJlY2F1c2Ugbm9uZSBvZiB0aGUgZHJpdmVycyBvbiB0
aGUgcGxhdGZvcm0gYXJlCj4+PiBlcXVpcHBlZCB0byBkZWZlciB0aGVpciBvd24gcHJvYmluZy4K
Pj4+Cj4+PiBJIHRoaW5rIHdlIG5lZWQgdG8gY2hhbmdlIHRoaXMgd29ya3MgcmlnaHQgbm93LCBt
ZWFuaW5nIHRoYXQgd2UgY2FuJ3QKPj4+IGJsaW5kbHkgY2hhbmdlIHRoZSBiZWhhdmlvdXIgb2Yg
KmJ1aWx0LWluKiBkcml2ZXJzLiBJJ2xsIHNlZSBpZiBJIGNhbgo+Pj4gY29tZSB1cCB3aXRoIHNv
bWV0aGluZyBxdWlja2x5LCBidXQgSSdsbCBvdGhlcndpc2UgdGFrZSBFbnJpYyBwYXRjaC4KPj4K
Pj4gU291bmRzIGZhaXIgTWFyYy4KPj4KPj4gQnR3LCBFbnJpYywgb3V0IG9mIGN1cmlvc2l0eSwg
Y2FuIHlvdSB0cnkgYWRkaW5nICJmd19kZXZsaW5rPW9uIiB0bwo+PiB5b3VyIGtlcm5lbCBjb21t
YW5kIGxpbmUgdG8gc2VlIGlmIGl0IGhlbHBzPyBJdCBiYXNpY2FsbHkgZW5zdXJlcwo+PiBwcm9w
ZXIgcHJvYmUgb3JkZXJpbmcgd2l0aG91dCBkZXBlbmRpbmcgb24gdGhlIGRyaXZlcnMuIFRoZXJl
IGFyZSBzb21lCj4+IGNvcm5lciBjYXNlcyB3aGVyZSBpdCBzdGlsbCBjYW4ndCB3b3JrIHByb3Bl
cmx5ICh0b28gbXVjaCB0byBleHBsYWluCj4+IGZvciBhIGxhdGUgbmlnaHQgZW1haWwpLCBidXQg
aWYgdGhlIHBsYXRmb3JtcyBkb24ndCBoYXZlIHRob3NlIGNvcm5lcgo+PiBjYXNlcyBpdCdsbCB3
b3JrIHBlcmZlY3RseS4KPj4KPj4gSSdtIGZpbmUgd2l0aCB0aGUgcmV2ZXJ0IGlmIE1hcmMgaXNu
J3QgYWJsZSB0byBmaW5kIGEgcXVpY2sgZml4IHRvIHRoZQo+PiBkcml2ZXJzLCBidXQgdGhpcyBt
aWdodCBhbHNvIGZpeCB5b3VyIHByb2JsZW0gcmlnaHQgYXdheS4KPiAKPiBJJ20gYWZyYWlkIHRo
ZXJlIGlzIG5vIHF1aWNrIGZpeCBpZiB3ZSB3YW50IHRvIHByZXNlcnZlIHRoZSBjdXJyZW50Cj4g
YmVoYXZpb3Igd2l0aCBidWlsdC1pbiBkcml2ZXJzLCBhbmQgbm90IGhhdmluZyAiZndfZGV2bGlu
az1vbiIgYnkKPiBkZWZhdWx0IG1ha2VzIGl0IGlycmVsZXZhbnQgZm9yIG1vc3QgcGVvcGxlLgo+
IAo+IGZ3X2RldmxpbmsgYWxzbyBwcmV2ZW50cyBteSB0ZXN0IHBsYXRmb3JtcyBmcm9tIGJvb3Rp
bmcgKG15IHJrMzM5OQo+IGRvZXNuJ3QgZmluZCBpdHMgUENJIGRldmljZXMgd2l0aCBpdCksIHdo
aWxlIHRoZSBzYW1lIGtlcm5lbCBib290cwo+IGp1c3QgZmluZSB3aXRob3V0IGl0LiBJdCBjb3Vs
ZCB3ZWxsIGJlIHRoYXQgdGhlIGNvcm5lciBjYXNlIGlzCj4gbGlrZWx5IHRvIGJlIG1vcmUgcHJl
dmFsZW50IHRoYW4geW91IHNlZW0gdG8gZXhwZWN0Lgo+IAo+IEkgd2lsbCBwcm9iYWJseSBlbmQt
dXAgZW5kLXVwIHF1ZXVpbmcgcmV2ZXJ0cyBmb3IgYm90aCBtdGstc3lzaXJxLAo+IG10ay1jaXJx
LCBhbmQgcWNvbS1wZGMgKHRoZSBmaXJzdCB0d28gY2FuJ3QgYmUgYnVpbHQgYXMgbW9kdWxlIHdp
dGgKPiBtYWlubGluZSBhbnl3YXksIGFuZCBJIHNlZW0gdG8gcmVtZW1iZXIgdGhhdCB0aGUgbGF0
dGVyIGNhdXNlZCBzb21lCj4gY29udHJvdmVyc3kgYXMgd2VsbCkuCj4gCj4gQXMgYW4gZXhwZXJp
bWVudCwgSSBoYXZlIHB1c2hlZCBvdXQgYSBicmFuY2hbMV0gdGhhdCBpbXBsZW1lbnRzCj4gYSAi
aHlicmlkIiBwcm9iZSwgcmV0YWluaW5nIHRoZSBwcmV2aW91cyBlYXJseSBwcm9iZSBtZWNoYW5p
c20gd2hlbgo+IHRoZSBkcml2ZXIgaXMgYnVpbHQtaW4sIGFuZCBsZXR0aW5nIHRoaW5ncyByaXAg
d2hlbiBidWlsdCBhcyBhCj4gbW9kdWxlIChpZiB5b3UgZG8gdGhhdCwgeW91IGhvcGVmdWxseSBr
bm93IHdoYXQgeW91IGFyZSBkb2luZykuCj4gSSdkIHdlbGNvbWUgc29tZSB0ZXN0aW5nIG9uIGFm
ZmVjdGVkIHBsYXRmb3JtcyAoSSBkb24ndCBoYXZlCj4gYW55dGhpbmcgSSBjYW4gcnVuIG1haW5s
aW5lIG9uIHRoYXQnZCBiZSBhZmZlY3RlZCkuCj4gCgpVbmZvcnR1bmF0ZWx5LCBteSBLdWt1aSAo
TVQ4MTgzKSBib2FyZCBkb2Vzbid0IGJvb3QgYXQgYWxsIHdpdGggdGhvc2UgcGF0Y2hlcy4gSQpv
bmx5IGRpZCBhIHF1aWNrIHRlc3QgYW5kIEkgZGlkbid0IGRpZyBmdXJ0aGVyLCBwbGVhc2UgbGV0
IG1lIGtub3cgaWYgeW91IHdhbnQgSQpkZWJ1ZyBtb3JlIHRoZSBpc3N1ZS4gSU1ITywgcmlnaHQg
bm93LCB0aGUgcmV2ZXJ0IHNlZW1zIHRvIGJlIHRoZSBiZXR0ZXIKc29sdXRpb24gZm9yIHRoaXMg
Y3ljbGUuCgpUaGFua3MsCiBFbnJpYwoKCj4gVGhhbmtzLAo+IAo+IMKgwqDCoMKgwqDCoMKgIE0u
Cj4gCj4gWzFdCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvbWF6L2FybS1wbGF0Zm9ybXMuZ2l0L2xvZy8/aD1pcnEvaHlicmlkLXByb2JlCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
