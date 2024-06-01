Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C799CC27C44
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Jun 2024 12:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lvEcECdSPEZ9gHThU+ok/dFIWZz6KwxLY9jrZJous+A=; b=ZyytwRlJD+oflDFQjK5Nr3p0IW
	Ag9HaaCp+Pf+loF8rr17SqREQ5sSjKsPU85i1Bw0RF2rC9xlN5s2olTgQxXtAtCyzfE3W0rw93GQU
	0YshJfeb9mtVHOK+CIdERgczxwuf7MDr+dwUs5wLXSQ4xlrSllETTlQVGZoel9L/uuG/Ws0DOabR3
	6Od8K3pe6KyxE9KXzEnqx3Mou+h0Yr5wdPa6KbR6ixF9HmmJ6WSkT27HS5+ty+qYek4QYrG3ZhzYK
	Ri6u2VTPSt3QdlQr8+f4lm4r3yQ3EngATB7ySt6sQpoOJGuDpunkp6P0+2uc4iZZC7itYp57CRKi+
	OnYdVNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDNwi-0000000Cat9-0ADR;
	Sat, 01 Jun 2024 12:34:52 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDNdu-0000000CTuF-0xVb;
	Sat, 01 Jun 2024 12:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1717244099; x=1717848899; i=frank-w@public-files.de;
	bh=lvEcECdSPEZ9gHThU+ok/dFIWZz6KwxLY9jrZJous+A=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=m5aCDMt9HIKbzsoH185M2Yfo7fwJNHtvlNHVa/bMzbqeyUwAcCDoHKWMO6dsDI53
	 MJbr0KmSgP3NQLBPJk18KbHxWuxalptJOh6Su/R6adC7cbXf5IhdBhmmPyONNqaxH
	 ztqZgY7HfIsjPIlaLguwHbK5V9XyX675I19rtAOFx9aECAsjm1dFdzHLBRjj52Vtb
	 0iHGfvdBdhOtHgMtAZqlIfawXd1Ez01bZMj4GAgNoZzSWhllstz7dzSIyldJ2JWrc
	 T30oa9v9lynbC+TAPfqxkoPDtTpWCCyFMrNRfKxaiIhqQAj32xggKks1z11AI9YJD
	 K0mxsWQEAWSjr2+0gQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.147.29] ([217.61.147.29]) by web-mail.gmx.net
 (3c-app-gmx-bap08.server.lan [172.19.172.78]) (via HTTP); Sat, 1 Jun 2024
 14:14:59 +0200
MIME-Version: 1.0
Message-ID: <trinity-afd8a6d5-1acc-4020-b8cb-e0db80c241cf-1717244099767@3c-app-gmx-bap08>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Eric
 Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Aw: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add BananaPi
 R3 Mini
Content-Type: text/plain; charset=UTF-8
Date: Sat, 1 Jun 2024 14:14:59 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <a7a20d35-f566-4c3c-aef1-cb7a0f349cf6@collabora.com>
References: <20240510095707.6895-1-linux@fw-web.de>
 <20240510095707.6895-2-linux@fw-web.de>
 <a7a20d35-f566-4c3c-aef1-cb7a0f349cf6@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:csPF87R4ollgagNDdL+HT/01eQEv27Y1G6e/ybL/hqAjMvhTTSL19a/hYOa0N91ckFy1u
 m/eYtsKP20+o0LNLtViebe5BzFkkpLthFMc+cWYLiaBRUO1wRywenLslwMPzj1BwkeqJn3nB5VBp
 lAtk6lfKrjvW2V/6XLYH2iHIkdf15CgqJBnHcp2ZHZZ2k3S8N31M0GFv6rHVcEjV/jEJ/0f0zHJ/
 ylN01GfwjzQMSbeVeXs5M5yoGXANlVLm4tlzXIbhg0HhNTT/qvTNliIkyUBnodU+MrfLKyGHHZ1f
 tQ=
UI-OutboundReport: notjunk:1;M01:P0:9m4bUWM75tM=;ugYFxEsX+a5lkO2Zcqo7G7+zfjz
 KgZNAsN3DTuYK3PROs1445uXbDRwkbcD66MED97R3+O7hjCWpSwSoPsmzCTTDv0zBMbQGXh2J
 Rh3PIAzlinoT4BgrR+nFDOOAaMTiN7oaPXSJXEWcWKFQDc24BT3nmEYf8oVtr2X4exqH7rTNX
 /kHtKuu7s/WsjsgwgIM2zi87Q5PZPFiEEI0iGdUcKf7g7z2MZiY7UvKywVB9BZrIEJKtIuqe0
 HP3udYRs2G2f5j61t4hLnjGgstPa6W8AArZtYzQor43jJAr3TcCU4JLw0jpa5vqpRQMWrReXn
 XJUk8DWSA6dWWcZ65b9rFPFW7k787d/7E6BIBdxAp8uKEH2Owb3L3Wd/N4g0Un2A0YDVQFzih
 l0BqF85t6MQsTdyPsh+vApyipjIjyyzkd333sRukslARpXzpMtOkSlWbGIYmgopu5HYZcJYu9
 Dmqkphtrrd29iysn9D/nbBybeVFGxO8Lc2vYWFOgH4shL9PDOw8+N1IpyllqnV1NN3XFqUYqp
 YTeYPHrDeJPr20/JJJmADXkdn3nnppFBwyf9mB3TuHOpU0/QDjHp0g9a2SJ9ZYl2e7xhtvwLn
 EaBKXkNJRLJgcZ4oMGhyRzYs3qbSAe3Tls/AHhD4GQ+DZIVN9lIYsgAf+tuao1ojvoW3IDUQT
 t10Sk5GHXuxiqRbXRBpxVgQaf8UXonCoskxpzxyb9wcLt+SwzryX27Qw4ajCX0E=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240601_051526_654119_7FC97A4F 
X-CRM114-Status: UNSURE (   8.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

just a gentle ping...is there anything missing?

i see state in netdev-patchwork [1] is "changes requested", but comments d=
o not say anything about this...

in mtk-patchwork [2] it is new and i do not see patches in mtk-next [3] ye=
t

regards Frank

[1] https://patchwork.kernel.org/project/netdevbpf/list/?series=3D852204&s=
tate=3D%2A&archive=3Dboth
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/202405100957=
07.6895-2-linux@fw-web.de/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git

> Gesendet: Montag, 13. Mai 2024 um 15:06 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> An: "Frank Wunderlich" <linux@fw-web.de>, "Rob Herring" <robh@kernel.org=
>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Doole=
y" <conor+dt@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "=
Stephen Boyd" <sboyd@kernel.org>, "Pavel Machek" <pavel@ucw.cz>, "Lee Jone=
s" <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Eric Dumaze=
t" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni=
" <pabeni@redhat.com>, "Matthias Brugger" <matthias.bgg@gmail.com>
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Eric Woudstra" <ericw=
ouds@gmail.com>, "Tianling Shen" <cnsztl@immortalwrt.org>, devicetree@vger=
.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linu=
x-leds@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.inf=
radead.org, linux-mediatek@lists.infradead.org, "Conor Dooley" <conor.dool=
ey@microchip.com>
> Betreff: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add BananaPi R=
3 Mini
>
> Il 10/05/24 11:57, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add MT7988A based BananaPi R3 Mini.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
>
>
>

