Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 23:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JhdrSiLCx2UqAECGV3ws5abvVl/LSfLbLjEunNhKbd8=; b=3NOIUUxtDV/u56
	BUWz0XrKIFhqBiUu4o7Un6n9+O5liM8buHag5YbVm5wnehusbI9xnnz2rYt1RR4Ne4r8+uWJ8WAuv
	j0owwLRDkdbDjVJCW8ukjKLGM5Op0XrWYtoydtGmROyHPsI3jkHhNqnLYL0sdjXDDXbu1f5WOcPi2
	E04r6wLO7TzheDkwNK+lMv6hpsz+1mGlDE6x4Nx1iTBc6iX0W4TPMaS0nGaYCD7jCEXpfzq2U4wDd
	m4YvXiD2UzuiGK4JR27Ip7qbppnJK4X8KOw29E2NVxEU1DT3bXbh49VCcvLzUy/RPctchwStoB7Jq
	NNVWvblPzNlKDXerGbMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNjZ4-00798s-O5; Fri, 25 Feb 2022 22:59:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNjYq-00792y-Mp; Fri, 25 Feb 2022 22:59:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 8E83F1F467FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645829979;
 bh=5/cbXG/0jty+bdChTJn7AE0JyJhsUQJkq1UGkqKxjAw=;
 h=From:To:Cc:Subject:Date:From;
 b=T4wnPFhH210ovR8105MIZoT/yV/bB+jd6nxy9AE3kGprtoXa1BSuJ6MCxRFsJmT5g
 JhWsJmv3/8R82KXFXFPiQhqF23/YufhERkmCfRDECgySYyrQrXlorM3mrWEPfOIF/a
 QUDNwhK/lTIOHx4gpqzVal3uO4ZZ2t0j3oUA1hL2sp8L/Ovc3L5Hq4v4CMVMpFlQgm
 cwrQBnjE+hsjvmq/zTmgyJ2LncrM0M3Vls5BrSmTuYRXDgNepxPfQwmcw/3mjH2lz3
 4xsS0NGfysoh1gszQpTAb60P+BgHmffTyGp2lh1YHsOxRLyiZzZlZggN8764nQgYyq
 upAxn/I9+RAMQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v1 0/3] Fixes for Mediatek dt-bindings
Date: Fri, 25 Feb 2022 17:58:51 -0500
Message-Id: <20220225225854.81038-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_145940_897624_9CDEC3AE 
X-CRM114-Status: UNSURE (   9.41  )
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

ClRoaXMgc2VyaWVzIGhhcyBzb21lIGZpeGVzIGZvciBNZWRpYXRlayBkdC1iaW5kaW5ncy4gSXQg
c29sdmVzIHNvbWUKd2FybmluZ3MgcHJpbnRlZCBieSBkdGJzX2NoZWNrLCBib3RoIGZvciBhbHJl
YWR5IG1lcmdlZCBEZXZpY2V0cmVlcywgYXMKd2VsbCBhcyBzb21lIHRoYXQgd291bGQgYmUgaW50
cm9kdWNlZCBieSB0aGUgY2hhbmdlcyB0byBtdDgxOTIuZHRzaSBpbgpbMV0uCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwMjE4MDkxNjMzLjkzNjgtMS1hbGxlbi1raC5jaGVu
Z0BtZWRpYXRlay5jb20vCgoKTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gKDMpOgogIGR0LWJpbmRp
bmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazogQWRkIGludGVycnVwdHMgcHJvcGVydHkgdG8gbXRr
LHNjcAogIGR0LWJpbmRpbmdzOiB1c2I6IG10ay14aGNpOiBBbGxvdyB3YWtldXAgaW50ZXJydXB0
LW5hbWVzIHRvIGJlCiAgICBvcHRpb25hbAogIG1lZGlhOiBkdC1iaW5kaW5nczogbXRrLXZjb2Rl
Yy1lbmNvZGVyOiBBZGQgcG93ZXItZG9tYWlucyBwcm9wZXJ0eQoKIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1lbmNvZGVyLnlhbWwgICAgIHwgMyArKysKIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCAg
ICAgIHwgMyArKysKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvbWVkaWF0
ZWssbXRrLXhoY2kueWFtbCAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQoKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
