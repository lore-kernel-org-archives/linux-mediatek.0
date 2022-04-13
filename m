Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8EFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 06:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGFdYwxsUigS1pP0jOkFJEu5zQuD+PQDP5JElEDRZBQ=; b=eOwfaIm8zcKios
	z84rjpV+0/5x/WQ9vTqaQaKucJf6pQspPtqijSk2dTDZOz/1x702QNEau/aowgMznnzXgxM7QOehk
	Wzzaf3HBP6470ArEBx2chUpk86gd1oOp2EYBgmOpKSTg66zrCUCe3dQ3VWtWbJv1taZRDnTDm/Tqg
	93WaOp/bHUiVLXlseQ8N+bzPVJgSM3Ynq5BzKwH9lwLFWBMZh4f+lTrCqjTyGUVNbrh805IWZwbTD
	p+lVMAJMNeva222YnTr3zwO8MdX8hUJExcrKkyy7f3zaJsZDlr43FKwie/3pvhvU9utgjimmKDtaR
	wV3G4Mz9iJqEvVypVLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neWIL-00H4Fe-E3; Wed, 13 Apr 2022 06:16:01 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neWBC-00H0ln-8y; Wed, 13 Apr 2022 06:08:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649830109; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GZgJzAj84MkQLWH09OwLISskLWuQeAVaNJijhuQHMFsS/xzv6LFRcPiCqpMkhD1pt2qLQN0/GuCFvW5T+5Li/R6jRjY/2U4wokTMvq0aXoP6N3Gg7xKhfvLSr7of9kf7VYnmUd2ozaNtEXR1FXpDfkuEVEvtLxARKWKx+7kMwJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649830109;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=YE6b1mo8I5azClKQbd0b86QgxZKJjLu5JgfZBC1QyRE=; 
 b=WZ8W4EbwI3lgFD4RJZUKzagDncGXgy66CS7ZnuaCBMUil9uahq1w2Ev1ifEcSYJsepqcwSg+nkEaYjJ5iE50+JEDdCvX3t9n9EUY32SRkb1OlzIt41KJrGslycAYlHxkX4FSkWHQtKVyAqIQgF3v9zsGFwVYxGD+/7mogv53lew=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649830109; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
 bh=YE6b1mo8I5azClKQbd0b86QgxZKJjLu5JgfZBC1QyRE=;
 b=Lg8Kg6NuECM6lv2h2GGM73CLqjmGRkRaW88+6CmB3D8G9sjF/prZ/q8NvZEUBjJe
 WJqgB/3yCJL5Lqf7q6B8iBloe7gVd7QKG6CNiKiPjUqcGKS9qpVk/5SOcb+w1RUPXAN
 GDKgrWPzpsvAgYhjSM5axeIEwx79T1AbVPEFSxyY=
Received: from arinc9-PC.localdomain (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 1649830108091536.530591428714;
 Tue, 12 Apr 2022 23:08:28 -0700 (PDT)
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
Subject: [PATCH 08/14] MAINTAINERS: add Ralink pinctrl driver
Date: Wed, 13 Apr 2022 09:07:23 +0300
Message-Id: <20220413060729.27639-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413060729.27639-1-arinc.unal@arinc9.com>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_230838_424044_D4BBCFD6 
X-CRM114-Status: UNSURE (   9.96  )
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
w5xOQUwgPGFyaW5jLnVuYWxAYXJpbmM5LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlO
RVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggZmQ3NjhkNDNlMDQ4Li5jYmQwYzNlMTgwYmYgMTAwNjQ0
Ci0tLSBhL01BSU5UQUlORVJTCisrKyBiL01BSU5UQUlORVJTCkBAIC0xNjUwMiw2ICsxNjUwMiwx
MyBAQCBMOglsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwogUzoJTWFpbnRhaW5lZAogRjoJYXJj
aC9taXBzL2Jvb3QvZHRzL3JhbGluay9tdDc2MjEqCiAKK1JBTElOSyBQSU5DVFJMIERSSVZFUgor
TToJQXLEsW7DpyDDnE5BTCA8YXJpbmMudW5hbEBhcmluYzkuY29tPgorTToJU2VyZ2lvIFBhcmFj
dWVsbG9zIDxzZXJnaW8ucGFyYWN1ZWxsb3NAZ21haWwuY29tPgorTDoJbGludXgtbWlwc0B2Z2Vy
Lmtlcm5lbC5vcmcKK1M6CU1haW50YWluZWQKK0Y6CWRyaXZlcnMvcGluY3RybC9yYWxpbmsvKgor
CiBSQUxJTksgUlQyWDAwIFdJUkVMRVNTIExBTiBEUklWRVIKIE06CVN0YW5pc2xhdyBHcnVzemth
IDxzdGZfeGxAd3AucGw+CiBNOglIZWxtdXQgU2NoYWEgPGhlbG11dC5zY2hhYUBnb29nbGVtYWls
LmNvbT4KLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
