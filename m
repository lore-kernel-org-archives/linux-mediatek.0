Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534E3C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 15:43:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BE32078A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 15:43:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qGrxWYvL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k9p2XBES";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="bGObxkMz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BE32078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:Subject:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sEqB1bBEb7/+bhM29SMqDN1vwrmtEwdd2yloGcGzZbc=; b=qGrxWYvLpPwCLtn7D/h7G9qNIQ
	R8Zdqg2Nojvxw29SQuN+XvyffKPo1+GXN085RztwMXZJtdhbV9MVjHGBJ73lomVAj8+0ZpRHmA01e
	syTaaVDiIZCSUdI/JCcenpuOu1I5b7x49fAkeHH2lF80G4SNQEVgih5PdVKcFsTzisGzn1HZJmVGJ
	exR0TFnMT49JYJSJksW5iU005upYvJz1BmeR6IltPkkTxlNFEmsQLbaWbXU7EMi05tE307dkBd6hj
	sALs+JI4IYNs87i2Xd6qRJBrnrDq5A1yAPwPv3uPhHcF3nWAejF8h7JlFcFdoq7u045Fs4l7yQ9ko
	1NY8Z9+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAxZs-0006J7-35; Wed, 26 Aug 2020 15:43:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA6Jh-0000hz-UC; Mon, 24 Aug 2020 06:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:From:Subject:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=rPnKNdeyQ8hQGEo7A4j1VtwH1AIycEImqf+W5Pr4TTE=; b=k9p2XBESUzViwIMsDrfSG+iPSE
 H04RReJgxEGuR5MdGgfKhXe0EgBmrkyCc/LJBTF+K0hba5Yjxx+qgJfQLcY1eAz221LS2h64xM/lW
 7Pq3bOSNipmhlbZvkioCdFwQqHLjGKCCuGHiFqHWZPt/9QNxu19lfD3Xjjs3Qq+T9HXjsOjlsZ9ol
 31u5hVNt63OqzGRkKMrQE5H5+w1ICQXZDu/QqMEi35fhG7Kd5PAm1NAxVkqf7p5kj1Na/58r0XPJG
 uoY3Dxv/JjhNukunUEyvs16YOhwWaOnjGspISlWTjIi87w2v6neYS65lMXYVa3NrqcaH83svU4Bpo
 KjtbrV0Q==;
Received: from mout.web.de ([212.227.15.14])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA6Jd-0005x5-KZ; Mon, 24 Aug 2020 06:50:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1598251844;
 bh=es0rpx0ftIOuSAZ5+zpm0szmRa47lZ6Qk2VRqE4INYY=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=bGObxkMzRfV924Es69spUYyu36qDqEAiJFODnUsHJsMRT9r+Kb2G039E/oKx4pPTe
 H++jVrIDH1S9HLHVoN5tNUHVQF+3yVgz1ciI5LfaEPoJ7VEbHhF5Z7o3w3aWUCTTxm
 twx4vn1NZcRil/jkwz5Nsg/M3nrT1JtLJB6XN3bw=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.51.25]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M8QeQ-1kVdRV443e-00vxLh; Mon, 24
 Aug 2020 08:44:48 +0200
