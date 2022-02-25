Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4B8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 23:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlJ71xhvp+Kp/ml2oekB7Mc9S/HZiQdnTu9f8+DITys=; b=YAUgQhs8rnAUQt
	i91uqY71ZBOTO/gGClsfRXU9pOGE4fkBYLYj9AGrdimZ+TizUFomAQo7mnsmGbhsZaaRkmONIOO4n
	UqdEgBNcckiXv9g9vxy67Rh2fTvaH+NSC7K5wPymNwMow7W9jaEX5q6eUUGIjzlQ3tC+C9lYOIUvC
	FGXtYNFsk6Oek1qHkOLObw+at8cEXfrZTCPE6O7gmMXvmF25qUrVERl1TuYX3TQH0Ad1/tiU4wfcs
	emSEjFuE2kJoKhi7pivN0KGKKPx2IWKyKpQvUeyQ8i3D0HlYD+jeeODjDaFEZGt83pUj3sRXABP5x
	lMNjWhBTzRrV+SQkDWPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNjZR-0079IG-Ud; Fri, 25 Feb 2022 23:00:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNjYu-00793u-2k; Fri, 25 Feb 2022 22:59:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 6C8B21F46806
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645829982;
 bh=nr1KVl2X25oUfWhFk5/6RiJ6luvzbcYX7imnkK6NuYk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n8mZqCzJ8n/gjPmuBLhnWNCCV83zAMAuM91qaZHehEhei06y/9z4lXA1OexfjTcZa
 H4pia2ycWxBrINxiMTHi8nUpGTuz/4zTcZjX3XMhoQ0aRlfAgiYVKk6cZkudgZHnOb
 Yj0U1ym2lpo7l6Ova/NdYa8hqswmA07JOmunrVSAgzX/dezujbDrgKJt1Fynj5Ybb/
 Fu8z7bXwo9/SvgYeC0PJ5Y4CiTk3XmzzWTuldSVFt679Sq6XrTr353IdnfjtdH2xlS
 AjfydbzoE/8dpW8n5fRNYKsEOMPWXXs9+TlauJC03J5JeBBmBNfcpxfGaeMXYafYpr
 PFaSW2kMcjShg==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: usb: mtk-xhci: Allow wakeup
 interrupt-names to be optional
Date: Fri, 25 Feb 2022 17:58:53 -0500
Message-Id: <20220225225854.81038-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225225854.81038-1-nfraprado@collabora.com>
References: <20220225225854.81038-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_145944_299411_E15ED2E9 
X-CRM114-Status: UNSURE (   8.80  )
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

QWRkIG1pc3NpbmcgJ21pbkl0ZW1zOiAxJyB0byB0aGUgaW50ZXJydXB0LW5hbWVzIHByb3BlcnR5
IHRvIGFsbG93IHRoZQpzZWNvbmQgaW50ZXJydXB0LW5hbWVzLCAnd2FrZXVwJywgdG8gYmUgb3B0
aW9uYWwuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+Ci0tLQoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91
c2IvbWVkaWF0ZWssbXRrLXhoY2kueWFtbCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9tZWRpYXRlayxtdGsteGhjaS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1sCmluZGV4IDQxZWZiNTE2MzhkMS4uZjA2OWMx
ZDc3ZTYyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L21lZGlhdGVrLG10ay14aGNpLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9tZWRpYXRlayxtdGsteGhjaS55YW1sCkBAIC01Niw2ICs1Niw3IEBAIHByb3Bl
cnRpZXM6CiAgICAgICAtIGRlc2NyaXB0aW9uOiBvcHRpb25hbCwgd2FrZXVwIGludGVycnVwdCB1
c2VkIHRvIHN1cHBvcnQgcnVudGltZSBQTQogCiAgIGludGVycnVwdC1uYW1lczoKKyAgICBtaW5J
dGVtczogMQogICAgIGl0ZW1zOgogICAgICAgLSBjb25zdDogaG9zdAogICAgICAgLSBjb25zdDog
d2FrZXVwCi0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
