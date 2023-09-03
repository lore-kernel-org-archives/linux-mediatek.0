Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4F7C71153
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Sep 2023 09:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bu2aeR9N3ykN+PWW3Rq18quU2605aVuMysBpFsJqpr0=; b=M09+guI6nsTTJviyusDVW4OKvn
	ikin25Mh/djWIDvNhyGni1wDPVndX4irplKhR0eI57ndxBNYCWrem3qIHP9fYOZbpw3WzUXvEeLKO
	FgcNdbvDotsuxF0/h7kM76zqMvSH4lUSS6LVpfhd41ER1/DlZkJDCKajC1nKeDZLQRYS93KfbQ3nw
	eT00QZeRnH63NfFBddY/9AzNfLiRH3Vp4xrnVPNBmV3n8IJyzZ7C79R1XAaoPylS/7K9uFeldL/JY
	VTklOdVWB6N3VCt0bcQzlf7Q6l8XG0EonRZjql6QQlesFjVeHR89/fV0CBqbv8Y83WXPJ92enppAM
	bEroqKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcjDp-002Hrj-1o;
	Sun, 03 Sep 2023 09:16:45 +0000
Received: from m13116.mail.163.com ([220.181.13.116])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcjDm-002Hqb-0W
	for linux-mediatek@lists.infradead.org;
	Sun, 03 Sep 2023 09:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=TAQ9ab7/JzjoCuofku23C87drjGIJXzYsIWmCVjMcsM=; b=L
	w/mbsMren9ZrlgJYV2OwgwnwwjW4YlOMMuIAlk1uUsj++doNsPvtKuKgNzJL34dm
	zwpynRVLP/BrauZtpMMFvPkrjMOuRb94iPJQifHXhFucj1DQ/oK/KT579BBVk4mJ
	OWFpNE+cN8N77eSSLRHO3V98wQ3OmeafH+uXY054xA=
Received: from 18500469033$163.com ( [114.250.138.216] ) by
 ajax-webmail-wmsvr116 (Coremail) ; Sun, 3 Sep 2023 17:15:08 +0800 (CST)
X-Originating-IP: [114.250.138.216]
Date: Sun, 3 Sep 2023 17:15:08 +0800 (CST)
From: "Dingyan Li" <18500469033@163.com>
To: "Thinh Nguyen" <Thinh.Nguyen@synopsys.com>
Cc: "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>, 
	"pawell@cadence.com" <pawell@cadence.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"brcm80211-dev-list.pdl@broadcom.com" <brcm80211-dev-list.pdl@broadcom.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"mina86@mina86.com" <mina86@mina86.com>, 
	"clemens@ladisch.de" <clemens@ladisch.de>, 
	"ruslan.bilovol@gmail.com" <ruslan.bilovol@gmail.com>, 
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, 
	"treding@nvidia.com" <treding@nvidia.com>, 
	"oneukum@suse.com" <oneukum@suse.com>, 
	"laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, 
	"nic_swsd@realtek.com" <nic_swsd@realtek.com>, 
	"marcel@holtmann.org" <marcel@holtmann.org>
Subject: Re:Re: [PATCH v3] USB: Extend usb_device_speed with new value
 USB_SPEED_SUPER_PLUS_BY2
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 163com
In-Reply-To: <20230901223316.vbnf3zfjsxoogenb@synopsys.com>
References: <20230901160532.6313-1-18500469033@163.com>
 <20230901223316.vbnf3zfjsxoogenb@synopsys.com>
X-NTES-SC: AL_QuySAfuYvU0r7iWZZekXkkYVgew6WsC4vf4k3IReOps0qivA9D4jUFJnPF/Q28ChDiaLnTWeUwNtwftUXpZRYrrq88G2fmxAXgwIEZrDPSBr
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
MIME-Version: 1.0
Message-ID: <58c0090e.160e.18a5a531364.Coremail.18500469033@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: dMGowACHpoKcTvRkSgANAA--.21129W
X-CM-SenderInfo: jprykiiquwmiitt6il2tof0z/xtbB5xLdy2BHLfFV3wAasI
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_021642_549500_4495164A 
X-CRM114-Status: GOOD (  25.61  )
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

