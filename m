Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADADC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UwqnRO+U81VSU5uydyeGqhhEYR6wDMSbQTmtM1sG2o=; b=RvBknrV9wcIiQZ
	J7OlRSztYDBYwsro0X5DPmwUUAzIbYMaCaT+Z33v6MxMac3evGKVHLyP5AN/kaNx1butLghBAZAyy
	+XNXr58y7IZX2OJBDlVqj9v5eoYBUBGIRPCH7VBf6l8Ehw5vjEqAI8aQQ/PcdeiBv8i8ry9sFrNa2
	Ym1oICou5lf7fnQGy6pEWrL4+FHSt+AFvjIkwSQWNI5tGcUSNOAGG1E2tG+PPcbwXhrZHdYJ6zvOw
	eQcxc5E+4BoVpEfyjSCN5ENV/7Ik7hVXRTZOj6NpHg5x283cC5jtrM1hv82HzZjiO32An/rOaBY8R
	SXE2blhc4iiuu42yG2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWLY-00H5cx-4K; Wed, 13 Apr 2022 06:19:20 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWBU-00H0tQ-BW; Wed, 13 Apr 2022 06:08:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830130; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GlbhLNwzhdNvH8aEOqanJ4bWmfhYL3hfSxRQdBdJAS8Ut6vNR+xmicB2cVUHSONPGPV4erwBEM+CI3nTaiXOoLq7/kszTx5m9KLg+lgqOHCZr1yqecw77wIFzjtLneUJ2ZJopIL20ReV2rlsHG8BslSL5Oth7/W92N+leneUaSw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830130;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=mpwcTh8CjWF1bV6nY35bIDn7PlK6pgxOAGh4mpV6q+4=; 
 b=fzie1MADyCPQ9mCVRKBzzVzcU6OQL2C9tQF51V9qkvyRgUzfaTsahbpusxrC46K30yyq1OjHC8bGPCKs63bw+cmocER3yfVJLCJM4nL5cE9o1Chi0tCVOv3SqteuQxnDS05Wgu0GBILxQUO3ilIMt6WCq9u53O/l34WjdadlG9g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830129; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=mpwcTh8CjWF1bV6nY35bIDn7PlK6pgxOAGh4mpV6q+4=;
 b=A0L8wqdCbJnEyGzRtXzzS2766oZ5HilbHnXdMW9gQjUmGPZ2U6aTbM9KLDPzPVc9
 KiMX/k4xEnpfmjaFF5/BurMu8e3EAAI6grq+IZJ4OZQzfFqikhlzp1DbNxNJln82I4K
 X7cJ053TcWKd6+ksFEx3DMGP7BR/kalqk7SBPt2I=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830128143542.8941953542978;
 Tue, 12 Apr 2022 23:08:48 -0700 (PDT)
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
Subject: [PATCH 13/14] dt-bindings: pinctrl: add binding for Ralink RT305X
 pinctrl
Date: Wed, 13 Apr 2022 09:07:28 +0300
Message-Id: <20220413060729.27639-14-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230856_503812_2D9006D9 
X-CRM114-Status: GOOD (  12.62  )
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

