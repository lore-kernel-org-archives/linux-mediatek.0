Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE43DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYLwtqsWD7/g13TcDSTl9djYAPA0iRTgqOZ+w2xIAMI=; b=sGM3pTvqJLIFRt
	zo8SlMM3K9CFBZ/GuOW3ybWENPjUccbD+KqlHfzfRGAAowuSS4xQ1jiMO4zKSrX1nmgm9Ug/1Gzlr
	Vr9r6u8UPBj/dZJIBd+gu/HBxrD65MsWVhH+GdT/0m2L+ZkbqzH8kyiFlkyXIaFYJ15gHn/rZaizF
	pM/19Yw7sA+hDkrmlpG8Z53TVX6/YLIL1s4wzAwsChOcS97422zxzmGpfSgaxYxDj2oUdLKObZMuP
	Mbel42ouGAzzS2WCjkDdLNZZ63G3Z5rboIDyRTGW51VS07BjfdXqxrQz1X5bto7L5FbNLWGmyryF7
	swxbewQ/qrNzafqbqhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWKd-00H5Et-Uf; Wed, 13 Apr 2022 06:18:23 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWBR-00H0s1-I9; Wed, 13 Apr 2022 06:08:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830126; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DC3LrbIqvzZaLzQZ+S0ncDASReU7LuznWb/AWkelxCzcBJojRKf2TEReHIhzLb5fHi1e/zziev9InCGoQRplpNOkOWeKGt4h5KaVEwQoSfpI1sJH3TNTq3Ertu56uBGuuvFR1fcihpvX//doTRW7ShAWhXrch/MqB5zQem8k46o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830126;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=VZvyACgwn9ASHwL310GjvNe30AHHx9r4ZajXUqN2Lfg=; 
 b=g9YqrwBiXw3xwxNMd9BDe8+MN2oMubHxkUwU7S9YgPvV/yVgldbY+d+X09kH3F2bP8nhLrGhpUQvXER94ARLl9zFpr33EGtlKn/ybs1ZkaaoBtJaO6D8kI1l4qtwclqBtq4ckPze6/c/J1sFw2f/1co51VAlR0fbkTfmbotR9WA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830126; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=VZvyACgwn9ASHwL310GjvNe30AHHx9r4ZajXUqN2Lfg=;
 b=MOFzrXkHSHkWoqFXsDrjbu7kaTSJJ+lubKZMD6ypwVuWsaMX6i/E1PASO7waJ0mv
 /m2Yb358NrSkCh3dUxjK65xdeTCNBq6+8i88MkSy4XT/f8WbNUSIKiGoxwPiyDF4ly6
 vw3Xc7bSTctdHeUA+0veIwn4+Yh+ncl9l1L1qj1Y=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830123973757.1372863442003;
 Tue, 12 Apr 2022 23:08:43 -0700 (PDT)
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
Subject: [PATCH 12/14] dt-bindings: pinctrl: add binding for Ralink MT7621
 pinctrl
