Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EF5C48BE5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 03:24:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF6136135C
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 03:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF6136135C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wanyeetech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cp1zjmjHzgaRyz7USf+yd9czXirauUPTwVmzR2v35fk=; b=Snkcokq/d/3nXV
	GxrvlJzRyFWZFVihpFe7AKFrIqV/MHLeMjrR9T1ZTFX8kYROzLTtBa1h54Z1osjiPj0wmyabgF5mi
	HxFrrSD7e1MjOKlMxlFl8A+zWxAh8ylGUUmFy5cKLonV4ibNc4rR6mMLWRydLMPUSmxsnTsCTyYxg
	iPdnfIfM46LbAjNARCvmO1Zin10zbIOU1VX5oQoHkDL35jiEsd4L7ZTgP+Fic+fbOqG4mykkdb0j1
	VfSRR8KPbVMRUt0zkE5EwKgaPYyKIDaz5xGV4JkaikCr+6c6MxiDyto8YQTPTXjEdtBcGF09m6IJV
	OiZsjIpnhTwEzUZcWE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltidk-008cpA-TT; Thu, 17 Jun 2021 03:24:24 +0000
Received: from out28-145.mail.aliyun.com ([115.124.28.145])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltidW-008clf-To; Thu, 17 Jun 2021 03:24:13 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3630309|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.546091-0.00633987-0.447569;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047188; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=21; RT=21; SR=0; TI=SMTPD_---.KTXxsUV_1623900243; 
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KTXxsUV_1623900243) by smtp.aliyun-inc.com(10.147.40.2);
 Thu, 17 Jun 2021 11:24:05 +0800
Date: Thu, 17 Jun 2021 11:24:00 +0800
From: =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To: Rob Herring <robh+dt@kernel.org>, sihui.liu@ingenic.com
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
 jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: Re: [PATCH v3 1/2] dt-bindings: dwmac: Add bindings for new Ingenic
 SoCs.
Message-ID: <20210617112400.5e68c172@zhouyanjie-virtual-machine>
In-Reply-To: <20210616154526.54481912@zhouyanjie-virtual-machine>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
 <CAL_Jsq+7v6GRMfxWhA6g2r0GaZSO_AztgSz7rheJsE9jKYd8uQ@mail.gmail.com>
 <20210616154526.54481912@zhouyanjie-virtual-machine>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_202411_181201_233ABE67 
X-CRM114-Status: GOOD (  23.22  )
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

