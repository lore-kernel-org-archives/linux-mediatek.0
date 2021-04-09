Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30B2C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 22:55:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD23610F9
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 22:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD23610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c4cBoQnKFLX3KtKIexUUsC5A4Uz0XxMZhXTPes855v8=; b=dQBw/LTlog0cKmm8KES++znRD9
	iMoSSLnxdHsxO5x2b25z8vrvg6fhvCfEe/g2AvlojQzzP5DEDDB5FcEXeWUEKJQaoT8qBZ2IicO7r
	RzkA5cXyaIvnIjn+AHKtZdQR3TGeluALUPFcGwfR7op/GMiIfPgDp6NfwgwcBdNSOAmDC3nR+6DAk
	AjfjFh+H9KZpvyG+Y0q+CbInWn40XnXGkxLfEA6M3yTiCqokEBTikwizz26I4hIYCEfcnzR5Szpv1
	eIHtrpwyjwYz+ig6vt2ui8E95Hyh6YusumVWWVgjWamFismVn/ayK7WnPBLB6fwrragjRqBg4PaCp
	pg/9o9CA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV01f-001fE0-Tv; Fri, 09 Apr 2021 22:54:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV01U-001fC1-N6
 for linux-mediatek@desiato.infradead.org; Fri, 09 Apr 2021 22:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gcbDGkUdDnJOBYT7ozbn4FoVr2Zh2eTcQINGngwB6vM=; b=CDlF5hvduPZRX+D/R2tSzB/Yog
 Rhnvs9JG7UB3aEQ81qkJDSmqLDELNxoDTxkcD2I4Dl9XA9T5qHNNTDvLqqDDVqVrU7uBApRPwmPwK
 TPNx7ERkc53FmjlY/MGBJBMK7c0W2VSHFJzCfiMLTHP6oqQ2fXL0k1rx7c96I6BA+/Q8/r1PZRhJJ
 zLRm1Uhds6tgm+oE8isaHAVlpZBv+rNaVPmiZrucuiYM/td08s8MmyXphHR8qY/Svta8HMxrJO5bG
 +McyX2WHkwA/1Cmaudth5Rvn6RZ0Rx6uMmmkmBSPQWbffSQuaNtT0ZLzdvTBhVPzNFgP/vrfEyef+
 WhS0QRRw==;
Received: from mx.i2x.nl ([2a04:52c0:101:921::25])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lV01Q-004qMJ-IX
 for linux-mediatek@lists.infradead.org; Fri, 09 Apr 2021 22:54:42 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.i2x.nl (Postfix) with ESMTPS id 09BBF5FC67;
 Sat, 10 Apr 2021 00:54:35 +0200 (CEST)
Authentication-Results: mx.i2x.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="RoJrOTA2"; 
 dkim-atps=neutral
