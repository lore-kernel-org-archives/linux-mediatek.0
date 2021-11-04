Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD48C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 11:41:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E1161205
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 11:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85E1161205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jooa7PkZdME+nXCBi+d/oaQiQ8duAstjlx+MeR2Q2NA=; b=GagitJMd07oGji
	C8FboKirFDh7okOV/oMSa78cn6j5kiJmsJQg5xm4aYF8GeqfsjwEI1MoVG77KFZjBfwbWOV1Rd6Zk
	YaZHaUrt7CUADT3orWWgA8XNZOcz8YIAHVUYh4UwXmigaIPEDgDrf0Ot39X3//6hj+OtnACVsynse
	3Ezlg4ooUJIjm9rSQgdMi3PiHxVPX8wcFs50uv7IUOy8NnkDko2DWxDD6q/OujD+23VdqIGkZ4iSE
	1uUAjXKh705Kr4XwJ+LYSC5TxjWe8KIzwEFkYgu/B/jEIym1fAfbqKrvruPVN/KKVtx0ZIr3SfZvf
	xuKPz+9PWiz6Q1Z3iKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mib7U-008jYG-Q6; Thu, 04 Nov 2021 11:41:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mib7I-008jVi-4A; Thu, 04 Nov 2021 11:41:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE6BB611EF;
 Thu,  4 Nov 2021 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636026071;
 bh=w4EJu5XJxSHpNU33OdK4OD1pgxNRI63+7YIulSPgqTA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nY3bp1C1iEUAgTkKHfaCeYAYC4rUcxlNvEa8hB1iU+Rxcst30p9ZVvmd5uaUXsO7t
 r/zSPFt7kZc5dvxsWd/RFVUdbUScmWNZCM3tXx5mPQ2BB6Txfn6ab49ftUhCyVceZY
 RBGUUdpd9K/tA2ci3FAFr5Bky7hm8hBdNKodHH7vKXghnjUtF5LIbzl6a4P3qF0/Gn
 4weR3k6xlCVPinWW0h66aYkPPGQpxGW8yscR/SJ5+LTFADWq2ykMRNXn/rqkLvI+Rh
 Fe2zMRlrHs9SOrORLyxVxuG52pFj5GPgfNOC2mR9w0SvXIu/dh6lBWEy7MlQEHmimj
 zeTuwUOZUITIQ==
Received: by pali.im (Postfix)
 id 19858990; Thu,  4 Nov 2021 12:41:09 +0100 (CET)
Date: Thu, 4 Nov 2021 12:41:08 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczyi=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Jiey Yang <ot_jiey.yang@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Delay 100ms to wait power and clock to
 become stable
Message-ID: <20211104114108.mvhm5nhbc7hn2yld@pali>
References: <20211104062144.31453-1-qizhong.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211104062144.31453-1-qizhong.cheng@mediatek.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_044112_209968_77207BBC 
X-CRM114-Status: GOOD (  17.09  )
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

