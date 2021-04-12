Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167D1C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:51:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD1046120B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD1046120B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=vdorst.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5WCNObhNDbNz4snjqo1YYuIAiXxbGjpBTDFB+70DgbI=; b=Pf7N3pM4TJoH7c7MUXRShp5P3m
	/us4s68+nsp1TUFMn/B6Bq2mhMDkFo6uaAILu4scwWnj1LZJmJHIzSzSgYY3E5lqDmFXMM4D7VUEJ
	aE6dBLskUSCofSn4i0WM3BCL7JyAM5qCjO26LWPzT5hZk2bnhEvMpAORZ9pHCVQeZQKiJnpg/BUZl
	lP+AAZZMzQtXTwoEybEz3zKXufkX4PUNClcNG/vS5oQAPb3ZbzGoAWEetjclo2tLWAe2Cmx4i8Ln/
	4woYVnWLzN/0vAuit+tpyGSox87Fnp4WjrZ5HMYrVAmsD+xiRwJ9Z2bAidnMp5ZanYO7iJGAhlP7z
	PqmUFaVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqPS-005rd6-O9; Mon, 12 Apr 2021 06:50:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqPQ-005rcA-Lj
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 06:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=d+FNPoVyUuFfNwKhrRN87D3cxES+p+PMfh3mHzlZDpA=; b=Rq8rGEO3nfyFfk2VAw/0PPKlvf
 QMisrDtEuJBDW6tQkKYEmxN9VQV/KXMUOkP4uynMdzrFKdCdIUAUuqh5prfnU1jAuEUkpg0b7nYEI
 t2sk94BNxp0WiQYLS5a86Cav8ERraxxXjm6i8qz9O6GkkGV4LAFfUNuXZIWG6jG1lw7D4sGRjH0VW
 aZKtMKeGdarSF/6BctfChKzPxjZ1Yajdf+nxSEmBHtCpn/nlbbmBo8QUO743O5Wq0VVIhHN7Ntz9T
 KcSMb6KM78msgY4oLMaWtMkp0G1vt20/dn3ODPuHQOrtGZx0VJSCY+4CqHi/scI3YSr9T13OdL8Dv
 PT7gLVuQ==;
Received: from mx.i2x.nl ([5.2.79.48])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqPM-005uXS-FP
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 06:50:54 +0000
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd00::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx.i2x.nl (Postfix) with ESMTPS id 409415FB39;
 Mon, 12 Apr 2021 08:50:42 +0200 (CEST)
Authentication-Results: mx.i2x.nl; dkim=pass (2048-bit key;
 secure) header.d=vdorst.com header.i=@vdorst.com header.b="m1S786pa"; 
 dkim-atps=neutral