CkF0IDIwMjMtMDktMDIgMDY6MzM6MzAsICJUaGluaCBOZ3V5ZW4iIDxUaGluaC5OZ3V5ZW5Ac3lu
b3BzeXMuY29tPiB3cm90ZToKPkhpLAo+Cj5QbGVhc2UgQ2MgbWUgZm9yIGNoYW5nZXMgcmVsYXRl
ZCB0byBkd2MzLgo+ClN1cmUsIHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93LgoKPk9uIFNhdCwg
U2VwIDAyLCAyMDIzLCBEaW5neWFuIExpIHdyb3RlOgo+PiBDdXJyZW50bHkgdGhlcmUgYXJlIHRo
ZXJlIG1ham9yIGdlbmVyYXRpb25zIHdoZW4gc3BlYWtpbmcgb2YKPj4gVVNCX1NQRUVEX1NVUEVS
X1BMVVMgZGV2aWNlcy4gSG93ZXZlciwgdGhleSBhY3R1YWxseSBzdGFuZHMKPj4gZm9yIGRpZmZl
cmVudCBwaHlzaWNhbCBzcGVlZHMuIEdFTl8yeDIgbWVhbnMgMjBHYnBzLCB3aGlsZQo+PiB0aGUg
b3RoZXJzIG1lYW4gMTBHYnBzLiBTbyBpbiBvcmRlciB0byBjb25maXJtIDIwR2JwcywgYm90aAo+
PiBzcGVlZCBhbmQgZ2VuZXJhdGlvbiBuZWVkIHRpIGJlIGNoZWNrZWQuIFRoaXMgY2F1c2VzIGEg
dHJvdWJsZQo+PiBmb3IgaW9jdGwgVVNCREVWRlNfR0VUX1NQRUVEIHNpbmNlIGl0IGNhbiBvbmx5
IHJldHVybiBzcGVlZAo+PiB2YWx1ZSB0byB1c2Vyc3BhY2UuCj4+IAo+PiBJbiBvcmRlciBub3Qg
dG8gYWRkIGEgbmV3IGlvY3RsIHRvIGdldCBzc3AgZ2VuZXJhdGlvbiwgZXh0ZW5kaW5nCj4+IHVz
Yl9kZXZpY2Vfc3BlZWQgaXMgYSBnb29kIG9wdGlvbi4gVGhlIHNpZGUgZWZmZWN0IGlzIHRoYXQK
Pj4gVVNCX1NQRUVEX1NVUEVSX1BMVVMgaGFzIGJlZW4gdXNlZCBpbiBsb3RzIG9mIHBsYWNlcyBh
bmQKPj4gaXQgYWxzbyB0YWtlcyBzb21lIGVmZm9ydCB0byBnbyB0aHJvdWdoIGFsbCBvZiB0aGVt
IGFuZCBjaGVjawo+PiB3aGV0aGVyIHRoZSBuZXcgc3BlZWQgc2hvdWxkIGJlIHVzZWQgdG9vLgo+
PiAKPj4gQmVzaWRlcywgYXMgc3VnZ2VzdGVkIGJ5IEFsZW4sIHNzcF9yYXRlIGlzIG5vdCBhIHBy
b3BlciBuYW1lLAo+PiBjaGFuZ2UgaXQgdG8gc3NwX2dlbi4gQW5kIGNoYW5nZSBhbGwgZnVuY3Rp
b25zL3N0cnVjdCBmaWxlZHMKPj4gZW5kZWQgd2l0aCBzc3BfcmF0ZSB0byBzc3BfZ2VuLiBBbmQg
dGhlcmUgaXMgYWxzbyBzb21lIGNvZGUKPj4gcmVmYWN0b3IgdG8gcmVkdWNlIGR1cGxpY2F0ZSBk
ZWZpbml0aW9uIG9mIHN0cmluZ3MgYW5kIGluY3JlYXNlCj4+IHRoZSB1dGlsaXphdGlvbiBvZiBj
b21tb25seSBkZWZpbmVkIHV0aWxpdGllcy4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IERpbmd5YW4g
TGkgPDE4NTAwNDY5MDMzQDE2My5jb20+Cj4+IC0tLQo+Cj5DYW4gd2Ugc3BlbGwgb3V0IHRoZSB3
aG9sZSB0aGluZyBpbnN0ZWFkIG9mIFVTQl9TUEVFRF9TVVBFUl9QTFVTX0JZMgo+KGllLiBVU0Jf
U1BFRURfU1VQRVJfUExVU19HRU5fMngyIGFzIHlvdSBpbnRlbmRlZCkgaW5zdGVhZCBvZiBqdXN0
IHRoZQo+bGFuZSBjb3VudC4KPgpIZXJlIGlzIGEgbGl0dGxlIGJpdCBtb3JlIGNvbnRleHQgYXQK
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8wN2M4MjFhZS0yMzkxLTQ3NGMtYWVjOS02NWY0
N2QzZmVjZjJAcm93bGFuZC5oYXJ2YXJkLmVkdS8KV2hhdCBJJ20gdHJ5aW5nIHRvIGRvIGlzIHRo
YXQgaW4gZW51bSB1c2JfZGV2aWNlX3NwZWVkLCB3ZSBvbmx5IGNhcmUgYWJvdXQKb3ZlcmFsbCBz
cGVlZCBpbnN0ZWFkIG9mIHN0dWZmIGxpa2UgbGFuZXMuIEZvciBleGFtcGxlLCBHRU5fMXgyIGFu
ZApHRU5fMlgxIGFyZSBib3RoIDEwR2Jwcywgc28gd2UgY2FuIHVzZSBVU0JfU1BFRURfU1VQRVJf
UExVUwp0byByZXByZXNlbnQgMTBHYnBzLiBHRU5fMngyIHJlcHJlc2VudCAyMEdicHMsIHdlIGNh
biB1c2UKVVNCX1NQRUVEX1NVUEVSX1BMVVNfQlkyLiBUaGVyZSBpcyBubyBuZWVkIHRvIGFwcGVu
ZCBnZW5lcmF0aW9uCmFuZCBsYW5lIGluZm8gd2hlbiB3ZSBvbmx5IHdhbnQgdG8gdGFsayBhYm91
dCBvdmVyYWxsIHNwZWVkLiBCeSB0aGUgd2F5LApBcHBsZSBhbHNvIHVzZXMgYSBzaW1pbGFyIHdh
eSB0byBkZWNsYXJlIHNwZWVkIGVudW1zIGFuZCB0aGUgbmV3CnNwZWVkIG5hbWUgaXMga2luZCBv
ZiBib3Jyb3dlZCBmcm9tIGl0LgoKPlRoZXJlIGFyZSBTdXBlclNwZWVkIFBsdXMgZ2VuZXJhdGlv
biBfYW5kXyBsYW5lIGNvdW50LiBUaGF0J3Mgd2h5IEkKPmRpZG4ndCBuYW1lICJ1c2Jfc3NwX2dl
biIgdGhhdCBvbmx5IHJlZmxlY3RzIHRoZSBnZW5lcmF0aW9uIGFuZCBub3QgdGhlCj4KU3RpbGws
IEkgdGhpbmsgInVzYl9zc3BfZ2VuIiBpcyBzbGlnaHRseSBiZXR0ZXIgdGhhbiAidXNiX3NzcF9y
YXRlIi4gQXMgZm9yCnRoZSBsYW5lcywgSSB0aGluayBpdCdzIE9LIHRvIG5vdCBtZW50aW9uIGl0
IGluIHRoZSBuYW1lIHNpbmNlIHRoZXJlIGFyZQphbHJlYWR5IGNvbW1lbnRzIHRvIGV4cGxhaW4g
d2hhdCB0aGlzIGVudW0gaXMgZm9yLiBCZXNpZGVzLCB0aGUgd29yZAoicmF0ZSIgaXMga2luZCBv
ZiBsaWtlICJzcGVlZCIsIHdoaWNoIHNob3VsZCBiZSBjb3ZlcmVkIGJ5IHVzYl9kZXZpY2Vfc3Bl
ZWQKaW5zdGVhZCBvZiBpbiB0aGUgZW51bSBmb3IgZ2VuZXJhdGlvbiBhbmQgbGFuZXMuCgo+bGFu
ZSBjb3VudC4gQWxzbywgSSBkaWRuJ3QgZXh0ZW5kIHVzYl9kZXZpY2Vfc3BlZWQgYmVjYXVzZSBn
ZW4gWHhZIGFyZQo+YWxsIGEgc2luZ2xlIHNwZWVkOiBTdXBlclNwZWVkIFBsdXMuCj4KQWdhaW4s
IEkgdGhpbmsgaXQgZGVwZW5kcyBvbiB3aGF0IHdlIHJlYWxseSBtZWFuIHdoZW4gc3BlYWtpbmcg
b2Ygc3BlZWQuCkNsZWFybHkgR0VOXzJ4MiBhbmQgR0VOXzJ4MSBoYXZlIGRpZmZlcmVudCBvdmVy
YWxsIHNwZWVkLiBMZXQncyBub3QgaGlkZQp0aGUgZmFjdCB1bmRlciBTdXBlclNwZWVkIFBsdXMu
Cgo+SWYgeW91J3JlIHBsYW5uaW5nIHRvIGRvIGl0IHRoaXMgd2F5LCB3aHkgbm90IGFkZCB0aGUg
b3RoZXIgc3BlZWRzIChzdWNoCj5hcyBnZW4gMXgyKSB0byB1c2JfZGV2aWNlX3NwZWVkIGVudW0g
dG9vPyBUaGVuIHdlIGNhbiBkcm9wIHRoZQo+Ckxpa2UgSSBzYWlkIGFib3ZlLCBpZiB3ZSBvbmx5
IGNhcmUgYWJvdXQgdGhlIG92ZXJhbGwgc3BlZWQsIHRoZXJlIGlzIG5vIG5lZWQKdG8gdGVsbCBH
RU5fMXgyIGZyb20gR0VOXzJ4MSBzaW5jZSBib3RoIGFyZSAxMEdicHMuIEJ1dCBsaWtlIGluIGR3
YzMgY29kZSwKdGhlcmUgYXJlIHNvbWUgZGlmZmVyZW50IGJlaGF2aW9ycyBiYXNlZCBvbiBnZW5l
cmF0aW9uIGFuZCBsYW5lcywgc28KdGhlIGVudW0gc3RpbGwgbmVlZHMgdG8gYmUga2VwdC4KCj51
c2Jfc3NwX3JhdGUgZW51bS4gSWYgd2UncmUgZ29pbmcgdG8gY2hlY2sgbXVsdGlwbGUgZW51bSBm
b3IgU3VwZXJTcGVlZAo+UGx1cywgd2UgcHJvYmFibHkgbmVlZCBhIHVzYl9kZXZpY2VfaXNfc3Vw
ZXJzcGVlZF9wbHVzKCkgZnVuY3Rpb24uCj4KPk5vdyB3ZSBuZWVkIHRvIGF1ZGl0IGFsbCB0aGUg
Z3JlYXRlci9sZXNzZXIgc3BlZWQgY2hlY2tzIHRoYXQgdXNlIDwgb3IgPgo+dG8gbWFrZSBzdXJl
IHRoYXQgdGhleSBhcmUgdXNlZCBob3cgdGhleSB3ZXJlIGludGVuZGVkIHRvLgo+CkFmdGVyIGdv
aW5nIHRocm91Z2ggYWxsIHBsYWNlcyB3aGVyZSBVU0JfU1BFRURfU1VQRVJfUExVUyBpcyB1c2Vk
LApmb3Igc3dpdGNoIHN0YXRlbWVudHMsIEkgY2hvb3NlIHRvIGFkZCAgYW4gZXh0cmEgY2FzZS4g
Rm9yIGlmIHN0YXRlbWVudCwKY2hhbmdlICI9PSIgdG8gIj49Ii4gQnV0IEknbSBub3QgY29tcGxl
dGVseSBzdXJlIHRoZXkgYXJlIGFsbCBjb3JyZWN0LAp3aGljaCBuZWVkIHRvIGJlIGZ1cnRoZXIg
Y2hlY2tlZCBieSBtYWludGFpbmVycy4KCj5TaW5jZSB0aGVzZSBjaGFuZ2VzIGFyZSBub3Qgc2lt
cGxlIGFuZCB3aWxsIHRvdWNoIG9uIG11bHRpcGxlIHBsYWNlcywKPnBsZWFzZSBzcGxpdCB0aGlz
IHBhdGNoIG91dC4KPgpPa2F5LCBJIGNhbiB0cnkgdG8gc3BsaXQgdGhlIHBhdGNoIG9uY2Ugd2Ug
cmVhY2ggYW4gYWdyZWVtZW50IG9uCmhvdyB0byBoYW5kbGUgU1NQIHNwZWVkIGFuZCBnZW5lcmF0
aW9uLiBCZXNpZGVzLCB0aGVyZSBpcyBhbG1vc3QKb25lIGZpbGUgZm9yIGVhY2ggZGlmZmVyZW50
IG1vZHVsZSBhbmQgaXQncyBub3QgZ29vZCB0byBzZW5kIG9uZSBwYXRjaApmb3IgZWFjaCBvZiB0
aGVtLCByaWdodD8gVGhlcmUgd291bGQgYmUgbWFueSBpbiB0aGlzIHdheS4KClJlZ2FyZHMsCkRp
bmd5YW4K

