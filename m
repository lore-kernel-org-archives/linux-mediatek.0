Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DFCC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 17:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgegbsxsJaXoMwTKRly36sUdf4rPA+vyIXDIr9E9YkE=; b=Z8ktKy3NfbUeyH
	2Y/itkNERQ3Lz02AKDZNN+8JwVibtIAtIicdG3LoAlk2Cih/dxGHZcQA5VM/++i8EWjyCsjRDLLpm
	5bKWadonJk846rqE0LOKzeOfMRVqDtI3Ht3J8CObk8t/h79NWhhCTMRjfSE/5WP8lNmyOyWFXBZIS
	SoCk+RVDUQnZTAwP8oIa1k0vlOcYlpG23xmHI7HRm4pk2uNShcF39vyT8Seto35JkYHILRAy8CNm0
	frDvbmiNpKs5FyW6utaQC5ehtepyiuCqIV/anpeYN5/7QrAQrrVFFXHRdsP06HXEc7qr5EZBnusXW
	ovWSmyC25EQobTWOO0BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC3Ec-004DpA-9U; Mon, 24 Jan 2022 17:34:30 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC3EZ-004DoC-Gz
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 17:34:28 +0000
Received: by mail-pg1-x532.google.com with SMTP id z131so4968806pgz.12
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 09:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZyDNjyTk1g5RHID85BarMSjV5u48polFgmuVs6EELTc=;
 b=fQlDXQHTJYMjYvbnXqHdGAykkgWwHhP7VJ3dDIAvDCxb2ywj07Dqxr41jgWLAdNqii
 qnXkcy2N4001VUlkE9BEdGglIc80QYhxCXNqMpA6APHgPkf7P0Wp+P2v53QSKsHw1jAD
 mhlgR4MVK7YdVIBk9Y3lJyLPWufxeyInJnEgfYHwvoIHDGPsJkDGuJDhydy+sFq6zMjt
 lxmIueLbwLWOMcQSm+8xV8JSSz1sGtRzeIbAQhXc5aXsKexJIDVuwby1fzWnPgIvd5a5
 ZBWlhnDmQXzjZM0ySO0G/wtPCji8sG/KUPwDjGbEBnnQOldBiHMWKEIK7MDEX7jHHK6R
 xnKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZyDNjyTk1g5RHID85BarMSjV5u48polFgmuVs6EELTc=;
 b=CKe6cK6vGxLHhtwJ8Icf3xdynMtmuwJ946SZPS7fsZLoH9NwqXL35k4yNXJHN8HXpQ
 cwVAt/WDN6uOn5mLHbJUHHnxIdIQIh6J1a6/4O6JD4IFJeOH26Mxip9ctrk9Eyf8+s9y
 O3zvwBcQCQU2SeC4ZPp0YHwPj9hOKYf/KPXI9xvsCvvFr3tkQ5DCCwl35FS0VNK3xBn2
 uEzUetnzX8lTg+CaUzqAqKYF8W6/2R1yuAvxYsf8/4TNi43yaifGFckvPHOCKrzl4WNy
 fELpkJCJpUKz9bslq993MuARQK69sz8L+t8yyqK8nvQKd38W1RWEWr2Jx4rItuM4aAWp
 zbNg==
X-Gm-Message-State: AOAM531HT2xRG7e8TTrWrvQQ0EEUJUDG0YVous2Rf9NuAjxu5aEWi2Kf
 x7HNYAvugfXtfnumzUOaHOg=
X-Google-Smtp-Source: ABdhPJxEMy4wan/+d+ujiXjIpF3AAO0pFS5nxHMHA0D8KpXdACgqaIiBMtuARCp2I3vT/O90wVTDvw==
X-Received: by 2002:a63:87c6:: with SMTP id i189mr5221362pge.261.1643045666452; 
 Mon, 24 Jan 2022 09:34:26 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 o11sm12949904pgj.33.2022.01.24.09.34.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 09:34:25 -0800 (PST)
