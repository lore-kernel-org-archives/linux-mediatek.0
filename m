Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6FEC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 23:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpj4IuM/ecoyjEBrgepUgyT7DKN9V+o8STacrR3/xo4=; b=X2hQtUZ/l1DyGN
	28rL3iMkt0wPZQ+IvfniqLgKVJqJxmitbtPpCpUB5lB0DG6QxpzGZy20QrkRMOGHUxzgIWJhA7b2j
	MtZifDi9JxxlAckrt3iYco7AEGgUU8M4o9ed2PJWouV8uEKT1w6omqqNl+iezUOhTu78K1fR0HjK1
	xM31XqGyENBMQZgTN3CsOiZAbfP4rUKl1L4tFGZXym60JPYcpAC02ngcaNc2agjnr+j4frs9q/Y4m
	LJ2wtuYzxCQ7JluIPvcOvjfx8RFaYHUWqyLVLndihxuYn89RHWZOCVvSt9DCva8mJAYIZf9womaL/
	9MpJumOrhb/VOtnUxUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNjZg-0079QO-In; Fri, 25 Feb 2022 23:00:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNjYv-00794p-Id; Fri, 25 Feb 2022 22:59:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 100231F46808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645829984;
 bh=qY7g+EkArzTfdSMsa9x3xIBuajRepERJP4O9V2Lj82Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TDi+OJ5/TIg5zuBS22T/Vv9UsG1dEkQNLnps4DxdHeiWpgWxZkuNOF8f72+kWb/7g
 GZNQNlYCtIsRXnJG87wUTktx8ycjFyX2fdV0hELqwKuZYV8gbPvHlPOIfX3T4F4+Xi
 PX13JZoH1aAeLLmVfL8Wh/8MViGfXcWYlN0tPX1d20eoJD3LzHe2E/MGPIWYKDOnLT
 YzE3pE+aykhxV57oKreGBBZZa0UT/8JTSaA+ChMNVHsR6FGGoNtrv6UYGIGVYOtbxN
 a6XEksawKVcl+qc7TBEhiDVGoQjW/vVZhQxzt8txAgDW0WvS2p7pJn6nHbbipFKR1F
 cCt8z3UCYpJZw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v1 3/3] media: dt-bindings: mtk-vcodec-encoder: Add
 power-domains property
Date: Fri, 25 Feb 2022 17:58:54 -0500
Message-Id: <20220225225854.81038-4-nfraprado@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225225854.81038-1-nfraprado@collabora.com>
References: <20220225225854.81038-1-nfraprado@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_145945_850976_4CFABB17 
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

VGhlIGVuY29kZXIgbm9kZSBtYXkgYmUgZGVwZW5kZW50IG9uIGEgcG93ZXItZG9tYWluLiBBZGQg
YSBwcm9wZXJ0eSBmb3IKaXQuCgpTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQoKIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL21lZGlhdGVrLHZjb2RlYy1lbmNvZGVyLnlhbWwgICAgIHwgMyArKysKIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLWVuY29kZXIueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtZW5jb2Rl
ci55YW1sCmluZGV4IGU3YjY1YTkxYzkyYy4uYzI4ODkxM2U1NjY2IDEwMDY0NAotLS0gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssdmNvZGVjLWVuY29k
ZXIueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVk
aWF0ZWssdmNvZGVjLWVuY29kZXIueWFtbApAQCAtNjUsNiArNjUsOSBAQCBwcm9wZXJ0aWVzOgog
ICAgIGRlc2NyaXB0aW9uOgogICAgICAgRGVzY3JpYmVzIHBvaW50IHRvIHNjcC4KIAorICBwb3dl
ci1kb21haW5zOgorICAgIG1heEl0ZW1zOiAxCisKIHJlcXVpcmVkOgogICAtIGNvbXBhdGlibGUK
ICAgLSByZWcKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
