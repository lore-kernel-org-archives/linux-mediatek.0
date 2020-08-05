Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC8BC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 11:30:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D30F022D04
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 11:30:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pvui3G1K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D30F022D04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sx9bKSM9mX/e9hZL0abPLo2pjAJ2eNHjOGY3VxZJydQ=; b=Pvui3G1Kez3mt4I7Hqcsb2dWD
	3nHxGCl7SxTCW0GnMqJOJAfpifNHmFYHYU1Q6uwCOzp/qckjRzoxHHkSp2Qus8hsT19G6NTP9XZ1n
	Ukd75ZnoAu805Shmeh18dMA6R7MSc/hK46GGBCSpUkIpyDQv06sWUhmfspW1oku3h7gSDbk176XdY
	ArZ+jJHpHXUQJsdJdLODX7Huw8szBqQH/4zpckCka0tCbV3rTxcCYiwr5yUL4JmMnOh40L4rbRU++
	3FjCkNXfcnYy8UMgWRgDcWuwlVIz4st4wKH3S1+zKocGRE5tPk+zoVrlW9TtgsY5GE1tsu9wkj711
	LWKaPAPXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Hcg-0002cN-Jh; Wed, 05 Aug 2020 11:30:18 +0000
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Hcc-0002bF-PC; Wed, 05 Aug 2020 11:30:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1k3Hcb-00BavX-Nw; Wed, 05 Aug 2020 12:30:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 2/3] arm: dts: mt7623: move MT7623N GPU to separate
 mt7623n.dtsi file
Date: Wed,  5 Aug 2020 12:30:12 +0100
Message-Id: <20200805113013.2763510-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200805113013.2763510-1-dwmw2@infradead.org>
References: <8ef96e4d02ef82e171409945ee6cc0348c4fe594.camel@infradead.org>
 <20200805113013.2763510-1-dwmw2@infradead.org>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Frank Wunderlich <linux@fw-web.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoZSBNVDc2MjNBIGRv
