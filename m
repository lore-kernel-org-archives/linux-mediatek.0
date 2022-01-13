Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0A5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpPcGqjqurIowi2Iq0jqyV1uXoD7DLzGOaiRGAWVe8o=; b=e7xXdXU0/hH5j1
	YKZNa7O1Uv++FRbaWtcpCp9ivsTMWkxihG19D771yEQGtmr3soPhtWD0FmEEoNd9BufLggZ0hmuEt
	+ijor7IJee250JqlmpA9lqVC5BWTrX9NmT/hwq+2Hci/fJoWHTi37+Bn38xQ7FlCis6s4joY+SrPh
	/SmOjf3Zw+Xmw11aV0ISL7aK1h/bi5irS6mZ9WWlpP32PIzav4eXkzkKKObLWsTO21tuCJhNIpOZK
	12mWZsEemC6Ljn5S3GRiyInI6H+z+Dic283U6vUScEseVZve94GDn8J0SXvy5OzQBPc6Iyebx6WNH
	M9SPsdk5j7SFYNpzd40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7uE8-004wVO-Jq; Thu, 13 Jan 2022 07:08:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7uDn-004wS1-RA; Thu, 13 Jan 2022 07:08:33 +0000
X-UUID: 16749d6820f34c8aa8cafcfb3121a721-20220113
X-UUID: 16749d6820f34c8aa8cafcfb3121a721-20220113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1002875208; Thu, 13 Jan 2022 00:08:27 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Jan 2022 22:58:29 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 13 Jan 2022 14:58:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 Jan 2022 14:58:27 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee
 <ryder.lee@kernel.org>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v4 5/5] arm64: dts: mediatek: Correct system timer clock of
 MT8192
Date: Thu, 13 Jan 2022 14:58:22 +0800
Message-ID: <20220113065822.11809-6-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
References: <20220113065822.11809-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_230831_889564_FC0542F3 
X-CRM114-Status: GOOD (  12.82  )
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

RnJvbTogQWxsZW4tS0ggQ2hlbmcgPEFsbGVuLUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KCldoZW4g
dGhlIGluaXRpYWwgZGV2aWNldHJlZSBmb3IgbXQ4MTkyIHdhcyBhZGRlZCBpbiA0ODQ4OTk4MGUy
N2UgKCJhcm02NDoKZHRzOiBBZGQgTWVkaWF0ZWsgU29DIE1UODE5MiBhbmQgZXZhbHVhdGlvbiBi
b2FyZCBkdHMgYW5kIE1ha2VmaWxlIiksIHRoZQpjbG9jayBkcml2ZXIgZm9yIG10ODE5MiB3YXMg
bm90IHlldCB1cHN0cmVhbSwgc28gdGhlIGNsb2NrIHByb3BlcnR5IG5vZGVzCndlcmUgc2V0IHRv
IHRoZSBjbGsyNm0gY2xvY2sgYXMgYSBwbGFjZWhvbGRlci4KCkdpdmVuIHRoYXQgdGhlIGNsb2Nr
IGRyaXZlciBoYXMgc2luY2UgYmVlbiBhZGRlZCB0aHJvdWdoIDcxMDU3M2RlZTMxYiAoImNsazoK
bWVkaWF0ZWs6IEFkZCBNVDgxOTIgYmFzaWMgY2xvY2tzIHN1cHBvcnQiKSwgYXMgd2VsbCBhcyBp
dHMgZHQtYmluZGluZ3MKdGhyb3VnaCBmMzVmMWEyM2UwZTEgKCJjbGs6IG1lZGlhdGVrOiBBZGQg
ZHQtYmluZGluZ3Mgb2YgTVQ4MTkyIGNsb2NrcyIpIGFuZApkZXZpY2V0cmVlIG5vZGVzIHRocm91
Z2ggNWQyYjg5N2JjNmY1ICgiYXJtNjQ6IGR0czogbWVkaWF0ZWs6IEFkZCBtdDgxOTIKY2xvY2sg
Y29udHJvbGxlcnMiKSwgZml4IHRoZSBzeXN0aW1lciBjbG9jayBwcm9wZXJ0eSB0byBwb2ludCB0
byB0aGUgYWN0dWFsCmNsb2NrLgoKU2lnbmVkLW9mZi1ieTogQWxsZW4tS0ggQ2hlbmcgPEFsbGVu
LUtILkNoZW5nQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFBy
YWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210ODE5Mi5kdHNpIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay9tdDgxOTIuZHRzaSBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kK
aW5kZXggMWViNTg3NGMwOWE5Li40ZjZjNGNlODg1YWYgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTIuZHRzaQpAQCAtMzEyLDcgKzMxMiw3IEBACiAJCQkJICAgICAibWVkaWF0
ZWssbXQ2NzY1LXRpbWVyIjsKIAkJCXJlZyA9IDwwIDB4MTAwMTcwMDAgMCAweDEwMDA+OwogCQkJ
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDIzMyBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+OwotCQkJY2xv
Y2tzID0gPCZjbGsyNm0+OworCQkJY2xvY2tzID0gPCZ0b3Bja2dlbiBDTEtfVE9QX0NTV19GMjZN
X0QyPjsKIAkJCWNsb2NrLW5hbWVzID0gImNsazEzbSI7CiAJCX07CiAKLS0gCjIuMTguMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
