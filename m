Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F95C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:40:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7816E613F3
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7816E613F3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08X6DrnEQYRELbBA+FTWl5+sSsRSOy7PrAMGIfcgUF8=; b=ByI7wCnjmek9hE
	9SXCqNHvr47oz+2ZNkLL77tQhkYIoDqvh+stL3z7XQ6blW+5AB4GcV6qiFjw+VxQfoDS3BokjcFBO
	33EEqevNmJotUj6rNFstLA0lsnGbfVcuCim9dimIkuuUaONVtd/pmNMQz2IoIIDvBRoYcAnuNaYFE
	nwezQd2BVxOJ1kHNTQBc23twKPuAgqBEVj4Abj8M1rfPlzSWdZWBuYYrwMqMQZ2Gl7dD19zZ9CxOR
	DaYGMyDJa830CG7aiSNmUJu7F8Mn3Vs1INCwaPmeESConCroGWnm5TLY5O+ti7N9E63NOnhNGOWRP
	nvj3xTPkqwOuNUsGvHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwjFr-00138t-Fd; Fri, 25 Jun 2021 10:40:11 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwije-000qt4-Mn; Fri, 25 Jun 2021 10:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1624615613;
 bh=KPSrVHtFgQjR0DccR13l5IWzueT0aS5xNt0lrvk59Oc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=MITrXs43sljwPyxsQerYjzB2ZZDsKAWYEMnBGflRuQxQAyABfOuAVb+hKXP8M9e6i
 t0E/fraHnV8YrbavUP8jpdPLB3iA2C7yxzTwk4v8RB9ztS3FpXjPCjMEesAFhuau7R
 vvKu11tS7OJZqcI9cpH+3pCQCNyHmqJkXBszXws0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.157.219] ([217.61.157.219]) by web-mail.gmx.net
 (3c-app-gmx-bs66.server.lan [172.19.170.210]) (via HTTP); Fri, 25 Jun 2021
 10:16:43 +0200
MIME-Version: 1.0
Message-ID: <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
From: Frank Wunderlich <frank-w@public-files.de>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang
 <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Daniel Golle
 <daniel@makrotopia.org>
Subject: Aw: Re: [PATCH] Fix mt7622.dtsi thermal cpu
Date: Fri, 25 Jun 2021 10:16:43 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
 <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
 <173e6bab-9d21-eb28-9b91-a5f80c01fd03@linaro.org>
 <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:4154xVDgSfyG4t08O7Ht9tPl5ySlXuRPX9mO546NB9MEsmBGYGbuNdW1daSYpnkev6AqM
 q8ii1ZC6PODAWiCN6EDefPVGOxPhdR0BJT5+s5s6oh948EnixcAJNO6fbZgJzfgqU9SSzOpHBIFq
 mKMSWO0QdldOBlNGJjdVNIJtH0hCWu0/QBIwHjtLpbKcYOcbR9eBDnGhWNdv/TsQDo8VbGwpkPbW
 OXEei+hhi5DnplcNorFsuqzv47Q4ykmYafc6huTcnSz8ClT4MrqhPY/zod4vn2bzjB6aRHw16Vxv
 FU=
X-UI-Out-Filterresults: notjunk:1;V03:K0:ug4CERVGxc0=:gJVLSf7Sw0AbTBnHINFIRG
 oGdg4FloVG+ciU44x5h6I+B7Z1/X9CUNBdsvt8Q+3nmTs0ihRwnB/uYcuV7uBoeCWAhPcxp1T
 kspuCghJ87K+K/4UOD/Drs7YtHqqyaMM3gtU75axMa/3rfA9cZGaNMfB607QMPQKBLhUZWYUI
 ho4R9TlT/lq98sSIlt7FTKeaiPQl2mgGyh+49HazurYwpCOmRkQ8Be7s8ViVZ3+r1n854AMZm
 v6E9hxcvb34seukGOxPUGd+sAEXvx0ON3DIfuecelQVIziw8kB6dqV+wlGCiY3xUx2Z3yFJRq
 57G9x6KVfAhZ7uC58Uguv7ia7UAZfIqar1dpZS4UkI6myUGQisZmyPJQRR2B3H+3io6swyLlT
 RS5pltDhk05PJgv51qvdM+WKk8MRhD/kGQ1jifcYESEkgGKaPcp6K4Wlv1oaie+g+KTuhOveq
 JI1PlgSPl7K9PSHtrKO0wX4cpfecrPonlibSi6T36igOCLGHVcTfmFhicJVIy/hmCCDiu+3j8
 9hou7AUwSR6WeHlyadf10b41MiMrtJ7PX6cuzuRIV3S0Ncr9U2uTkIvTeggMI1qSxhuOLPudb
 cO21C84FArOObkSupGf9Obg1tkPbqCS8RC76HCI2asWgbtvOpA0F3fmgohjZgF5BjFRPb/gvB
 PROpn7585ofI2CQ4HTv+a7iXlWmoXFNV6iaY0UyBhedl6U31EMqb/hI2L7eM6iayWPt/47TbA
 kChbIeWhG8DRC/Po07urKsCaWNeqtpD5OPpWdmNbfMkJI8iaQEZHjsqgH7PMptOUJEqtIGJNt
 nqeTq++1sZA9YrjUHSaWkL2QsL9UjKuOlGegfwOermeh1c2m48=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_030655_120405_2B6D6736 