To: Sumera Priyadarsini <sylphrenadin@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH v3] net: dsa: Add of_node_put() before break and return
 statements
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <bbdeb43f-5b5e-7aa5-4126-446363d43a52@web.de>
Date: Mon, 24 Aug 2020 08:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:M0S/QTAYAjlv3370n0QvNnDX7+6fyXeUhCwGwgthj9zAbUUY5fb
 Sz0y7QK2eKs4vpuqG5zlO34d8L/nQc85v+QNDe/yPU6+C1HIgFbE8CcmT0MKbc3OEViqpLN
 4Yi3UeRSHLStAZY5raPNp8xKyXr6WtLt2zigLa0BK9g8sWQpnCXL/wML3j5M968GG/6/zQ7
 ycsTpFi/af9rbEtA3rEAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QUtS5tNXjW0=:6W7LJYoamtE/+0n7zA6DVZ
 LE0ACP4CkSM86ciCdvd52MtzplSgWqr9ChHk6eiVy0IduSyzh0X4s2CoY2ITaYsvgAiGOGtjW
 zp1RAaVuqeo9/zD7HL1IXAatPjceeR2pyi7ltG6aBd5CCBs+YYEmBo8HwP4xODjB3EgBPEsob
 DkmfDDOm/HLcdhdduq8gkBmrvmKBu5XYDK6wJjYqBzsYOvvYLUQWw6p0atf5Q2XX6hiMgNGL9
 oEETEckHVwA86DFTupAu0bsjmSnctD0+pyoBErX/FuDeHoN1PKMFDZCdYK/4cqPI8VtTcDZRy
 qXgZC+TViDRB2FmLYPBiItFTQ/DLWoy/5nK2g09ddAR1Ir2X4uPO37PuibMaDdM6P/LrNhOu3
 /Bg2z6d+aPSs0PqzuAAjVRTcEhxLz4bKes8mB96drtnLF71C9QpQtAR8bX5WarVw+EPOy5Q3V
 52EqCQN7Mg8UH3AT21n2Ee1MWMYRyJ888q9nH+aFcLn76zqj1a9nJNNp+Qu6Vhf6Ai8aLl8yF
 qOrCWvtY/cYGm5Re1q2T3LeGiypTTmYGQmiKkZkgEAynUKe4XXWyebjZXdoGYa6gZS0sF/pZf
 wdoYteaDMnt1u8DlA5J+OzeuBxOnV8caNi/gJtK5ZclYzktvBy7RKUHxJioAFvoyX5y7P7I05
 ep5OK+pBilJqOPjlPeOIMmjZJz+4PQZzjBQUNKdtVOIKhQLZeSldris8GArT7t4eByUpKaWzH
 38uKWnmAC2ORyqk1Z33Sguk2txkBWCTSJRtsfgsTTaQzX7i1d58BD3k39XquHywyH/rhXtUs9
 ISdPHFewSQ+8f8lCFL1+EUoxMXRGgp091xHy/EolFDejkG0pAeRV9seE+5C0lRpth4WWaIOG0
 5IDr3Z0sa5IOoiopjNH/HaEHG40dUtGUpoU50INr3i8c0odjzHHs6NXxv/UTRb8/lh2nESTJ9
 hrwhEUZxBkcOAd3cttO4ccnpDVJO4uYS+UPAX4EzlTmmI5t3CbXzznSpoLrQ++Gjju1sSFt8X
 49ud8SQxhCRRb1Ttitb+v2R1qflwzi9nM8cHBtUqWl14daCekxLnNz4kbF4sWNL7q82m3CSMs
 /Ci4fwcPJhHQaS5hABNFUtwQvcNsW1ijxnIuYwUHFosbX0jNQic/TShVIZIYkgREXUhqkIggz
 7hwr/kL66q2/kJFyoLKf+mNsVzccgEV3Th14UCVaGqjZVyTBO4/fryADCCL5hzkxi4/QTRflU
 XUxAmSwJkW1BfPyty4aICp8DEkB8tPM1ygkfAXA==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_075049_892195_A616AA15 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Wed, 26 Aug 2020 11:43:05 -0400
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vivien Didelot <vivien.didelot@gmail.com>,
 Julia Lawall <julia.lawall@lip6.fr>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

4oCmCj4gRml4IGEgcG90ZW50aWFsIG1lbW9yeSBsZWFrIGluIG10NzUzMC5jIGJ5IGluc2VydGlu
ZyBvZl9ub2RlX3B1dCgpCj4gYmVmb3JlIHRoZSBicmVhayBhbmQgcmV0dXJuIHN0YXRlbWVudHMu
Cj4KPiBJc3N1ZSBmb3VuZCB3aXRoIENvY2NpbmVsbGUuCgpXb3VsZCB5b3UgbGlrZSB0byBwb2lu
dCBhbnkgc3BlY2lmaWMgU21QTCBzY3JpcHQgb3V0IGZvciBzdWNoIGEgc291cmNlIGNvZGUgYW5h
bHlzaXM/CgrigKYKPiBDaGFuZ2VzIGluIHYzOgo+IAktIENvcnJlY3Qgc3ludGF4IGVycm9ycwo+
IAktIE1vZGlmeSBjb21taXQgbWVzc2FnZQo+Cj4gLS0tCj4KPiBTaWduZWQtb2ZmLWJ5OiDigKYK
CiogUGxlYXNlIGF2b2lkIGEgZHVwbGljYXRpb24gZm9yIHRoaXMgdGFnLgoKKiBUaGUgcGF0Y2gg
dmVyc2lvbiBkZXNjcmlwdGlvbnMgc2hvdWxkIGJlIHNwZWNpZmllZCBiZXNpZGVzIHRoZSBkaWZm
c3RhdC4KICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90
b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1w
YXRjaGVzLnJzdD9pZD1kMDEyYTcxOTBmYzFmZDcyZWQ0ODkxMWU3N2NhOTdiYTQ1MjFiY2NkI243
NTMKClJlZ2FyZHMsCk1hcmt1cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlawo=
