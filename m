Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0380FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 21:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sptHi0usXI7iL/qtScpe8pToswxhlBA9qQ9JJjRQ/UY=; b=lRdtX6YOPmq3Is
	oqPB68xmvzi6v+rS5q1LppErKICZp1fKQMtimvSc+tT4vU5ouoa/+q00qOLm20s4zq+S+EPgSG2vS
	cOBQgwRO/1JWYQPetg1rMhbh5GMrg1pefQBvzzu0EO9v05CxNV4nMw/m0gcuuazBqW/yuj8J78F02
	y/BE8+5VDlYkacZ3EMMYNUHj2FQNlCcIY8BK+LN2TjZYptOmgjAwKU3PL1WpyGs0VdBPkwqf0ZZre
	Bki7dTYSr5DkaM0Ytobdw3lpafrFjXlh1BNV+UaWTsHaIhpRObBUvtDpP1ZL9Ds6Bdl1qSZfVwsm5
	tnsnbDKkwhQn6csPvtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npFwK-00DUMo-SA; Thu, 12 May 2022 21:01:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npFrX-00DRO3-6b; Thu, 12 May 2022 20:56:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 521881F45AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652389002;
 bh=GrZDgZ5n77I8KtnjA2tOlTRA6mI8tLLdvbtiFZXUTG0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RU7yVXKMRydUYzQRyyhaqN22pMIXICErdzLysumVSWsTvVh2ykx91P6ya5K1xuOr4
 bnndX9h8DfFGC39p68a77R/glGAXwKjNVabl1xUHEWjIrwx19kB66OVmUUL2uAIbQ3
 lGU3pB6s4hlRlofDYaM3MYL2TuzSjKFJZc1Oke3ZkEpE3qveHSmOnNvPxO8Pj8iuhF
 h9reHCdOSEzjmHxQABet1e8eXIPOby31AH4CyaJlmIIaz3rQeYFmxSYnt0t6MjwXpX
 E48kMIRmvxooddEfnOf5R1TMuMRuKrvg1J4Qxq8e2VTFMT+AkUIOwTTbdGI0iihdbX
 J4l3W/In322LQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 13/16] arm64: dts: mediatek: asurada: Enable XHCI
Date: Thu, 12 May 2022 16:55:59 -0400
Message-Id: <20220512205602.158273-14-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512205602.158273-1-nfraprado@collabora.com>
References: <20220512205602.158273-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_135643_410381_5F11D5BB 
X-CRM114-Status: GOOD (  10.78  )
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

RW5hYmxlIFhIQ0kgY29udHJvbGxlciBvbiB0aGUgQXN1cmFkYSBwbGF0Zm9ybS4gVGhpcyBhbGxv
d3MgdGhlIHVzZSBvZgp0aGUgVVNCIHBvcnRzLCBhbmQgdGhlcmVmb3JlIGEgcm9vdGZzIGNhbiBi
ZSBsb2FkZWQgYW5kIGEgdXNhYmxlIHNoZWxsCnJlYWNoZWQgZnJvbSBhIGxpdmUgVVNCIGltYWdl
LgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xs
YWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5OiBDaGVuLVl1IFRz
YWkgPHdlbnN0QGNocm9taXVtLm9yZz4KCi0tLQoKKG5vIGNoYW5nZXMgc2luY2UgdjIpCgpDaGFu
Z2VzIGluIHYyOgotIEFkZGVkIHRoaXMgcGF0Y2gKCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlh
dGVrL210ODE5Mi1hc3VyYWRhLmR0c2kgfCA4ICsrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9t
dDgxOTItYXN1cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTIt
YXN1cmFkYS5kdHNpCmluZGV4IGQ5Yzk4NTIzMzlhOC4uZWNhZTI3MzA3ODllIDEwMDY0NAotLS0g
YS9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKKysrIGIv
YXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBAIC01ODMs
NSArNTgzLDEzIEBAICZ1YXJ0MCB7CiAJc3RhdHVzID0gIm9rYXkiOwogfTsKIAorJnhoY2kgewor
CXN0YXR1cyA9ICJva2F5IjsKKworCXdha2V1cC1zb3VyY2U7CisJdnVzYjMzLXN1cHBseSA9IDwm
cHAzMzAwX2c+OworCXZidXMtc3VwcGx5ID0gPCZwcDUwMDBfYT47Cit9OworCiAjaW5jbHVkZSA8
YXJtL2Nyb3MtZWMta2V5Ym9hcmQuZHRzaT4KICNpbmNsdWRlIDxhcm0vY3Jvcy1lYy1zYnMuZHRz
aT4KLS0gCjIuMzYuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
