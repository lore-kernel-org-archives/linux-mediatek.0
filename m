Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D853AC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Feb 2022 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tV1FOf7Whlah9YGNFtUEWigWeXSFKYxO7wCiVBUjJBA=; b=1LicX3mr6JY4te
	TWSCztjzn0nq4hjFnAELuMnnT50hfQ2miHQCsZ8EGDb0tpv6r6vXFqblHsaY0veg1CHJif5woc/5V
	947JwwG2KGHgZDPlwvtD+cagJiPi/io/XnhiTj6BHXAqS1sjKr4UnLi6dLMcd5cR1ejQTASfh2+x2
	Vn4MmRpVrnyz9m/EOHA9+9M0dW3tI9TfNpAVJCl0TpaOkqyxQvtUwGpaORIB1087MJXv0vTqiKPFh
	W6mLVPzrvP1fIAFiWBegfdSYN3I+7HQCbBwoLaDoGObqT7Z/KrPXsz91c8oRVWVA/KAOD2QEA3Lc2
	g485b0IWD3XbZViyBtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nExFZ-00DFUE-W1; Tue, 01 Feb 2022 17:47:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nExFN-00DFSc-Jb; Tue, 01 Feb 2022 17:47:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 2A7BB1F42600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643737633;
 bh=OkkKZ3FYGEgZTul8yQpicqMp2cbfoH6C3I3tztPrqUE=;
 h=From:To:Cc:Subject:Date:From;
 b=hhxrF6mDNLVvBLQEG5CZ0rtWouQinB10zZriDIzvQiUtWwiwTDrhUYVvhq/XMMH4q
 BFSiI7qDHgjKNmMhMI+zZ1vQP5vpsDh4Qpwf5SEqlPKirc1S2SaEvuHmR1vOyW2t6A
 RoHYC3xbgJ03Ej7OVTweS9iVSs3eLk7SMjvEPJSAeNF5cNlqoaBKlWMm2ZLm3YRGH5
 K3oe2skX2hmB5B/hOtEu9LI/M2DtfI6rozcqna3Qq0olGDw1nkYfXC6Q7qT6Rf37X0
 6rrn3BAxCUle9me82u5XkhqKy9fi2ZUSsMEhUsCVG0ttDNCUNNllCnvdGHn+qngWek
 dkBkuo1rGOGzw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Robert Foss <robert.foss@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Cc: kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2] arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's
 DSI endpoint
Date: Tue,  1 Feb 2022 12:46:43 -0500
Message-Id: <20220201174643.843102-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_094717_821721_0219CBD9 
X-CRM114-Status: GOOD (  11.84  )
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

bXQ4MTgzLWt1a3VpLWphY3V6emkgaGFzIGFuIGFueDc2MjUgYnJpZGdlIGNvbm5lY3RlZCB0byB0
aGUgb3V0cHV0IG9mCml0cyBEU0kgaG9zdC4gSG93ZXZlciwgYWZ0ZXIgY29tbWl0IGZkMDMxMGI2
ZmU3ZCAoImRybS9icmlkZ2U6IGFueDc2MjU6CmFkZCBNSVBJIERQSSBpbnB1dCBmZWF0dXJlIiks
IGEgYnVzLXR5cGUgcHJvcGVydHkgc3RhcnRlZCBiZWluZyByZXF1aXJlZAppbiB0aGUgZW5kcG9p
bnQgbm9kZSBieSB0aGUgZHJpdmVyIHRvIGluZGljYXRlIHdoZXRoZXIgaXQgaXMgRFNJIG9yIERQ
SS4KCkFkZCB0aGUgbWlzc2luZyBidXMtdHlwZSBwcm9wZXJ0eSBhbmQgc2V0IGl0IHRvIDUKKFY0
TDJfRldOT0RFX0JVU19UWVBFX1BBUkFMTEVMKSBzbyB0aGF0IHRoZSBkcml2ZXIgaGFzIGl0cyBp
bnB1dApjb25maWd1cmVkIHRvIERTSSBhbmQgdGhlIGRpc3BsYXkgcGlwZWxpbmUgY2FuIHByb2Jl
IGNvcnJlY3RseS4KCldoaWxlIGF0IGl0LCBhbHNvIHNldCB0aGUgZGF0YS1sYW5lcyBwcm9wZXJ0
eSB0aGF0IHdhcyBhbHNvIGludHJvZHVjZWQKaW4gdGhhdCBzYW1lIGNvbW1pdCwgc28gdGhhdCB3
ZSBkb24ndCByZWx5IG9uIHRoZSBkZWZhdWx0IHZhbHVlLgoKRml4ZXM6IGZkMDMxMGI2ZmU3ZCAo
ImRybS9icmlkZ2U6IGFueDc2MjU6IGFkZCBNSVBJIERQSSBpbnB1dCBmZWF0dXJlIikKU2lnbmVk
LW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29t
PgoKLS0tCnYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjAxMjAyMjQyMDQuNzcz
MTE3LTEtbmZyYXByYWRvQGNvbGxhYm9yYS5jb20KCkNoYW5nZXMgaW4gdjI6Ci0gKHRoYW5rcyBS
b2IpIFVzZSBwcm9wZXIgZm9ybWF0IHdoZW4gcmVmZXJpbmcgdG8gY29tbWl0IGluIGNvbW1pdAog
IG1lc3NhZ2UgYXMgcG9pbnRlZCBvdXQgYnkgY2hlY2twYXRjaAoKIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTgzLWt1a3VpLWphY3V6emkuZHRzaSB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE4My1rdWt1aS1qYWN1enppLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE4My1rdWt1aS1qYWN1enppLmR0c2kKaW5kZXggOGY3YmYzM2Y2MDdkLi5lOGYx
MzNkYzk2YjkgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgz
LWt1a3VpLWphY3V6emkuZHRzaQorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210
ODE4My1rdWt1aS1qYWN1enppLmR0c2kKQEAgLTE3MSw2ICsxNzEsOCBAQCBwb3J0QDAgewogCiAJ
CQlhbng3NjI1X2luOiBlbmRwb2ludCB7CiAJCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZkc2lfb3V0
PjsKKwkJCQlidXMtdHlwZSA9IDw1PjsKKwkJCQlkYXRhLWxhbmVzID0gPDAgMSAyIDM+OwogCQkJ
fTsKIAkJfTsKIAotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
