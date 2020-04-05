Return-Path: <SRS0=YyAn=5V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7F6C2BA15
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 15:36:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B100F20659
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Apr 2020 15:36:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KVkUIqCW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="sJHbBQms"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B100F20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pmbuX2Ib/tS5MH1THMKKShi2zNbB0ZWRNtgXRO1mjKo=; b=KVkUIqCW6a5LUF
	KzGwMPFQNukpXEDi9Le5BN8FyC8LaOjnm4Vq2pCZkGkxDlco7kJsOludEy7GWwJzyEiPPD7z91Ki+
	caFVhmwNcUYo1+B+EoJlBec7+o5s011upIQ/4c9SXZsbNlkGrwOEZnaBloYBfA8QxjFr/h6ePgi6S
	Lg9MmydITIrPpUzcaQWV7W18Sj/WrNysI7nYVmhB3cky9zHfk+YoeokEz8MstNZLyN6e/z+v2h8W4
	YuDDFsWuLUD/v2H3OxiLuabdZqUU1ZTRanJ7ok0LJn5TwIogtTJvL8IlP+wrvv08wy591fa2EmdQ5
	R7OfgW/Yf5ROK4wFPvAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jL7KI-0007j1-1d; Sun, 05 Apr 2020 15:36:46 +0000
Received: from mout.web.de ([212.227.17.11])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jL7KF-0007ia-Mc; Sun, 05 Apr 2020 15:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1586100978;
 bh=tnYDeiuDrcRk0nlPNPGkbd2yv/Uu1XjW1jGNeoaglWg=;
 h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
 b=sJHbBQmslULtjvmcd7PHQdC2tBb0NYq7WQjJH9N9pOqVcoLPp+AX/c85elklTWPEG
 aItGPWfGemVpvXJ1/qPY+BRmVh4LgwuxAFTcMKS/aU7Z44wa401mBsYtFT33s7p/0n
 k4hOjIuy6rLmYWLsDPJASng8JgOL8k/81R3rkE4E=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([93.131.99.70]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LkPjj-1ijqYr2hzf-00cU19; Sun, 05
 Apr 2020 17:36:18 +0200
To: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Vladimir Zapolskiy <vz@mleia.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] rtc: Delete an error message in three functions
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <04116352-b464-041c-1939-96440133aa6f@web.de>
Date: Sun, 5 Apr 2020 17:36:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:8+/Dc59/ZQ9+ftEfpC3i/0o/mPSYrEeU22u2c6J0lKMOGgj7M27
 xGQQMzqGeVrc7EFFUgwLSLjJZiyGFZ1ONGhSzOSNqClTcF/6Ka5qQyBp4vDtj9xoyM9/W4C
 5N8LN+TKjhgKzvLi5AR/m3uPV4eqI1AEmzq3W9Y7J7iplIsSb41ZO04Tinu1vwu8Wa1fXOj
 euXLTnhOf446ZHlS/lLrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5BtEuP3ErMc=:Fh4okuSnNC5D+zfo6Znivn
 3TLmQdF8XJzaa1V6MArixv9kPF2bf1E9JGcJt9sxPaPX4KoVU18S9Q76t4sOHp4v0eUK5767S
 b5KA+QSsz7QNprTJmHTRBX4F6LKx+nEDwjPP6NmAqPGSgmUjNAJedy5wE+Fp08MR85VpjaaYL
 kIW1IbsnEee6kFDpDrCEls4gxLVMZy0YiKTDf7rRWlpYMWWhx/W+f8rQzV4voDn3eWxqfAjEk
 Ko3mbHs+iPtxaNJpQbXdaD9ymY4c5yR7ZAj1lnZMaR423E/pNok4POesKdF25xI5MyveHLhi3
 PRpfhLysiH7W10EcHGuF0nf0uOlqzjZW24aeNRmkyrllreNBBIuDJ6yX/zdSUWY2EC2nbuj/6
 ClcvRqxeCZ9ThC5REh4CMzQ75YKLcHzh1CMLSLTim+TyOUUMU8MiNOJ5xj6D7MMIhGVvx790a
 TxApeRk10UoxFlXJvNA2UHf3SP+a8S1CYi1ooLvNROm3+CYqqeJm/q12bB/lTnhmX3wsk+1DM
 AuVhcHwgKBCNTwfZ1p/7SBeHf4+1yZqnX1pn7InzvxsM9NPCErXZhehH6x5P0dG7aQ7pyieQx
 30vNUjnxPabHCLGoOEEBwIvsH4KaxAPIdbAbG2z3UJbgzz4vvanwZ+hhcuACfriATMOjFuW5Y
 rgtNfj4BHYNMv2kYRLyDE2XyzDh5vlq1exCIzHCAZRZPnRB9QQAhIcBXqRqohbV4LE9qzdiOR
 j1IprXh6+lNiRvCjVc3KejkWXsZe75ljjj6dVXLkVEOxC9iwxgUggQMzLiZeX9BZIxl061lnC
 /TjTXhfu6TMk3hFyhcAh+kV/Gbh1RXi4z224ueq5hZyBuFKMXkxDp2L4sFBImRSGTtqp4OHqn
 4R43dy1rwxeM96rBPZ+IzLYLrm0GG1yK3eV1OCPvA88WviOAueyKbEK4XqVBfHqH1Pixwhs36
 U1sK74WbEOTpEVzgvBdcWjRPXBmZD0GidH0iD3Mxc45YGc/vtqLCsAWaz6zTV8jY7dF2FZ+Uc
 jmf9sT4Yy/2zszLKhMEyPz7U4pLJl3MN3cavs3kerN1xUKheqx8NjgmuDX0bLkccyPmvyu8Jf
 XOySu9rXtxrBtKqid/mn6snxZwdtQyHESzUYcQ2hdj3oNly+r0kUVjV5hRP+FIzbYruzVKmIf
 oyBeAgLodBqcslOWVF1tZ98IvGa4hPhzXW9VvYdifbWkMnlmJ629y6VejpnT19PMbpKQEi3FQ
 WisU3HbEfVjK+e+8c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_083644_031129_BA6340BB 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Tang Bin <tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBTdW4sIDUgQXByIDIwMjAgMTc6MzA6MTUgKzAyMDAKClRoZSBmdW5jdGlvbiDigJxwbGF0Zm9y
