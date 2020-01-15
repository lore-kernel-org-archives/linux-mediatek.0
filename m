Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112C0C33CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 07:25:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7F8E2187F
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 07:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L9PcZJWi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="pvLHYF8p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7F8E2187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TFiFmrklaNKUMKjNPssA1/v5U8Ylgg0dMNdGWLFfhMY=; b=L9PcZJWiUQNNWp3tYnJSsXT9c
	o8Dj2zDW5IGkkqCN/Llt54ZWLxBsG9sadZXEBUIlg8t3mcUcKLZt6Li8idLN9Uv/MB6cV1/tLdyQS
	x8tyxG8p0heYiRMyrPn0VhpShjHYdc7P/Ph15OyXUA8AxF9AEpja7ZxHhLNP/IrE9CfvZ11+Whc+5
	2rISFpgDwAiu2CEsl/7T62/iN2rw1x8jFDMn920NvNNNvQeQsbDXrOWPfYYAnGO7+LmFnWmyJVkUv
	VYAX3RalmOREGTOy62tLZzwZz/RTmNpRZlmNCS1yrKLODGyn77FosyIw5MtsjqiSZMfYji4dz4PfH
	j/Ff1H+EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ird3E-0004HP-25; Wed, 15 Jan 2020 07:25:16 +0000
Received: from fd.dlink.ru ([178.170.168.18])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ird30-0002x9-44; Wed, 15 Jan 2020 07:25:06 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 71D351B214D2; Wed, 15 Jan 2020 10:24:55 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 71D351B214D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1579073095; bh=9BpX60oTC+OJffotL5YslGLjv5z+sH4Lz+acJSFb43Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=pvLHYF8pnpfT44bK2Ta2lq+IWZ5YTHPd4ldRQT+xj4vcGzUXWrT2ZGmrEtnoifOfM
 LI74OKTkRZLg5FLE/rhyXzqj7IQO3HDq4/8g4pgOEsARlkgYlRIjFRxmRF1AkZ9vCy
 vvfDXDS7Uc5Ew93rp0g9NzwVuHl5ZEW450o5ptu4=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id 381B21B2010A;
 Wed, 15 Jan 2020 10:24:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 381B21B2010A
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id AC6BF1B20AE9;
 Wed, 15 Jan 2020 10:24:45 +0300 (MSK)
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Wed, 15 Jan 2020 10:24:45 +0300 (MSK)
MIME-Version: 1.0
Date: Wed, 15 Jan 2020 10:24:45 +0300
From: Alexander Lobakin <alobakin@dlink.ru>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH RFC net-next 06/19] net: dsa: tag_gswip: fix typo in tag
 name
In-Reply-To: <0edda44f-7a75-e6c9-eec3-48259630bb3d@gmail.com>
References: <20191230143028.27313-1-alobakin@dlink.ru>
 <20191230143028.27313-7-alobakin@dlink.ru> <20191230172209.GE13569@lunn.ch>
 <0edda44f-7a75-e6c9-eec3-48259630bb3d@gmail.com>
User-Agent: Roundcube Webmail/1.4.0
Message-ID: <69c888adea30f35fe36da37d76ee604e@dlink.ru>
X-Sender: alobakin@dlink.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_232502_575458_1EBBE434 
X-CRM114-Status: UNSURE (   7.49  )
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
 Yoshiki Komachi <komachi.yoshiki@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Matteo Croce <mcroce@redhat.com>, Edward Cree <ecree@solarflare.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sean Wang <sean.wang@mediatek.com>,
 Jiri Pirko <jiri@mellanox.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RmxvcmlhbiBGYWluZWxsaSB3cm90ZSAxNS4wMS4yMDIwIDAwOjU3Ogo+IE9uIDEyLzMwLzE5IDk6
MjIgQU0sIEFuZHJldyBMdW5uIHdyb3RlOgo+PiBPbiBNb24sIERlYyAzMCwgMjAxOSBhdCAwNToz
MDoxNFBNICswMzAwLCBBbGV4YW5kZXIgTG9iYWtpbiB3cm90ZToKPj4+ICJnd3NpcCIgLT4gImdz
d2lwIi4KPj4+IAo+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIExvYmFraW4gPGFsb2Jha2lu
QGRsaW5rLnJ1Pgo+PiAKPj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5j
aD4KPiAKPiBMaWtld2lzZSwgdGhpcyBpcyBhIGJ1ZyBmaXggdGhhdCBzaG91bGQgYmUgZXh0cmFj
dGVkIG91dCBvZiB0aGlzIEdSTwo+IHNlcmllcyBhbmQgYSBGaXhlczogdGFnIGJlIHB1dCBzaW5j
ZSB0aGlzIGhhcyBhbiB1c2VyLXZpc2libGUgaW1wYWN0Cj4gdGhyb3VnaCAvc3lzL2NsYXNzL25l
dC8qL2RzYS90YWdnaW5nLgoKU3VyZSwgSSdsbCBwdWxsIHNvbWUgcmVhbGx5IGltcG9ydGFudCBm
aXhlcyAobGlrZSB0aGlzIG9uZSBhbmQgZG91YmxlZApUeCBzdGF0cyBpbiB0YWdfcWNhKSBvdXQg
b2YgdGhpcyBzZXJpZXMgYW5kIHN1Ym1pdCB0aGVtIGFzIHNlcGFyYXRlCnBhdGNoZXMsIG1heWJl
IGV2ZW4gaW4gbmV0LWZpeGVzIHRyZWU/Cgo+IFRoYW5rcwoKUmVnYXJkcywK4Zq3IOGbliDhmqIg
4ZqmIOGaoCDhmrEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
