Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6233C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsLsvEX+tdoY1DTV1jQsbUfPy5j8QrK4nuf+716LXCE=; b=4prGsNxynh37Lc
	W4smef2MH5d9wcoN49F7OADH+cEK7vxTtE1QHeIV+lG8yHC1MlH5fu/ulFc/qTNwAzMGNc73vrerP
	/fep6sib+SI9WOms/zNdqJD/4MQ8wM32BumrxwJCOzY7WSI3rUUOQHoT6WimO0oL+2TogUpCyPutF
	Mlglbt4SFHaYvrDTKWVXS7If7FNnz27y8tCkljaPNrsV/yKPwfitTmCEyvAxF9zigBR8o6klqjH1u
	zW1DEJOd/MhwboZ/8Stdphs7ba5Bsg0RGa7twd4lob5mYQPPE2j2901n2DoYlH8xvjIXRxKsgT/ae
	RBbrVnHqtm5j3syt6ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWJx-00H4wc-2s; Wed, 13 Apr 2022 06:17:41 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWBN-00H0qi-Bi; Wed, 13 Apr 2022 06:08:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830121; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M93nIZCPOTy7SQV7AhKolQJqHKRYb0HMeWy5u3CFe/rvt8PPqPtQw95UKUknVe5ODWabcV8gsvPyQOeEF/zAGuhDUV/k1Ku88DYSFlTX2Pq3Qu7nnVLHkLBNNIKQ/hMh4rEEh7c8gCJ4m2QofkK06Q9Y6g/oCxfKfIse3F/iGgU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830121;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=kvX7/HILmGsGFUpCgEqWcAxlrRzLYM66Yu5Zr3A0qRU=; 
 b=CqHrPmHmrixKFMvG4tklbZAyDU7s3eBpyKBl+6ywrWgUgbDBo41vrmGR9LjsUH/mc3/NOSMwIYHKhfpnf3pGauuSa1+z/58SyCYIbKNX0jAuMZcpqSOYWCaxj7ugWPTmp5riPw8AdbM3/UbwQ9o1JGauBAut1HWFJujiSGUiNwU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830121; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=kvX7/HILmGsGFUpCgEqWcAxlrRzLYM66Yu5Zr3A0qRU=;
 b=HMSKAdoVeDvDXwYwl8TCn3j/5OWFwi4jJ6s3ANBs5b4i2bcHwSdEWnu7irnbzQ8Z
 vD0Uos4SwfCoJ9htnCdXDrGuqQLiiQOioVS/2uHOtmVQQWG7GL5uD0zFz9RhK2PDgul
 H+tKD42ueYCVIEBnUecwNnLe8Vh6fdWVP6mc6cuo=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830120014391.1248903549166;
 Tue, 12 Apr 2022 23:08:40 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH 11/14] dt-bindings: pinctrl: add binding for Ralink MT7620
 pinctrl
