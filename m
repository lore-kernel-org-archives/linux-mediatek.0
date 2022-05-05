Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 19:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dlpzxc+1ifUhJEbLf77lSteaysG/mdxsUe9at04J/cU=; b=0PSt+3sAWwfuXO
	408+AlAbvSxYmFCEMQPf6YCLQOOCmMdie7EDzBVjHz5saRsaNI0Ag9mDJMyOM+IDOZIsR2PjAwBou
	w2u8Wub1lYmihSHpgalJnjNrfL4qwbdv45I75dZSJddji7NBw81eSd5Qq6Ihl62+ZauII7CEChsab
	eSHoHf0iOS7gqKr4ISBgIHnAyWno6rwWWBIjitJvnlrGlc7WRVwQJ0s1Ysk55An9ce6zRmQyJPEw6
	NwoQaQQkZl9n5XJnOUREJgHQAavj9ZwjjJnkFk0PIunUHs07pV847LA8zcY9hMr9Guu8w9FFkxHGh
	wJU3JIwHJpsDN2qKhTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmhQY-00HXfk-QD; Thu, 05 May 2022 19:46:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmhQJ-00HXZo-7T; Thu, 05 May 2022 19:46:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id 35F1B1F45CBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651779960;
 bh=RGCX7f1c3IvRqOzT0kQrLTGaV5rzWYFn7wa3F2g/3sc=;
 h=From:To:Cc:Subject:Date:From;
 b=BXy3pO2lbGRDAQvI5Sqc06/aVbQjRQAa+9OJG3jTImF2Pkx1vJdy6g8je5lhrAJ44
 ZTfO2haJHSE1EIl6OgDagBuOOZd5pbaNkbLQO0pWBu3ma9rQVSqRG7s/OCOpK4AF7f
 bG+2iJpQMt4I+pdTBf/dryqWzsxGfAWrGulm/I++Kczj1divEdS/4eQKcZlfxZs1fm
 KIZLrg7EScTR452qblEK9qL4EXT1rFjN65ekXO2EniYPBdtTMcQdNJk6hpIA1003DG
 6/s2b2Ftt/m888IGvwWOQ6A1l6YU2tx82ilpar4j9DAolh1i9+ywWO3J6sY59ikA5b
 t9r9012cLKAHA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Luca Weiss <luca@z3ntu.xyz>, Maxim Kutnij <gtk3@inbox.ru>,
 Rob Herring <robh+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 00/16] Introduce support for MediaTek MT8192 Google
 Chromebooks
Date: Thu,  5 May 2022 15:45:34 -0400
Message-Id: <20220505194550.3094656-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_124603_495625_BE81263A 
X-CRM114-Status: GOOD (  11.59  )
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