QWRkIGJpbmRpbmcgZm9yIHRoZSBSYWxpbmsgUlQzMDVYIHBpbiBjb250cm9sbGVyIGZvciBSVDMw
NTAsIFJUMzA1MiwKUlQzMzUwLCBSVDMzNTIgYW5kIFJUNTM1MCBTb0NzLgoKU2lnbmVkLW9mZi1i
eTogQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgotLS0KIC4uLi9waW5jdHJs
L3JhbGluayxydDMwNXgtcGluY3RybC55YW1sICAgICAgICB8IDg5ICsrKysrKysrKysrKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFsaW5rLHJ0MzA1eC1w
aW5jdHJsLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcGluY3RybC9yYWxpbmsscnQzMDV4LXBpbmN0cmwueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3JhbGluayxydDMwNXgtcGluY3RybC55YW1sCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMzlmNGExNTNkOTRiCi0tLSAvZGV2
L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvcmFs
aW5rLHJ0MzA1eC1waW5jdHJsLnlhbWwKQEAgLTAsMCArMSw4OSBAQAorIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQorJVlBTUwgMS4yCistLS0K
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcGluY3RybC9yYWxpbmsscnQzMDV4
LXBpbmN0cmwueWFtbCMKKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVt
YXMvY29yZS55YW1sIworCit0aXRsZTogUmFsaW5rIFJUMzA1WCBQaW4gQ29udHJvbGxlcgorCitt
YWludGFpbmVyczoKKyAgLSBBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cisg
IC0gU2VyZ2lvIFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29tPgorCitk
ZXNjcmlwdGlvbjoKKyAgUmFsaW5rIFJUMzA1WCBwaW4gY29udHJvbGxlciBmb3IgUlQzMDUwLCBS
VDMwNTIsIFJUMzM1MCwgUlQzMzUyIGFuZCBSVDUzNTAgU29Dcy4KKyAgVGhlIHBpbiBjb250cm9s
bGVyIGNhbiBvbmx5IHNldCB0aGUgbXV4aW5nIG9mIHBpbiBncm91cHMuIE11eGluZyBpbmRpdml1
YWwgcGlucworICBpcyBub3Qgc3VwcG9ydGVkLiBUaGVyZSBpcyBubyBwaW5jb25mIHN1cHBvcnQu
CisKK3Byb3BlcnRpZXM6CisgIGNvbXBhdGlibGU6CisgICAgY29uc3Q6IHJhbGluayxydDMwNXgt
cGluY3RybAorCitwYXR0ZXJuUHJvcGVydGllczoKKyAgJy1waW5zJCc6CisgICAgdHlwZTogb2Jq
ZWN0CisgICAgcGF0dGVyblByb3BlcnRpZXM6CisgICAgICAnXiguKi0pP3Bpbm11eCQnOgorICAg
ICAgICB0eXBlOiBvYmplY3QKKyAgICAgICAgZGVzY3JpcHRpb246IG5vZGUgZm9yIHBpbmN0cmwu
CisgICAgICAgICRyZWY6IHBpbm11eC1ub2RlLnlhbWwjCisKKyAgICAgICAgcHJvcGVydGllczoK
KyAgICAgICAgICBncm91cHM6CisgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIHBpbiBncm91
cCB0byBzZWxlY3QuCisgICAgICAgICAgICBlbnVtOiBbCisgICAgICAgICAgICAgICMgRm9yIFJU
MzA1MCwgUlQzMDUyIGFuZCBSVDMzNTAgU29DcworICAgICAgICAgICAgICBpMmMsIGp0YWcsIG1k
aW8sIHJnbWlpLCBzZHJhbSwgc3BpLCB1YXJ0ZiwgdWFydGxpdGUsCisKKyAgICAgICAgICAgICAg
IyBGb3IgUlQzMzUyIFNvQworICAgICAgICAgICAgICBpMmMsIGp0YWcsIGxlZCwgbG5hLCBtZGlv
LCBwYSwgcmdtaWksIHNwaSwgc3BpX2NzMSwgdWFydGYsIHVhcnRsaXRlLAorCisgICAgICAgICAg
ICAgICMgRm9yIFJUNTM1MCBTb0MKKyAgICAgICAgICAgICAgaTJjLCBqdGFnLCBsZWQsIHNwaSwg
c3BpX2NzMSwgdWFydGYsIHVhcnRsaXRlLAorICAgICAgICAgICAgXQorCisgICAgICAgICAgZnVu
Y3Rpb246CisgICAgICAgICAgICBkZXNjcmlwdGlvbjogVGhlIG11eCBmdW5jdGlvbiB0byBzZWxl
Y3QuCisgICAgICAgICAgICBlbnVtOiBbCisgICAgICAgICAgICAgICMgRm9yIFJUMzA1MCwgUlQz
MDUyIGFuZCBSVDMzNTAgU29DcworICAgICAgICAgICAgICBncGlvLCBncGlvIGkycywgZ3BpbyB1
YXJ0ZiwgaTJjLCBpMnMgdWFydGYsIGp0YWcsIG1kaW8sIHBjbSBncGlvLCBwY20gaTJzLCBwY20g
dWFydGYsIHJnbWlpLAorICAgICAgICAgICAgICBzZHJhbSwgc3BpLCB1YXJ0ZiwgdWFydGxpdGUs
CisKKyAgICAgICAgICAgICAgIyBGb3IgUlQzMzUyIFNvQworICAgICAgICAgICAgICBncGlvLCBn
cGlvIGkycywgZ3BpbyB1YXJ0ZiwgaTJjLCBpMnMgdWFydGYsIGp0YWcsIGxlZCwgbG5hLCBtZGlv
LCBwYSwgcGNtIGdwaW8sIHBjbSBpMnMsCisgICAgICAgICAgICAgIHBjbSB1YXJ0ZiwgcmdtaWks
IHNwaSwgc3BpX2NzMSwgdWFydGYsIHVhcnRsaXRlLCB3ZGdfY3MxLAorCisgICAgICAgICAgICAg
ICMgRm9yIFJUNTM1MCBTb0MKKyAgICAgICAgICAgICAgZ3BpbywgZ3BpbyBpMnMsIGdwaW8gdWFy
dGYsIGkyYywgaTJzIHVhcnRmLCBqdGFnLCBsZWQsIHBjbSBncGlvLCBwY20gaTJzLCBwY20gdWFy
dGYsIHNwaSwKKyAgICAgICAgICAgICAgc3BpX2NzMSwgdWFydGYsIHVhcnRsaXRlLCB3ZGdfY3Mx
LAorICAgICAgICAgICAgXQorCisgICAgICAgIHJlcXVpcmVkOgorICAgICAgICAgIC0gZ3JvdXBz
CisgICAgICAgICAgLSBmdW5jdGlvbgorCisgICAgICAgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBm
YWxzZQorCisgICAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCisKK2FsbE9mOgorICAtICRy
ZWY6ICJwaW5jdHJsLnlhbWwjIgorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisKK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQorCitleGFtcGxlczoKKyAgIyBQaW5tdXggY29udHJvbGxl
ciBub2RlCisgIC0gfAorICAgIHBpbmN0cmwgeworICAgICAgY29tcGF0aWJsZSA9ICJyYWxpbmss
cnQzMDV4LXBpbmN0cmwiOworCisgICAgICBpMmNfcGluczogaTJjMC1waW5zIHsKKyAgICAgICAg
cGlubXV4IHsKKyAgICAgICAgICBncm91cHMgPSAiaTJjIjsKKyAgICAgICAgICBmdW5jdGlvbiA9
ICJpMmMiOworICAgICAgICB9OworICAgICAgfTsKKyAgICB9OwotLSAKMi4yNS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
