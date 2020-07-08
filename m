Return-Path: <SRS0=VCtr=AT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091A7C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 15:56:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD233206F6
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jul 2020 15:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hNxptc83";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LKNggCJk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Ps0evOh+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD233206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qbqCPz4vQ/S3pe+qjfeYRzuQWYxEayavbzEBEoiGO7Y=; b=hNxptc83k/7dQL1MeJsdHZtrcL
	Erg7ykUVij8aq2grMXTb9VVnBUbOKzHpjf6FJUAR4A7U/weFatrmVq/sU9G1JaqVNVFes6YN+9PFH
	D0K9yZ5i7sKLWlu4cRjYNsuYlm+USCRX2CfX2PYEQXUErvifD+dRm+JJFCL37WHq1/Ad3Xy55Q7Qw
	rPPpHAofKIoBszMQ7nX678XDflYriPqi/vMo+OsXsMmxqPx+/5uzTbyyAZbR9CkxSKLCKLkRGnonD
	wobWEjhRVnZ9HUtvjrgEo4HArwrFq+LiOK61qSUgjFLd92uHXRWq2cLxEHlXHB6LmXJm21QJlvCzf
	aakL/wZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtCQe-0003iW-Gy; Wed, 08 Jul 2020 15:56:12 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCQb-0003ho-NS; Wed, 08 Jul 2020 15:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=mKHv/or799BB7Al1f1LxDwGNKUkeVNiB9yl7fOjGcLQ=; b=LKNggCJkzj8Af7oC68y2VNgze8
 3K5Is266PJ+Fg/QW5irfGAE8dtmRrBerLeJBtZGFR+oVAQXlvmsYbhORSZFTGYUHyylcP4nnwa7Ee
 6Ey5vOmDB3NP3kcHQc6AYfvL+yArIZN31HpxYY0e6coSLRH4gc77Py4rpj3+CgUiVP4mqh7V87YW3
 Xl62aByYnT6XKMZGGsDksaWw9WuCkRgr9d7TXhEfWNI1ffw2k+6tvT2o0qq1BTgA+5UfO261+N3/9
 UVf36NFCnBfVJTeQhlPRSz2PIzmt5m3ima4cpljE89LMx4j5gnEkqPSf9cxe42oJ4tsmiD0y/Nb7M
 R3WSeMMg==;
Received: from mout.gmx.net ([212.227.17.21])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtCNz-0003Yv-HG; Wed, 08 Jul 2020 15:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1594223565;
 bh=LU0N738Cta16L6YXG8KR0rGDYWQO7GyOF1FHDDiJg24=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=Ps0evOh+3vgWWrtKWtW+WklwvqjznvnOFsMYekWW+LevoqDtUzMhiiVELzNE3AQaX
 h9YnBwKrpZqq2t+BhB5JMeOF8vI5Q1DiPPGPFOzLe0jYW9Cj0bq4bG93YlVHHte3CI
 7heVsggp8/Rm7LoN8wwvfFxqUy38UoXEU+GDi5Js=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.213.58]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MyKDU-1kpIgO2BeG-00yiQp; Wed, 08 Jul 2020 17:46:48 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] net: ethernet: mtk_eth_soc: fix mtu warning