ClRoaXMgc2VyaWVzIGludHJvZHVjZXMgRGV2aWNldHJlZXMgZm9yIHRoZSBNVDgxOTItYmFzZWQg
QXN1cmFkYSBwbGF0Zm9ybQphcyB3ZWxsIGFzIEFzdXJhZGEgU3BoZXJpb24gYW5kIEFzdXJhZGEg
SGF5YXRvIGJvYXJkcy4KClN1cHBvcnQgZm9yIHRoZSBib2FyZHMgaXMgYWRkZWQgdG8gdGhlIGV4
dGVudCB0aGF0IGlzIGN1cnJlbnRseSBlbmFibGVkCmluIHRoZSBtdDgxOTIuZHRzaSwgYXMgdG8g
bm90IGFkZCBhbnkgZGVwZW5kZW5jaWVzIHRvIHRoaXMgc2VyaWVzLgoKQmVzaWRlcyB0aGUgb3Ro
ZXIgZHQtYmluZGluZyBmaXhlcyBhbHJlYWR5IG9uIGxpbnV4LW5leHQgdG8gYXZvaWQgbmV3Cndh
cm5pbmdzIGJ5IHRoaXMgc2VyaWVzLCBbMV0gaXMgYWxyZWFkeSBtZXJnZWQgYnV0IG5vdCBvbiBu
ZXh0IHlldC4KClRoaXMgc2VyaWVzIHdhcyBwZWVyLXJldmlld2VkIGludGVybmFsbHkgYmVmb3Jl
IHN1Ym1pc3Npb24uCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwNDI5MjAx
MzI1LjIyMDU3OTktMS1uZnJhcHJhZG9AY29sbGFib3JhLmNvbS8KCnYxOiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyMjAzMTYxNTEzMjcuNTY0MjE0LTEtbmZyYXByYWRvQGNvbGxhYm9y
YS5jb20vCgpDaGFuZ2VzIGluIHYyOgotIEFkZGVkIHBhdGNoZXMgMS0yIGZvciBNZWRpYXRlayBi
b2FyZCBkdC1iaW5kaW5ncwotIEFkZGVkIHBhdGNoZXMgMTMtMTYgZW5hYmxpbmcgaGFyZHdhcmUg
Zm9yIEFzdXJhZGEgdGhhdCBoYXMgc2luY2UgYmVlbgogIGVuYWJsZWQgb24gbXQ4MTkyLmR0c2kK
Ck7DrWNvbGFzIEYuIFIuIEEuIFByYWRvICgxNik6CiAgZHQtYmluZGluZ3M6IGFybTY0OiBkdHM6
IG1lZGlhdGVrOiBBZGQgbXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24KICBkdC1iaW5kaW5nczogYXJt
NjQ6IGR0czogbWVkaWF0ZWs6IEFkZCBtdDgxOTItYXN1cmFkYS1oYXlhdG8KICBhcm02NDogZHRz
OiBtZWRpYXRlazogSW50cm9kdWNlIE1UODE5Mi1iYXNlZCBBc3VyYWRhIGJvYXJkIGZhbWlseQog
IGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBEb2N1bWVudCBHUElPIG5hbWVzCiAgYXJt
NjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBzeXN0ZW0td2lkZSBwb3dlciBzdXBwbGll
cwogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBFbmFibGUgYW5kIGNvbmZpZ3VyZSBJ
MkMgYW5kIFNQSSBidXNzZXMKICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIENo
cm9tZU9TIEVDCiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBrZXlib2FyZCBt
YXBwaW5nIGZvciB0aGUgdG9wIHJvdwogIGFybTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBB
ZGQgQ3I1MCBUUE0KICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogQWRkIEVsYW4gZUtU
SDMwMDAgSTJDIHRyYWNrcGFkCiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBJ
MkMgdG91Y2hzY3JlZW4KICBhcm02NDogZHRzOiBtZWRpYXRlazogc3BoZXJpb246IEFkZCBrZXli
b2FyZCBiYWNrbGlnaHQKICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogRW5hYmxlIFhI
Q0kKICBhcm02NDogZHRzOiBtZWRpYXRlazogYXN1cmFkYTogRW5hYmxlIFBDSWUgYW5kIGFkZCBX
aUZpCiAgYXJtNjQ6IGR0czogbWVkaWF0ZWs6IGFzdXJhZGE6IEFkZCBNVDYzNTkgUE1JQwogIGFy
bTY0OiBkdHM6IG1lZGlhdGVrOiBhc3VyYWRhOiBBZGQgU1BNSSByZWd1bGF0b3JzCgogLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrLnlhbWwgICAgIHwgIDEzICsKIGFyY2gvYXJt
NjQvYm9vdC9kdHMvbWVkaWF0ZWsvTWFrZWZpbGUgICAgICAgICB8ICAgMiArCiAuLi4vZHRzL21l
ZGlhdGVrL210ODE5Mi1hc3VyYWRhLWhheWF0by1yMS5kdHMgfCAgMTggKwogLi4uL21lZGlhdGVr
L210ODE5Mi1hc3VyYWRhLXNwaGVyaW9uLXIwLmR0cyAgIHwgIDMzICsKIC4uLi9ib290L2R0cy9t
ZWRpYXRlay9tdDgxOTItYXN1cmFkYS5kdHNpICAgICB8IDc3NyArKysrKysrKysrKysrKysrKysK
IDUgZmlsZXMgY2hhbmdlZCwgODQzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBh
cmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1hc3VyYWRhLWhheWF0by1yMS5kdHMK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE5Mi1h
c3VyYWRhLXNwaGVyaW9uLXIwLmR0cwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ4MTkyLWFzdXJhZGEuZHRzaQoKLS0gCjIuMzYuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
