Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0095FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m52svjd14Lj7biC6gMYvF/OAulAso/lt9ugIU4a6Xdk=; b=za+eRuoqJPNbVz
	TK2RLAQv2Y3DZ2jfhqeuNx8bteTtsVXaMTlL1wQ6qhhJc2GG70fgHLBpUY5Y9blMuWok8gEnVLQ4g
	MTyUzY4g0szJDxv2V+FhvhYPxYxbrQfZcg3hHFnqWAMSwlKGzpEIbbdt6e8qHw7KuwnizHiqv1EqQ
	ivlQxfv1RM7kipL5PHF8VLYCW5jUp7GE07li6xTvdurzymxU6rOnUf3RaYCHLOWoXDt/MFmqtkCjB
	kV9sDKHEplYyVQzYjPM93YBo3uDHBBmN8geTjkgyCVy3Nnxd85ankTGtUOr5jvU19LdQqTXzL351P
	VUhDuhZ65qRuDZU32xbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhTe-00HZs7-0O; Thu, 05 May 2022 19:49:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQy-00HXtF-IU; Thu, 05 May 2022 19:46:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id D308A1F45CD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651780003;
 bh=Dj7vGkYC2BwaxdlFtxv9aMWMtotDYi0t1OanA82gQVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ob34YrajdxH8LFFr/Uzcr6LQXBusD66HfS6+XCkQgwF+9I7/dqzTSip4UumJ4ElDm
 4gctg/6716y5yLvdh//RAFfzEe8J6t0Ncmt/4HFojagHFvLoK04+slvMT7QaTb2lKE
 qGQcN6oGcWHVmnXfQLuKrvPsz3uE/IUGlkqv4X1JErzfPjIv0qPZka/2oz0Myn9dlb
 M4QnLgRAtia18gCJqu6J3PJ5UTWtGu96zvoHzyKo0/Ac5R1zUEUOTC5LGC4yin5Q+c
 3gij+MxiX93X0p3kLNn+a8K63GVV75bhsOXAPlctkv1Vx8K01hRGrRMeoPUA1SxjYx
 8HbVB94qzSN7w==
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
Subject: [PATCH v2 10/16] arm64: dts: mediatek: asurada: Add Elan eKTH3000 I2C
 trackpad
Date: Thu,  5 May 2022 15:45:44 -0400
Message-Id: <20220505194550.3094656-11-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505194550.3094656-1-nfraprado@collabora.com>
References: <20220505194550.3094656-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124644_806136_270168A5 
X-CRM114-Status: UNSURE (   9.44  )
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBFbGFuIGVLVEgzMDAwIGkyYyB0cmFja3BhZCBwcmVzZW50IG9u
IEFzdXJhZGEuIEl0IGlzCmNvbm5lY3RlZCB0byB0aGUgSTJDMiBidXMgYW5kIGhhcyBhZGRyZXNz
IDB4MTUuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRv
QGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgotLS0KCihubyBjaGFuZ2Vz
IHNpbmNlIHYxKQoKIC4uLi9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpICAg
ICAgfCAxOCArKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1
cmFkYS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5k
dHNpCmluZGV4IDUyMjFmMWQxYjdkYy4uYTE1ZTg0ZDg2NDQ5IDEwMDY0NAotLS0gYS9hcmNoL2Fy
bTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLmR0c2kKKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpCkBAIC0xMDksNiArMTA5LDE2
IEBAICZpMmMyIHsKIAljbG9jay1zdHJldGNoLW5zID0gPDEyNjAwPjsKIAlwaW5jdHJsLW5hbWVz
ID0gImRlZmF1bHQiOwogCXBpbmN0cmwtMCA9IDwmaTJjMl9waW5zPjsKKworCXRyYWNrcGFkQDE1
IHsKKwkJY29tcGF0aWJsZSA9ICJlbGFuLGVrdGgzMDAwIjsKKwkJcmVnID0gPDB4MTU+OworCQlp
bnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZwaW8gMTUgSVJRX1RZUEVfTEVWRUxfTE9XPjsKKwkJcGlu
Y3RybC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJcGluY3RybC0wID0gPCZ0cmFja3BhZF9waW5zPjsK
KwkJdmNjLXN1cHBseSA9IDwmcHAzMzAwX3U+OworCQl3YWtldXAtc291cmNlOworCX07CiB9Owog
CiAmaTJjMyB7CkBAIC00NDAsNiArNDUwLDE0IEBAIHBpbnMtYnVzIHsKIAkJCWJpYXMtZGlzYWJs
ZTsKIAkJfTsKIAl9OworCisJdHJhY2twYWRfcGluczogdHJhY2twYWQtZGVmYXVsdC1waW5zIHsK
KwkJcGlucy1pbnQtbiB7CisJCQlwaW5tdXggPSA8UElOTVVYX0dQSU8xNV9fRlVOQ19HUElPMTU+
OworCQkJaW5wdXQtZW5hYmxlOworCQkJbWVkaWF0ZWsscHVsbC11cC1hZHYgPSA8Mz47CisJCX07
CisJfTsKIH07CiAKICZzcGkxIHsKLS0gCjIuMzYuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
