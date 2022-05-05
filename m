Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E41C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBeTf4NzKytv1qnKZD3RRw7PJFNOUjsdgn7dLsk7tig=; b=o4j87xrBCsMy1L
	sZYzFi2Alb361x0Dfpbt6LKzGnG8LtA6qFNWjr7WhV0OFbT7YbhGhrwIa5iCghRnGW0GzjFiPIfmL
	Q5Q4/Ekqe2KyNzrag3hq03pT40nLuYHxpk9CAzeZ4iw++cA9YGxBFDRDapqUdL+Ema5IgpiD3o6zG
	JFu8L7QBAyU6r3jKO3I61lL1FxvilZouh9asB1nT53xIPc+G+pOY0j6cELGzxSSPCMERbGHUm6jEQ
	NfB5yVJF8gYSBRjuyamTsXJd/0z9MDMOWsOBiQAPxTmZjyKeawnqx+lwjbgaDyhZdpOwitTyWl7cK
	oytYH0erW5mF6TAsZa6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhSk-00HZFg-Fo; Thu, 05 May 2022 19:48:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQs-00HXnp-6L; Thu, 05 May 2022 19:46:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 1B9571F45CCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651779997;
 bh=T51OK/vVhW36JlunHPrBRDVW5Rm5AifIL1V8W6fBY8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FsRnU6UG3UgTCz1SocvQc9D26+Rih/z1frhQXpJMHYd3Jr6cX/jBWl8/5/3EsATUI
 rx9M01vWO6o7C6w3BIU4sFNFND3/66m3LmoPMFMzJ8I68t0YwEQnYlnlUVO9EwM4va
 lpR8Qopc5wGhBIWVVxH2JFNIbxbJaHSCCcCVcu7ngtznSl87qThvwgrHHJjc74KNJT
 z4CSPH+pH6nuxckVLbSr2e5kTfRNbBulrzQDGerPmxHIfhhJKUgXqdUzKNM6gaTFbA
 je2Le7PNhrO21y/z/GNYT1ZxhBoG7Kv+r15OeOPxYbyMN5UvQ1BCuo+DZ4ri/V07Kf
 SbJhrPNPAcLtA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 08/16] arm64: dts: mediatek: asurada: Add keyboard mapping
 for the top row
Date: Thu,  5 May 2022 15:45:42 -0400
Message-Id: <20220505194550.3094656-9-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124638_407370_944E0355 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

Q2hyb21lYm9va3MnIGVtYmVkZGVkIGtleWJvYXJkcyBkaWZmZXIgZnJvbSBzdGFuZGFyZCBsYXlv
dXRzIGZvciB0aGUKdG9wIHJvdyBpbiB0aGF0IHRoZXkgaGF2ZSBzaG9ydGN1dHMgaW4gcGxhY2Ug
b2YgdGhlIHN0YW5kYXJkIGZ1bmN0aW9uCmtleXMuIE1hcCB0aGVzZSBrZXlzIHRvIGFjaGlldmUg
dGhlIGZ1bmN0aW9uYWxpdHkgdGhhdCBpcyBwaWN0dXJlZCBvbgp0aGUgcHJpbnRvdXRzLgoKU2ln
bmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEu
Y29tPgpSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2Fj
Y2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KLS0tCgoobm8gY2hhbmdlcyBzaW5jZSB2MSkK
CiAuLi4vYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSAgICAgfCAyOSArKysr
KysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQppbmRleCA2
NjIyMDdkMGViNzUuLmExY2JmN2EzNzViNiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
bWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQpAQCAtNTI1LDMgKzUyNSwzMiBAQCAmdWFydDAg
ewogCiAjaW5jbHVkZSA8YXJtL2Nyb3MtZWMta2V5Ym9hcmQuZHRzaT4KICNpbmNsdWRlIDxhcm0v
Y3Jvcy1lYy1zYnMuZHRzaT4KKworJmtleWJvYXJkX2NvbnRyb2xsZXIgeworCWZ1bmN0aW9uLXJv
dy1waHlzbWFwID0gPAorCQlNQVRSSVhfS0VZKDB4MDAsIDB4MDIsIDApCS8qIFQxICovCisJCU1B
VFJJWF9LRVkoMHgwMywgMHgwMiwgMCkJLyogVDIgKi8KKwkJTUFUUklYX0tFWSgweDAyLCAweDAy
LCAwKQkvKiBUMyAqLworCQlNQVRSSVhfS0VZKDB4MDEsIDB4MDIsIDApCS8qIFQ0ICovCisJCU1B
VFJJWF9LRVkoMHgwMywgMHgwNCwgMCkJLyogVDUgKi8KKwkJTUFUUklYX0tFWSgweDAyLCAweDA0
LCAwKQkvKiBUNiAqLworCQlNQVRSSVhfS0VZKDB4MDEsIDB4MDQsIDApCS8qIFQ3ICovCisJCU1B
VFJJWF9LRVkoMHgwMiwgMHgwOSwgMCkJLyogVDggKi8KKwkJTUFUUklYX0tFWSgweDAxLCAweDA5
LCAwKQkvKiBUOSAqLworCQlNQVRSSVhfS0VZKDB4MDAsIDB4MDQsIDApCS8qIFQxMCAqLworCT47
CisJbGludXgsa2V5bWFwID0gPAorCQlNQVRSSVhfS0VZKDB4MDAsIDB4MDIsIEtFWV9CQUNLKQor
CQlNQVRSSVhfS0VZKDB4MDMsIDB4MDIsIEtFWV9SRUZSRVNIKQorCQlNQVRSSVhfS0VZKDB4MDIs
IDB4MDIsIEtFWV9aT09NKQorCQlNQVRSSVhfS0VZKDB4MDEsIDB4MDIsIEtFWV9TQ0FMRSkKKwkJ
TUFUUklYX0tFWSgweDAzLCAweDA0LCBLRVlfU1lTUlEpCisJCU1BVFJJWF9LRVkoMHgwMiwgMHgw
NCwgS0VZX0JSSUdIVE5FU1NET1dOKQorCQlNQVRSSVhfS0VZKDB4MDEsIDB4MDQsIEtFWV9CUklH
SFRORVNTVVApCisJCU1BVFJJWF9LRVkoMHgwMiwgMHgwOSwgS0VZX01VVEUpCisJCU1BVFJJWF9L
RVkoMHgwMSwgMHgwOSwgS0VZX1ZPTFVNRURPV04pCisJCU1BVFJJWF9LRVkoMHgwMCwgMHgwNCwg
S0VZX1ZPTFVNRVVQKQorCisJCUNST1NfU1REX01BSU5fS0VZTUFQCisJPjsKK307Ci0tIAoyLjM2
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
