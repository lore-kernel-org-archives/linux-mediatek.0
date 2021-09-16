Return-Path: <SRS0=M/W3=OG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3EDC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 03:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 088DE61178
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Sep 2021 03:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 088DE61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OOA0ZGQyGwKuKk4MPw7kE8lpE3eiz+U5crmRqdi3WjI=; b=0379REI8PiIz6T
	nN5bItIj7UFxUwRGfS89vdykGavUq8cBM+mSDHDVl+/UMM7DNrDMQsuWJBLUXiX9cryclS4sLjK+y
	1dHsWGLGjHuk5Q6CCgljD79JkX+B8YWUEIUFxvm62bF3dzTBVMCFxQQQb0pVUFXbNCkOM01vE7/K8
	z+H5kxhPzese+Pxpsx4TOLBhhvdb7vwR/reNtPWNNC2zl7DS7/92e0CBo7+oZsZpSBtzQoDk/Hx6B
	mmNgXrvtKuBA0RReJjiq5hb5/B7wr9Najq9J+CQeORqdfwWhW8CSz4kwNfccgU5PFL/3nD95qjwDM
	Kev8hrDv0AKt9iAaApUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQhei-00AEn5-8c; Thu, 16 Sep 2021 03:01:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQhef-00AEmc-9b; Thu, 16 Sep 2021 03:01:43 +0000
X-UUID: c1c40339c5604260a111d4161e64e166-20210915
X-UUID: c1c40339c5604260a111d4161e64e166-20210915
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 461043009; Wed, 15 Sep 2021 20:01:33 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Sep 2021 19:56:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Sep 2021 10:56:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 16 Sep 2021 10:56:38 +0800
Message-ID: <9068426be6ba2a0eb05d77b18a8f131a2d00ca21.camel@mediatek.com>
Subject: Re: [PATCH v5 01/16] dt-bindings: mediatek: add vdosys1 RDMA
 definition for mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, DTML
 <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, <singo.chang@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>
Date: Thu, 16 Sep 2021 10:56:38 +0800
In-Reply-To: <CAAOTY_-rVhh4_m39JPRnE-zwW38k-OPArVv6GqOmORaD=qStVQ@mail.gmail.com>
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-2-nancy.lin@mediatek.com>
 <CAAOTY_-rVhh4_m39JPRnE-zwW38k-OPArVv6GqOmORaD=qStVQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_200141_375198_B92CB94C 
X-CRM114-Status: GOOD (  29.01  )
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

