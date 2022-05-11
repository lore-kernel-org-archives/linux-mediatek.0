Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA03DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 May 2022 19:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oObISJWHQH6zXIKtGotDMqam9N7QMqgHdOVAsdOqPDI=; b=rmlzMJGQR51X4H
	oJ7W95TlActf843YrjcLSwRydvBfKMJfVYp+2eQFR5c89Bve7ENy+9cXeGiJnpkRvcX5W6cO9YxsO
	UdXbW0/6y89dnie6S/zchEwz3he5KIB9yFBKhChyzhRPknMquehDfYOWU+2oimRk9PY3sj5K+2Amo
	RF8EMmWKbwUtNllD0g8/jFSZHOho7+3V2R6aNt38IHMuhgxaE2UczHI/ygSh7DQEi+qIMS+5BjwYL
	yP+7WxwMfMtzWCUKB+frkaRGN/SG8TUdcoBAJdE6pAZ7nxjwpn0d6YTXCGTUtLbq19CE15e8ujtxq
	UTNzCrZpUb0pHhtI7V+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nosQc-008Pv6-BE; Wed, 11 May 2022 19:55:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nosQI-008PoE-SG; Wed, 11 May 2022 19:55:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id F06951F42CF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652298897;
 bh=mb8FI9cn+BTWOJjO46oabe4cMLSOl4wn8hXjvFvCuoc=;
 h=From:To:Cc:Subject:Date:From;
 b=dpQiAjZI6Jhhxfs09HDMi10UTpbhdgj5qfUkzPgXjjmC7MFCoRAkXh2kPf8Zj/b6n
 a31L8+kgqyxzLRD2bCYy1OcJv7Xh50hv++mdnTyw+xaxVCcjwvSq37pBLJhzNuJ7zp
 k8XTHxEU/cPaEhoMXKQTkDl+FkDPjVMgyCBA5HJLq2VQr2UlfS/pmTkE6U1Q/t0XdC
 rvdJV/8mEr7YgwsBJDPdQE+Lbaj+wFTdrOWFrfm7YiVivvmtDv/wgAnfiDQ7lg0pwF
 thV44tjSbn8ZL6xGxPObQWwaig4gYkbUK5SwTP2Xs9pWcvs5UWS9lG4KSYBN2rLw73
 9IwJ0Y27HprkA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH v5 0/2] Mediatek SCP dt-binding tweaks
Date: Wed, 11 May 2022 15:54:50 -0400
Message-Id: <20220511195452.871897-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_125503_088373_43934AE9 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

ClR3byBzaW1wbGUgcGF0Y2hlcyBmb3IgdGhlIE1lZGlhdGVrIFNDUCBkdC1iaW5kaW5nLiBUaGUg
Zmlyc3QgZml4ZXMgdGhlCnJlZy9yZWctbmFtZXMgcHJvcGVydHkgd2hpbGUgdGhlIHNlY29uZCBh
ZGRzIGEgbmV3IG9wdGlvbmFsCm1lbW9yeS1yZWdpb24gcHJvcGVydHkuCgp2NDogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTA2MjEzMjI2LjI1Nzg1OS0xLW5mcmFwcmFkb0Bjb2xs
YWJvcmEuY29tCnYzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA1MDMyMTExMTQu
MjY1NjA5OS0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tCnYyOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMjA1MDIxOTI0MjAuMjU0ODUxMi0xLW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
CnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjA0MjkyMTExMTEuMjIxNDExOS0x
LW5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tCgpDaGFuZ2VzIGluIHY1OgotIE1hZGUgbDF0Y20gb3B0
aW9uYWwgZm9yIG10ODE5Mi9tdDgxOTUKLSBHcmVhdGx5IHNpbXBsaWZpZWQgdGhlIGNvbnN0cmFp
bnRzIG92ZXJyaWRlIGluIHRoZSBpZjp0aGVuOgoKQ2hhbmdlcyBpbiB2NDoKLSBSZXdvcmtlZCBw
cmVzZW5jZSBvZiBsMXRjbSByZWcgdG8gYmUgaWY6dGhlbjogYmFzZWQgYW5kIHByZXNlbnQgb25s
eQogIG9uIG10ODE5Mi9tdDgxOTUKCkNoYW5nZXMgaW4gdjM6Ci0gTWFkZSB0aGUgY2ZnIHJlZyBy
ZXF1aXJlZCBhZ2Fpbi4gQWZ0ZXIgbG9va2luZyBhZ2FpbiBpbnRvIHRoZSBtdGstc2NwCiAgZHJp
dmVyLCBvbmx5IGwxdGNtIGlzIG9wdGlvbmFsLgoKQ2hhbmdlcyBpbiB2MjoKLSBEcm9wcGVkIHR5
cGUgYW5kIGRlc2NyaXB0aW9uIGZyb20gbWVtb3J5LXJlZ2lvbiBzaW5jZSBpdCdzIGEKICB3ZWxs
LWtub3duIHByb3BlcnR5Ci0gU2V0IG1lbW9yeS1yZWdpb24gbWF4SXRlbXMgdG8gMQoKTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gKDIpOgogIGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRl
azogTWFrZSBsMXRjbSByZWcgZXhjbHVzaXZlIHRvIG10ODE5eAogIGR0LWJpbmRpbmdzOiByZW1v
dGVwcm9jOiBtZWRpYXRlazogQWRkIG9wdGlvbmFsIG1lbW9yeS1yZWdpb24gdG8KICAgIG10ayxz
Y3AKCiAuLi4vYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgICAgICAgICAgfCA0NyAr
KysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMTQg
ZGVsZXRpb25zKC0pCgotLSAKMi4zNi4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
