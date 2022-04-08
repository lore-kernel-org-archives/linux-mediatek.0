Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A415C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 06:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VuGmcIgdge2yiqHhxkmNyxBjAFlzeT3Ssh7/wuBU034=; b=qWoYOpfjNOKbWB
	hZgvC0NkC/DoqZvMezUxbPSm7SkElncnTxhmwL2Yj31xHcxuvP4NPpfvyb7/rd10+LCWL2ytrR7gn
	gPuADq6m0xs8YDsikoAH6XdPiu5gXZyw432bSntLFQUiKUAcVYVz3MWoftuM6q8nZvQrTc3SFzTdE
	Ick2zu/03mo88i86ZBnH3dR7N/aEMiukqL3is78WHypjSYR6FXgEs4zZWgwVkC3v6UDe+yXIQoReB
	binb+1eX3+tfInHYvtSKtBN/I0HarkSsMriW2XPT5BNs2rV03ALDVZzRzst1/kMdGLLrTk/9yZ3uw
	3isaUFCoRjwg25O8Gmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nchpG-00FEgJ-9F; Fri, 08 Apr 2022 06:10:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nchpD-00FEf4-5N; Fri, 08 Apr 2022 06:10:28 +0000
X-UUID: e9f6a81278974e3a99cd5ebcaf503d78-20220407
X-UUID: e9f6a81278974e3a99cd5ebcaf503d78-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1621241348; Thu, 07 Apr 2022 23:10:17 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 23:05:59 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Apr 2022 14:05:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 14:05:57 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nfraprado@collabora.com>,
 <tzungbi@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [v10 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of
 headset
Date: Fri, 8 Apr 2022 14:05:51 +0800
Message-ID: <20220408060552.26607-4-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
References: <20220408060552.26607-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_231027_285015_B5DD0268 
X-CRM114-Status: GOOD (  13.89  )
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

QXMgcGFydCBvZiB0aGUgcmVmYWN0b3JpbmcgdG8gYWxsb3cgdGhlIHNhbWUgbWFjaGluZSBkcml2
ZXIgdG8gYmUgdXNlZCBmb3IKdGhlIHJ0MTAxNShwKSBhbmQgcnQ1NjgyKHMpIGNvZGVjcyBvbiB0
aGUgTVQ4MTkyIHBsYXRmb3JtLCBwYXJzZSB0aGUKcnQ1NjgyKHMpIGNvZGVjIGZyb20gdGhlIGhl
YWRzZXQtY29kZWMgcHJvcGVydHkgaW4gdGhlIGRldmljZXRyZWUgYW5kIHdpcmUKaXQgdG8gdGhl
IEkyUzggYW5kIEkyUzkgYmFja2VuZHMuCgpTaWduZWQtb2ZmLWJ5OiBKaWF4aW4gWXUgPGppYXhp
bi55dUBtZWRpYXRlay5jb20+ClJldmlld2VkLWJ5OiBUenVuZy1CaSBTaGloIDx0enVuZ2JpQGtl
cm5lbC5vcmc+ClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+ClRlc3RlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFw
cmFkb0Bjb2xsYWJvcmEuY29tPgotLS0KIC4uLi9tdDgxOTIvbXQ4MTkyLW10NjM1OS1ydDEwMTUt
cnQ1NjgyLmMgICAgICB8IDM0ICsrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
NiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9t
ZWRpYXRlay9tdDgxOTIvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLmMgYi9zb3VuZC9zb2Mv
bWVkaWF0ZWsvbXQ4MTkyL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi5jCmluZGV4IDE1NzEx
NDQ4ZDI1OS4uNGExMWY2ODdkNDE2IDEwMDY0NAotLS0gYS9zb3VuZC9zb2MvbWVkaWF0ZWsvbXQ4
MTkyL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4Mi5jCisrKyBiL3NvdW5kL3NvYy9tZWRpYXRl
ay9tdDgxOTIvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLmMKQEAgLTI4LDkgKzI4LDYgQEAK
ICNkZWZpbmUgUlQxMDE1X0RFVjBfTkFNRQkicnQxMDE1LjEtMDAyOCIKICNkZWZpbmUgUlQxMDE1
X0RFVjFfTkFNRQkicnQxMDE1LjEtMDAyOSIKIAotI2RlZmluZSBSVDU2ODJfQ09ERUNfREFJCSJy
dDU2ODItYWlmMSIKLSNkZWZpbmUgUlQ1NjgyX0RFVjBfTkFNRQkicnQ1NjgyLjEtMDAxYSIKLQog
c3RydWN0IG10ODE5Ml9tdDYzNTlfcHJpdiB7CiAJc3RydWN0IHNuZF9zb2NfamFjayBoZWFkc2V0
X2phY2s7CiAJc3RydWN0IHNuZF9zb2NfamFjayBoZG1pX2phY2s7CkBAIC02MjYsMTQgKzYyMywx
MiBAQCBTTkRfU09DX0RBSUxJTktfREVGUyhpMnM3LAogCiBTTkRfU09DX0RBSUxJTktfREVGUyhp
MnM4LAogCQkgICAgIERBSUxJTktfQ09NUF9BUlJBWShDT01QX0NQVSgiSTJTOCIpKSwKLQkJICAg
ICBEQUlMSU5LX0NPTVBfQVJSQVkoQ09NUF9DT0RFQyhSVDU2ODJfREVWMF9OQU1FLAotCQkJCQkJ
ICAgUlQ1NjgyX0NPREVDX0RBSSkpLAorCQkgICAgIERBSUxJTktfQ09NUF9BUlJBWShDT01QX0VN
UFRZKCkpLAogCQkgICAgIERBSUxJTktfQ09NUF9BUlJBWShDT01QX0VNUFRZKCkpKTsKIAogU05E
X1NPQ19EQUlMSU5LX0RFRlMoaTJzOSwKIAkJICAgICBEQUlMSU5LX0NPTVBfQVJSQVkoQ09NUF9D
UFUoIkkyUzkiKSksCi0JCSAgICAgREFJTElOS19DT01QX0FSUkFZKENPTVBfQ09ERUMoUlQ1Njgy
X0RFVjBfTkFNRSwKLQkJCQkJCSAgIFJUNTY4Ml9DT0RFQ19EQUkpKSwKKwkJICAgICBEQUlMSU5L
X0NPTVBfQVJSQVkoQ09NUF9FTVBUWSgpKSwKIAkJICAgICBEQUlMSU5LX0NPTVBfQVJSQVkoQ09N
UF9FTVBUWSgpKSk7CiAKIFNORF9TT0NfREFJTElOS19ERUZTKGNvbm5zeXNfaTJzLApAQCAtMTEx
NCw3ICsxMTA5LDcgQEAgc3RhdGljIGludCBtdDgxOTJfbXQ2MzU5X2NhcmRfc2V0X2JlX2xpbmso
c3RydWN0IHNuZF9zb2NfY2FyZCAqY2FyZCwKIHN0YXRpYyBpbnQgbXQ4MTkyX210NjM1OV9kZXZf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKIAlzdHJ1Y3Qgc25kX3NvY19j
YXJkICpjYXJkOwotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcGxhdGZvcm1fbm9kZSwgKmhkbWlfY29k
ZWMsICpzcGVha2VyX2NvZGVjOworCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcGxhdGZvcm1fbm9kZSwg
KmhkbWlfY29kZWMsICpoZWFkc2V0X2NvZGVjLCAqc3BlYWtlcl9jb2RlYzsKIAlpbnQgcmV0LCBp
OwogCXN0cnVjdCBzbmRfc29jX2RhaV9saW5rICpkYWlfbGluazsKIAlzdHJ1Y3QgbXQ4MTkyX210
NjM1OV9wcml2ICpwcml2OwpAQCAtMTE0Miw2ICsxMTM3LDEzIEBAIHN0YXRpYyBpbnQgbXQ4MTky
X210NjM1OV9kZXZfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJZ290byBl
cnJfc3BlYWtlcl9jb2RlYzsKIAl9CiAKKwloZWFkc2V0X2NvZGVjID0gb2ZfZ2V0X2NoaWxkX2J5
X25hbWUocGRldi0+ZGV2Lm9mX25vZGUsICJoZWFkc2V0LWNvZGVjIik7CisJaWYgKCFoZWFkc2V0
X2NvZGVjKSB7CisJCXJldCA9IC1FSU5WQUw7CisJCWRldl9lcnJfcHJvYmUoJnBkZXYtPmRldiwg
cmV0LCAiUHJvcGVydHkgJ2hlYWRzZXQtY29kZWMnIG1pc3Npbmcgb3IgaW52YWxpZFxuIik7CisJ
CWdvdG8gZXJyX2hlYWRzZXRfY29kZWM7CisJfQorCiAJZm9yX2VhY2hfY2FyZF9wcmVsaW5rcyhj
YXJkLCBpLCBkYWlfbGluaykgewogCQlyZXQgPSBtdDgxOTJfbXQ2MzU5X2NhcmRfc2V0X2JlX2xp
bmsoY2FyZCwgZGFpX2xpbmssIHNwZWFrZXJfY29kZWMsICJJMlMzIik7CiAJCWlmIChyZXQpIHsK
QEAgLTExNTAsNiArMTE1MiwyMCBAQCBzdGF0aWMgaW50IG10ODE5Ml9tdDYzNTlfZGV2X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCQlnb3RvIGVycl9wcm9iZTsKIAkJfQog
CisJCXJldCA9IG10ODE5Ml9tdDYzNTlfY2FyZF9zZXRfYmVfbGluayhjYXJkLCBkYWlfbGluaywg
aGVhZHNldF9jb2RlYywgIkkyUzgiKTsKKwkJaWYgKHJldCkgeworCQkJZGV2X2Vycl9wcm9iZSgm
cGRldi0+ZGV2LCByZXQsICIlcyBzZXQgaGVhZHNldF9jb2RlYyBmYWlsXG4iLAorCQkJCSAgICAg
IGRhaV9saW5rLT5uYW1lKTsKKwkJCWdvdG8gZXJyX3Byb2JlOworCQl9CisKKwkJcmV0ID0gbXQ4
MTkyX210NjM1OV9jYXJkX3NldF9iZV9saW5rKGNhcmQsIGRhaV9saW5rLCBoZWFkc2V0X2NvZGVj
LCAiSTJTOSIpOworCQlpZiAocmV0KSB7CisJCQlkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJl
dCwgIiVzIHNldCBoZWFkc2V0X2NvZGVjIGZhaWxcbiIsCisJCQkJICAgICAgZGFpX2xpbmstPm5h
bWUpOworCQkJZ290byBlcnJfcHJvYmU7CisJCX0KKwogCQlpZiAoaGRtaV9jb2RlYyAmJiBzdHJj
bXAoZGFpX2xpbmstPm5hbWUsICJURE0iKSA9PSAwKSB7CiAJCQlkYWlfbGluay0+Y29kZWNzLT5v
Zl9ub2RlID0gaGRtaV9jb2RlYzsKIAkJCWRhaV9saW5rLT5pZ25vcmUgPSAwOwpAQCAtMTE4MCw2
ICsxMTk2LDggQEAgc3RhdGljIGludCBtdDgxOTJfbXQ2MzU5X2Rldl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCQlkZXZfZXJyX3Byb2JlKCZwZGV2LT5kZXYsIHJldCwgIiVz
IHNuZF9zb2NfcmVnaXN0ZXJfY2FyZCBmYWlsXG4iLCBfX2Z1bmNfXyk7CiAKIGVycl9wcm9iZToK
KwlvZl9ub2RlX3B1dChoZWFkc2V0X2NvZGVjKTsKK2Vycl9oZWFkc2V0X2NvZGVjOgogCW9mX25v
ZGVfcHV0KHNwZWFrZXJfY29kZWMpOwogZXJyX3NwZWFrZXJfY29kZWM6CiAJb2Zfbm9kZV9wdXQo
cGxhdGZvcm1fbm9kZSk7Ci0tIAoyLjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