Message-ID: <4fd93933-9b98-175a-d6f2-8cb3ddc30c51@gmail.com>
Date: Mon, 24 Jan 2022 09:34:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: MT7621 SoC Traffic Won't Flow on RGMII2 Bus/2nd GMAC
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, DENG Qingfang <dqfext@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?=
 <opensource@vdorst.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 linux-mips@vger.kernel.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, openwrt-devel@lists.openwrt.org,
 erkin.bozoglu@xeront.com
References: <83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@arinc9.com>
 <CALW65jZ4N_YRJd8F-uaETWm1Hs3rNcy95csf++rz7vTk8G8oOg@mail.gmail.com>
 <02ecce91-7aad-4392-c9d7-f45ca1b31e0b@arinc9.com> <Ye1zwIFUa5LPQbQm@lunn.ch>
 <acf98ec3-1120-bcc0-2a2f-85d97c48febd@gmail.com>
 <Ye7hMWRR4URUnSFp@shell.armlinux.org.uk>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <Ye7hMWRR4URUnSFp@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_093427_573129_78A366A0 
X-CRM114-Status: GOOD (  18.38  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxLzI0LzIwMjIgOToyNiBBTSwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOgo+IE9u
IE1vbiwgSmFuIDI0LCAyMDIyIGF0IDA5OjEzOjM4QU0gLTA4MDAsIEZsb3JpYW4gRmFpbmVsbGkg
d3JvdGU6Cj4+IE9uIDEvMjMvMjAyMiA3OjI2IEFNLCBBbmRyZXcgTHVubiB3cm90ZToKPj4+IE9u
IFN1biwgSmFuIDIzLCAyMDIyIGF0IDExOjMzOjA0QU0gKzAzMDAsIEFyxLFuw6cgw5xOQUwgd3Jv
dGU6Cj4+Pj4gSGV5IERlbmcsCj4+Pj4KPj4+PiBPbiAyMy8wMS8yMDIyIDA5OjUxLCBERU5HIFFp
bmdmYW5nIHdyb3RlOgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gRG8geW91IHNldCB0aGUgZXRoZXJu
ZXQgcGlubXV4IGNvcnJlY3RseT8KPj4+Pj4KPj4+Pj4gJmV0aGVybmV0IHsKPj4+Pj4gICAgICAg
IHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+Pj4+ICAgICAgICBwaW5jdHJsLTAgPSA8JnJn
bWlpMV9waW5zICZyZ21paTJfcGlucyAmbWRpb19waW5zPjsKPj4+Pj4gfTsKPj4+Pgo+Pj4+IFRo
aXMgZml4ZWQgaXQhIFdlIGRpZCBoYXZlICZyZ21paTJfcGlucyBvbiB0aGUgZ21hYzEgbm9kZSAo
aXQgd2FzIG9yaWdpbmFsbHkKPj4+PiBvbiBleHRlcm5hbF9waHkpIHNvIHdlIG5ldmVyIHRob3Vn
aHQgdG8gaW52ZXN0aWdhdGUgdGhlIHBpbmN0cmwKPj4+PiBjb25maWd1cmF0aW9uIGZ1cnRoZXIh
IFR1cm5zIG91dCAmcmdtaWkyX3BpbnMgbmVlZHMgdG8gYmUgZGVmaW5lZCBvbiB0aGUKPj4+PiBl
dGhlcm5ldCBub2RlIGluc3RlYWQuCj4+Pgo+Pj4gUEhZcyBhcmUgZ2VuZXJhbGx5IGV4dGVybmFs
LCBzbyBwaW5tdXggb24gdGhlbSBtYWtlcyBubyBzZW5zZS4gUEhZcyBpbgo+Pj4gRFQgYXJlIG5v
dCBkZXZpY2VzIGluIHRoZSB1c3VhbCBzZW5zZSwgc28gaSBkb24ndCB0aGluayB0aGUgZHJpdmVy
Cj4+PiBjb3JlIHdpbGwgaGFuZGxlIHBpbm11eCBmb3IgdGhlbSwgZXZlbiBpZiB5b3UgZGlkIGxp
c3QgdGhlbS4KPj4KPj4gTm90IHN1cmUgSSB1bmRlcnN0YW5kIHlvdXIgY29tbWVudCBoZXJlLCB0
aGlzIGlzIGNvbmZpZ3VyaW5nIHRoZSBwaW5tdXggb24KPj4gdGhlIFNvQyBzaWRlIGluIG9yZGVy
IGZvciB0aGUgc2Vjb25kIFJHTUlJIGludGVyZmFjZSdzIGRhdGEgcGF0aCB0byB3b3JrLgo+IAo+
IFRoZSBwaW5tdXggY29uZmlndXJhdGlvbiB3YXMgbGlzdGVkIHVuZGVyIHRoZSBleHRlcm5hbCBQ
SFkgbm9kZSwgd2hpY2gKPiBpcyBxdXRpZSB1bnVzdWFsLiBJbiB0aGUgY2FzZSBvZiBwaHlsaWIg
YW5kIGV4dGVybmFsIGV0aGVybmV0IFBIWXMsCj4gdGhpcyBjYW4gYmUgYSBwcm9ibGVtLgo+IAo+
IFRoZSBwaW5tdXggY29uZmlndXJhdGlvbiBpcyBub3JtYWxseSBoYW5kbGVkIGF0IGRldmljZSBw
cm9iZSB0aW1lIGJ5Cj4gdGhlIGRldmljZSBtb2RlbCwgYnV0IHJlbWVtYmVyIHBoeWxpYiBieXBh
c3NlcyB0aGF0IHdoZW4gaXQgYXR0YWNoZXMKPiB0aGUgZ2VuZXJpYyBQSFkgZHJpdmVyIC0gbWVh
bmluZyB5b3UgZG9uJ3QgZ2V0IHRoZSBwaW5tdXggY29uZmlndXJlZC4KPiAKPiBXaGF0IHRoaXMg
bWVhbnMgaXMgdGhhdCBwaW5tdXggY29uZmlndXJhdGlvbiBpbiBldGhlcm5ldCBQSFkgbm9kZXMg
aXMKPiB1bnJlbGlhYmxlLiBJdCB3aWxsIG9ubHkgaGFwcGVuIGlmIHdlIGhhdmUgYSBzcGVjaWZp
YyBkcml2ZXIgZm9yIHRoZQo+IFBIWSBhbmQgdGhlIGRyaXZlciBtb2RlbCBiaW5kcyB0aGF0IGRy
aXZlci4KPiAKPiBPZiBjb3Vyc2UsIGlmIHdlIGtpbGxlZCB0aGUgZ2VuZXJpYyBkcml2ZXIsIHRo
YXQgd291bGQgZ2V0IGFyb3VuZCB0aGlzCj4gaXNzdWUgYnkgcmVxdWlyaW5nIGV2ZXJ5IFBIWSB0
byBoYXZlIGl0cyBvd24gc3BlY2lmaWMgZHJpdmVyLCBidXQgdGhlcmUKPiB3b3VsZCBiZSBtYW55
IGNvbXBsYWludHMgYmVjYXVzZSBsaWtlbHkgbG90cyB3b3VsZCBzdG9wIHdvcmtpbmcuCgpJIHN1
cHBvc2UgdGhhdCBleHBsYWlucyB3aHkgdGhpcyBpcyBzdGlsbCBpbiBzdGFnaW5nIHRoZW4gOikg
QW5kcmV3J3MgCmFuc3dlciBtYWtlcyBtb3JlIHNlbnNlIG5vdywgdGhhbmtzLgotLSAKRmxvcmlh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
