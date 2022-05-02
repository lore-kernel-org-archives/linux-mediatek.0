Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8925AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJk3w1S+hHv2v+lZGfzdOca3VFDIfzacUwSDzp0iw0k=; b=hlhr9BeAluLqzf
	XWexVfjLHrLTNjwdjhPd2Qnq1GxaaiB78YvkpTzqIaLVj9X8nVmypELmGzKVVlU9qOJ/cOX22RJrp
	OuIaG7+syJvtScrKBLTWLb8UBmaT//T5k5YdG8uYUpvXkLwOQhEZDlffGg4JLslevhfSVm9VFxsig
	JdVJVyLE2xNEon7ao5Pz315YOTs4+0XARLpjxqo3z2j2bw7BaIUkQOJplRi80MfM6MnPNcH1XTpK0
	En5MEnoe93vlFn8R2Q8t71d5NDGgQNmeVAoBoZ1IA/3FzU23tJ7U4dTbvAdxPJzGZoo1Jv0/HuMQM
	cmJEDgKHiRvLV4XwrsRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlbf8-002NSm-7A; Mon, 02 May 2022 19:24:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlben-002NKq-G2; Mon, 02 May 2022 19:24:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id E2D341F43621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651519466;
 bh=vHihAny00/plbHUVJRmkYGyvszXuKSJzxYZuye6XI3w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JpQqhjaAxa5faEQtAsKCmgXiugtsTXMLqjEWTrs1HlSSGtpuwbTN9iX+Cz0kOJaFa
 ZbKr4bnDb/xWp9p9PRJAUgU8IIQTNBdovEiIorjCTjd+zecDsy04ZLW1XgutGmgAC2
 XJllqbTfFdIyc2n+WRIJBaip0pUk111qe3FePJ/LD0aqGP8zLdaYvZMpqL2j6Kk/y8
 zLiL+kz4CbpPBDM9zBpEWdhBJey8fpSq+hWjFxxEi/aJBIHkj5xISEpA6LUy0zJ6g4
 v4P1W0vsxxMgxHwfGWREJScjhQajlJlsqBJ7H1JIuMEBk9rSsIxCfQZWRymkIkSpP+
 fdfY++J7xgZkw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: remoteproc: mediatek: Fix optional
 reg-names for mtk, scp
Date: Mon,  2 May 2022 15:24:19 -0400
Message-Id: <20220502192420.2548512-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220502192420.2548512-1-nfraprado@collabora.com>
References: <20220502192420.2548512-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_122429_702567_D3B1C8AB 
X-CRM114-Status: GOOD (  10.16  )
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

VGhlIFNDUCBoYXMgdGhyZWUgbWVtb3J5IHJlZ2lvbnM6IHNyYW0sIGwxdGNtIGFuZCBjZmcuIE9u
bHkgc3JhbSBpcwpyZXF1aXJlZCwgdGhlIG90aGVyIHR3byBhcmUgb3B0aW9uYWwuIEZpeCB0aGUg
ZHQtYmluZGluZyBzbyB0aGF0IHRoZQpvcHRpb25hbCByZWdpb25zIGNhbiBiZSBvbWl0dGVkIGFu
ZCBwYXNzZWQgaW4gYW55IG9yZGVyLgoKQWxzbyBhZGQgdGhlIG1pc3NpbmcgbWluSXRlbXMgdG8g
dGhlIHJlZyBwcm9wZXJ0eSBhbmQgdXBkYXRlIHRoZQpkZXNjcmlwdGlvbi4KClNpZ25lZC1vZmYt
Ynk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KCi0t
LQoKKG5vIGNoYW5nZXMgc2luY2UgdjEpCgogLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3Rl
cHJvYy9tdGssc2NwLnlhbWwgICAgICB8IDEyICsrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwKaW5kZXgg
ODIzYTIzNjI0MmRlLi5lYzlkZGViNmNhMmMgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnlhbWwKQEAgLTI0LDE0
ICsyNCwyMCBAQCBwcm9wZXJ0aWVzOgogICByZWc6CiAgICAgZGVzY3JpcHRpb246CiAgICAgICBT
aG91bGQgY29udGFpbiB0aGUgYWRkcmVzcyByYW5nZXMgZm9yIG1lbW9yeSByZWdpb25zIFNSQU0s
IENGRywgYW5kCi0gICAgICBMMVRDTS4KKyAgICAgIEwxVENNLiBPbmx5IFNSQU0gaXMgcmVxdWly
ZWQsIHdoaWxlIENGRyBhbmQgTDFUQ00gYXJlIG9wdGlvbmFsLgorICAgIG1pbkl0ZW1zOiAxCiAg
ICAgbWF4SXRlbXM6IDMKIAogICByZWctbmFtZXM6CisgICAgbWluSXRlbXM6IDEKICAgICBpdGVt
czoKICAgICAgIC0gY29uc3Q6IHNyYW0KLSAgICAgIC0gY29uc3Q6IGNmZwotICAgICAgLSBjb25z
dDogbDF0Y20KKyAgICAgIC0gZW51bToKKyAgICAgICAgICAtIGwxdGNtCisgICAgICAgICAgLSBj
ZmcKKyAgICAgIC0gZW51bToKKyAgICAgICAgICAtIGwxdGNtCisgICAgICAgICAgLSBjZmcKIAog
ICBjbG9ja3M6CiAgICAgZGVzY3JpcHRpb246Ci0tIAoyLjM2LjAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