Received: from pc-rene.vdorst.com (pc-rene.vdorst.com [192.168.2.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id BCBB1BC6B76;
 Sat, 10 Apr 2021 00:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com BCBB1BC6B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1618008874;
 bh=gcbDGkUdDnJOBYT7ozbn4FoVr2Zh2eTcQINGngwB6vM=;
 h=From:To:Cc:Subject:Date:From;
 b=RoJrOTA20W/AspLCGjaeOvZHiW3QtsQ2KJJCjpR3HEjkRFY0GFUaGO0I7OnhPWt7j
 xkem4eOUyNFd5UBKPRLJoUcomEuyfpA7LUEruh5C+wlwip2GRiIeM3mdp6nVHdM8qV
 alMQqMQm81+lPWM4L326atRc9CTeVwy/g8HY9yHqbbTn7QPS/rKTX8myGA+NwL67XM
 yuzWtwg6lTBmUzC8AIDXz0SRfFvn8hScPfRbin28djhzlW6NW8l2c+xQtjFkyBlUnF
 N78U1xdurSqRUqZ2jqggMVEgvDsWP5hBp2LbZgirijXZccE5D3bIAYkBGv5GZi31fZ
 mGf/wumQek2kQ==
From: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 DENG Qingfang <dqfext@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next] net: dsa: mt7530: Add support for EEE features
Date: Sat, 10 Apr 2021 00:53:46 +0200
Message-Id: <20210409225346.432312-1-opensource@vdorst.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_155440_779402_E71D77F2 
X-CRM114-Status: GOOD (  17.83  )
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

VGhpcyBwYXRjaCBhZGRzIEVFRSBzdXBwb3J0LgoKU2lnbmVkLW9mZi1ieTogUmVuw6kgdmFuIERv
cnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+Ci0tLQogZHJpdmVycy9uZXQvZHNhL210NzUzMC5j
IHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9u
ZXQvZHNhL210NzUzMC5oIHwgMTYgKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCA2NSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHNh
L210NzUzMC5jIGIvZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCmluZGV4IDJiZDFiYWI3MTQ5Ny4u
ZGFhODdiMGJhYTY1IDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmMKKysrIGIv
ZHJpdmVycy9uZXQvZHNhL210NzUzMC5jCkBAIC0yNTY4LDYgKzI1NjgsMTEgQEAgc3RhdGljIHZv
aWQgbXQ3NTN4X3BoeWxpbmtfbWFjX2xpbmtfdXAoc3RydWN0IGRzYV9zd2l0Y2ggKmRzLCBpbnQg
cG9ydCwKIAkJCW1jciB8PSBQTUNSX1RYX0ZDX0VOOwogCQlpZiAocnhfcGF1c2UpCiAJCQltY3Ig
fD0gUE1DUl9SWF9GQ19FTjsKKworCQlpZiAobW9kZSA9PSBNTE9fQU5fUEhZICYmIHBoeWRldiAm
JgorCQkgICAgIShwcml2LT5lZWVfZGlzYWJsZWQgJiBCSVQocG9ydCkpICYmCisJCSAgICBwaHlf
aW5pdF9lZWUocGh5ZGV2LCAwKSA+PSAwKQorCQkJbWNyIHw9IFBNQ1JfRk9SQ0VfRUVFMUcgfCBQ
TUNSX0ZPUkNFX0VFRTEwMDsKIAl9CiAKIAltdDc1MzBfc2V0KHByaXYsIE1UNzUzMF9QTUNSX1Ao
cG9ydCksIG1jcik7CkBAIC0yODAwLDYgKzI4MDUsNDkgQEAgbXQ3NTN4X3BoeV93cml0ZShzdHJ1
Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBwb3J0LCBpbnQgcmVnbnVtLCB1MTYgdmFsKQogCXJldHVy
biBwcml2LT5pbmZvLT5waHlfd3JpdGUoZHMsIHBvcnQsIHJlZ251bSwgdmFsKTsKIH0KIAorc3Rh
dGljIGludCBtdDc1M3hfZ2V0X21hY19lZWUoc3RydWN0IGRzYV9zd2l0Y2ggKmRzLCBpbnQgcG9y
dCwKKwkJCSAgICAgIHN0cnVjdCBldGh0b29sX2VlZSAqZSkKK3sKKwlzdHJ1Y3QgbXQ3NTMwX3By
aXYgKnByaXYgPSBkcy0+cHJpdjsKKwl1MzIgZWVlY3IsIHBtc3I7CisKKwllLT5lZWVfZW5hYmxl
ZCA9ICEocHJpdi0+ZWVlX2Rpc2FibGVkICYgQklUKHBvcnQpKTsKKworCWlmIChlLT5lZWVfZW5h
YmxlZCkgeworCQllZWVjciA9IG10NzUzMF9yZWFkKHByaXYsIE1UNzUzMF9QTUVFRUNSX1AocG9y
dCkpOworCQllLT50eF9scGlfZW5hYmxlZCA9ICEoZWVlY3IgJiBMUElfTU9ERV9FTik7CisJCWUt
PnR4X2xwaV90aW1lciA9IEdFVF9MUElfVEhSRVNIKGVlZWNyKTsKKwkJcG1zciA9IG10NzUzMF9y
ZWFkKHByaXYsIE1UNzUzMF9QTVNSX1AocG9ydCkpOworCQllLT5lZWVfYWN0aXZlID0gZS0+ZWVl
X2VuYWJsZWQgJiYgISEocG1zciAmIFBNU1JfRUVFMUcpOworCX0KKworCXJldHVybiAwOworfQor
CitzdGF0aWMgaW50IG10NzUzeF9zZXRfbWFjX2VlZShzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGlu
dCBwb3J0LAorCQkJICAgICAgc3RydWN0IGV0aHRvb2xfZWVlICplKQoreworCXN0cnVjdCBtdDc1
MzBfcHJpdiAqcHJpdiA9IGRzLT5wcml2OworCXUzMiBlZWVjcjsKKworCWlmIChlLT5lZWVfZW5h
YmxlZCkgeworCQlpZiAoZS0+dHhfbHBpX3RpbWVyID4gMHhGRkYpCisJCQlyZXR1cm4gLUVJTlZB
TDsKKwkJcHJpdi0+ZWVlX2Rpc2FibGVkICY9IH5CSVQocG9ydCk7CisJCWVlZWNyID0gbXQ3NTMw
X3JlYWQocHJpdiwgTVQ3NTMwX1BNRUVFQ1JfUChwb3J0KSk7CisJCWVlZWNyICY9IH4oTFBJX1RI
UkVTSF9NQVNLIHwgTFBJX01PREVfRU4pOworCQlpZiAoIWUtPnR4X2xwaV9lbmFibGVkKQorCQkJ
LyogRm9yY2UgTFBJIE1vZGUgd2l0aG91dCBhIGRlbGF5ICovCisJCQllZWVjciB8PSBMUElfTU9E
RV9FTjsKKwkJZWVlY3IgfD0gU0VUX0xQSV9USFJFU0goZS0+dHhfbHBpX3RpbWVyKTsKKwkJbXQ3
NTMwX3dyaXRlKHByaXYsIE1UNzUzMF9QTUVFRUNSX1AocG9ydCksIGVlZWNyKTsKKwl9IGVsc2Ug
eworCQlwcml2LT5lZWVfZGlzYWJsZWQgfD0gQklUKHBvcnQpOworCX0KKworCXJldHVybiAwOwor
fQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRzYV9zd2l0Y2hfb3BzIG10NzUzMF9zd2l0Y2hfb3Bz
ID0gewogCS5nZXRfdGFnX3Byb3RvY29sCT0gbXRrX2dldF90YWdfcHJvdG9jb2wsCiAJLnNldHVw
CQkJPSBtdDc1M3hfc2V0dXAsCkBAIC0yODM1LDYgKzI4ODMsOCBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRzYV9zd2l0Y2hfb3BzIG10NzUzMF9zd2l0Y2hfb3BzID0gewogCS5waHlsaW5rX21hY19h
bl9yZXN0YXJ0CT0gbXQ3NTN4X3BoeWxpbmtfbWFjX2FuX3Jlc3RhcnQsCiAJLnBoeWxpbmtfbWFj
X2xpbmtfZG93bgk9IG10NzUzeF9waHlsaW5rX21hY19saW5rX2Rvd24sCiAJLnBoeWxpbmtfbWFj
X2xpbmtfdXAJPSBtdDc1M3hfcGh5bGlua19tYWNfbGlua191cCwKKwkuZ2V0X21hY19lZWUJCT0g
bXQ3NTN4X2dldF9tYWNfZWVlLAorCS5zZXRfbWFjX2VlZQkJPSBtdDc1M3hfc2V0X21hY19lZWUs
CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IG10NzUzeF9pbmZvIG10NzUzeF90YWJsZVtdID0g
ewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZHNhL210NzUzMC5oIGIvZHJpdmVycy9uZXQvZHNh
L210NzUzMC5oCmluZGV4IGVjMzZlYTVkZmQ1Ny4uMDJmOTgzZGYyNmJjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL25ldC9kc2EvbXQ3NTMwLmgKKysrIGIvZHJpdmVycy9uZXQvZHNhL210NzUzMC5oCkBA
IC0yNTcsNiArMjU3LDggQEAgZW51bSBtdDc1MzBfdmxhbl9wb3J0X2F0dHIgewogI2RlZmluZSAg
UE1DUl9SWF9FTgkJCUJJVCgxMykKICNkZWZpbmUgIFBNQ1JfQkFDS09GRl9FTgkJQklUKDkpCiAj
ZGVmaW5lICBQTUNSX0JBQ0tQUl9FTgkJCUJJVCg4KQorI2RlZmluZSAgUE1DUl9GT1JDRV9FRUUx
RwkJQklUKDcpCisjZGVmaW5lICBQTUNSX0ZPUkNFX0VFRTEwMAkJQklUKDYpCiAjZGVmaW5lICBQ
TUNSX1RYX0ZDX0VOCQkJQklUKDUpCiAjZGVmaW5lICBQTUNSX1JYX0ZDX0VOCQkJQklUKDQpCiAj
ZGVmaW5lICBQTUNSX0ZPUkNFX1NQRUVEXzEwMDAJCUJJVCgzKQpAQCAtMjg4LDcgKzI5MCwxNyBA
QCBlbnVtIG10NzUzMF92bGFuX3BvcnRfYXR0ciB7CiAJCQkJCSBQTUNSX1RYX0VOIHwgUE1DUl9S
WF9FTiB8IFwKIAkJCQkJIFBNQ1JfVFhfRkNfRU4gfCBQTUNSX1JYX0ZDX0VOIHwgXAogCQkJCQkg
UE1DUl9GT1JDRV9TUEVFRF8xMDAwIHwgXAotCQkJCQkgUE1DUl9GT1JDRV9GRFggfCBQTUNSX0ZP
UkNFX0xOSykKKwkJCQkJIFBNQ1JfRk9SQ0VfRkRYIHwgUE1DUl9GT1JDRV9MTksgfCBcCisJCQkJ
CSBQTUNSX0ZPUkNFX0VFRTFHIHwgUE1DUl9GT1JDRV9FRUUxMDApCisKKyNkZWZpbmUgTVQ3NTMw
X1BNRUVFQ1JfUCh4KQkJKDB4MzAwNCArICh4KSAqIDB4MTAwKQorI2RlZmluZSAgV0FLRVVQX1RJ
TUVfMTAwMCh4KQkJKCgoeCkgJiAweEZGKSA8PCAyNCkKKyNkZWZpbmUgIFdBS0VVUF9USU1FXzEw
MCh4KQkJKCgoeCkgJiAweEZGKSA8PCAxNikKKyNkZWZpbmUgIExQSV9USFJFU0hfTUFTSwkJR0VO
TUFTSygxNSwgNCkKKyNkZWZpbmUgIExQSV9USFJFU0hfU0hUCQkJNAorI2RlZmluZSAgU0VUX0xQ
SV9USFJFU0goeCkJCSgoKHgpIDw8IExQSV9USFJFU0hfU0hUKSAmIExQSV9USFJFU0hfTUFTSykK
KyNkZWZpbmUgIEdFVF9MUElfVEhSRVNIKHgpCQkoKCh4KSAmIExQSV9USFJFU0hfTUFTSykgPj4g
TFBJX1RIUkVTSF9TSFQpCisjZGVmaW5lICBMUElfTU9ERV9FTgkJCUJJVCgwKQogCiAjZGVmaW5l
IE1UNzUzMF9QTVNSX1AoeCkJCSgweDMwMDggKyAoeCkgKiAweDEwMCkKICNkZWZpbmUgIFBNU1Jf
RUVFMUcJCQlCSVQoNykKQEAgLTc2MSw2ICs3NzMsNyBAQCBzdHJ1Y3QgbXQ3NTN4X2luZm8gewog
ICoJCQlyZWdpc3RlcnMKICAqIEBwNl9pbnRlcmZhY2UJSG9sZGluZyB0aGUgY3VycmVudCBwb3J0
IDYgaW50ZXJmYWNlCiAgKiBAcDVfaW50Zl9zZWw6CUhvbGRpbmcgdGhlIGN1cnJlbnQgcG9ydCA1
IGludGVyZmFjZSBzZWxlY3QKKyAqIEBlZWVfZGlzYWJsZWQ6CUhvbGRpbmcgdGhlIGN1cnJlbnQg
ZWVlIHVzZXIgZGlzYWJsZWQgYml0cwogICovCiBzdHJ1Y3QgbXQ3NTMwX3ByaXYgewogCXN0cnVj
dCBkZXZpY2UJCSpkZXY7CkBAIC03NzgsNiArNzkxLDcgQEAgc3RydWN0IG10NzUzMF9wcml2IHsK
IAl1bnNpZ25lZCBpbnQJCXA1X2ludGZfc2VsOwogCXU4CQkJbWlycm9yX3J4OwogCXU4CQkJbWly
cm9yX3R4OworCXU4CQkJZWVlX2Rpc2FibGVkOwogCiAJc3RydWN0IG10NzUzMF9wb3J0CXBvcnRz
W01UNzUzMF9OVU1fUE9SVFNdOwogCS8qIHByb3RlY3QgYW1vbmcgcHJvY2Vzc2VzIGZvciByZWdp
c3RlcnMgYWNjZXNzKi8KLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
