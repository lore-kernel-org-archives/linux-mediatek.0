Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1941FC48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 07:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72EA461159
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 07:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72EA461159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanyeetech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tQpHJ6pvDGQ1Gxj67UhMV4cDYXxF6XnsxVd6jip/as=; b=vSWTOzqV/x5FuY
	40MgzRVMK8U62f8bsH92tOaXNiCXND7mUK7JGBiWDYXx3X039VlQZh/JvUlAHabeDDzWUqeg9JlFr
	3FjI6XazsdeX275y/P04iaMCnNuMYSgP87gd5JCXJOjqHWUIkiXmBafaWX7bxuhmKBeQUzpJVs9N3
	DLkRbzX0I7AN7L6CyC3oNsl0koQi4sgNg3tSHx6Hq5lg7Xv9YXHIHYYFkmOnc3wqntvdfDhyjtLe5
	MRwRleHIVQOblCj3YS9o5wPfq/NBhXnh3wGJVS/xX3qdo/F1zPymqGZqBe4XgdbwJkuPZ7tb6xSij
	cb61Sgvfj4x5L3GDxUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltQFD-005FkM-13; Wed, 16 Jun 2021 07:45:51 +0000
Received: from out29-52.mail.aliyun.com ([115.124.29.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltQEz-005Ffn-7q; Wed, 16 Jun 2021 07:45:39 +0000
X-Alimail-AntiSpam: AC=SUSPECT; BC=0.6743332|-1; BR=01201311R101b1; CH=blue;
 DM=|SUSPECT|false|; DS=CONTINUE|ham_regular_dialog|0.64693-0.00539747-0.347672;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047193; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KT5RiOm_1623829528; 
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KT5RiOm_1623829528)
 by smtp.aliyun-inc.com(10.147.44.129);
 Wed, 16 Jun 2021 15:45:29 +0800
Date: Wed, 16 Jun 2021 15:45:26 +0800
From: =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>,
 netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
 sihui.liu@ingenic.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: Re: [PATCH v3 1/2] dt-bindings: dwmac: Add bindings for new Ingenic
 SoCs.
Message-ID: <20210616154526.54481912@zhouyanjie-virtual-machine>
In-Reply-To: <CAL_Jsq+7v6GRMfxWhA6g2r0GaZSO_AztgSz7rheJsE9jKYd8uQ@mail.gmail.com>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
 <CAL_Jsq+7v6GRMfxWhA6g2r0GaZSO_AztgSz7rheJsE9jKYd8uQ@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_004537_502229_052E6AB5 
X-CRM114-Status: GOOD (  19.14  )
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

SGkgUm9iLAoK5LqOIFR1ZSwgMTUgSnVuIDIwMjEgMTc6MDU6NDUgLTA2MDAKUm9iIEhlcnJpbmcg
PHJvYmgrZHRAa2VybmVsLm9yZz4g5YaZ6YGTOgoKPiBPbiBNb24sIEp1biAxNCwgMjAyMSBhdCAx
MToxOCBBTSDlkajnkLDmnbAgKFpob3UgWWFuamllKQo+IDx6aG91eWFuamllQHdhbnllZXRlY2gu
Y29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgdGhlIGR3bWFjIGJpbmRpbmdzIGZvciB0aGUgSlo0Nzc1
IFNvQywgdGhlIFgxMDAwIFNvQywKPiA+IHRoZSBYMTYwMCBTb0MsIHRoZSBYMTgzMCBTb0MgYW5k
IHRoZSBYMjAwMCBTb0MgZnJvbSBJbmdlbmljLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IOWRqOeQ
sOadsCAoWmhvdSBZYW5qaWUpIDx6aG91eWFuamllQHdhbnllZXRlY2guY29tPgo+ID4gLS0tCj4g
Pgo+ID4gTm90ZXM6Cj4gPiAgICAgdjEtPnYyOgo+ID4gICAgIE5vIGNoYW5nZS4KPiA+Cj4gPiAg
ICAgdjItPnYzOgo+ID4gICAgIEFkZCAiaW5nZW5pYyxtYWMueWFtbCIgZm9yIEluZ2VuaWMgU29D
cy4KPiA+Cj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2luZ2VuaWMsbWFjLnlhbWwg
ICAgICAgfCA3Ngo+ID4gKysrKysrKysrKysrKysrKysrKysrKyAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvc25wcyxkd21hYy55YW1sCj4gPiB8IDE1ICsrKysrIDIgZmlsZXMgY2hhbmdlZCwg
OTEgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9pbmdlbmljLG1hYy55YW1sCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMu
eWFtbAo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2luZ2VuaWMs
bWFjLnlhbWwgbmV3IGZpbGUKPiA+IG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwLi41ZmUyZTgx
Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbmV0L2luZ2VuaWMsbWFjLnlhbWwKPiA+IEBAIC0wLDAgKzEsNzYgQEAKPiA+ICsjIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+
ICslWUFNTCAxLjIKPiA+ICstLS0KPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL25ldC9pbmdlbmljLG1hYy55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBCaW5kaW5ncyBm
b3IgTUFDIGluIEluZ2VuaWMgU29Dcwo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAgLSDl
kajnkLDmnbAgKFpob3UgWWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4KPiA+ICsK
PiA+ICtkZXNjcmlwdGlvbjoKPiA+ICsgIFRoZSBFdGhlcm5ldCBNZWRpYSBBY2Nlc3MgQ29udHJv
bGxlciBpbiBJbmdlbmljIFNvQ3MuCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBh
dGlibGU6Cj4gPiArICAgIGVudW06Cj4gPiArICAgICAgLSBpbmdlbmljLGp6NDc3NS1tYWMKPiA+
ICsgICAgICAtIGluZ2VuaWMseDEwMDAtbWFjCj4gPiArICAgICAgLSBpbmdlbmljLHgxNjAwLW1h
Ywo+ID4gKyAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKPiA+ICsgICAgICAtIGluZ2VuaWMseDIw
MDAtbWFjCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiAr
ICBpbnRlcnJ1cHRzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgaW50ZXJydXB0
LW5hbWVzOgo+ID4gKyAgICBjb25zdDogbWFjaXJxCj4gPiArCj4gPiArICBjbG9ja3M6Cj4gPiAr
ICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiArICBjbG9jay1uYW1lczoKPiA+ICsgICAgY29uc3Q6
IHN0bW1hY2V0aAo+ID4gKwo+ID4gKyAgbW9kZS1yZWc6Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBB
biBleHRyYSBzeXNjb24gcmVnaXN0ZXIgdGhhdCBjb250cm9sIGV0aGVybmV0Cj4gPiBpbnRlcmZh
Y2UgYW5kIHRpbWluZyBkZWxheSAgCj4gCj4gTmVlZHMgYSB2ZW5kb3IgcHJlZml4IGFuZCB0eXBl
Lgo+IAo+ID4gKwo+ID4gKyAgcngtY2xrLWRlbGF5LXBzOgo+ID4gKyAgICBkZXNjcmlwdGlvbjog
UkdNSUkgcmVjZWl2ZSBjbG9jayBkZWxheSBkZWZpbmVkIGluIHBpY28gc2Vjb25kcwo+ID4gKwo+
ID4gKyAgdHgtY2xrLWRlbGF5LXBzOgo+ID4gKyAgICBkZXNjcmlwdGlvbjogUkdNSUkgdHJhbnNt
aXQgY2xvY2sgZGVsYXkgZGVmaW5lZCBpbiBwaWNvIHNlY29uZHMKPiA+ICsKPiA+ICtyZXF1aXJl
ZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsgIC0gaW50ZXJydXB0cwo+
ID4gKyAgLSBpbnRlcnJ1cHQtbmFtZXMKPiA+ICsgIC0gY2xvY2tzCj4gPiArICAtIGNsb2NrLW5h
bWVzCj4gPiArICAtIG1vZGUtcmVnCj4gPiArCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZh
bHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL2Nsb2NrL3gxMDAwLWNndS5oPgo+ID4gKwo+ID4gKyAgICBtYWM6IGV0aGVybmV0
QDEzNGIwMDAwIHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiaW5nZW5pYyx4MTAwMC1tYWMi
LCAic25wcyxkd21hYyI7ICAKPiAKPiBEb2Vzbid0IG1hdGNoIHRoZSBzY2hlbWEuCgpTb3JyeSBm
b3IgdGhhdCwgc29tZWhvdyB3aGVuIEkgcnVuICJtYWtlIGR0X2JpbmRpbmdzX2NoZWNrIiwgdGhl
cmUgaXMgbm8Kd2Fycm5pbmcgb3IgZXJyb3IgbWVzc2FnZSBhYm91dCB0aGlzIGZpbGUuIEkgYW0g
c3VyZSB0aGF0IHlhbWxsaW50IGlzCmluc3RhbGxlZCBhbmQgZHRzY2hlbWEgaGFzIGJlZW4gdXBn
cmFkZWQgdG8gMjAyMS42LgoKSSB3aWxsIHNlbmQgYSBmaXguCgpUaGFua3MgYW5kIGJlc3QgcmVn
YXJkcyEKCj4gCj4gPiArICAgICAgICByZWcgPSA8MHgxMzRiMDAwMCAweDIwMDA+Owo+ID4gKwo+
ID4gKyAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmaW50Yz47Cj4gPiArICAgICAgICBpbnRl
cnJ1cHRzID0gPDU1PjsKPiA+ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiOwo+
ID4gKwo+ID4gKyAgICAgICAgY2xvY2tzID0gPCZjZ3UgWDEwMDBfQ0xLX01BQz47Cj4gPiArICAg
ICAgICBjbG9jay1uYW1lcyA9ICJzdG1tYWNldGgiOwo+ID4gKwo+ID4gKyAgICAgICAgbW9kZS1y
ZWcgPSA8Jm1hY19waHlfY3RybD47Cj4gPiArICAgIH07Cj4gPiArLi4uCj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwK
PiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlh
bWwgaW5kZXgKPiA+IDJlZGQ4YmUuLjljMGNlOTIgMTAwNjQ0IC0tLQo+ID4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbCArKysKPiA+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgQEAgLTU2
LDYKPiA+ICs1NiwxMSBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAgICAgLSBhbWxvZ2ljLG1lc29u
OG0yLWR3bWFjCj4gPiAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZ3hiYi1kd21hYwo+ID4gICAg
ICAgICAgLSBhbWxvZ2ljLG1lc29uLWF4Zy1kd21hYwo+ID4gKyAgICAgICAgLSBpbmdlbmljLGp6
NDc3NS1tYWMKPiA+ICsgICAgICAgIC0gaW5nZW5pYyx4MTAwMC1tYWMKPiA+ICsgICAgICAgIC0g
aW5nZW5pYyx4MTYwMC1tYWMKPiA+ICsgICAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKPiA+ICsg
ICAgICAgIC0gaW5nZW5pYyx4MjAwMC1tYWMKPiA+ICAgICAgICAgIC0gcm9ja2NoaXAscHgzMC1n
bWFjCj4gPiAgICAgICAgICAtIHJvY2tjaGlwLHJrMzEyOC1nbWFjCj4gPiAgICAgICAgICAtIHJv
Y2tjaGlwLHJrMzIyOC1nbWFjCj4gPiBAQCAtMzEwLDYgKzMxNSwxMSBAQCBhbGxPZjoKPiA+ICAg
ICAgICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjhpLXI0MC1lbWFjCj4gPiAgICAgICAgICAgICAg
ICAtIGFsbHdpbm5lcixzdW44aS12M3MtZW1hYwo+ID4gICAgICAgICAgICAgICAgLSBhbGx3aW5u
ZXIsc3VuNTBpLWE2NC1lbWFjCj4gPiArICAgICAgICAgICAgICAtIGluZ2VuaWMsano0Nzc1LW1h
Ywo+ID4gKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgxMDAwLW1hYwo+ID4gKyAgICAgICAgICAg
ICAgLSBpbmdlbmljLHgxNjAwLW1hYwo+ID4gKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgxODMw
LW1hYwo+ID4gKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgyMDAwLW1hYwo+ID4gICAgICAgICAg
ICAgICAgLSBzbnBzLGR3eGdtYWMKPiA+ICAgICAgICAgICAgICAgIC0gc25wcyxkd3hnbWFjLTIu
MTAKPiA+ICAgICAgICAgICAgICAgIC0gc3Qsc3BlYXI2MDAtZ21hYwo+ID4gQEAgLTM1Myw2ICsz
NjMsMTEgQEAgYWxsT2Y6Cj4gPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW44aS1yNDAt
ZW1hYwo+ID4gICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuOGktdjNzLWVtYWMKPiA+ICAg
ICAgICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjUwaS1hNjQtZW1hYwo+ID4gKyAgICAgICAgICAg
ICAgLSBpbmdlbmljLGp6NDc3NS1tYWMKPiA+ICsgICAgICAgICAgICAgIC0gaW5nZW5pYyx4MTAw
MC1tYWMKPiA+ICsgICAgICAgICAgICAgIC0gaW5nZW5pYyx4MTYwMC1tYWMKPiA+ICsgICAgICAg
ICAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKPiA+ICsgICAgICAgICAgICAgIC0gaW5nZW5pYyx4
MjAwMC1tYWMKPiA+ICAgICAgICAgICAgICAgIC0gc25wcyxkd21hYy00LjAwCj4gPiAgICAgICAg
ICAgICAgICAtIHNucHMsZHdtYWMtNC4xMGEKPiA+ICAgICAgICAgICAgICAgIC0gc25wcyxkd21h
Yy00LjIwYQo+ID4gLS0KPiA+IDIuNy40Cj4gICAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
