Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25265C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 15:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ilwSk8QjgOZVmfA3h4tgP57mq5MgVKxkdzlHY0KW9s=; b=PTDgOmMlepTS/w
	g3Lbz8CEgJWH1mOuf9zkMnOV6Ke+cz3WjU/MYvgyOcRZQ/8bybTXfA6qdO0AwAsC3RWIadC9Dco2D
	SCXbBY9doub1WqUgpCqIpGh9HXzggFyJBuT48t6cn0lNc1PiuhDDimLe0dSukYFJgLjtwDJFYHrkA
	f5UpUMVFN+KUpFsXJWOiXr5pN2YdPmVUgNhSUGCf4YjpwOPiRzTG46S6iOFeJa5tk/RvPEk6G6Ixx
	AEU2o85vPUKrWj7OW/PmmXKyAzrNrTkRJ1XP7YYsk8Qbm3yPqW25yokasWM+Jxymb3B+BS7cPJatM
	SyfFFUT1hVLoZcRew1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttOc-00Bj3E-4h; Wed, 25 May 2022 15:58:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nttO0-00Biq4-NQ; Wed, 25 May 2022 15:57:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nfraprado)
	with ESMTPSA id 0D3EB1F45155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653494241;
	bh=keaPZajLO694U70uhGq8U44vTxGJZt9Iw2KHBP80PJU=;
	h=From:To:Cc:Subject:Date:From;
	b=Vyu0Qh5cZGMhgqCtx+m2WgNsyFLV54cPirMXvdq4Afp+0U5utq+wV8xhpJETIszPQ
	 C4pJo3oOuJGsoJxNVMpGKqobUHkRBlpunN5X+A8E9wzBo26ntiMBxEAvg1QtBa2f/B
	 iLTJ5wi1cwGM+HGNqAR6bWqcQ3zsNUnZnpWdyTQfYLFu2s2ilTMV7WAKrSLnOXyW5O
	 8KO82ixXX5tbR04/wCnWwjqJowhgLS872Qae7yawfxSFAE2q2tPOE/9gtiZ0ulFlel
	 voT1OJX9nYhDOpUcbgchLH7ErffAhmd/b5eRMno7FXmk0j+0Mee/qYFATuolKfYsRv
	 NC9IK9KZAbqBA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/2] MT8192 pinctrl properties adjustments
Date: Wed, 25 May 2022 11:57:12 -0400
Message-Id: <20220525155714.1837360-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_085724_961666_36B71674 
X-CRM114-Status: UNSURE (   8.21  )
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

ClRoZSB0d28gcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBzdWJzdGl0dXRlIHByb3BlcnRpZXMgaW4g
dGhlIG10ODE5MgpwaW5jdHJsIGR0LWJpbmRpbmcgZm9yIG9uZXMgd2hpY2ggaGF2ZSBhIGNsZWFy
ZXIgbWVhbmluZyBhbmQgYXJlIG1vcmUKc3RhbmRhcmRpemVkLiBBdCB0aGlzIHBvaW50IHRoZXJl
J3Mgbm8gRFQgdXNpbmcgdGhlIG10ODE5MiBwaW5jdHJsCmJpbmRpbmcsIHNvIGlmIHN1Y2ggY2hh
bmdlcyBhcmUgdG8gYmUgbWFkZSwgdGhleSBuZWVkIHRvIGhhcHBlbiBub3cuCgoKTsOtY29sYXMg
Ri4gUi4gQS4gUHJhZG8gKDIpOgogIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6IEFkZCBk
cml2ZS1zdHJlbmd0aC1taWNyb2FtcAogIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBtdDgxOTI6IFVz
ZSBnZW5lcmljIGJpYXMgaW5zdGVhZCBvZiBwdWxsLSotYWR2CgogLi4uL2JpbmRpbmdzL3BpbmN0
cmwvcGluY3RybC1tdDgxOTIueWFtbCAgICAgIHwgNTggKysrKysrLS0tLS0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDQwIGRlbGV0aW9ucygtKQoKLS0gCjIuMzYu
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