SGkgUm9iLAoK5LqOIFdlZCwgMTYgSnVuIDIwMjEgMTU6NDU6MjYgKzA4MDAK5ZGo55Cw5p2wIDx6
aG91eWFuamllQHdhbnllZXRlY2guY29tPiDlhpnpgZM6Cgo+IEhpIFJvYiwKPiAKPiDkuo4gVHVl
LCAxNSBKdW4gMjAyMSAxNzowNTo0NSAtMDYwMAo+IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+IOWGmemBkzoKPiAKPiA+IE9uIE1vbiwgSnVuIDE0LCAyMDIxIGF0IDExOjE4IEFNIOWR
qOeQsOadsCAoWmhvdSBZYW5qaWUpCj4gPiA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4gd3Jv
dGU6ICAKPiA+ID4KPiA+ID4gQWRkIHRoZSBkd21hYyBiaW5kaW5ncyBmb3IgdGhlIEpaNDc3NSBT
b0MsIHRoZSBYMTAwMCBTb0MsCj4gPiA+IHRoZSBYMTYwMCBTb0MsIHRoZSBYMTgzMCBTb0MgYW5k
IHRoZSBYMjAwMCBTb0MgZnJvbSBJbmdlbmljLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiDl
kajnkLDmnbAgKFpob3UgWWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4KPiA+ID4g
LS0tCj4gPiA+Cj4gPiA+IE5vdGVzOgo+ID4gPiAgICAgdjEtPnYyOgo+ID4gPiAgICAgTm8gY2hh
bmdlLgo+ID4gPgo+ID4gPiAgICAgdjItPnYzOgo+ID4gPiAgICAgQWRkICJpbmdlbmljLG1hYy55
YW1sIiBmb3IgSW5nZW5pYyBTb0NzLgo+ID4gPgo+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbmV0L2luZ2VuaWMsbWFjLnlhbWwgICAgICAgfCA3Ngo+ID4gPiArKysrKysrKysrKysrKysr
KysrKysrIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwKPiA+ID4g
fCAxNSArKysrKyAyIGZpbGVzIGNoYW5nZWQsIDkxIGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NAo+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L2luZ2VuaWMsbWFjLnlhbWwKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdAo+ID4gPiBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbAo+ID4gPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbCBuZXcg
ZmlsZQo+ID4gPiBtb2RlIDEwMDY0NCBpbmRleCAwMDAwMDAwMC4uNWZlMmU4MSAtLS0gL2Rldi9u
dWxsCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5n
ZW5pYyxtYWMueWFtbAo+ID4gPiBAQCAtMCwwICsxLDc2IEBACj4gPiA+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiA+ID4gKyVZQU1M
IDEuMgo+ID4gPiArLS0tCj4gPiA+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFz
L25ldC9pbmdlbmljLG1hYy55YW1sIwo+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ICsKPiA+ID4gK3RpdGxlOiBCaW5kaW5n
cyBmb3IgTUFDIGluIEluZ2VuaWMgU29Dcwo+ID4gPiArCj4gPiA+ICttYWludGFpbmVyczoKPiA+
ID4gKyAgLSDlkajnkLDmnbAgKFpob3UgWWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNv
bT4KPiA+ID4gKwo+ID4gPiArZGVzY3JpcHRpb246Cj4gPiA+ICsgIFRoZSBFdGhlcm5ldCBNZWRp
YSBBY2Nlc3MgQ29udHJvbGxlciBpbiBJbmdlbmljIFNvQ3MuCj4gPiA+ICsKPiA+ID4gK3Byb3Bl
cnRpZXM6Cj4gPiA+ICsgIGNvbXBhdGlibGU6Cj4gPiA+ICsgICAgZW51bToKPiA+ID4gKyAgICAg
IC0gaW5nZW5pYyxqejQ3NzUtbWFjCj4gPiA+ICsgICAgICAtIGluZ2VuaWMseDEwMDAtbWFjCj4g
PiA+ICsgICAgICAtIGluZ2VuaWMseDE2MDAtbWFjCj4gPiA+ICsgICAgICAtIGluZ2VuaWMseDE4
MzAtbWFjCj4gPiA+ICsgICAgICAtIGluZ2VuaWMseDIwMDAtbWFjCj4gPiA+ICsKPiA+ID4gKyAg
cmVnOgo+ID4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsKPiA+ID4gKyAgaW50ZXJydXB0czoK
PiA+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gPiArCj4gPiA+ICsgIGludGVycnVwdC1uYW1lczoK
PiA+ID4gKyAgICBjb25zdDogbWFjaXJxCj4gPiA+ICsKPiA+ID4gKyAgY2xvY2tzOgo+ID4gPiAr
ICAgIG1heEl0ZW1zOiAxCj4gPiA+ICsKPiA+ID4gKyAgY2xvY2stbmFtZXM6Cj4gPiA+ICsgICAg
Y29uc3Q6IHN0bW1hY2V0aAo+ID4gPiArCj4gPiA+ICsgIG1vZGUtcmVnOgo+ID4gPiArICAgIGRl
c2NyaXB0aW9uOiBBbiBleHRyYSBzeXNjb24gcmVnaXN0ZXIgdGhhdCBjb250cm9sIGV0aGVybmV0
Cj4gPiA+IGludGVyZmFjZSBhbmQgdGltaW5nIGRlbGF5ICAgIAo+ID4gCj4gPiBOZWVkcyBhIHZl
bmRvciBwcmVmaXggYW5kIHR5cGUuCj4gPiAgIAo+ID4gPiArCj4gPiA+ICsgIHJ4LWNsay1kZWxh
eS1wczoKPiA+ID4gKyAgICBkZXNjcmlwdGlvbjogUkdNSUkgcmVjZWl2ZSBjbG9jayBkZWxheSBk
ZWZpbmVkIGluIHBpY28KPiA+ID4gc2Vjb25kcyArCj4gPiA+ICsgIHR4LWNsay1kZWxheS1wczoK
PiA+ID4gKyAgICBkZXNjcmlwdGlvbjogUkdNSUkgdHJhbnNtaXQgY2xvY2sgZGVsYXkgZGVmaW5l
ZCBpbiBwaWNvCj4gPiA+IHNlY29uZHMgKwo+ID4gPiArcmVxdWlyZWQ6Cj4gPiA+ICsgIC0gY29t
cGF0aWJsZQo+ID4gPiArICAtIHJlZwo+ID4gPiArICAtIGludGVycnVwdHMKPiA+ID4gKyAgLSBp
bnRlcnJ1cHQtbmFtZXMKPiA+ID4gKyAgLSBjbG9ja3MKPiA+ID4gKyAgLSBjbG9jay1uYW1lcwo+
ID4gPiArICAtIG1vZGUtcmVnCj4gPiA+ICsKPiA+ID4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQo+ID4gPiArCj4gPiA+ICtleGFtcGxlczoKPiA+ID4gKyAgLSB8Cj4gPiA+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3gxMDAwLWNndS5oPgo+ID4gPiArCj4gPiA+ICsgICAg
bWFjOiBldGhlcm5ldEAxMzRiMDAwMCB7Cj4gPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiaW5n
ZW5pYyx4MTAwMC1tYWMiLCAic25wcyxkd21hYyI7ICAgIAo+ID4gCj4gPiBEb2Vzbid0IG1hdGNo
IHRoZSBzY2hlbWEuICAKPiAKPiBTb3JyeSBmb3IgdGhhdCwgc29tZWhvdyB3aGVuIEkgcnVuICJt
YWtlIGR0X2JpbmRpbmdzX2NoZWNrIiwgdGhlcmUgaXMKPiBubyB3YXJybmluZyBvciBlcnJvciBt
ZXNzYWdlIGFib3V0IHRoaXMgZmlsZS4gSSBhbSBzdXJlIHRoYXQgeWFtbGxpbnQKPiBpcyBpbnN0
YWxsZWQgYW5kIGR0c2NoZW1hIGhhcyBiZWVuIHVwZ3JhZGVkIHRvIDIwMjEuNi4KCkkgZm91bmQg
dGhhdCBpdCBzZWVtcyB0byBiZSBiZWNhdXNlIDUuMTMgbmV3bHkgaW50cm9kdWNlZAoiRFRfQ0hF
Q0tFUl9GTEFHUz0tbSIsIGFuZCBJIGFtIHN0aWxsIHVzaW5nIHRoZSBvbGQKIm1ha2UgZHRfYmlu
ZGluZ19jaGVjayIgY29tbWFuZCwgc28gdGhpcyBlcnJvciBpcyBub3QgcHJvbXB0ZWQuIE5vdyBJ
CmNhbiBzZWUgdGhpcyBlcnJvciBtZXNzYWdlIGFmdGVyIHVzaW5nIHRoZQoibWFrZSBEVF9DSEVD
S0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2siIGNvbW1hbmQsIGFuZCBJIHdpbGwgc2VuZCBh
CmZpeCBzb29uLgoKVGhhbmtzIGFuZCBiZXN0IHJlZ2FyZHMhCgo+IAo+IEkgd2lsbCBzZW5kIGEg
Zml4Lgo+IAo+IFRoYW5rcyBhbmQgYmVzdCByZWdhcmRzIQo+IAo+ID4gICAKPiA+ID4gKyAgICAg
ICAgcmVnID0gPDB4MTM0YjAwMDAgMHgyMDAwPjsKPiA+ID4gKwo+ID4gPiArICAgICAgICBpbnRl
cnJ1cHQtcGFyZW50ID0gPCZpbnRjPjsKPiA+ID4gKyAgICAgICAgaW50ZXJydXB0cyA9IDw1NT47
Cj4gPiA+ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiOwo+ID4gPiArCj4gPiA+
ICsgICAgICAgIGNsb2NrcyA9IDwmY2d1IFgxMDAwX0NMS19NQUM+Owo+ID4gPiArICAgICAgICBj
bG9jay1uYW1lcyA9ICJzdG1tYWNldGgiOwo+ID4gPiArCj4gPiA+ICsgICAgICAgIG1vZGUtcmVn
ID0gPCZtYWNfcGh5X2N0cmw+Owo+ID4gPiArICAgIH07Cj4gPiA+ICsuLi4KPiA+ID4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55
YW1sCj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3
bWFjLnlhbWwgaW5kZXgKPiA+ID4gMmVkZDhiZS4uOWMwY2U5MiAxMDA2NDQgLS0tCj4gPiA+IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFjLnlhbWwgKysr
Cj4gPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9zbnBzLGR3bWFj
LnlhbWwgQEAgLTU2LDYKPiA+ID4gKzU2LDExIEBAIHByb3BlcnRpZXM6Cj4gPiA+ICAgICAgICAg
IC0gYW1sb2dpYyxtZXNvbjhtMi1kd21hYwo+ID4gPiAgICAgICAgICAtIGFtbG9naWMsbWVzb24t
Z3hiYi1kd21hYwo+ID4gPiAgICAgICAgICAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4gPiA+
ICsgICAgICAgIC0gaW5nZW5pYyxqejQ3NzUtbWFjCj4gPiA+ICsgICAgICAgIC0gaW5nZW5pYyx4
MTAwMC1tYWMKPiA+ID4gKyAgICAgICAgLSBpbmdlbmljLHgxNjAwLW1hYwo+ID4gPiArICAgICAg
ICAtIGluZ2VuaWMseDE4MzAtbWFjCj4gPiA+ICsgICAgICAgIC0gaW5nZW5pYyx4MjAwMC1tYWMK
PiA+ID4gICAgICAgICAgLSByb2NrY2hpcCxweDMwLWdtYWMKPiA+ID4gICAgICAgICAgLSByb2Nr
Y2hpcCxyazMxMjgtZ21hYwo+ID4gPiAgICAgICAgICAtIHJvY2tjaGlwLHJrMzIyOC1nbWFjCj4g
PiA+IEBAIC0zMTAsNiArMzE1LDExIEBAIGFsbE9mOgo+ID4gPiAgICAgICAgICAgICAgICAtIGFs
bHdpbm5lcixzdW44aS1yNDAtZW1hYwo+ID4gPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixz
dW44aS12M3MtZW1hYwo+ID4gPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW41MGktYTY0
LWVtYWMKPiA+ID4gKyAgICAgICAgICAgICAgLSBpbmdlbmljLGp6NDc3NS1tYWMKPiA+ID4gKyAg
ICAgICAgICAgICAgLSBpbmdlbmljLHgxMDAwLW1hYwo+ID4gPiArICAgICAgICAgICAgICAtIGlu
Z2VuaWMseDE2MDAtbWFjCj4gPiA+ICsgICAgICAgICAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMK
PiA+ID4gKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgyMDAwLW1hYwo+ID4gPiAgICAgICAgICAg
ICAgICAtIHNucHMsZHd4Z21hYwo+ID4gPiAgICAgICAgICAgICAgICAtIHNucHMsZHd4Z21hYy0y
LjEwCj4gPiA+ICAgICAgICAgICAgICAgIC0gc3Qsc3BlYXI2MDAtZ21hYwo+ID4gPiBAQCAtMzUz
LDYgKzM2MywxMSBAQCBhbGxPZjoKPiA+ID4gICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3Vu
OGktcjQwLWVtYWMKPiA+ID4gICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuOGktdjNzLWVt
YWMKPiA+ID4gICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuNTBpLWE2NC1lbWFjCj4gPiA+
ICsgICAgICAgICAgICAgIC0gaW5nZW5pYyxqejQ3NzUtbWFjCj4gPiA+ICsgICAgICAgICAgICAg
IC0gaW5nZW5pYyx4MTAwMC1tYWMKPiA+ID4gKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgxNjAw
LW1hYwo+ID4gPiArICAgICAgICAgICAgICAtIGluZ2VuaWMseDE4MzAtbWFjCj4gPiA+ICsgICAg
ICAgICAgICAgIC0gaW5nZW5pYyx4MjAwMC1tYWMKPiA+ID4gICAgICAgICAgICAgICAgLSBzbnBz
LGR3bWFjLTQuMDAKPiA+ID4gICAgICAgICAgICAgICAgLSBzbnBzLGR3bWFjLTQuMTBhCj4gPiA+
ICAgICAgICAgICAgICAgIC0gc25wcyxkd21hYy00LjIwYQo+ID4gPiAtLQo+ID4gPiAyLjcuNCAg
Cj4gPiAgICAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
