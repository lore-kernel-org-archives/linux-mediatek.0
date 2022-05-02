Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C78C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 19:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Lsrd91+VmS7UQplKCzq99XQ2P2PqNUugko+o2NOWzQ=; b=pL41SAOqW+3PXe
	lCPCi84ASEHy1XZCTbF9XfyJ+xF/x0XEeYFCIwp3WTa8rDYVthyw2Fn+w6ChY6u/tFEGfAgtQFSHb
	I8eNaOYHCnm/GAKym7OenDzLJPXdDYI9zTR3L13T9xFH3TEFHhBE8HJcUrnCuXaf/jP1MdzUrgQIl
	RTG8WhUeTeFwH7FP0WK83s0nzq6mBypjPNEEVa4fAr+SyORc0VA/kYiaWRD5gd0L2aPK7+EmK/gee
	KGe3B7imERcuEkelQTQcTCYJrkTPZC7F4fzs02LbUavgt0QJdhdEouc3zzrhpJ6MefFjVCZmNb33k
	i9Jj9fGF8p23SHDVFXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlbey-002NOt-HH; Mon, 02 May 2022 19:24:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlben-002NKW-40; Mon, 02 May 2022 19:24:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 0E93B1F43616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651519464;
 bh=g/10CsCiiEAtzUkTggO9p2fKiGZMC5fLwF20fgME/00=;
 h=From:To:Cc:Subject:Date:From;
 b=S5AZcx8E4EvtBgUSCN9EWouvAbcZYo0t4YVuYZMr2PdcC1hWzIUhYG/C9OA/w2dTV
 McwPwmNQE7TEj26ozepd0NGY4DLGVlE3VUaoSQoT5493L/6ju2JdwvtvCSOMNwLQk2
 vaUg+xxPDybtP2jvDXrz9BaxAh4gXYm6jtbPR47rhFHtQr3ABJVpHU+XGlzXJmPlU9
 k1JuqK0jL+LLaDoD4iE5YZZzStairRVYGsPXdKQ5ysqoY1nBdEK1w9u3Z0aoBmPWIx
 K+sCCJOeA8eDyMlcPPdxdKa83DluzVt8ocET2HtOJybUPH/9c8vEoGRyT3ZyJybseL
 HT/fhkfx3mNEw==
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
Subject: [PATCH v2 0/2] Mediatek SCP dt-binding tweaks
Date: Mon,  2 May 2022 15:24:18 -0400
Message-Id: <20220502192420.2548512-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_122429_356783_FA3E4D14 
X-CRM114-Status: UNSURE (   7.82  )
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

ClR3byBzaW1wbGUgcGF0Y2hlcyBmb3IgdGhlIE1lZGlhdGVrIFNDUCBkdC1iaW5kaW5nLiBUaGUg
Zmlyc3QgZml4ZXMgdGhlCnJlZy9yZWctbmFtZXMgcHJvcGVydHkgd2hpbGUgdGhlIHNlY29uZCBh
ZGRzIGEgbmV3IG9wdGlvbmFsCm1lbW9yeS1yZWdpb24gcHJvcGVydHkuCgp2MTogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNDI5MjExMTExLjIyMTQxMTktMS1uZnJhcHJhZG9AY29s
bGFib3JhLmNvbQoKQ2hhbmdlcyBpbiB2MjoKLSBEcm9wcGVkIHR5cGUgYW5kIGRlc2NyaXB0aW9u
IGZyb20gbWVtb3J5LXJlZ2lvbiBzaW5jZSBpdCdzIGEKICB3ZWxsLWtub3duIHByb3BlcnR5Ci0g
U2V0IG1lbW9yeS1yZWdpb24gbWF4SXRlbXMgdG8gMQoKTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
KDIpOgogIGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazogRml4IG9wdGlvbmFsIHJl
Zy1uYW1lcyBmb3IgbXRrLHNjcAogIGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazog
QWRkIG9wdGlvbmFsIG1lbW9yeS1yZWdpb24gdG8KICAgIG10ayxzY3AKCiAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9yZW1vdGVwcm9jL210ayxzY3AueWFtbCAgIHwgMTUgKysrKysrKysrKysrLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoy
LjM2LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