Date: Wed,  8 Jul 2020 17:46:34 +0200
Message-Id: <20200708154634.9565-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:f4eGLoM7b59LlVnF7QAav5q/YJIcx9clM2yM7+NqTv9tBkejQqs
 au1gdA7QoPd0PPprJTzRKzybOTMmD14heF0qGnjwaABpo+XISVHKv5rw99O2S0ojFe9uDQL
 Qxu2lOqi+kzvKyOBpfLYcfelq6iI7x0aHD2bo1rK4OYlfxeRe2f4NPCAwZXbWjcYfAUryJJ
 xAsnWzoMdvXQ0LmII42Zg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZmyyK6eqHY8=:csok2Xzh8ggD5aZNZ73UfB
 DkkOZygeFw2Ido9ju+oB+btCZ3KhUX0fvvegNilUPDhpmHsrW7m0oHyLhb9+yRTLMUiK+fEoM
 1sG9A0xYyxFQqG4r4AySuOH7Uj7LEof6BauO8r/zTkBuPIKhZnUfQxagiiXy3xlVTgnQ+3r54
 umHs5APgb7IQpxc5sLL2DRs5Gs6fGTTuBuy1xtOyjI07guysiaDgVNVZscZDhpLP5AHrFnq29
 oAaSi2FcCO+8VcWj3qeDBUjTSmkgN61qB64xyIC4gyqgxTIufVyBVzy21TmRFEKgvzj+HBScV
 6ichRv228hyh55PL4yq7An78ol2/OMP+l8iGu1DZaATXNMNNzGD5Nz1Mix40LSHnPNLjVGlx6
 9O3WUbnMljfHDmYsxhK5AW/zMnmRG9JYXplaQSJdT8LhDxnZu9Inwr/Rjh7mLMRIM2/R7D9ai
 dZcXLHKM3rOByJitz9VrbWJ/GzeCkQD4XG60nMenvhWfQRaSPFnagDn2s3OpeIDnu8lP2rgLf
 R13rUMx6x3bA6hD/qkKDKcXHnsK3xs9WwGVmepYcSkNa/s9e1tPvSBB9jouDKItjyi/xXaZxS
 AYjK/TQqGu9sEU2RYsXtxglyZjGAw9YhU4SqlU3tDQAMN3fLTRt0E6yGgFBLBuQYWmcWg3pZJ
 PEwSmjeFcjJeu6G7Z+CwVgcIxCCf0JUH4ygUgkNbjSnLH8XMNoP29gqUHtFzsF32nB2UDJdxT
 jwcrxs7y8xu8NAsnZKKe0yJXbDpz0a64ZYS81NbgIqG4EZTlNsh9pFDQXJnCePZPlUzfNdKVF
 0j8WNKuBWlGBbKms2BgaQvo0PQ7x4/r3E4/aZoVVaTp/qNgl1qMB/S3NRoWyNtySDME+X8U9m
 4UR+3MbVqOj8Bal3leeW8kJHyTjzIpWRI6ul7tUPGbnEwLomvxsR5PQmgevFlhrm8FZWa1IVp
 ZFMcu3taA2vwhjWOjHaZi2rF/dnITgZ7i7fz3sh28Qr3gid+/NdIO7/GJIeTUS8E1A2/PHBMY
 MRZrScmfm/QyAklVAjwx0pPLLSwGoHo7I+fWlccQybB7G4h/Z0I2V04U41BJyz8G7pG1Iz3NZ
 IpcN289V5nmvnx/YMikwwa+bKf5TjDja4yVYOfOEtn+ZjcAnktmIOlpVK4aUmZsb//SBk23Go
 LA/nvKAC7yIi/AvanJUoUIzF9ODfsb214cYsLqbqqDbjl5m63o42RC+0ez4d4eiDXPITPLP9O
 U1ylozikemylFp0wXQ2WAFclgxOXapiETt4O54FHaPFaQwkQxBqd4+MqxC49AGQWoto0p4FVe
 jaIIEXPt+pzMyEq34QSUGRMqHNifIxph9dw3jMLAKK/dfmKL4c5HJhfC68QUOF2qmGG4X+7H+
 kfJM8c+FcUteWVq4rNhdRwA/xDHW7+NaSWwL7CY+ZUGkUEhvY8Co8YAe1qca23OahjZvI2GZL
 meOFVzGh6RR4huFDtNzrQS2jO1NV3ztDMpmqJ9N8jgXYvIEC0LyzuL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_165330_711586_AFBDFD2C 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogUmVuw6kgdmFuIERvcnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+CgppbiByZWNlbnQg
S2VybmVsLVZlcnNpb25zIHRoZXJlIGFyZSB3YXJuaW5ncyBhYm91dCBpbmNvcnJlY3QgTVRVLVNp
emUKbGlrZSB0aGVzZToKCm10NzUzMCBtZGlvLWJ1czowMDogbm9uZmF0YWwgZXJyb3IgLTk1IHNl
dHRpbmcgTVRVIG9uIHBvcnQgeApldGgwOiBtdHUgZ3JlYXRlciB0aGFuIGRldmljZSBtYXhpbXVt
Cm10a19zb2NfZXRoIDFiMTAwMDAwLmV0aGVybmV0IGV0aDA6IGVycm9yIC0yMiBzZXR0aW5nIE1U
VSB0byBpbmNsdWRlIERTQSBvdmVyaGVhZAoKU2lnbmVkLW9mZi1ieTogUmVuw6kgdmFuIERvcnN0
IDxvcGVuc291cmNlQHZkb3JzdC5jb20+ClNpZ25lZC1vZmYtYnk6IEZyYW5rIFd1bmRlcmxpY2gg
PGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgoKRml4ZXM6IGJmY2I4MTMyMDMgKCJuZXQ6IGRzYTog
Y29uZmlndXJlIHRoZSBNVFUgZm9yIHN3aXRjaCBwb3J0cyIpCkZpeGVzOiA3MjU3OWUxNGExICgi
bmV0OiBkc2E6IGRvbid0IGZhaWwgdG8gcHJvYmUgaWYgd2UgY291bGRuJ3Qgc2V0IHRoZSBNVFUi
KQpGaXhlczogN2E0YzUzYmVlMyAoIm5ldDogcmVwb3J0IGludmFsaWQgbXR1IHZhbHVlIHZpYSBu
ZXRsaW5rIGV4dGFjayIpCi0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0
aF9zb2MuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMgYi9kcml2
ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jCmluZGV4IDg1NzM1ZDMyZWNi
MC4uMDBlM2Q3MGY3ZDA3IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRl
ay9tdGtfZXRoX3NvYy5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19l
dGhfc29jLmMKQEAgLTI4OTEsNiArMjg5MSwxMCBAQCBzdGF0aWMgaW50IG10a19hZGRfbWFjKHN0
cnVjdCBtdGtfZXRoICpldGgsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiAJZXRoLT5uZXRkZXZb
aWRdLT5pcnEgPSBldGgtPmlycVswXTsKIAlldGgtPm5ldGRldltpZF0tPmRldi5vZl9ub2RlID0g
bnA7CgorCWV0aC0+bmV0ZGV2W2lkXS0+bXR1ID0gMTUzNjsKKwlldGgtPm5ldGRldltpZF0tPm1p
bl9tdHUgPSBFVEhfTUlOX01UVTsKKwlldGgtPm5ldGRldltpZF0tPm1heF9tdHUgPSAxNTM2Owor
CiAJcmV0dXJuIDA7CgogZnJlZV9uZXRkZXY6Ci0tCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