Date: Wed, 13 Apr 2022 09:07:27 +0300
Message-Id: <20220413060729.27639-13-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230853_793414_694A2329 
X-CRM114-Status: GOOD (  12.86  )
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBSYWxpbmsgTVQ3NjIxIHBpbiBjb250cm9sbGVyIGZvciBNVDc2
MjEgU29DLgoKU2lnbmVkLW9mZi1ieTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzku
Y29tPgotLS0KIC4uLi9waW5jdHJsL3JhbGluayxtdDc2MjEtcGluY3RybC55YW1sICAgICAgICB8
IDY5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2OSBpbnNlcnRpb25zKCsp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bp
bmN0cmwvcmFsaW5rLG10NzYyMS1waW5jdHJsLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9yYWxpbmssbXQ3NjIxLXBpbmN0cmwueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxtdDc2
MjEtcGluY3RybC55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4u
ZDFlNGQxNDU3NzU0Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLG10NzYyMS1waW5jdHJsLnlhbWwKQEAgLTAsMCArMSw2
OSBAQAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNs
YXVzZQorJVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
cGluY3RybC9yYWxpbmssbXQ3NjIxLXBpbmN0cmwueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIworCit0aXRsZTogUmFsaW5rIE1UNzYy
MSBQaW4gQ29udHJvbGxlcgorCittYWludGFpbmVyczoKKyAgLSBBcsSxbsOnIMOcTkFMIDxhcmlu
Yy51bmFsQGFyaW5jOS5jb20+CisgIC0gU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1
ZWxsb3NAZ21haWwuY29tPgorCitkZXNjcmlwdGlvbjoKKyAgUmFsaW5rIE1UNzYyMSBwaW4gY29u
dHJvbGxlciBmb3IgTVQ3NjIxIFNvQy4KKyAgVGhlIHBpbiBjb250cm9sbGVyIGNhbiBvbmx5IHNl
dCB0aGUgbXV4aW5nIG9mIHBpbiBncm91cHMuIE11eGluZyBpbmRpdml1YWwgcGlucworICBpcyBu
b3Qgc3VwcG9ydGVkLiBUaGVyZSBpcyBubyBwaW5jb25mIHN1cHBvcnQuCisKK3Byb3BlcnRpZXM6
CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IHJhbGluayxtdDc2MjEtcGluY3RybAorCitwYXR0
ZXJuUHJvcGVydGllczoKKyAgJy1waW5zJCc6CisgICAgdHlwZTogb2JqZWN0CisgICAgcGF0dGVy
blByb3BlcnRpZXM6CisgICAgICAnXiguKi0pP3Bpbm11eCQnOgorICAgICAgICB0eXBlOiBvYmpl
Y3QKKyAgICAgICAgZGVzY3JpcHRpb246IG5vZGUgZm9yIHBpbmN0cmwuCisgICAgICAgICRyZWY6
IHBpbm11eC1ub2RlLnlhbWwjCisKKyAgICAgICAgcHJvcGVydGllczoKKyAgICAgICAgICBncm91
cHM6CisgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIHBpbiBncm91cCB0byBzZWxlY3QuCisg
ICAgICAgICAgICBlbnVtOiBbaTJjLCBqdGFnLCBtZGlvLCBwY2llLCByZ21paTEsIHJnbWlpMiwg
c2RoY2ksIHNwaSwgdWFydDEsIHVhcnQyLCB1YXJ0Mywgd2R0XQorCisgICAgICAgICAgZnVuY3Rp
b246CisgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11eCBmdW5jdGlvbiB0byBzZWxlY3Qu
CisgICAgICAgICAgICBlbnVtOiBbZ3BpbywgaTJjLCBpMnMsIGp0YWcsIG1kaW8sIG5hbmQxLCBu
YW5kMiwgcGNpZSByZWZjbGssIHBjaWUgcnN0LCBwY20sIHJnbWlpMSwgcmdtaWkyLAorICAgICAg
ICAgICAgICAgICAgIHNkaGNpLCBzcGRpZjIsIHNwZGlmMywgc3BpLCB1YXJ0MSwgdWFydDIsIHVh
cnQzLCB3ZHQgcmVmY2xrLCB3ZHQgcnN0XQorCisgICAgICAgIHJlcXVpcmVkOgorICAgICAgICAg
IC0gZ3JvdXBzCisgICAgICAgICAgLSBmdW5jdGlvbgorCisgICAgICAgIGFkZGl0aW9uYWxQcm9w
ZXJ0aWVzOiBmYWxzZQorCisgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2FsbE9m
OgorICAtICRyZWY6ICJwaW5jdHJsLnlhbWwjIgorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxl
CisKK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgIyBQaW5tdXgg
Y29udHJvbGxlciBub2RlCisgIC0gfAorICAgIHBpbmN0cmwgeworICAgICAgY29tcGF0aWJsZSA9
ICJyYWxpbmssbXQ3NjIxLXBpbmN0cmwiOworCisgICAgICBpMmNfcGluczogaTJjMC1waW5zIHsK
KyAgICAgICAgcGlubXV4IHsKKyAgICAgICAgICBncm91cHMgPSAiaTJjIjsKKyAgICAgICAgICBm
dW5jdGlvbiA9ICJpMmMiOworICAgICAgICB9OworICAgICAgfTsKKyAgICB9OwotLSAKMi4yNS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
