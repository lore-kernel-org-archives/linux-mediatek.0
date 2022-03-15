Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F80C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ukpaOqS95BTz7JW9i4WmXIZd1aBrhsqXaoN9Zt6Ot4=; b=jizKiFiTcMvwZt
	NN0U7VerG/BJU3pKcDiV9ygcQ4isWh0ILAeTssoUpXVG48B4WBr2AtqB5ZEUDQqSxqLQySPHnOvAg
	JkFqdwvv2NcHnupshbjM00JCIpVKdDX6b4WtiGZlRaTz/AapXZo51oTxG3fDXPIhVcIMu+FITKO+F
	/WJD2oS9boOe4NJ/0D72LhQshLCelL2j1kej9iNR7BbLTRnmyON/gTluZ33vg4QDv7FzyYvDB9VzD
	PmXBuqDw3hI/j7eW9tfo/OaKzHkqstPxT9kshbRrnNgGUtS14msmmxAIB0lhZdCFh2jsnZiZpzoJr
	TFNQyCdcaUpyxQcgh/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUEcC-00AeVt-KS; Tue, 15 Mar 2022 21:22:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUEb9-00Ae0Z-FL; Tue, 15 Mar 2022 21:20:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 964461F42BCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647379252;
 bh=qdT4s8k2Bmbtq4iZ3iouM38/nzELTwmnPF7JPOifUkI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OeBy4qNcs6/B0BhypiDX7M6VKWZ9LYikZyrsTiRYSNdH6Ou81r1jD2cYiYodtoJJ9
 v2XcSQM7mOtFu4qOVidIn9vS9KcgzHpDuawizS7APeT6ljIaef+nhag2WBiPfQ9nFS
 3XRxMphMmITsidT0LgpJpUvCHGHl+PA1VZXjYjrgWAJ+yg5RSexvcW0OtF3FmVWMMS
 orDB5m2HXdey+2Lugil7KoZdE0DcjgzTEXn3/EgCAZuW2agf2wG3flmPAkl1dxQlNw
 S1D5lCWJPbPiV2VWBkz4MQK7QjlxQhzrt77274K6tT8ohIADkopHJF82N/iZZ8tUyR
 FrjC1ikDul7jQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 4/4] dt-bindings: pinctrl: mt8192: Add gpio-line-names
 property
Date: Tue, 15 Mar 2022 17:19:36 -0400
Message-Id: <20220315211936.442708-5-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315211936.442708-1-nfraprado@collabora.com>
References: <20220315211936.442708-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_142055_688859_57BDA770 
X-CRM114-Status: UNSURE (   8.70  )
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

QWRkIHRoZSBncGlvLWxpbmUtbmFtZXMgb3B0aW9uYWwgcHJvcGVydHkgdG8gdGhlIHBpbmN0cmwt
bXQ4MTkyIGJpbmRpbmcKdG8gcHJldmVudCBkdF9iaW5kaW5nX2NoZWNrIHdhcm5pbmdzIHdoZW4g
aXQgaXMgcHJlc2VudCBpbiB0aGUgcGluY3RybApub2RlIGluIHRoZSBEZXZpY2V0cmVlLgoKU2ln
bmVkLW9mZi1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEu
Y29tPgotLS0KCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9waW5j
dHJsLW10ODE5Mi55YW1sIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3Bp
bmN0cmwtbXQ4MTkyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGlu
Y3RybC9waW5jdHJsLW10ODE5Mi55YW1sCmluZGV4IGUyN2NiY2M2ZThmOS4uYzkwYTEzMmZiYzc5
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9w
aW5jdHJsLW10ODE5Mi55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9waW5jdHJsL3BpbmN0cmwtbXQ4MTkyLnlhbWwKQEAgLTI5LDYgKzI5LDggQEAgcHJvcGVydGll
czoKICAgICBkZXNjcmlwdGlvbjogZ3BpbyB2YWxpZCBudW1iZXIgcmFuZ2UuCiAgICAgbWF4SXRl
bXM6IDEKIAorICBncGlvLWxpbmUtbmFtZXM6IHRydWUKKwogICByZWc6CiAgICAgZGVzY3JpcHRp
b246IHwKICAgICAgIFBoeXNpY2FsIGFkZHJlc3MgYmFzZSBmb3IgZ3BpbyBiYXNlIHJlZ2lzdGVy
cy4gVGhlcmUgYXJlIDExIEdQSU8KLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