SGkgQ2h1bi1LdWFuZywKClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCk9uIFR1ZSwgMjAyMS0wOS0w
NyBhdCAwNzo0MiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiBIaSwgTmFuY3k6Cj4gCj4g
TmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDnmnIg25pelIOmA
seS4gCDkuIvljYgzOjE15a+r6YGT77yaCj4gPiAKPiA+IEFkZCB2ZG9zeXMxIFJETUEgZGVmaW5p
dGlvbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0
ZWsuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLXJk
bWEueWFtbCAgIHwgNzcKPiA+ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNzcgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLQo+
ID4gcmRtYS55YW1sCj4gPiAKPiA+IGRpZmYgLS1naXQKPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbWRwLQo+ID4gcmRtYS55
YW1sCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlh
dGVrL21lZGlhdGVrLG1kcC0KPiA+IHJkbWEueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQK
PiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uMzYxMDA5Mzg0OGUxCj4gPiAtLS0gL2Rldi9udWxsCj4g
PiArKysKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVk
aWF0ZWsvbWVkaWF0ZWssbWRwLQo+ID4gcmRtYS55YW1sCj4gCj4gSSd2ZSBjb21wYXJlZCB0aGUg
cmRtYSBkcml2ZXIgaW4gbWRwIFsxXSB3aXRoIHRoZSByZG1hIGRyaXZlciBpbgo+IGRpc3BsYXkg
WzJdLCBib3RoIGFyZSBzaW1pbGFyLiBUaGUgZGlmZmVyZW5jZSBhcmUgbGlrZSBtZXJnZTAgdmVy
c3VzCj4gbWVyZ2U1LiBTbyBJIHdvdWxkIGxpa2UgYm90aCBiaW5kaW5nIGRvY3VtZW50IGFyZSBw
bGFjZWQgdG9nZXRoZXIuIEluCj4gZGlzcGxheSBmb2xkZXI/IEluIG1lZGlhIGZvbGRlcj8gSW4g
U29DIGZvbGRlcj8gSSd2ZSBubyBpZGVhIHdoaWNoCj4gb25lCj4gaXMgYmV0dGVyLCBidXQgYXQg
bGVhc2UgcHV0IHRvZ2V0aGVyLgo+IAo+IFsxXSAKPiBodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3Bh
dGNoLzIwMjEwODI0MTAwMDI3LjI1OTg5LTYtbW91ZHkuaG9AbWVkaWF0ZWsuY29tL19fOyEhQ1RS
TktBOXdNZzBBUmJ3ITFNamZLMXNBTUR2UDlmVTFHWDZRdmZMRWZhcFlFY0xtc1lQMkFoa0FPWjZM
VmFMVExpNnZBbkpNTXFIM3ZySjMkCj4gIAo+IFsyXSAKPiBodHRwczovL3VybGRlZmVuc2UuY29t
L3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVr
L3BhdGNoLzIwMjEwOTA2MDcxNTM5LjEyOTUzLTEyLW5hbmN5LmxpbkBtZWRpYXRlay5jb20vX187
ISFDVFJOS0E5d01nMEFSYnchMU1qZksxc0FNRHZQOWZVMUdYNlF2ZkxFZmFwWUVjTG1zWVAyQWhr
QU9aNkxWYUxUTGk2dkFuSk1NdU0yOVY5VCQKPiAgCj4gCj4gUmVnYXJkcywKPiBDaHVuLUt1YW5n
Lgo+IApPSywgSSB3aWxsIGRpc2N1c3MgdGhpcyB3aXRoIE1vdWR5LgoKUmVnYXJkcywKTmFuY3kg
TGluCj4gPiBAQCAtMCwwICsxLDc3IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4g
PiArJGlkOiAKPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG1kcC1yZG1hLnlhbWwqX187
SXchIUNUUk5LQTl3TWcwQVJidyExTWpmSzFzQU1EdlA5ZlUxR1g2UXZmTEVmYXBZRWNMbXNZUDJB
aGtBT1o2TFZhTFRMaTZ2QW5KTU1oZVJCMmJMJAo+ID4gIAo+ID4gKyRzY2hlbWE6IAo+ID4gaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchMU1qZksxc0FNRHZQOWZVMUdYNlF2
ZkxFZmFwWUVjTG1zWVAyQWhrQU9aNkxWYUxUTGk2dkFuSk1Na29GNF9acyQKPiA+ICAKPiA+ICsK
PiA+ICt0aXRsZTogbWVkaWF0ZWsgZGlzcGxheSBNRFAgUkRNQQo+ID4gKwo+ID4gK21haW50YWlu
ZXJzOgo+ID4gKyAgLSBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gKwo+ID4gK2Rlc2Ny
aXB0aW9uOiB8Cj4gPiArICBUaGUgbWVkaWF0ZWsgZGlzcGxheSBNRFAgUkRNQSBzdGFuZHMgZm9y
IFJlYWQgRGlyZWN0IE1lbW9yeQo+ID4gQWNjZXNzLgo+ID4gKyAgSXQgcHJvdmlkZXMgcmVhbCB0
aW1lIGRhdGEgdG8gdGhlIGJhY2stZW5kIHBhbmVsIGRyaXZlciwgc3VjaCBhcwo+ID4gRFNJLAo+
ID4gKyAgRFBJIGFuZCBEUF9JTlRGLgo+ID4gKyAgSXQgY29udGFpbnMgb25lIGxpbmUgYnVmZmVy
IHRvIHN0b3JlIHRoZSBzdWZmaWNpZW50IHBpeGVsIGRhdGEuCj4gPiArICBSRE1BIGRldmljZSBu
b2RlIG11c3QgYmUgc2libGluZ3MgdG8gdGhlIGNlbnRyYWwgTU1TWVNfQ09ORklHCj4gPiBub2Rl
Lgo+ID4gKyAgRm9yIGEgZGVzY3JpcHRpb24gb2YgdGhlIE1NU1lTX0NPTkZJRyBiaW5kaW5nLCBz
ZWUKPiA+ICsgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsv
bWVkaWF0ZWssbW1zeXMueWEKPiA+IG1sIGZvciBkZXRhaWxzLgo+ID4gKwo+ID4gK3Byb3BlcnRp
ZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBvbmVPZjoKPiA+ICsgICAgICAtIGl0ZW1z
Ogo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDgxOTUtdmRvMS1yZG1hCj4gPiAr
Cj4gPiArICByZWc6Cj4gPiArICAgIG1heEl0ZW1zOiAxCj4gPiArCj4gPiArICBpbnRlcnJ1cHRz
Ogo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKwo+ID4gKyAgcG93ZXItZG9tYWluczoKPiA+ICsg
ICAgZGVzY3JpcHRpb246IEEgcGhhbmRsZSBhbmQgUE0gZG9tYWluIHNwZWNpZmllciBhcyBkZWZp
bmVkIGJ5Cj4gPiBiaW5kaW5ncyBvZgo+ID4gKyAgICAgIHRoZSBwb3dlciBjb250cm9sbGVyIHNw
ZWNpZmllZCBieSBwaGFuZGxlLiBTZWUKPiA+ICsgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwKPiA+IGZvciBkZXRhaWxzLgo+ID4g
Kwo+ID4gKyAgY2xvY2tzOgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAgICAtIGRlc2NyaXB0aW9u
OiBSRE1BIENsb2NrCj4gPiArCj4gPiArICBpb21tdXM6Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+
ID4gKyAgICAgIFRoaXMgcHJvcGVydHkgc2hvdWxkIHBvaW50IHRvIHRoZSByZXNwZWN0aXZlIElP
TU1VIGJsb2NrCj4gPiB3aXRoIG1hc3RlciBwb3J0IGFzIGFyZ3VtZW50LAo+ID4gKyAgICAgIHNl
ZQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lvbW11L21lZGlhdGVrLGlv
bW11LnlhbWwgZm9yCj4gPiBkZXRhaWxzLgo+ID4gKwo+ID4gKyAgbWVkaWF0ZWssZ2NlLWNsaWVu
dC1yZWc6Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIFRoZSByZWdpc3RlciBvZiBk
aXNwbGF5IGZ1bmN0aW9uIGJsb2NrIHRvIGJlIHNldCBieSBnY2UuCj4gPiBUaGVyZSBhcmUgNCBh
cmd1bWVudHMsCj4gPiArICAgICAgc3VjaCBhcyBnY2Ugbm9kZSwgc3Vic3lzIGlkLCBvZmZzZXQg
YW5kIHJlZ2lzdGVyIHNpemUuIFRoZQo+ID4gc3Vic3lzIGlkIHRoYXQgaXMKPiA+ICsgICAgICBt
YXBwaW5nIHRvIHRoZSByZWdpc3RlciBvZiBkaXNwbGF5IGZ1bmN0aW9uIGJsb2NrcyBpcwo+ID4g
ZGVmaW5lZCBpbiB0aGUgZ2NlIGhlYWRlcgo+ID4gKyAgICAgIGluY2x1ZGUvaW5jbHVkZS9kdC1i
aW5kaW5ncy9nY2UvPGNoaXA+LWdjZS5oIG9mIGVhY2ggY2hpcHMuCj4gPiArICAgICRyZWY6IC9z
Y2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUtYXJyYXkKPiA+ICsgICAgbWF4
SXRlbXM6IDEKPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAg
LSByZWcKPiA+ICsgIC0gcG93ZXItZG9tYWlucwo+ID4gKyAgLSBjbG9ja3MKPiA+ICsgIC0gaW9t
bXVzCj4gPiArCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiArCj4gPiArZXhh
bXBsZXM6Cj4gPiArICAtIHwKPiA+ICsKPiA+ICsgICAgdmRvMV9yZG1hMDogdmRvMV9yZG1hQDFj
MTA0MDAwIHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTk1LXZkbzEt
cmRtYSI7Cj4gPiArICAgICAgICByZWcgPSA8MCAweDFjMTA0MDAwIDAgMHgxMDAwPjsKPiA+ICsg
ICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSA0OTUgSVJRX1RZUEVfTEVWRUxfSElHSCAwPjsK
PiA+ICsgICAgICAgIGNsb2NrcyA9IDwmdmRvc3lzMSBDTEtfVkRPMV9NRFBfUkRNQTA+Owo+ID4g
KyAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3BtIE1UODE5NV9QT1dFUl9ET01BSU5fVkRPU1lT
MT47Cj4gPiArICAgICAgICBpb21tdXMgPSA8JmlvbW11X3ZkbyBNNFVfUE9SVF9MMl9NRFBfUkRN
QTA+Owo+ID4gKyAgICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPSA8JmdjZTEgU1VCU1lT
XzFjMTBYWFhYIDB4NDAwMAo+ID4gMHgxMDAwPjsKPiA+ICsgICAgfTsKPiA+ICsKPiA+IC0tCj4g
PiAyLjE4LjAKPiA+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