Received: from pc-rene.vdorst.com (pc-rene.vdorst.com [192.168.2.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id F3579BC9FC5;
 Mon, 12 Apr 2021 08:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com F3579BC9FC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
 s=default; t=1618210242;
 bh=d+FNPoVyUuFfNwKhrRN87D3cxES+p+PMfh3mHzlZDpA=;
 h=From:To:Cc:Subject:Date:From;
 b=m1S786pal22OrkVRkpR1NgBcBbx4kW4WS2O+K8dJg9xt/qWvNZM3IjGmGQ8jXmEtc
 oH8jML3UjEH1bJ0H6Ge4L6rsTcAR5tQ1dQWQTS/B1LZZ/TJ7O1PmQ+2y07RR4qUvWF
 J6okSwJYvKleW5PECIve46Cb7Jw4oc0tKur28CclcAY0hg5v3S8wO8/Pk48j3OxVmq
 2j2EOPXLE48Pgmv4/aFlrV1bMXWYAQQ9MMhDPMsvSd/P0xeslkQRNd5kMAUura6hr3
 cqLQInxjgKVPmlJxggXYP9MWBC789hf+Ke/KDn47oBUorIa59nlBCx93lUe6rfKlmh
 7+snbEx/20ozA==
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
Subject: [PATCH net-next v2] net: dsa: mt7530: Add support for EEE features
Date: Mon, 12 Apr 2021 08:50:31 +0200
Message-Id: <20210412065031.29492-1-opensource@vdorst.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_235052_697226_80645F55 
X-CRM114-Status: GOOD (  18.29  )
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
cnN0IDxvcGVuc291cmNlQHZkb3JzdC5jb20+Ci0tLQp2MSAtPiB2MjoKLSBSZWZhY3RvciB0aGUg
bXQ3NTN4X3tnZXQsc2V0fV9tYWNfZWVlKCkuCiAgQXMgREVOUSBRaW5nZmFuZyBtZW50aW9uZWQs
IG1vc3QgdGhpbmdzIGFyZSBzZXQgZWxzZSB3ZXJlLgogIFRoZXNlIGZ1bmN0aW9ucyBvbmx5IHNl
dC9yZXBvcnQgdGhlIExQSSB0aW1lb3V0IHZhbHVlL0xQSSB0aW1lb3V0IGVuYWJsZSBiaXQuCi0g
UmVtb3ZlZCB0aGUgdmFyaWFibGUgImVlZV9lbmFibGVkIiwgZG9uJ3QgbmVlZCB0b28gdHJhY2sg
dGhlIEVFRSBzdGF0dXMuCi0gUmVmYWN0b3IgbXQ3NTN4X3BoeWxpbmtfbWFjX2xpbmtfdXAoKS4K
ICBwaHlfaW5pdF9lZWUoKSByZXBvcnRzIGlzIHRoZSBFRUUgaXMgYWN0aXZlLCB0aGlzIGZ1bmN0
aW9uIGFsc28gY2hlY2tzCiAgdGhlIFBIWSwgZHVwbGV4IGFuZCBicm9rZW4gRFRTIG1vZGVzLgog
IFdoZW4gYWN0aXZlIHNldCB0aGUgTUFDIEVFRSBiaXQgYmFzZWQgb24gdGhlIHNwZWVkLgotIEFk
ZCB7R0VULFNFVClfTFBJX1RIUkVTSCh4KSBtYWNybwotIFBNQ1JfRk9SQ0VfRUVFMUcgfCBQTUNS
X0ZPUkNFX0VFRTEwMCBhcmUgbm93IHBsYWNlZCBpbiB0aGUgcmlnaHQgTUFTSyB2YXJpYWJsZQoK
IGRyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYyB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIGRyaXZlcnMvbmV0L2RzYS9tdDc1MzAuaCB8IDE0ICsrKysrKysrKysr
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYyBiL2RyaXZlcnMvbmV0L2RzYS9tdDc1
MzAuYwppbmRleCAyYmQxYmFiNzE0OTcuLjk2ZjdjOWVlZGUzNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9uZXQvZHNhL210NzUzMC5jCisrKyBiL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYwpAQCAtMjU3
MCw2ICsyNTcwLDE3IEBAIHN0YXRpYyB2b2lkIG10NzUzeF9waHlsaW5rX21hY19saW5rX3VwKHN0
cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCiAJCQltY3IgfD0gUE1DUl9SWF9GQ19FTjsK
IAl9CiAKKwlpZiAobW9kZSA9PSBNTE9fQU5fUEhZICYmIHBoeWRldiAmJiBwaHlfaW5pdF9lZWUo
cGh5ZGV2LCAwKSA+PSAwKSB7CisJCXN3aXRjaCAoc3BlZWQpIHsKKwkJY2FzZSBTUEVFRF8xMDAw
OgorCQkJbWNyIHw9IFBNQ1JfRk9SQ0VfRUVFMUc7CisJCQlicmVhazsKKwkJY2FzZSBTUEVFRF8x
MDA6CisJCQltY3IgfD0gUE1DUl9GT1JDRV9FRUUxMDA7CisJCQlicmVhazsKKwkJfQorCX0KKwog
CW10NzUzMF9zZXQocHJpdiwgTVQ3NTMwX1BNQ1JfUChwb3J0KSwgbWNyKTsKIH0KIApAQCAtMjgw
MCw2ICsyODExLDM2IEBAIG10NzUzeF9waHlfd3JpdGUoc3RydWN0IGRzYV9zd2l0Y2ggKmRzLCBp
bnQgcG9ydCwgaW50IHJlZ251bSwgdTE2IHZhbCkKIAlyZXR1cm4gcHJpdi0+aW5mby0+cGh5X3dy
aXRlKGRzLCBwb3J0LCByZWdudW0sIHZhbCk7CiB9CiAKK3N0YXRpYyBpbnQgbXQ3NTN4X2dldF9t
YWNfZWVlKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBvcnQsCisJCQkgICAgICBzdHJ1Y3Qg
ZXRodG9vbF9lZWUgKmUpCit7CisJc3RydWN0IG10NzUzMF9wcml2ICpwcml2ID0gZHMtPnByaXY7
CisJdTMyIGVlZWNyID0gbXQ3NTMwX3JlYWQocHJpdiwgTVQ3NTMwX1BNRUVFQ1JfUChwb3J0KSk7
CisKKwllLT50eF9scGlfZW5hYmxlZCA9ICEoZWVlY3IgJiBMUElfTU9ERV9FTik7CisJZS0+dHhf
bHBpX3RpbWVyID0gR0VUX0xQSV9USFJFU0goZWVlY3IpOworCisJcmV0dXJuIDA7Cit9CisKK3N0
YXRpYyBpbnQgbXQ3NTN4X3NldF9tYWNfZWVlKHN0cnVjdCBkc2Ffc3dpdGNoICpkcywgaW50IHBv
cnQsCisJCQkgICAgICBzdHJ1Y3QgZXRodG9vbF9lZWUgKmUpCit7CisJc3RydWN0IG10NzUzMF9w
cml2ICpwcml2ID0gZHMtPnByaXY7CisJdTMyIHNldCwgbWFzayA9IExQSV9USFJFU0hfTUFTSyB8
IExQSV9NT0RFX0VOOworCisJaWYgKGUtPnR4X2xwaV90aW1lciA+IDB4RkZGKQorCQlyZXR1cm4g
LUVJTlZBTDsKKworCXNldCA9IFNFVF9MUElfVEhSRVNIKGUtPnR4X2xwaV90aW1lcik7CisJaWYg
KCFlLT50eF9scGlfZW5hYmxlZCkKKwkJLyogRm9yY2UgTFBJIE1vZGUgd2l0aG91dCBhIGRlbGF5
ICovCisJCXNldCB8PSBMUElfTU9ERV9FTjsKKwltdDc1MzBfcm13KHByaXYsIE1UNzUzMF9QTUVF
RUNSX1AocG9ydCksIG1hc2ssIHNldCk7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBkc2Ffc3dpdGNoX29wcyBtdDc1MzBfc3dpdGNoX29wcyA9IHsKIAkuZ2V0X3RhZ19w
cm90b2NvbAk9IG10a19nZXRfdGFnX3Byb3RvY29sLAogCS5zZXR1cAkJCT0gbXQ3NTN4X3NldHVw
LApAQCAtMjgzNSw2ICsyODc2LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkc2Ffc3dpdGNoX29w
cyBtdDc1MzBfc3dpdGNoX29wcyA9IHsKIAkucGh5bGlua19tYWNfYW5fcmVzdGFydAk9IG10NzUz
eF9waHlsaW5rX21hY19hbl9yZXN0YXJ0LAogCS5waHlsaW5rX21hY19saW5rX2Rvd24JPSBtdDc1
M3hfcGh5bGlua19tYWNfbGlua19kb3duLAogCS5waHlsaW5rX21hY19saW5rX3VwCT0gbXQ3NTN4
X3BoeWxpbmtfbWFjX2xpbmtfdXAsCisJLmdldF9tYWNfZWVlCQk9IG10NzUzeF9nZXRfbWFjX2Vl
ZSwKKwkuc2V0X21hY19lZWUJCT0gbXQ3NTN4X3NldF9tYWNfZWVlLAogfTsKIAogc3RhdGljIGNv
bnN0IHN0cnVjdCBtdDc1M3hfaW5mbyBtdDc1M3hfdGFibGVbXSA9IHsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L2RzYS9tdDc1MzAuaCBiL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuaAppbmRleCBl
YzM2ZWE1ZGZkNTcuLjAyMDRkYTQ4NmYzYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvZHNhL210
NzUzMC5oCisrKyBiL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuaApAQCAtMjU3LDYgKzI1Nyw4IEBA
IGVudW0gbXQ3NTMwX3ZsYW5fcG9ydF9hdHRyIHsKICNkZWZpbmUgIFBNQ1JfUlhfRU4JCQlCSVQo
MTMpCiAjZGVmaW5lICBQTUNSX0JBQ0tPRkZfRU4JCUJJVCg5KQogI2RlZmluZSAgUE1DUl9CQUNL
UFJfRU4JCQlCSVQoOCkKKyNkZWZpbmUgIFBNQ1JfRk9SQ0VfRUVFMUcJCUJJVCg3KQorI2RlZmlu
ZSAgUE1DUl9GT1JDRV9FRUUxMDAJCUJJVCg2KQogI2RlZmluZSAgUE1DUl9UWF9GQ19FTgkJCUJJ
VCg1KQogI2RlZmluZSAgUE1DUl9SWF9GQ19FTgkJCUJJVCg0KQogI2RlZmluZSAgUE1DUl9GT1JD
RV9TUEVFRF8xMDAwCQlCSVQoMykKQEAgLTI4MSw3ICsyODMsOCBAQCBlbnVtIG10NzUzMF92bGFu
X3BvcnRfYXR0ciB7CiAjZGVmaW5lICBQTUNSX0xJTktfU0VUVElOR1NfTUFTSwkoUE1DUl9UWF9F
TiB8IFBNQ1JfRk9SQ0VfU1BFRURfMTAwMCB8IFwKIAkJCQkJIFBNQ1JfUlhfRU4gfCBQTUNSX0ZP
UkNFX1NQRUVEXzEwMCB8IFwKIAkJCQkJIFBNQ1JfVFhfRkNfRU4gfCBQTUNSX1JYX0ZDX0VOIHwg
XAotCQkJCQkgUE1DUl9GT1JDRV9GRFggfCBQTUNSX0ZPUkNFX0xOSykKKwkJCQkJIFBNQ1JfRk9S
Q0VfRkRYIHwgUE1DUl9GT1JDRV9MTksgfCBcCisJCQkJCSBQTUNSX0ZPUkNFX0VFRTFHIHwgUE1D
Ul9GT1JDRV9FRUUxMDApCiAjZGVmaW5lICBQTUNSX0NQVV9QT1JUX1NFVFRJTkcoaWQpCShQTUNS
X0ZPUkNFX01PREVfSUQoKGlkKSkgfCBcCiAJCQkJCSBQTUNSX0lGR19YTUlUKDEpIHwgUE1DUl9N
QUNfTU9ERSB8IFwKIAkJCQkJIFBNQ1JfQkFDS09GRl9FTiB8IFBNQ1JfQkFDS1BSX0VOIHwgXApA
QCAtMjkwLDYgKzI5MywxNSBAQCBlbnVtIG10NzUzMF92bGFuX3BvcnRfYXR0ciB7CiAJCQkJCSBQ
TUNSX0ZPUkNFX1NQRUVEXzEwMDAgfCBcCiAJCQkJCSBQTUNSX0ZPUkNFX0ZEWCB8IFBNQ1JfRk9S
Q0VfTE5LKQogCisjZGVmaW5lIE1UNzUzMF9QTUVFRUNSX1AoeCkJCSgweDMwMDQgKyAoeCkgKiAw
eDEwMCkKKyNkZWZpbmUgIFdBS0VVUF9USU1FXzEwMDAoeCkJCSgoKHgpICYgMHhGRikgPDwgMjQp
CisjZGVmaW5lICBXQUtFVVBfVElNRV8xMDAoeCkJCSgoKHgpICYgMHhGRikgPDwgMTYpCisjZGVm
aW5lICBMUElfVEhSRVNIX01BU0sJCUdFTk1BU0soMTUsIDQpCisjZGVmaW5lICBMUElfVEhSRVNI
X1NIVAkJCTQKKyNkZWZpbmUgIFNFVF9MUElfVEhSRVNIKHgpCQkoKCh4KSA8PCBMUElfVEhSRVNI
X1NIVCkgJiBMUElfVEhSRVNIX01BU0spCisjZGVmaW5lICBHRVRfTFBJX1RIUkVTSCh4KQkJKCgo
eCkgJiBMUElfVEhSRVNIX01BU0spID4+IExQSV9USFJFU0hfU0hUKQorI2RlZmluZSAgTFBJX01P
REVfRU4JCQlCSVQoMCkKKwogI2RlZmluZSBNVDc1MzBfUE1TUl9QKHgpCQkoMHgzMDA4ICsgKHgp
ICogMHgxMDApCiAjZGVmaW5lICBQTVNSX0VFRTFHCQkJQklUKDcpCiAjZGVmaW5lICBQTVNSX0VF
RTEwME0JCQlCSVQoNikKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
