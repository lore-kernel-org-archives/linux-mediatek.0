Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502E5C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 May 2022 21:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Kecg3sMjAPSVVikBNbbw9iwsD9lIwoKrrbfEyMI9o/E=; b=DvH/uCT4ZXPZmo
	fujBslDgQ0/QJim/MKR42VXZEtmw+EpVXSpqYq2Ad53Rw+fHoeO6HJaoIkiODxDgNiFrDDLUQFMdL
	uRT8TjhxpH7kBLtsmpKtysxK5zY/MJE9XIp4NEqdj588I3aoDZ2xSM9RRPD4lk8/Qylh4zFDGAIrH
	7cv8XEVPgWqilrSARkC7wJ8ibtyyBUaaCIiH8tFzWeGF62uyWfVBn1eSrc3ZtIYccw7g0iM8Wazkn
	43eNj8rxPwHw7SON8/1gW35E+HM1Kna6/JAuAt/AKBMakRM1CYhCdVTCNKVQDamMM5kThcwXaN0TM
	J3u5C6/al/YKNNAVLBGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nn5Z8-0058MU-5t; Fri, 06 May 2022 21:32:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nn5Yw-0058Iu-OQ; Fri, 06 May 2022 21:32:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 9E66A1F46F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651872752;
 bh=Feax7TqOjAak8vTxXHyo5w7ldHLoCzV9bRYJ4gdOnQg=;
 h=From:To:Cc:Subject:Date:From;
 b=g741dTAEheu8gAyBHmVs9pPhsTV8SLjFD/30iAXzEMsv5dlyqXfxA5pU3Os51NBoC
 +76a4ARigQobUXpXAw8ofmdCAZZbTTLRkRx/2J4wi5CG/dzclT+Pz1/JCxJaQt5OcF
 qFTHxF2f4bfgjETuXod5jHS0Fc9yjfN6HbeDFbLO9jCEZq7Dna+FIvBappQJswuCMt
 Gqk+/+5ax1Qh3bjl2SPrWZOF3nX+0rlUmaSxsy0NbKZT6OHvUkrzzEn7+PlTIhHELi
 vPQx1G/8HvFaaIdkVAWuSqh1H+zSrBAsPs+EEnmgu4/lJcV2VE/Q2sClu0k3+Cqn6b
 jAnyejeU3VJmw==
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
 Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 0/2] Mediatek SCP dt-binding tweaks
Date: Fri,  6 May 2022 17:32:24 -0400
Message-Id: <20220506213226.257859-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_143235_038288_13877960 
X-CRM114-Status: UNSURE (   7.26  )
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
ZGRzIGEgbmV3IG9wdGlvbmFsCm1lbW9yeS1yZWdpb24gcHJvcGVydHkuCgp2MzogaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTAzMjExMTE0LjI2NTYwOTktMS1uZnJhcHJhZG9AY29s
bGFib3JhLmNvbQp2MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNTAyMTkyNDIw
LjI1NDg1MTItMS1uZnJhcHJhZG9AY29sbGFib3JhLmNvbQp2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjIwNDI5MjExMTExLjIyMTQxMTktMS1uZnJhcHJhZG9AY29sbGFib3JhLmNv
bQoKQ2hhbmdlcyBpbiB2NDoKLSBSZXdvcmtlZCBwcmVzZW5jZSBvZiBsMXRjbSByZWcgdG8gYmUg
aWY6dGhlbjogYmFzZWQgYW5kIHByZXNlbnQgb25seQogIG9uIG10ODE5Mi9tdDgxOTUKCkNoYW5n
ZXMgaW4gdjM6Ci0gTWFkZSB0aGUgY2ZnIHJlZyByZXF1aXJlZCBhZ2Fpbi4gQWZ0ZXIgbG9va2lu
ZyBhZ2FpbiBpbnRvIHRoZSBtdGstc2NwCiAgZHJpdmVyLCBvbmx5IGwxdGNtIGlzIG9wdGlvbmFs
LgoKQ2hhbmdlcyBpbiB2MjoKLSBEcm9wcGVkIHR5cGUgYW5kIGRlc2NyaXB0aW9uIGZyb20gbWVt
b3J5LXJlZ2lvbiBzaW5jZSBpdCdzIGEKICB3ZWxsLWtub3duIHByb3BlcnR5Ci0gU2V0IG1lbW9y
eS1yZWdpb24gbWF4SXRlbXMgdG8gMQoKTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8gKDIpOgogIGR0
LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazogTWFrZSBsMXRjbSByZWcgZXhjbHVzaXZl
IHRvIG10ODE5eAogIGR0LWJpbmRpbmdzOiByZW1vdGVwcm9jOiBtZWRpYXRlazogQWRkIG9wdGlv
bmFsIG1lbW9yeS1yZWdpb24gdG8KICAgIG10ayxzY3AKCiAuLi4vYmluZGluZ3MvcmVtb3RlcHJv
Yy9tdGssc2NwLnlhbWwgICAgICAgICAgfCA3MiArKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgotLSAKMi4zNi4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