bV9nZXRfaXJx4oCdIGNhbiBsb2cgYW4gZXJyb3IgYWxyZWFkeS4KVGh1cyBvbWl0IHJlZHVuZGFu
dCBtZXNzYWdlcyBmb3IgdGhlIGV4Y2VwdGlvbiBoYW5kbGluZyBpbiB0aGUKY2FsbGluZyBmdW5j
dGlvbnMuCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUgQ29jY2luZWxsZSBz
b2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZyaW5nQHVzZXJzLnNv
dXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL3J0Yy9ydGMtZnNsLWZ0bS1hbGFybS5jIHwgNCAr
LS0tCiBkcml2ZXJzL3J0Yy9ydGMtbHBjMjR4eC5jICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3J0
Yy9ydGMtbXQyNzEyLmMgICAgICAgIHwgNCArLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtZnNs
LWZ0bS1hbGFybS5jIGIvZHJpdmVycy9ydGMvcnRjLWZzbC1mdG0tYWxhcm0uYwppbmRleCA3NTZh
ZjYyYjA0ODYuLjIzYzgxMWRhNDgwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ydGMvcnRjLWZzbC1m
dG0tYWxhcm0uYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtZnNsLWZ0bS1hbGFybS5jCkBAIC0yNjgs
MTAgKzI2OCw4IEBAIHN0YXRpYyBpbnQgZnRtX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQogCX0KCiAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlpZiAo
aXJxIDwgMCkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJjYW4ndCBnZXQgaXJxIG51bWJlclxu
Iik7CisJaWYgKGlycSA8IDApCiAJCXJldHVybiBpcnE7Ci0JfQoKIAlyZXQgPSBkZXZtX3JlcXVl
c3RfaXJxKCZwZGV2LT5kZXYsIGlycSwgZnRtX3J0Y19hbGFybV9pbnRlcnJ1cHQsCiAJCQkgICAg
ICAgSVJRRl9OT19TVVNQRU5ELCBkZXZfbmFtZSgmcGRldi0+ZGV2KSwgcnRjKTsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcnRjL3J0Yy1scGMyNHh4LmMgYi9kcml2ZXJzL3J0Yy9ydGMtbHBjMjR4eC5j
CmluZGV4IDAwZWYxNmJhOTQ4MC4uZWVjODgxYTgxMDY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3J0
Yy9ydGMtbHBjMjR4eC5jCisrKyBiL2RyaXZlcnMvcnRjL3J0Yy1scGMyNHh4LmMKQEAgLTIwNSwx
MCArMjA1LDggQEAgc3RhdGljIGludCBscGMyNHh4X3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gUFRSX0VSUihydGMtPnJ0Y19iYXNlKTsKCiAJaXJxID0g
cGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlpZiAoaXJxIDwgMCkgewotCQlkZXZfd2Fybigm
cGRldi0+ZGV2LCAiY2FuJ3QgZ2V0IGludGVycnVwdCByZXNvdXJjZVxuIik7CisJaWYgKGlycSA8
IDApCiAJCXJldHVybiBpcnE7Ci0JfQoKIAlydGMtPmNsa19ydGMgPSBkZXZtX2Nsa19nZXQoJnBk
ZXYtPmRldiwgInJ0YyIpOwogCWlmIChJU19FUlIocnRjLT5jbGtfcnRjKSkgewpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jIGIvZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jCmlu
ZGV4IDU4MWI4NzMxZmI4YS4uZjZiZGJhYmQ3MjAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3J0Yy9y
dGMtbXQyNzEyLmMKKysrIGIvZHJpdmVycy9ydGMvcnRjLW10MjcxMi5jCkBAIC0zMjgsMTAgKzMy
OCw4IEBAIHN0YXRpYyBpbnQgbXQyNzEyX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCW10MjcxMl9ydGNfaHdfaW5pdChtdDI3MTJfcnRjKTsKCiAJbXQyNzEyX3J0Yy0+
aXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKLQlpZiAobXQyNzEyX3J0Yy0+aXJxIDwg
MCkgewotCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJObyBJUlEgcmVzb3VyY2VcbiIpOworCWlmICht
dDI3MTJfcnRjLT5pcnEgPCAwKQogCQlyZXR1cm4gbXQyNzEyX3J0Yy0+aXJxOwotCX0KCiAJcGxh
dGZvcm1fc2V0X2RydmRhdGEocGRldiwgbXQyNzEyX3J0Yyk7CgotLQoyLjI2LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