Date: Wed, 13 Apr 2022 09:07:26 +0300
Message-Id: <20220413060729.27639-12-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230849_550549_5C663F68 
X-CRM114-Status: GOOD (  12.74  )
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBSYWxpbmsgTVQ3NjIwIHBpbiBjb250cm9sbGVyIGZvciBNVDc2
MjAsIE1UNzYyOCBhbmQKTVQ3Njg4IFNvQ3MuCgpTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFM
IDxhcmluYy51bmFsQGFyaW5jOS5jb20+Ci0tLQogLi4uL3BpbmN0cmwvcmFsaW5rLG10NzYyMC1w
aW5jdHJsLnlhbWwgICAgICAgIHwgODcgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDg3IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmssbXQ3NjIwLXBpbmN0cmwueWFtbAoKZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGlu
ayxtdDc2MjAtcGluY3RybC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3BpbmN0cmwvcmFsaW5rLG10NzYyMC1waW5jdHJsLnlhbWwKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMDAwLi4wMTU3OGI4YWEyNzcKLS0tIC9kZXYvbnVsbAorKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmssbXQ3NjIwLXBpbmN0
cmwueWFtbApAQCAtMCwwICsxLDg3IEBACisjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCislWUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9waW5jdHJsL3JhbGluayxtdDc2MjAtcGluY3RybC55YW1sIwor
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisK
K3RpdGxlOiBSYWxpbmsgTVQ3NjIwIFBpbiBDb250cm9sbGVyCisKK21haW50YWluZXJzOgorICAt
IEFyxLFuw6cgw5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KKyAgLSBTZXJnaW8gUGFyYWN1
ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0BnbWFpbC5jb20+CisKK2Rlc2NyaXB0aW9uOgorICBS
YWxpbmsgTVQ3NjIwIHBpbiBjb250cm9sbGVyIGZvciBNVDc2MjAsIE1UNzYyOCBhbmQgTVQ3Njg4
IFNvQ3MuCisgIFRoZSBwaW4gY29udHJvbGxlciBjYW4gb25seSBzZXQgdGhlIG11eGluZyBvZiBw
aW4gZ3JvdXBzLiBNdXhpbmcgaW5kaXZpdWFsIHBpbnMKKyAgaXMgbm90IHN1cHBvcnRlZC4gVGhl
cmUgaXMgbm8gcGluY29uZiBzdXBwb3J0LgorCitwcm9wZXJ0aWVzOgorICBjb21wYXRpYmxlOgor
ICAgIGNvbnN0OiByYWxpbmssbXQ3NjIwLXBpbmN0cmwKKworcGF0dGVyblByb3BlcnRpZXM6Cisg
ICctcGlucyQnOgorICAgIHR5cGU6IG9iamVjdAorICAgIHBhdHRlcm5Qcm9wZXJ0aWVzOgorICAg
ICAgJ14oLiotKT9waW5tdXgkJzoKKyAgICAgICAgdHlwZTogb2JqZWN0CisgICAgICAgIGRlc2Ny
aXB0aW9uOiBub2RlIGZvciBwaW5jdHJsLgorICAgICAgICAkcmVmOiBwaW5tdXgtbm9kZS55YW1s
IworCisgICAgICAgIHByb3BlcnRpZXM6CisgICAgICAgICAgZ3JvdXBzOgorICAgICAgICAgICAg
ZGVzY3JpcHRpb246IFRoZSBwaW4gZ3JvdXAgdG8gc2VsZWN0LgorICAgICAgICAgICAgZW51bTog
WworICAgICAgICAgICAgICAjIEZvciBNVDc2MjAgU29DCisgICAgICAgICAgICAgIGVwaHksIGky
YywgbWRpbywgbmRfc2QsIHBhLCBwY2llLCByZ21paTEsIHJnbWlpMiwgc3BpLCBzcGkgcmVmY2xr
LCB1YXJ0ZiwgdWFydGxpdGUsIHdkdCwgd2xlZCwKKworICAgICAgICAgICAgICAjIEZvciBNVDc2
MjggYW5kIE1UNzY4OCBTb0NzCisgICAgICAgICAgICAgIGdwaW8sIGkyYywgaTJzLCBwMGxlZF9h
biwgcDBsZWRfa24sIHAxbGVkX2FuLCBwMWxlZF9rbiwgcDJsZWRfYW4sIHAybGVkX2tuLCBwM2xl
ZF9hbiwKKyAgICAgICAgICAgICAgcDNsZWRfa24sIHA0bGVkX2FuLCBwNGxlZF9rbiwgcGVyc3Qs
IHB3bTAsIHB3bTEsIHJlZmNsaywgc2Rtb2RlLCBzcGksIHNwaSBjczEsIHNwaXMsIHVhcnQwLAor
ICAgICAgICAgICAgICB1YXJ0MSwgdWFydDIsIHdkdCwgd2xlZF9hbiwgd2xlZF9rbiwKKyAgICAg
ICAgICAgIF0KKworICAgICAgICAgIGZ1bmN0aW9uOgorICAgICAgICAgICAgZGVzY3JpcHRpb246
IFRoZSBtdXggZnVuY3Rpb24gdG8gc2VsZWN0LgorICAgICAgICAgICAgZW51bTogWworICAgICAg
ICAgICAgICAjIEZvciBNVDc2MjAgU29DCisgICAgICAgICAgICAgIGVwaHksIGdwaW8sIGdwaW8g
aTJzLCBncGlvIHVhcnRmLCBpMmMsIGkycyB1YXJ0ZiwgbWRpbywgbmFuZCwgcGEsIHBjaWUgcmVm
Y2xrLCBwY2llIHJzdCwKKyAgICAgICAgICAgICAgcGNtIGdwaW8sIHBjbSBpMnMsIHBjbSB1YXJ0
ZiwgcmVmY2xrLCByZ21paTEsIHJnbWlpMiwgc2QsIHNwaSwgc3BpIHJlZmNsaywgdWFydGYsIHVh
cnRsaXRlLAorICAgICAgICAgICAgICB3ZHQgcmVmY2xrLCB3ZHQgcnN0LCB3bGVkLAorCisgICAg
ICAgICAgICAgICMgRm9yIE1UNzYyOCBhbmQgTVQ3Njg4IFNvQ3MKKyAgICAgICAgICAgICAgYW50
ZW5uYSwgZGVidWcsIGdwaW8sIGkyYywgaTJzLCBqdGFnLCBwMGxlZF9hbiwgcDBsZWRfa24sIHAx
bGVkX2FuLCBwMWxlZF9rbiwgcDJsZWRfYW4sCisgICAgICAgICAgICAgIHAybGVkX2tuLCBwM2xl
ZF9hbiwgcDNsZWRfa24sIHA0bGVkX2FuLCBwNGxlZF9rbiwgcGNpZSwgcGNtLCBwZXJzdCwgcHdt
LCBwd20wLCBwd20xLAorICAgICAgICAgICAgICBwd21fdWFydDIsIHJlZmNsaywgcnN2ZCwgc2R4
Yywgc2R4YyBkNSBkNCwgc2R4YyBkNiwgc2R4YyBkNywgc3BpLCBzcGkgY3MxLCBzcGlzLCBzd19y
LCB1YXJ0MCwKKyAgICAgICAgICAgICAgdWFydDEsIHVhcnQyLCB1dGlmLCB3ZHQsIHdsZWRfYW4s
IHdsZWRfa24sIC0sCisgICAgICAgICAgICBdCisKKyAgICAgICAgcmVxdWlyZWQ6CisgICAgICAg
ICAgLSBncm91cHMKKyAgICAgICAgICAtIGZ1bmN0aW9uCisKKyAgICAgICAgYWRkaXRpb25hbFBy
b3BlcnRpZXM6IGZhbHNlCisKKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKKworYWxs
T2Y6CisgIC0gJHJlZjogInBpbmN0cmwueWFtbCMiCisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGli
bGUKKworYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2V4YW1wbGVzOgorICAjIFBpbm11
eCBjb250cm9sbGVyIG5vZGUKKyAgLSB8CisgICAgcGluY3RybCB7CisgICAgICBjb21wYXRpYmxl
ID0gInJhbGluayxtdDc2MjAtcGluY3RybCI7CisKKyAgICAgIGkyY19waW5zOiBpMmMwLXBpbnMg
eworICAgICAgICBwaW5tdXggeworICAgICAgICAgIGdyb3VwcyA9ICJpMmMiOworICAgICAgICAg
IGZ1bmN0aW9uID0gImkyYyI7CisgICAgICAgIH07CisgICAgICB9OworICAgIH07Ci0tIAoyLjI1
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
