Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1972C33CA8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:42:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85DE12075B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aUHrxTXq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gkdIVs2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85DE12075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FtgH9T0QeDvvHzMUhdv5jtPHDtaUYKEU9B4AXMdrVzY=; b=aUHrxTXq6uIO5Q
	C9OnRSzLmWh2103rVeGkFYDFCaHipBJkcAQ2kh9qcNfRvlVd5F/1nrYmWZ6JzMbcJlBW59Qf8x8Fv
	03j9QHFaxWbhJNdU22oA1MkXZsohhJXTp3+1BEo4Dtold82s7B1XqMuwqRU/2zTBHORjP7LUDKN/E
	zc7dAHt4aeNFpfpyvXfoaouzaGb46DMbaAC6kLfsllgr8YDwrASWIEW2lnTKeFXqbKLTFzxwTfgpN
	2NU9VyEzVdHL9tmgd6ooJ4e0pkFLED7yj9Pp0FI3b6Bg5TugtZzDFV5nej4xohHQwtZYlDYBT21Qd
	QbbjG0u/Da3GJoRKNZhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqwEz-0008FM-Io; Mon, 13 Jan 2020 09:42:33 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqwEi-0007yp-4u; Mon, 13 Jan 2020 09:42:17 +0000
Received: by mail-ed1-x543.google.com with SMTP id e10so7860942edv.9;
 Mon, 13 Jan 2020 01:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U7KeLP59PevGGC5Z3wB8REEwHPKJRQN3w5hiDB2hOxQ=;
 b=gkdIVs2lFneKxILRe08ZFuatX83Y1qz9EEbVaioH/dqogaaCCdsTaKHQ+JHTS3srR0
 F2mHpMbTne+ScQQODsLLcDSztAY3RlD3ghO5cSKu6JhHjDUP0evfCBmHnx+sHdPYehLT
 fhE8+ad2EaaexkZhkPJenTbckLlM9La2xTJvRtcbhratmc6w7+iKbpp5cQuHiILJ2BG5
 rcNMTHI46v9qSBc77zu1QQX+Gxhm6sq8Pmv4X4Ky6xew543BRMrEDsZ1e+ns3w58ZE+Z
 G0fSFsa9y6c3vxWrWSK9c3OlJ+Y/2MGU0BafdEHzo839WVJuRNU+wFRCJGIReeY89RKc
 eLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U7KeLP59PevGGC5Z3wB8REEwHPKJRQN3w5hiDB2hOxQ=;
 b=erED3pNcmuDK3VBI6uO1898QZEkIOs3kfFrfv8oHYKI+xUCsje5bK/v2bDqm9+CHaX
 X6NYzyfgwvu3kUQIoIABEGWuxWAJfJW8TYYd4DaNW07+bCrE1UTVNpMwenKSi1t6gfCo
 46LgEjLH/1iAZfr6CnHYQkOQQLHR4lkgoD12Mk7E6SX2P82rDlyUEyYEKbWxz4eBApHl
 mHuTdTWvnKeHnpMMtbirNz7LcqdzCqk8wuCaEj6QvHjICjFPOaDLVHUKL1+Dj0X6YMuX
 WjLcVJUlMGMMMq3XPuNfxRKbnIglH/4JfO61KElNvTFIv0d/FLSuuGvmDUPgAUsy0DnS
 2Mww==
X-Gm-Message-State: APjAAAWhSCXHSPayRkdhKGI2VoNSDct61DXuPHYaQzSGW9t2yR8MpIhv
 s1pbE6dCOL+lxqa8BXN/DE5O2f1aYch0hMrqdRg=
X-Google-Smtp-Source: APXvYqy8SM8Y+cR4BrF+oboBLfO9xNOTU4QgWP76WoRWA5nmy26BCRXzTEgIWDK02oI7osEZsjrKqq2/XWN0/Rs4LNQ=
X-Received: by 2002:a05:6402:1742:: with SMTP id
 v2mr16594732edx.171.1578908534048; 
 Mon, 13 Jan 2020 01:42:14 -0800 (PST)
MIME-Version: 1.0
References: <20191230143028.27313-1-alobakin@dlink.ru>
 <20191230143028.27313-6-alobakin@dlink.ru>
 <ee6f83fd-edf4-5a98-9868-4cbe9e226b9b@gmail.com>
 <ed0ad0246c95a9ee87352d8ddbf0d4a1@dlink.ru>
In-Reply-To: <ed0ad0246c95a9ee87352d8ddbf0d4a1@dlink.ru>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Mon, 13 Jan 2020 11:42:03 +0200
Message-ID: <CA+h21hoSoZT+ieaOu8N=MCSqkzey0L6HeoXSyLtHjZztT0S9ug@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 05/19] net: dsa: tag_ar9331: add GRO callbacks
To: Alexander Lobakin <alobakin@dlink.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_014216_220123_53B6AC33 
X-CRM114-Status: UNSURE (   7.11  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, Matteo Croce <mcroce@redhat.com>,
 Edward Cree <ecree@solarflare.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sean Wang <sean.wang@mediatek.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQWxleGFuZGVyLAoKT24gTW9uLCAxMyBKYW4gMjAyMCBhdCAxMToyMiwgQWxleGFuZGVyIExv
YmFraW4gPGFsb2Jha2luQGRsaW5rLnJ1PiB3cm90ZToKPgo+IENQVSBwb3J0cyBjYW4ndCBiZSBi
cmlkZ2VkIGFueXdheQo+Cj4gUmVnYXJkcywKPiDhmrcg4ZuWIOGaoiDhmqYg4ZqgIOGasQoKVGhl
IGZhY3QgdGhhdCBDUFUgcG9ydHMgY2FuJ3QgYmUgYnJpZGdlZCBpcyBhbHJlYWR5IG5vdCBpZGVh
bC4KT25lIGNhbiBoYXZlIGEgRFNBIHN3aXRjaCB3aXRoIGNhc2NhZGVkIHN3aXRjaGVzIG9uIGVh
Y2ggcG9ydCwgc28gaXQKYWN0cyBsaWtlIE4gRFNBIG1hc3RlcnMgKG5vdCBhcyBEU0EgbGlua3Ms
IHNpbmNlIHRoZSB0YWdnZXJzIGFyZQppbmNvbXBhdGlibGUpLCB3aXRoIGVhY2ggc3dpdGNoIGZv
cm1pbmcgaXRzIG93biB0cmVlLiBJdCBpcyBkZXNpcmFibGUKdGhhdCB0aGUgcG9ydHMgb2YgdGhl
IERTQSBzd2l0Y2ggb24gdG9wIGFyZSBicmlkZ2VkLCBzbyB0aGF0CmZvcndhcmRpbmcgYmV0d2Vl
biBjYXNjYWRlZCBzd2l0Y2hlcyBkb2VzIG5vdCBwYXNzIHRocm91Z2ggdGhlIENQVS4KCi1WbGFk
aW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
