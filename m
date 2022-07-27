Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC98CC19F2B
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 04:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHgxaSrcEv/g+0fTuSOV1TVQZ/MiS55h3yY46Qkqf3k=; b=cFV/YKA0mfGAh3Wc7F6xk1l1BG
	kguN62z6DZlYabft/bsFZW6jmEcoIcRnDRJjTMJrSVcs0O8GQlnS5bCubpZly1RoUXaJLzkKK3a0/
	1iX2SfLttlZY1neZ7LlJ4B2LfX6RAvc8yJ9NWlXeS/9Q+nZpoOAPuiSeCbWn6ASxsyIZghq4Z7/Ak
	tpk+Fu77zD7Jzxn5OVF9uEmJC/EgWJ5g5nM96jsLCm8URPwTOYIp6URxx6Ju4PXbOhu/US9rcIZE1
	AqDuHMXq1n+mpqHf2lOx44EiejzllUDd3w0a9XM/B4PvnkYoKAqb5oa8raGVzXcFvKXEvBYZXt1Ri
	uXx6UpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGYMS-008gGK-4t; Wed, 27 Jul 2022 04:09:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGYMN-008gCN-8s
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 04:09:26 +0000
X-UUID: 13d72f89319e468fa6e1c66603062960-20220726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:Subject; bh=KHgxaSrcEv/g+0fTuSOV1TVQZ/MiS55h3yY46Qkqf3k=;
	b=ObkP4oka3FtuXnFO/QxruCIinpep53TNxyDiA8tuURzKnp4TVEKnumV4XZSYEvr5OMsmffNLFsopghZ8pqc9Qh/hx+BWkikVshJcpYaakc0ma/+nh7Dt8t0EEOvgYuzXVs0mWBVYHWEUvHaLIqSNSpXuPf8fcdGO0RgT3Z57bsI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:6fad8af7-fde0-47c3-9c4f-d346f3470893,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:ef4ae9cb-7c9b-4dbc-a9d4-00659d6b7a90,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 13d72f89319e468fa6e1c66603062960-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1360730566; Tue, 26 Jul 2022 21:09:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 27 Jul 2022 11:08:45 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 27 Jul 2022 11:08:45 +0800
Subject: Re: [PATCH v3] ufs: core: fix lockdep warning of clk_scaling_lock
To: Greg KH <gregkh@linuxfoundation.org>
CC: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>, <wsd_upstream@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<stable@vger.kernel.org>
References: <20220726091433.22755-1-peter.wang@mediatek.com>
 <YuACtFnW6QJ7QFyq@kroah.com>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <5e9a5d32-504d-54ad-fbe7-01ac054ec2c2@mediatek.com>
Date: Wed, 27 Jul 2022 11:08:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YuACtFnW6QJ7QFyq@kroah.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_210923_355918_CA27B738 
X-CRM114-Status: GOOD (  22.11  )
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

