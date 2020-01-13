Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7D1C33CA8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:25:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DF392082E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ln76+r8V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="fwiqF50P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DF392082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I9OxiJwDPL0EVVh7iep1o4S2pnr+MmimNgIQHdImPHk=; b=Ln76+r8VTHtjnIhAey99nSgy5
	MWlPNx1aQ7+ttSbrntbg+eLk+0tcnhS1E8GDkhTG8BIoP4jHmfoq/PFWCDCej6nvIXfV8lf8VY/4d
	52N1IbdWj0c1HWcuL+dhZIpkx9f6BphzPRc1QFQ6bGWWdOJ8T0wguRz3QXXHz27orlMAReGWioT43
	fby6xlCrQMNkrxU8tqkgZ1ubBYOHHESGwIwshHkaXwNIBltcY849U7lN168q+gV9PIiPhFotxRHXf
	/BRrdoe9ogtNxf2Y+9e+sTf+MCOairM2AAPeqEVIHw96MG5H/n5JWFwWCMNht01FZ0hnV0jRaWLYO
	RVP+HbcYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqvyo-0008Pn-8M; Mon, 13 Jan 2020 09:25:50 +0000
Received: from mail.dlink.ru ([178.170.168.18] helo=fd.dlink.ru)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqvyX-0008DQ-BA; Mon, 13 Jan 2020 09:25:34 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id 30E3C1B20968; Mon, 13 Jan 2020 12:25:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 30E3C1B20968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1578907530; bh=2f/Y/GZU1BlOm+comjchqo4T/ukgrbsudCbLlFnoBlg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=fwiqF50P8SUCASZq6CdAJ+h+GXabFDEwcMXqtN6++C1LDQoC9TIfAITXOp+yuFTmi
 DwMjf0S+pgyISV0LAaAJlB2hCBbSLoBcHqkdrYypY79RBiLCKtJu5uJCFbw38YOgJU
 PTB9UmuqwIGsVQYMquKXrmpYWOIob1lVocdHTmb0=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id B5EDE1B201FA;
 Mon, 13 Jan 2020 12:25:20 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru B5EDE1B201FA
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id 5075A1B20320;
 Mon, 13 Jan 2020 12:25:20 +0300 (MSK)
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 13 Jan 2020 12:25:20 +0300 (MSK)
MIME-Version: 1.0
Date: Mon, 13 Jan 2020 12:25:20 +0300
From: Alexander Lobakin <alobakin@dlink.ru>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH RFC net-next 00/20] net: dsa: add GRO support
In-Reply-To: <20191230171216.GC13569@lunn.ch>
References: <20191230143028.27313-1-alobakin@dlink.ru>
 <20191230171216.GC13569@lunn.ch>
User-Agent: Roundcube Webmail/1.4.0
Message-ID: <e98ab4764c8a0a90c18bfd49305310fe@dlink.ru>
X-Sender: alobakin@dlink.ru
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_012533_573719_9E47DAEE 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Matteo Croce <mcroce@redhat.com>, Edward Cree <ecree@solarflare.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Sean Wang <sean.wang@mediatek.com>, Jiri Pirko <jiri@mellanox.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 "David S. Miller" <davem@davemloft.net>, Taehee Yoo <ap420073@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

QW5kcmV3IEx1bm4gd3JvdGUgMzAuMTIuMjAxOSAyMDoxMjoKPj4gSSBtYXJrIHRoaXMgYXMgUkZD
LCBhbmQgdGhlcmUgYXJlIHRoZSBrZXkgcXVlc3Rpb25zIGZvciBtYWludGFpbmVycywKPj4gZGV2
ZWxvcGVycywgdXNlcnMgZXRjLjoKPj4gLSBEbyB3ZSBuZWVkIEdSTyBzdXBwb3J0IGZvciBEU0Eg
YXQgYWxsPwo+IAo+PiAtIERvZXMgdGhpcyBzZXJpZXMgYnJpbmcgYW55IHBlcmZvcm1hbmNlIGlt
cHJvdmVtZW50cyBvbiB0aGUKPj4gICBhZmZlY3RlZCBzeXN0ZW1zPwo+IAo+IEhpIEFsZXhhbmRl
cgoKSGksCgo+IEkgdGhpbmsgdGhlc2UgYXJlIHRoZSB0d28gbW9zdCBpbXBvcnRhbnQgcXVlc3Rp
b25zLiBEaWQgeW91IGRvIGFueQo+IHBlcmZvcm1hbmNlIHRlc3RpbmcgZm9yIHRoZSBoYXJkd2Fy
ZSB5b3UgaGF2ZT8KCkV4YWN0bHksIHRoaXMgYXJlIHRoZSB0b3AgcXVlc3Rpb25zLiBJIHBlcmZv
cm1lZCBsb3RzIG9mIHRlc3RzIG9uCmhhcmR3YXJlIHdpdGggd2hpY2ggSSdtIHdvcmtpbmcgb24g
YW5kIGhhZCBhIHByZXR0eSBnb29kIGJvb3N0cwooSSBkaWRuJ3QgbWFpbmxpbmVkIG15IGRyaXZl
cnMgeWV0IHVuZm9ydHVuYXRlbHkpLgpCdXQgdGhpcyBkb2VzIG5vdCBtZWFuIHRoYXQgR1JPIHdv
dWxkIGJlIHRoYXQgbmljZSBmb3IgYWxsIGtpbmQgb2YKZGV2aWNlcyAqYXQgYWxsKi4gVGhhdCdz
IHdoeSBJIHdvdWxkIGxpa2UgdG8gc2VlIG1vcmUgdGVzdCByZXN1bHRzCm9uIGRpZmZlcmVudCBz
eXN0ZW1zLgoKPiBJIHBlcnNvbmFsbHkgZG9uJ3QgaGF2ZSBhbnkgb2YgdGhlIHN3aXRjaGVzIHlv
dSBoYXZlIG1hZGUKPiBtb2RpZmljYXRpb25zIHRvLCBzbyBpIGNhbm5vdCB0ZXN0IHRoZXNlIHBh
dGNoZXMuIEkgbWlnaHQgYmUgYWJsZSB0bwo+IGFkZCBHUk8gdG8gRFNBIGFuZCBFRFNBLCB3aGVy
ZSBpIGNhbiBkbyBzb21lIHBlcmZvcm1hbmNlIHRlc3RpbmcuCj4gCj4gICAgIEFuZHJldwoKUmVn
YXJkcywK4Zq3IOGbliDhmqIg4ZqmIOGaoCDhmrEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