X-CRM114-Status: GOOD (  14.01  )
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

SGksCgo+IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAyNC4gSnVuaSAyMDIxIHVtIDE1OjI5IFVocgo+
IFZvbjogIkVyaWMgV291ZHN0cmEiIDxlcmljd291ZHNAZ21haWwuY29tPgo+IFRoZSBTT0MgcnVu
cyB1bnRocm90bGxlZCBzbG93bHkgdG8gODAgZGVncmVlcy4gVGhpcyB0YWtlcyBtaW51dGVzLiBQ
b2xsaW5nIGludGVydmFsIDEgc2Vjb25kIG9yIGxlc3MgZG9lcyBub3QgbWF0dGVyIG11Y2ggd2hl
biBsb29raW5nIGF0IHRoZXNlIHRlbXBlcmF0dXJlIHJpc2UgdGltZXMgCj4gCj4gQWZ0ZXIgdGhh
dCBpbiBtb3JlIHRoZW4gYW4gaG91ciBpdCBzbG93bHkgY3JlZXBzIHVwIHRvIDg1LiBJIGJlbGll
dmUgdGhlIGRlc2lnbiBpcyBzbyB0aGF0IHRoZSBTT0MsIHVuZGVyIG5vcm1hbCBjaXJjdW1zdGFu
Y2VzLCBjYW4gcnVuIGF0IDEuMzUgR0h6IHdpdGhvdXQgdGhyb3R0bGluZyBmcmVxdWVuY3ksIHdp
dGhvdXQgaGVhdHNpbmsuIEl0IGp1c3QgbmVlZHMgYSBzYWZlZ3VhcmQgZm9yIGRpZmZlcmVudCBj
aXJjdW1zdGFuY2VzLgo+IAo+IE1vc3Qgb2YgdGhlc2UgU09DcyBjYW4gYWxzbyBydW4gaW4gaW5k
dXN0cmlhbCBncmFkZSBjaXJjdW1zdGFuY2VzLCB3aGljaCBtZWFucyB1cCB0byA4NSBkZWdyZWVz
IGFtYmllbnQgdGVtcGVyYXR1cmUgYWxyZWFkeSAuIElmIG5vdCBpbmR1c3RyaWFsIHRoZW4gdGhp
cyB3b3VsZCBiZSA2MCBkZWdyZWVzIGFtYmllbnQgYWxyZWFkeSAKPiAKPiBCdXQgb25seSBzb21l
b25lIGF0IE1lZGlhdGVrIGNhbiBjb25maXJtIHRoaXMgCgptYXliZSBNYXR0aGlhcyBrbm93cyBh
bnlib2R5PwpnZXRfbWFpbnRhaW5lcnMtc2NyaXB0IHNob3dzIG5vIG10ayBlbXBsb3llZSBmb3Ig
bXRrX3RoZXJtYWwgZHJpdmVyLCBhZGRlZCBTZWFuIGFuZCBSeWRlciBhcyBjb21tb24gTGludXgt
Q29udGFjdHMuLi4KCkRhbmllbCBmcm9tIG9wZW53cnQgaGF2ZSBzb21lIG90aGVyIG10NzYyMiBC
b2FyZHMgbWF5YmUgaGUgY2FuIHRlc3QgdGhlIEZhbiBhcHByb2FjaCBiZWxvdwoKPiBPbiBKdW4g
MjQsIDIwMjEsIDEyOjIxIFBNLCBhdCAxMjoyMSBQTSwgRGFuaWVsIExlemNhbm8gPGRhbmllbC5s
ZXpjYW5vQGxpbmFyby5vcmc+IHdyb3RlOgo+ID5Gb3VuZCB0aGF0Ogo+ID4KPiA+aHR0cHM6Ly9k
b3dubG9hZC5rYW1hbWkucGwvcDU3OTM0NC1NVDc2MjJBX0RhdGFzaGVldF9mb3JfQmFuYW5hUGlf
T25seSUyODElMjkucGRmCj4gPgo+ID5DaGFwdGVyIDMuMyAtIFRoZXJtYWwgQ2hhcmFjdGVyaXN0
aWNzCj4gPgo+ID5HaXZlbiB0aGUgdmFsdWVzIEkgc3VnZ2VzdDoKPiA+Cj4gPiAtIFBhc3NpdmUg
LSA4MMKwQwo+ID4KPiA+IC0gSG90IC0gOTDCsEMKPiA+Cj4gPiAtIENyaXRpY2FsIC0gMTAwwrBD
CgptYXliZSBhZGRpbmcgRkFOIChyNjQsIGRvbid0IGtub3cgZm9yIG90aGVyIG10NzYyMiBib2Fy
ZHMpIGZvciBsb3dlciAyIHRyaXBzICh3aXRoIGFkanVzdGVkIHRlbXBlcmF0dXJlIHBvaW50cykg
YW5kIGNwdS10aHJvdHRlbGluZyBmb3IgdXBwZXIgMiB0cmlwcwoKc29tZXRoaW5nIGxpa2UgdGhp
cyAodXNlZCB0aGUgNzAvODAgdHJpcCBwb2ludHMgZGlzY3Vzc2VkIGJlZm9yZSk6CgotLS0gYS9h
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210NzYyMi5kdHNpCisrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ3NjIyLmR0c2kKQEAgLTEzNCw2ICsxMzQsMTMgQEAKIAkJfTsK
IAl9OwogCisJZmFuMDogcHdtLWZhbiB7CisJCWNvbXBhdGlibGUgPSAicHdtLWZhbiI7CisJCSNj
b29saW5nLWNlbGxzID0gPDI+OworCQlwd21zID0gPCZwd20gMiAxMDAwMCAwPjsKKwkJY29vbGlu
Zy1sZXZlbHMgPSA8MCAxMDIgMTcwIDIzMD47CisJfTsKKwogCXRoZXJtYWwtem9uZXMgewogCQlj
cHVfdGhlcm1hbDogY3B1LXRoZXJtYWwgewogCQkJcG9sbGluZy1kZWxheS1wYXNzaXZlID0gPDEw
MDA+OwpAQCAtMTQzLDEzICsxNTAsMTMgQEAKIAogCQkJdHJpcHMgewogCQkJCWNwdV9wYXNzaXZl
OiBjcHUtcGFzc2l2ZSB7Ci0JCQkJCXRlbXBlcmF0dXJlID0gPDQ3MDAwPjsKKwkJCQkJdGVtcGVy
YXR1cmUgPSA8NzAwMDA+OwogCQkJCQloeXN0ZXJlc2lzID0gPDIwMDA+OwogCQkJCQl0eXBlID0g
InBhc3NpdmUiOwogCQkJCX07CiAKIAkJCQljcHVfYWN0aXZlOiBjcHUtYWN0aXZlIHsKLQkJCQkJ
dGVtcGVyYXR1cmUgPSA8NjcwMDA+OworCQkJCQl0ZW1wZXJhdHVyZSA9IDw4MDAwMD47CiAJCQkJ
CWh5c3RlcmVzaXMgPSA8MjAwMD47CiAJCQkJCXR5cGUgPSAiYWN0aXZlIjsKIAkJCQl9OwpAQCAt
MTcwLDE0ICsxNzcsMTIgQEAKIAkJCWNvb2xpbmctbWFwcyB7CiAJCQkJbWFwMCB7CiAJCQkJCXRy
aXAgPSA8JmNwdV9wYXNzaXZlPjsKLQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1B
TF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKLQkJCQkJCQkgPCZjcHUxIFRIRVJNQUxfTk9f
TElNSVQgVEhFUk1BTF9OT19MSU1JVD47CisJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZmYW4wIFRI
RVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47CiAJCQkJfTsKIAogCQkJCW1hcDEgewog
CQkJCQl0cmlwID0gPCZjcHVfYWN0aXZlPjsKLQkJCQkJY29vbGluZy1kZXZpY2UgPSA8JmNwdTAg
VEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPiwKLQkJCQkJCQkgPCZjcHUxIFRIRVJN
QUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47CisJCQkJCWNvb2xpbmctZGV2aWNlID0gPCZm
YW4wIFRIRVJNQUxfTk9fTElNSVQgVEhFUk1BTF9OT19MSU1JVD47CiAJCQkJfTsKIAogCQkJCW1h
cDIgewpAQCAtNDI4LDYgKzQzMyw3IEBACiAJcHdtOiBwd21AMTEwMDYwMDAgewogCQljb21wYXRp
YmxlID0gIm1lZGlhdGVrLG10NzYyMi1wd20iOwogCQlyZWcgPSA8MCAweDExMDA2MDAwIDAgMHgx
MDAwPjsKKwkJI3B3bS1jZWxscyA9IDwzPjsKIAkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDc3IElS
UV9UWVBFX0xFVkVMX0xPVz47CiAJCWNsb2NrcyA9IDwmdG9wY2tnZW4gQ0xLX1RPUF9QV01fU0VM
PiwKIAkJCSA8JnBlcmljZmcgQ0xLX1BFUklfUFdNX1BEPiwKCgpyZWdhcmRzIEZyYW5rCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