DQpPbiA3LzI2LzIyIDExOjA1IFBNLCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBUdWUsIEp1bCAyNiwg
MjAyMiBhdCAwNToxNDozM1BNICswODAwLCBwZXRlci53YW5nQG1lZGlhdGVrLmNvbSB3cm90ZToN
Cj4+IEZyb206IFBldGVyIFdhbmcgPHBldGVyLndhbmdAbWVkaWF0ZWsuY29tPg0KPj4NCj4+IFRo
ZXJlIGhhdmUgYSBsb2NrZGVwIHdhcm5pbmcgbGlrZSBiZWxvdyBpbiBjdXJyZW50IGZsb3cuDQo+
PiBrd29ya2VyL3UxNjowOiAgUG9zc2libGUgdW5zYWZlIGxvY2tpbmcgc2NlbmFyaW86DQo+Pg0K
Pj4ga3dvcmtlci91MTY6MDogICAgICAgIENQVTAgICAgICAgICAgICAgICAgICAgIENQVTENCj4+
IGt3b3JrZXIvdTE2OjA6ICAgICAgICAtLS0tICAgICAgICAgICAgICAgICAgICAtLS0tDQo+PiBr
d29ya2VyL3UxNjowOiAgIGxvY2soJmhiYS0+Y2xrX3NjYWxpbmdfbG9jayk7DQo+PiBrd29ya2Vy
L3UxNjowOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9jaygmaGJhLT5kZXZfY21k
LmxvY2spOw0KPj4ga3dvcmtlci91MTY6MDogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxvY2soJmhiYS0+Y2xrX3NjYWxpbmdfbG9jayk7DQo+PiBrd29ya2VyL3UxNjowOiAgIGxvY2so
JmhiYS0+ZGV2X2NtZC5sb2NrKTsNCj4+IGt3b3JrZXIvdTE2OjA6DQo+Pg0KPj4gQmVmb3JlIHRo
aXMgcGF0Y2ggY2xrX3NjYWxpbmdfbG9jayB3YXMgaGVsZCBpbiByZWFkZXIgbW9kZSBkdXJpbmcg
dGhlIHVmc2hjZF93Yl90b2dnbGUoKSBjYWxsLg0KPj4gV2l0aCB0aGlzIHBhdGNoIGFwcGxpZWQg
Y2xrX3NjYWxpbmdfbG9jayBpcyBub3QgaGVsZCB3aGlsZSB1ZnNoY2Rfd2JfdG9nZ2xlKCkgaXMg
Y2FsbGVkLg0KPj4NCj4+IFRoaXMgaXMgc2FmZSBiZWNhdXNlIHVmc2hjZF93Yl90b2dnbGUgd2ls
bCBoZWxkIGNsa19zY2FsaW5nX2xvY2sgaW4gcmVhZGVyIG1vZGUgImFnYWluIiBpbiBmbG93DQo+
PiB1ZnNoY2Rfd2JfdG9nZ2xlIC0+IF9fdWZzaGNkX3diX3RvZ2dsZSAtPiB1ZnNoY2RfcXVlcnlf
ZmxhZ19yZXRyeSAtPiB1ZnNoY2RfcXVlcnlfZmxhZyAtPg0KPj4gdWZzaGNkX2V4ZWNfZGV2X2Nt
ZCAtPiBkb3duX3JlYWQoJmhiYS0+Y2xrX3NjYWxpbmdfbG9jayk7DQo+PiBUaGUgcHJvdGVjdCBz
aG91bGQgZW5vdWdoIGFuZCBtYWtlIHN1cmUgY2xvY2sgaXMgbm90IGNoYW5nZSB3aGlsZSBzZW5k
IGNvbW1hbmQuDQo+Pg0KPj4gdWZzaGNkX3diX3RvZ2dsZSBjYW4gcHJvdGVjdGVkIGJ5IGhiYS0+
Y2xrX3NjYWxpbmcuaXNfYWxsb3dlZCB0byBtYWtlIHN1cmUNCj4+IHVmc2hjZF9kZXZmcmVxX3Nj
YWxlIGZ1bmN0aW9uIG5vdCBydW4gY29uY3VycmVudGx5Lg0KPj4NCj4+IEZpeGVzOiAwZTlkNGNh
NDNiYTggKCJzY3NpOiB1ZnM6IFByb3RlY3Qgc29tZSBjb250ZXh0cyBmcm9tIHVuZXhwZWN0ZWQg
Y2xvY2sgc2NhbGluZyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBXYW5nIDxwZXRlci53YW5n
QG1lZGlhdGVrLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3Vmcy9jb3JlL3Vmc2hjZC5jIHwg
MjcgKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNiBp
bnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91ZnMvY29yZS91ZnNoY2QuYyBiL2RyaXZlcnMvdWZzL2NvcmUvdWZzaGNkLmMNCj4+IGluZGV4
IGM3YjMzNzQ4MGUzZS4uYWE1NzEyNmZkYjQ5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy91ZnMv
Y29yZS91ZnNoY2QuYw0KPj4gKysrIGIvZHJpdmVycy91ZnMvY29yZS91ZnNoY2QuYw0KPj4gQEAg
LTI3Miw2ICsyNzIsNyBAQCBzdGF0aWMgdm9pZCB1ZnNoY2Rfd2JfdG9nZ2xlX2ZsdXNoX2R1cmlu
Z19oOChzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBib29sIHNldCk7DQo+PiAgIHN0YXRpYyBpbmxpbmUg
dm9pZCB1ZnNoY2Rfd2JfdG9nZ2xlX2ZsdXNoKHN0cnVjdCB1ZnNfaGJhICpoYmEsIGJvb2wgZW5h
YmxlKTsNCj4+ICAgc3RhdGljIHZvaWQgdWZzaGNkX2hiYV92cmVnX3NldF9scG0oc3RydWN0IHVm
c19oYmEgKmhiYSk7DQo+PiAgIHN0YXRpYyB2b2lkIHVmc2hjZF9oYmFfdnJlZ19zZXRfaHBtKHN0
cnVjdCB1ZnNfaGJhICpoYmEpOw0KPj4gK3N0YXRpYyB2b2lkIHVmc2hjZF9jbGtfc2NhbGluZ19h
bGxvdyhzdHJ1Y3QgdWZzX2hiYSAqaGJhLCBib29sIGFsbG93KTsNCj4+ICAgDQo+PiAgIHN0YXRp
YyBpbmxpbmUgdm9pZCB1ZnNoY2RfZW5hYmxlX2lycShzdHJ1Y3QgdWZzX2hiYSAqaGJhKQ0KPj4g
ICB7DQo+PiBAQCAtMTI0OSwxMiArMTI1MCwxMCBAQCBzdGF0aWMgaW50IHVmc2hjZF9jbG9ja19z
Y2FsaW5nX3ByZXBhcmUoc3RydWN0IHVmc19oYmEgKmhiYSkNCj4+ICAgCXJldHVybiByZXQ7DQo+
PiAgIH0NCj4+ICAgDQo+PiAtc3RhdGljIHZvaWQgdWZzaGNkX2Nsb2NrX3NjYWxpbmdfdW5wcmVw
YXJlKHN0cnVjdCB1ZnNfaGJhICpoYmEsIGJvb2wgd3JpdGVsb2NrKQ0KPj4gK3N0YXRpYyB2b2lk
IHVmc2hjZF9jbG9ja19zY2FsaW5nX3VucHJlcGFyZShzdHJ1Y3QgdWZzX2hiYSAqaGJhKQ0KPj4g
ICB7DQo+PiAtCWlmICh3cml0ZWxvY2spDQo+PiAtCQl1cF93cml0ZSgmaGJhLT5jbGtfc2NhbGlu
Z19sb2NrKTsNCj4+IC0JZWxzZQ0KPj4gLQkJdXBfcmVhZCgmaGJhLT5jbGtfc2NhbGluZ19sb2Nr
KTsNCj4+ICsJdXBfd3JpdGUoJmhiYS0+Y2xrX3NjYWxpbmdfbG9jayk7DQo+PiArDQo+PiAgIAl1
ZnNoY2Rfc2NzaV91bmJsb2NrX3JlcXVlc3RzKGhiYSk7DQo+PiAgIAl1ZnNoY2RfcmVsZWFzZSho
YmEpOw0KPj4gICB9DQo+PiBAQCAtMTI3MSw3ICsxMjcwLDcgQEAgc3RhdGljIHZvaWQgdWZzaGNk
X2Nsb2NrX3NjYWxpbmdfdW5wcmVwYXJlKHN0cnVjdCB1ZnNfaGJhICpoYmEsIGJvb2wgd3JpdGVs
b2NrKQ0KPj4gICBzdGF0aWMgaW50IHVmc2hjZF9kZXZmcmVxX3NjYWxlKHN0cnVjdCB1ZnNfaGJh
ICpoYmEsIGJvb2wgc2NhbGVfdXApDQo+PiAgIHsNCj4+ICAgCWludCByZXQgPSAwOw0KPj4gLQli
b29sIGlzX3dyaXRlbG9jayA9IHRydWU7DQo+PiArCWJvb2wgd2JfdG9nZ2xlID0gZmFsc2U7DQo+
PiAgIA0KPj4gICAJcmV0ID0gdWZzaGNkX2Nsb2NrX3NjYWxpbmdfcHJlcGFyZShoYmEpOw0KPj4g
ICAJaWYgKHJldCkNCj4+IEBAIC0xMzAwLDEzICsxMjk5LDE5IEBAIHN0YXRpYyBpbnQgdWZzaGNk
X2RldmZyZXFfc2NhbGUoc3RydWN0IHVmc19oYmEgKmhiYSwgYm9vbCBzY2FsZV91cCkNCj4+ICAg
CQl9DQo+PiAgIAl9DQo+PiAgIA0KPj4gLQkvKiBFbmFibGUgV3JpdGUgQm9vc3RlciBpZiB3ZSBo
YXZlIHNjYWxlZCB1cCBlbHNlIGRpc2FibGUgaXQgKi8NCj4+IC0JZG93bmdyYWRlX3dyaXRlKCZo
YmEtPmNsa19zY2FsaW5nX2xvY2spOw0KPj4gLQlpc193cml0ZWxvY2sgPSBmYWxzZTsNCj4+IC0J
dWZzaGNkX3diX3RvZ2dsZShoYmEsIHNjYWxlX3VwKTsNCj4+ICsJLyogRGlzYWJsZSBjbGtfc2Nh
bGluZyB1bnRpbCB1ZnNoY2Rfd2JfdG9nZ2xlIGZpbmlzaCAqLw0KPj4gKwloYmEtPmNsa19zY2Fs
aW5nLmlzX2FsbG93ZWQgPSBmYWxzZTsNCj4+ICsJd2JfdG9nZ2xlID0gdHJ1ZTsNCj4+ICAgDQo+
PiAgIG91dF91bnByZXBhcmU6DQo+PiAtCXVmc2hjZF9jbG9ja19zY2FsaW5nX3VucHJlcGFyZSho
YmEsIGlzX3dyaXRlbG9jayk7DQo+PiArCXVmc2hjZF9jbG9ja19zY2FsaW5nX3VucHJlcGFyZSho
YmEpOw0KPj4gKw0KPj4gKwkvKiBFbmFibGUgV3JpdGUgQm9vc3RlciBpZiB3ZSBoYXZlIHNjYWxl
ZCB1cCBlbHNlIGRpc2FibGUgaXQgKi8NCj4+ICsJaWYgKHdiX3RvZ2dsZSkgew0KPj4gKwkJdWZz
aGNkX3diX3RvZ2dsZShoYmEsIHNjYWxlX3VwKTsNCj4+ICsJCXVmc2hjZF9jbGtfc2NhbGluZ19h
bGxvdyhoYmEsIHRydWUpOw0KPj4gKwl9DQo+PiArDQo+PiAgIAlyZXR1cm4gcmV0Ow0KPj4gICB9
DQo+PiAgIA0KPj4gLS0gDQo+PiAyLjE4LjANCj4+DQo+IDxmb3JtbGV0dGVyPg0KPg0KPiBUaGlz
IGlzIG5vdCB0aGUgY29ycmVjdCB3YXkgdG8gc3VibWl0IHBhdGNoZXMgZm9yIGluY2x1c2lvbiBp
biB0aGUNCj4gc3RhYmxlIGtlcm5lbCB0cmVlLiAgUGxlYXNlIHJlYWQ6DQo+ICAgICAgaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0
ZXN0L3Byb2Nlc3Mvc3RhYmxlLWtlcm5lbC1ydWxlcy5odG1sX187ISFDVFJOS0E5d01nMEFSYnch
MjRWOHhOUEZ1MC1XZHBTM0ZINmpwVWJuVkdqaEdwaHo4TTBFWW56dVJRV2duTng1cVBCU0xTd0V0
ZEhGeXo2M2Z3JA0KPiBmb3IgaG93IHRvIGRvIHRoaXMgcHJvcGVybHkuDQoNCkhpIEdyZWcsDQoN
Cg0KVGhhbmsgeW91IGZvciByZW1pbmQuDQoNCldpbGwgdXNlIGNvcnJlY3Qgd2F5IG5leHQgdmVy
c2lvbg0KDQoNClRoYW5rcw0KDQpQZXRlcg0KDQoNCg0KPg0KPiA8L2Zvcm1sZXR0ZXI+