T24gVGh1cnNkYXkgMDQgTm92ZW1iZXIgMjAyMSAxNDoyMTo0NCBxaXpob25nIGNoZW5nIHdyb3Rl
Ogo+IERlc2NyaWJlZCBpbiBQQ0llIENFTSBzcGVjaWZpY2F0aW9uIHNldGN0aW9ucyAyLjIgKFBF
UlNUIyBTaWduYWwpIGFuZAo+IDIuMi4xIChJbml0aWFsIFBvd2VyLVVwIChHMyB0byBTMCkpLiBU
aGUgZGVhc3NlcnRpb24gb2YgUEVSU1QjIHNob3VsZAo+IGJlIGRlbGF5ZWQgMTAwbXMgKFRQVlBF
UkwpIGZvciB0aGUgcG93ZXIgYW5kIGNsb2NrIHRvIGJlY29tZSBzdGFibGUuCj4gCj4gU2lnbmVk
LW9mZi1ieTogcWl6aG9uZyBjaGVuZyA8cWl6aG9uZy5jaGVuZ0BtZWRpYXRlay5jb20+CgpBY2tl
ZC1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvcGNpZS1tZWRpYXRlay5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvcGNpZS1tZWRpYXRlay5jIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9wY2llLW1lZGlhdGVr
LmMKPiBpbmRleCAyZjNmOTc0OTc3YTMuLmIzMmFjYmFjODA4NCAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL3BjaWUtbWVkaWF0ZWsuYwo+ICsrKyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvcGNpZS1tZWRpYXRlay5jCj4gQEAgLTcwMiw2ICs3MDIsMTQgQEAgc3RhdGljIGlu
dCBtdGtfcGNpZV9zdGFydHVwX3BvcnRfdjIoc3RydWN0IG10a19wY2llX3BvcnQgKnBvcnQpCj4g
IAkgKi8KPiAgCXdyaXRlbChQQ0lFX0xJTktET1dOX1JTVF9FTiwgcG9ydC0+YmFzZSArIFBDSUVf
UlNUX0NUUkwpOwo+ICAKPiArCS8qCj4gKwkgKiBEZXNjcmliZWQgaW4gUENJZSBDRU0gc3BlY2lm
aWNhdGlvbiBzZXRjdGlvbnMgMi4yIChQRVJTVCMgU2lnbmFsKQo+ICsJICogYW5kIDIuMi4xIChJ
bml0aWFsIFBvd2VyLVVwIChHMyB0byBTMCkpLgo+ICsJICogVGhlIGRlYXNzZXJ0aW9uIG9mIFBF
UlNUIyBzaG91bGQgYmUgZGVsYXllZCAxMDBtcyAoVFBWUEVSTCkKPiArCSAqIGZvciB0aGUgcG93
ZXIgYW5kIGNsb2NrIHRvIGJlY29tZSBzdGFibGUuCj4gKwkgKi8KPiArCW1zbGVlcCgxMDApOwo+
ICsKCkkgZ3Vlc3MgdGhhdCB0aGlzIGNoYW5nZSBpcyBmaXhpbmcgZGV0ZWN0aW9uIG9mIHNvbWUg
UENJZSBjYXJkcywgcmlnaHQ/CgpUaGlzIGFkLWhvYyBkcml2ZXIgY2hhbmdlIGlzIHJlYWxseSBy
ZXF1aXJlZCBhcyBrZXJuZWwgcGNpIGNvZGUgZG9lcyBub3QKY29udGFpbiB0aGlzIGRlbGF5IGZ1
bmN0aW9uYWxpdHkuCgpOb3RlIHRoYXQgdGhpcyBkZWxheSBpcyByZXF1aXJlZCBpbiBldmVyeSBu
YXRpdmUgcGNpIGNvbnRyb2xsZXIgZHJpdmVyCihub3Qgb25seSBtZWRpYXRlayksIG90aGVyd2lz
ZSBzb21lIFBDSWUgY2FyZHMgbWF5IG5vdCBiZSBkZXRlY3RlZC4KCkZvciBmdXR1cmUgZGlyZWN0
aW9uLCBzb21lIG1vcmUgZ2VuZXJhbCBzb2x1dGlvbiBmb3IgdGhlc2UgaXNzdWVzIGlzCm5lZWRl
ZC4gSSBwcm9wb3NlZCBzb21ldGhpbmcgaW4gZm9sbG93aW5nIGVtYWlsOgpodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1wY2kvMjAyMTEwMjIxODM4MDguamRlbzd2bnRuYWdxa2c3Z0BwYWxp
LwpJZiB5b3UgaGF2ZSBhIHRpbWUsIEkgd291bGQgbGlrZSB0byBoZWFyIHNvbWUgZmVlZGJhY2su
Li4KCj4gIAkvKiBEZS1hc3NlcnQgUEhZLCBQRSwgUElQRSwgTUFDIGFuZCBjb25maWd1cmF0aW9u
IHJlc2V0CSovCj4gIAl2YWwgPSByZWFkbChwb3J0LT5iYXNlICsgUENJRV9SU1RfQ1RSTCk7Cj4g
IAl2YWwgfD0gUENJRV9QSFlfUlNUQiB8IFBDSUVfUEVSU1RCIHwgUENJRV9QSVBFX1NSU1RCIHwK
PiAtLSAKPiAyLjI1LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
