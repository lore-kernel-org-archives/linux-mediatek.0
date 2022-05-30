Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 13:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhMyyZ354gnHN+u3iZm12HRKtlUT1aDMNRSYqT9KsJA=; b=VKUjraH8WvU4tD
	lB4bgBer13Sj309WU5vIEHY2wkuazB3BNTrih6+gQomB5JgUrNIE5MeIdXQ5cOQwAcf+U/NsvoQXV
	jlVrbQsSMBeX/wSF4dIIZn0N71GQ7VHLeJGXxJmfvLgwYA5RrHthP+c+uXpDdV/jAfkSlul5WjdPu
	6nKQIdZxo9bwpbSjdpPXPfOueSLyy9jgMDVPt+sxR3zKdpENKO7n4uufu7+Kd4DEhgVoRUtuA1vxu
	NhvSiiQ4GEj5qimRQ7WJjJSWimj3TKH7YVGEHw8QG79Y2Yt8gNiE7HCu5zCXLlCiMjgpLLueeWTKO
	NLYAwzP6OkDYYvX+faUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfj7-006rgt-Cd; Mon, 30 May 2022 13:46:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfY3-006lLi-MA; Mon, 30 May 2022 13:35:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B4C960EC3;
	Mon, 30 May 2022 13:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19738C341C7;
	Mon, 30 May 2022 13:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653917706;
	bh=cB/zmou4JNBatz0EsRvy0e6Im6lxkG/oKJCnqFwoMfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GZUlB9s5JH+JNsIlBG6NEr5Bi6dlYEbiDJdxlsd9nD7LFJuyGz6uWocQRYNPe13Mx
	 q7EVfdlrnfdzpJ9j9a+WpRXf7t9Nb+gNG9bQGIY02Ez4Y+ATzlYFAcmGxGZX+1TEK2
	 /42gvU8ci2U5DXHukHpTK4dR4+IXzfyZNbIQJBXUb72ng5u6eS5qqR7JoIYw2SBjTm
	 uZU5fT3tWXfRW48cN4qIBZSagerussar3tEl5jrvSHCDQswn2KJTERdEexEt75YQFH
	 1R/KK3WCAqeERfS2nPtAoqAlGZqL1GZgTUVCNai3CzCuQeOU1796YH8w+STqhMnPDj
	 YFA/ikA3vy4bg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	hsin-hsiung.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.17 070/135] regulator: mt6315: Enforce regulator-compatible, not name
Date: Mon, 30 May 2022 09:30:28 -0400
Message-Id: <20220530133133.1931716-70-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_063507_799331_A68EF67A 
X-CRM114-Status: GOOD (  12.79  )
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

RnJvbTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgNmQ0MzVhOTRiYTViYjRmMmFkMzgxYzA4MjhmYmFlODljNjZiNTBm
ZSBdCgpUaGUgTVQ2MzE1IFBNSUMgZHQtYmluZGluZyBzaG91bGQgZW5mb3JjZSB0aGF0IG9uZSBv
ZiB0aGUgdmFsaWQKcmVndWxhdG9yLWNvbXBhdGlibGUgaXMgc2V0IGluIGVhY2ggcmVndWxhdG9y
IG5vZGUuIEhvd2V2ZXIgaXQgd2FzCm1pc3Rha2VubHkgbWF0Y2hpbmcgYWdhaW5zdCByZWd1bGF0
b3ItbmFtZSBpbnN0ZWFkLgoKRml4IHRoZSB0eXBvLiBUaGlzIG5vdCBvbmx5IGZpeGVzIHRoZSBj
b21wYXRpYmxlIHZlcmlmaWNhdGlvbiwgYnV0IGFsc28KbGlmdHMgdGhlIHJlZ3VsYXRvci1uYW1l
IHJlc3RyaWN0aW9uLCBzbyB0aGF0IG1vcmUgbWVhbmluZ2Z1bCBuYW1lcyBjYW4KYmUgc2V0IGZv
ciBlYWNoIHBsYXRmb3JtLgoKU2lnbmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjIwNDI5MjAxMzI1LjIyMDU3OTktMS1uZnJhcHJhZG9AY29sbGFib3JhLmNvbQpTaWduZWQt
b2ZmLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9yZWd1bGF0b3IvbXQ2MzE1LXJlZ3VsYXRvci55YW1sICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL210NjMxNS1yZWd1bGF0b3Iu
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZWd1bGF0b3IvbXQ2MzE1
LXJlZ3VsYXRvci55YW1sCmluZGV4IDYxZGQ1YWY4MGRiNi4uNWQyZDk4OWRlODkzIDEwMDY0NAot
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9yL210NjMxNS1y
ZWd1bGF0b3IueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVn
dWxhdG9yL210NjMxNS1yZWd1bGF0b3IueWFtbApAQCAtMzEsNyArMzEsNyBAQCBwcm9wZXJ0aWVz
OgogICAgICAgICAkcmVmOiAicmVndWxhdG9yLnlhbWwjIgogCiAgICAgICAgIHByb3BlcnRpZXM6
Ci0gICAgICAgICAgcmVndWxhdG9yLW5hbWU6CisgICAgICAgICAgcmVndWxhdG9yLWNvbXBhdGli
bGU6CiAgICAgICAgICAgICBwYXR0ZXJuOiAiXnZidWNrWzEtNF0kIgogCiAgICAgYWRkaXRpb25h
bFByb3BlcnRpZXM6IGZhbHNlCi0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