ZXNuJ3QgaGF2ZSBhIEdQVTsgYWRkIGl0IG9ubHkgZm9yIE1UNzYyM04gYm9hcmRzLgoKRml4ZXM6
IDFmNmVkMjI0NTk0ICgiYXJtOiBkdHM6IG10NzYyMzogYWRkIE1hbGktNDUwIGRldmljZSBub2Rl
IikKU2lnbmVkLW9mZi1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KLS0t
CiBhcmNoL2FybS9ib290L2R0cy9tdDc2MjMuZHRzaSAgICAgICAgICAgICAgICAgfCAyNCAtLS0t
LS0tLS0tLS0tCiBhcmNoL2FybS9ib290L2R0cy9tdDc2MjNuLWJhbmFuYXBpLWJwaS1yMi5kdHMg
fCAgMiArLQogYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi1yZmItZW1tYy5kdHMgICAgICAgIHwg
IDIgKy0KIGFyY2gvYXJtL2Jvb3QvZHRzL210NzYyM24uZHRzaSAgICAgICAgICAgICAgICB8IDM1
ICsrKysrKysrKysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwg
MjYgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vYm9vdC9kdHMvbXQ3
NjIzbi5kdHNpCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kgYi9h
cmNoL2FybS9ib290L2R0cy9tdDc2MjMuZHRzaQppbmRleCAzYTZiODU2ZTViNzQuLmRjZDJmNWJh
NGUyMCAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kKKysrIGIvYXJj
aC9hcm0vYm9vdC9kdHMvbXQ3NjIzLmR0c2kKQEAgLTczNCwzMCArNzM0LDYgQEAgZzNkc3lzOiBz
eXNjb25AMTMwMDAwMDAgewogCQkjcmVzZXQtY2VsbHMgPSA8MT47CiAJfTsKIAotCW1hbGk6IGdw
dUAxMzA0MDAwMCB7Ci0JCWNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ3NjIzLW1hbGkiLCAiYXJt
LG1hbGktNDUwIjsKLQkJcmVnID0gPDAgMHgxMzA0MDAwMCAwIDB4MzAwMDA+OwotCQlpbnRlcnJ1
cHRzID0gPEdJQ19TUEkgMTcwIElSUV9UWVBFX0xFVkVMX0xPVz4sCi0JCQkgICAgIDxHSUNfU1BJ
IDE3MSBJUlFfVFlQRV9MRVZFTF9MT1c+LAotCQkJICAgICA8R0lDX1NQSSAxNzIgSVJRX1RZUEVf
TEVWRUxfTE9XPiwKLQkJCSAgICAgPEdJQ19TUEkgMTczIElSUV9UWVBFX0xFVkVMX0xPVz4sCi0J
CQkgICAgIDxHSUNfU1BJIDE3NCBJUlFfVFlQRV9MRVZFTF9MT1c+LAotCQkJICAgICA8R0lDX1NQ
SSAxNzUgSVJRX1RZUEVfTEVWRUxfTE9XPiwKLQkJCSAgICAgPEdJQ19TUEkgMTc2IElSUV9UWVBF
X0xFVkVMX0xPVz4sCi0JCQkgICAgIDxHSUNfU1BJIDE3NyBJUlFfVFlQRV9MRVZFTF9MT1c+LAot
CQkJICAgICA8R0lDX1NQSSAxNzggSVJRX1RZUEVfTEVWRUxfTE9XPiwKLQkJCSAgICAgPEdJQ19T
UEkgMTc5IElSUV9UWVBFX0xFVkVMX0xPVz4sCi0JCQkgICAgIDxHSUNfU1BJIDE4MCBJUlFfVFlQ
RV9MRVZFTF9MT1c+OwotCQlpbnRlcnJ1cHQtbmFtZXMgPSAiZ3AiLCAiZ3BtbXUiLCAicHAwIiwg
InBwbW11MCIsICJwcDEiLAotCQkJCSAgInBwbW11MSIsICJwcDIiLCAicHBtbXUyIiwgInBwMyIs
ICJwcG1tdTMiLAotCQkJCSAgInBwIjsKLQkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX01N
UExMPiwKLQkJCSA8JmczZHN5cyBDTEtfRzNEU1lTX0NPUkU+OwotCQljbG9jay1uYW1lcyA9ICJi
dXMiLCAiY29yZSI7Ci0JCXBvd2VyLWRvbWFpbnMgPSA8JnNjcHN5cyBNVDI3MDFfUE9XRVJfRE9N
QUlOX01GRz47Ci0JCXJlc2V0cyA9IDwmZzNkc3lzIE1UMjcwMV9HM0RTWVNfQ09SRV9SU1Q+Owot
CX07Ci0KIAltbXN5czogc3lzY29uQDE0MDAwMDAwIHsKIAkJY29tcGF0aWJsZSA9ICJtZWRpYXRl
ayxtdDc2MjMtbW1zeXMiLAogCQkJICAgICAibWVkaWF0ZWssbXQyNzAxLW1tc3lzIiwKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyM24tYmFuYW5hcGktYnBpLXIyLmR0cyBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL210NzYyM24tYmFuYW5hcGktYnBpLXIyLmR0cwppbmRleCAyYjc2MGY5
MGYzOGMuLjM0NGY4YzY1YzRhYSAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIz
bi1iYW5hbmFwaS1icGktcjIuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyM24tYmFu
YW5hcGktYnBpLXIyLmR0cwpAQCAtNiw3ICs2LDcgQEAKIAogL2R0cy12MS87CiAjaW5jbHVkZSA8
ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQuaD4KLSNpbmNsdWRlICJtdDc2MjMuZHRzaSIKKyNpbmNs
dWRlICJtdDc2MjNuLmR0c2kiCiAjaW5jbHVkZSAibXQ2MzIzLmR0c2kiCiAKIC8gewpkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi1yZmItZW1tYy5kdHMgYi9hcmNoL2FybS9i
b290L2R0cy9tdDc2MjNuLXJmYi1lbW1jLmR0cwppbmRleCAwNDQ3NzQ4ZjlmYTAuLmY4ZWZjYzM2
NGJjMyAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi1yZmItZW1tYy5kdHMK
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbXQ3NjIzbi1yZmItZW1tYy5kdHMKQEAgLTcsNyArNyw3
IEBACiAKIC9kdHMtdjEvOwogI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lucHV0L2lucHV0Lmg+Ci0j
aW5jbHVkZSAibXQ3NjIzLmR0c2kiCisjaW5jbHVkZSAibXQ3NjIzbi5kdHNpIgogI2luY2x1ZGUg
Im10NjMyMy5kdHNpIgogCiAvIHsKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYy
M24uZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyM24uZHRzaQpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjc3MjRhNGQwNWI4OQotLS0gL2Rldi9udWxsCisrKyBi
L2FyY2gvYXJtL2Jvb3QvZHRzL210NzYyM24uZHRzaQpAQCAtMCwwICsxLDM1IEBACisvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorLyoKKyAqIENvcHlyaWdodCDCqSAyMDE3LTIw
MjAgTWVkaWFUZWsgSW5jLgorICogQXV0aG9yOiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRl
ay5jb20+CisgKgkgICBSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+CisgKgorICov
CisKKyNpbmNsdWRlICJtdDc2MjMuZHRzaSIKKworLyB7CisJbWFsaTogZ3B1QDEzMDQwMDAwIHsK
KwkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDc2MjMtbWFsaSIsICJhcm0sbWFsaS00NTAiOwor
CQlyZWcgPSA8MCAweDEzMDQwMDAwIDAgMHgzMDAwMD47CisJCWludGVycnVwdHMgPSA8R0lDX1NQ
SSAxNzAgSVJRX1RZUEVfTEVWRUxfTE9XPiwKKwkJCSAgICAgPEdJQ19TUEkgMTcxIElSUV9UWVBF
X0xFVkVMX0xPVz4sCisJCQkgICAgIDxHSUNfU1BJIDE3MiBJUlFfVFlQRV9MRVZFTF9MT1c+LAor
CQkJICAgICA8R0lDX1NQSSAxNzMgSVJRX1RZUEVfTEVWRUxfTE9XPiwKKwkJCSAgICAgPEdJQ19T
UEkgMTc0IElSUV9UWVBFX0xFVkVMX0xPVz4sCisJCQkgICAgIDxHSUNfU1BJIDE3NSBJUlFfVFlQ
RV9MRVZFTF9MT1c+LAorCQkJICAgICA8R0lDX1NQSSAxNzYgSVJRX1RZUEVfTEVWRUxfTE9XPiwK
KwkJCSAgICAgPEdJQ19TUEkgMTc3IElSUV9UWVBFX0xFVkVMX0xPVz4sCisJCQkgICAgIDxHSUNf
U1BJIDE3OCBJUlFfVFlQRV9MRVZFTF9MT1c+LAorCQkJICAgICA8R0lDX1NQSSAxNzkgSVJRX1RZ
UEVfTEVWRUxfTE9XPiwKKwkJCSAgICAgPEdJQ19TUEkgMTgwIElSUV9UWVBFX0xFVkVMX0xPVz47
CisJCWludGVycnVwdC1uYW1lcyA9ICJncCIsICJncG1tdSIsICJwcDAiLCAicHBtbXUwIiwgInBw
MSIsCisJCQkJICAicHBtbXUxIiwgInBwMiIsICJwcG1tdTIiLCAicHAzIiwgInBwbW11MyIsCisJ
CQkJICAicHAiOworCQljbG9ja3MgPSA8JnRvcGNrZ2VuIENMS19UT1BfTU1QTEw+LAorCQkJIDwm
ZzNkc3lzIENMS19HM0RTWVNfQ09SRT47CisJCWNsb2NrLW5hbWVzID0gImJ1cyIsICJjb3JlIjsK
KwkJcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UMjcwMV9QT1dFUl9ET01BSU5fTUZHPjsKKwkJ
cmVzZXRzID0gPCZnM2RzeXMgTVQyNzAxX0czRFNZU19DT1JFX1JTVD47CisJfTsKK307Ci0tIAoy
LjI2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
