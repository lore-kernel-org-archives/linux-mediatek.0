Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E180DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 17:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YFRFYao1ZqGl33q5cc1LPwGGffTWdF4pm871enaVv8=; b=o5LTvTJzlcNQlQ
	gNNP/QQZvsmE23vmzSAdsDF1Sqd7g4xljPIhTJkCfqZwcobrXuYOkWJBN3gVK8HqHB0D+p08LzsuG
	YW1Y6wt+Ss4yqNlDnz/I3q8POOUSX1oQbww2X3XGiYbVDegZGS28xGc0w4IfPYzFPAHmGOyI54PCX
	cM4SeqPfZc+NqXuHIkWaVBN24KQVBcs9vVqOVUo3nyycXwmmo5cmgFJgy4x4e3I/vZ7zBDh5ovek+
	Lz9aQQjvNmk3N/kGo3kINM75i1g5bLU0NXMFIWEsv7gQOx03ZXOP09JUrBP28wySA0gM2/epBS/G0
	Ywc1hLhNKqF62By80ILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3Vh-006fgw-9v; Thu, 14 Apr 2022 17:44:01 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3S8-006dfg-GS; Thu, 14 Apr 2022 17:40:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649958013; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SxT+YysqHldEASIpwf+tgvOGcVdWDRXovqqKgD0hLrA7ET3Oszn2HcnWPrDDe36kh6ikPi1NC7YXD9lS70UP0mXHRAUkjyhiU6wzX/3nVgJVsxo6UMrSUGxdbZcwTqfebE1IgPu0OHiKfwsf/ScaxLbzD+FwrgmjIK9nTyB8jBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649958013;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=NG1xjMeRvySQG6QrVBIRKQOBl6ROVJFrGcd25yzx2/k=; 
 b=AH52jsCC0XdOv8tm5kgTUdB3ZP1WbXMQZFDpd8o1pyZgks4dLwctGI8R3kcpbD0kx6V9a6Vla2wVVxqU+deD8Q/D9gfGLfX23V/GYfmak/Notx65PyBhivvGApxKEheHts3cY/ThNBOg0eLYfmidKti9wzhhQhoLSvOTCz2oYI4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649958013; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=NG1xjMeRvySQG6QrVBIRKQOBl6ROVJFrGcd25yzx2/k=;
 b=JrskM3nhTEfYpOqLfbJH0NzrxUmKDl2KP50GspS53tmUJE8rLQkZabkOwgyycfyc
 khDvq4C7yyETDQtvOOrEYkIynQJ5R0ivD4lDbfA4/R8ib9z1YG1vdINhkVD1edFvZfr
 SXGmjBQT46aVmQEYbcR8V6OCjnIG6NXTr0NHy0XM=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649958012254748.8245005807139;
 Thu, 14 Apr 2022 10:40:12 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joe Perches <joe@perches.com>
Cc: erkin.bozoglu@xeront.com,
 =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v2 08/14] MAINTAINERS: add Ralink pinctrl driver
Date: Thu, 14 Apr 2022 20:39:10 +0300
Message-Id: <20220414173916.5552-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414173916.5552-1-arinc.unal@arinc9.com>
References: <20220414173916.5552-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_104020_638864_A2BABF0E 
X-CRM114-Status: UNSURE (   9.89  )
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

QWRkIGEgbmV3IHNlY3Rpb24gZm9yIHRoZSBSYWxpbmsgcGluY3RybCBkcml2ZXIgYW5kIGFkZCBt
ZSBhbmQgU2VyZ2lvIGFzCnRoZSBtYWludGFpbmVycy4KClNpZ25lZC1vZmYtYnk6IEFyxLFuw6cg
w5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KUmV2aWV3ZWQtYnk6IFNlcmdpbyBQYXJhY3Vl
bGxvcyA8c2VyZ2lvLnBhcmFjdWVsbG9zQGdtYWlsLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDcg
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01B
SU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZmQ3NjhkNDNlMDQ4Li4yN2JmZWNhYTAwYWUg
MTAwNjQ0Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xNjUwMiw2ICsx
NjUwMiwxMyBAQCBMOglsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwogUzoJTWFpbnRhaW5lZAog
RjoJYXJjaC9taXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEqCiAKK1JBTElOSyBQSU5DVFJMIERS
SVZFUgorTToJQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgorTToJU2VyZ2lv
IFBhcmFjdWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29tPgorTDoJbGludXgtbWlw
c0B2Z2VyLmtlcm5lbC5vcmcKK1M6CU1haW50YWluZWQKK0Y6CWRyaXZlcnMvcGluY3RybC9yYWxp
bmsvCisKIFJBTElOSyBSVDJYMDAgV0lSRUxFU1MgTEFOIERSSVZFUgogTToJU3RhbmlzbGF3IEdy
dXN6a2EgPHN0Zl94bEB3cC5wbD4KIE06CUhlbG11dCBTY2hhYSA8aGVsbXV0LnNjaGFhQGdvb2ds
ZW1haWwuY29tPgotLSAKMi4yNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
