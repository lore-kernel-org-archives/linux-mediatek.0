Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9BAC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 16:03:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3B922C9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 16:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C3B922C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:References:
	In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iX6kMQzPLhtsc6gh8IUc4Ur2i2LIIMIMvWCkHVpzWdM=; b=ZPDiqdCtJs8zbbuW7EZThipdv
	T08b9r6xtqM4T52RvSPY15204v1xcUoQ6rNm+kiSigtVcfINVgHBsDqEDzytQJAvm9nuT4hsxdKEV
	D2M0ofcIeBjxg37jvLZYrx3Qq8v4vM9J702nhWr2w3KRoMM1WSEQJHTTFdjE6weHegRrsPeBY7tf0
	ew0BRLeZ/xQBPdrNFLxFdcRzDGM+xaUjp9zk4IBkGfWr236loRSQSNXg6cOsj4yt051xC9tH/HjkM
	q2ouHzrxtCubOoKhfon0Zux/HF3dy/ztrafLusJEZaHPzu/ZAlNRG9Z0N8IwQrDyk+spriRDd27Ju
	RXC0GzZ/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1X0G-0002AI-SV; Mon, 18 Jan 2021 16:03:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1X0C-00029G-Ho; Mon, 18 Jan 2021 16:03:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BF1F22AAA;
 Mon, 18 Jan 2021 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610985815;
 bh=aCdwQR0ujqDllQM02Gt/LZIEeZwAmc8NRQO9hypFVMQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dtLZxqheV7OH+BVL5uNzaC55AaBmzAHs3H5VT1hhyDnTyykfkzb19csd5euX+1jjR
 FXocEhfYsYT8hRCuXW8d2gl/KPyIBSJEJcEBM0LsTOAHG5bQhYBPHleN+CzdL3xbJG
 ejUpoQwyYM08imr0gWM+kHibq5c0Ui20xAZubTJfOf8xGej1ke/dOS4RU3kHqrF+oa
 ZT2AL0cgOyxdwFHujziv/+vsSLrONNnzvvdMOLZfSN0x370oOUtjdyXHUepVClv3tl
 1DDjazyXnf5InS/T2USzZjR5bmmMwSf2V2ffTSSYiLRVFHnJjce9h7rtPOjeUdAyV1
 OjquFnZxAO9WA==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Neuschäfer <j.neuschaefer@gmx.net>, devicetree@vger.kernel.org
In-Reply-To: <20210116013403.3490518-1-j.neuschaefer@gmx.net>
References: <20210116013403.3490518-1-j.neuschaefer@gmx.net>
Subject: Re: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Fix indentation
Message-Id: <161098576157.26872.3242007396802413840.b4-ty@kernel.org>
Date: Mon, 18 Jan 2021 16:02:41 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_110336_653058_64833D39 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Shane Chien <shane.chien@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAxNiBKYW4gMjAyMSAwMjozNDowMyArMDEwMCwgSm9uYXRoYW4gTmV1c2Now6RmZXIg
d3JvdGU6Cj4gVGhlIGl0ZW1zIG9mIHRoZSAnbWFpbnRhaW5lcnMnIGxpc3QgYXJlIGluZGVudGVk
IHdpdGggdGhyZWUgc3BhY2VzLgo+IFVzZSB0aGUgdXN1YWwgdHdvIHNwYWNlcyBpbnN0ZWFkLCBm
b3IgY29uc2lzdGVuY3kgYW5kIHRvIHNpbGVuY2UKPiB5YW1sbGludC4KCkFwcGxpZWQgdG8KCiAg
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUv
c291bmQuZ2l0IGZvci1uZXh0CgpUaGFua3MhCgpbMS8xXSBBU29DOiBkdC1iaW5kaW5nczogbXQ4
MTkyLW10NjM1OTogRml4IGluZGVudGF0aW9uCiAgICAgIGNvbW1pdDogZTM2NjI2YmIwOTllNTE1
OWE3ODY4ZGJmYWQ2OTU3ZmY2YjBlNDEwMgoKQWxsIGJlaW5nIHdlbGwgdGhpcyBtZWFucyB0aGF0
IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1uZXh0CnRyZWUgKHVzdWFsbHkg
c29tZXRpbWUgaW4gdGhlIG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZwp0
aGUgbmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIGJ1ZyBmaXgpLCBob3dl
dmVyIGlmCnByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBiZSBkcm9w
cGVkIG9yIHJldmVydGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3VsdGluZyBm
cm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBw
bGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2VuZCBmb2xs
b3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBu
ZWVkZWQuCgpJZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5n
IGZ1cnRoZXIgY2hhbmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0
ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBiZSByZXBs
YWNlZC4KClBsZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0
aGUgQ0NzIHdoZW4gcmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKVGhhbmtzLApNYXJrCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
