Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B288DC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Nov 2022 11:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rp7zYqpOsau/LPIR3QvWAmM9M3FNKxiBJ0iJkyMuijU=; b=qBquo80fPdojXhOeouUYlzefOq
	dL9rRtSVFdXPxxGOxCdUe245R3K54oeXzwLrfCR18zkpxrf1zxNkHwfPBYNjUWO1BbkdZmTG8a14/
	js1FRp4WzyGxXDdaTb6jOKk+4pUuf6lzOSs5z0Lb1S+Qu49va6ydEVuGOmCUF3RMrRhnFkx1BHsbq
	L3M+pScSumd/ru1G4RCWCD43241xPyGluPvxXC+ETpzAbuh6NVSIS9TRMjKezRTf7OrHhHA8vLUqy
	qfff/V+sxi0yXKF2IcUQqHIVO/GI+FC4vNM6Yc37ib5ShJDzjaMA7JFmrK9gIr801bTgP4QjxjLxX
	TonqcYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otoXc-005HvX-Pn; Sat, 12 Nov 2022 11:19:16 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otoXR-005Hrw-2q; Sat, 12 Nov 2022 11:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1668251925;
	bh=rp7zYqpOsau/LPIR3QvWAmM9M3FNKxiBJ0iJkyMuijU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JuhM5ybwF5gc+v79eCj+IvH2l036jTI020NgkMPbe3QYZRjidKTEjW5WoGJVmsd9J
	 22oe31g+QvlOE73Xe1OpFmrkKHlYWUe5hr3vD5p5n7LoKIKEm3SsYj7ffdZPDkDbvc
	 3qRTc6DyHMVnz0UALX4Hc4Rm3uwzIW6AloSAJ9VKXJJxOQbTlDB6HA8UAhV5yqV5oY
	 sQCLMVa9TVyDf464kwnXEVBfEW4LGHKHO62EumkElDXW+y8ZQl75aQZYFWHt0LKTvr
	 g3aUU0UV1IfkwOv+v6VgApUmGejFne7/DP3Lcbu02Dh0KsJeQ8yJIZurq9oma21foN
	 tca6VycS14GiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.227.41] ([157.180.227.41]) by web-mail.gmx.net
 (3c-app-gmx-bs18.server.lan [172.19.170.70]) (via HTTP); Sat, 12 Nov 2022
 12:18:45 +0100
MIME-Version: 1.0
Message-ID: <trinity-74ed6753-8790-4b4e-b479-8b79594deaa9-1668251925295@3c-app-gmx-bs18>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <linux@fw-web.de>
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod
 Koul <vkoul@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Aw: [PATCH v4 03/11] dt-bindings: usb: mtk-xhci: add support for
 mt7986
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Nov 2022 12:18:45 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221112091518.7846-4-linux@fw-web.de>
References: <20221112091518.7846-1-linux@fw-web.de>
 <20221112091518.7846-4-linux@fw-web.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:gCRoOpkI2dmBRiFBhn0pU9g6q49HTv0O8fEgaXiLsVAXzpLqMNbIn85QOPLr3N/vBYIXH
 WTylJph/OdYJnhgtFfTamYnylP/AdKUIfBu6AqCaxy9/Yd/hyv0YV1LJ5Q+nKlR0ughGRgyazSqo
 iX4spko7QjCGGWUmkxUnA30Js5isX49SecDWSA8NbJsDVzs4foq6++Xzic6VkiAnPeH61szIVIKd
 1ixmQGyTOgG1NnC4VmqMvyL1fzK8XnffDvuKdyQUTUng61ACp+NklnmqwPDVcOu+on19uvP9rCWT
 5U=
UI-OutboundReport: notjunk:1;M01:P0:lCc17Sn1yzU=;z2pK6blWRcnBHwu86+5E0PgAAkj
 xGOA5K/vmoAeepi2y/t+uUzg5F7ZYKMrqYpyrtUSqcIX93dLGw8aI7mz+F5UZpCtoSZmEytNJ
 Cq+Q2voskO1u4QaZk8KJ3e4gjBkfz4UJtyAsCm8llAAPPoBeboWDlAxZPcBIQ7UPOQiAaTUoZ
 neWMdEyzWXjFqWqy9imB3LFCk8e+/pJwEt1YJceCR++/lND+ebXaoALdMjitN5sr5QXCoiwJY
 cObwDWnPI3H+l3Xjh0XN4kgfTEKsKJcGnYh0LYLrTcM3iCAt0XkONq5Tki4w9ZlAIwRjZ0TZH
 GYQ6IVH+CGz+C0OIyNn6vwM1t9gT8KSJBMs6U17edmKsgXC+/J5bNTpCeQLOOHHf7F4iOHagK
 CAuJjbQX5VuPs+jwiRkqXURtXgcyZ4VBsVDlE1ECp1qfJj2gmMgxGpx4kgP6Rc5nou2Qr3M0Y
 t7ps4A/0s1bY+4jeSW4ydAXZL1t4fG738PdqbLUkCkUki73gaMmDAAJ5rRW79fQE7PfxQipit
 OwAyCGdDOL7vP1vLJxcSmkAZpx3fL4zsENg9IUL6QTMuAUeZicUbfJih6MhytXPJfpLR09Vrf
 VAEEEcobqD08vJl0OHPHH6cvAAt0l5m8/x7Dn0J/PJ4o5Y0WSNE8rKze0CKLg6AkD8YA3WHkb
 nqaaRon6DyZQS3yg90rLqpU8IWteOy+5Qs5h0LzVPKoaNc8KG20WW4dML2+mVPs2CNbh7yX+D
 2Bq4xRscwlqJcV3dIijXyTkLy35P4z2kxcRERQL+j4urJf17FIosEDVtbOif85eB4PcRM14mO
 CxXIP9pwTOC4yMVfr/6rOKKNmfxnz4w1VwYmEWJMvPaPA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221112_031905_429225_CAEFB16B 
X-CRM114-Status: UNSURE (   5.68  )
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

i've noticed that i missed the Ack from Krzysztof i've got in v1 [1]

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20221017104141.7338-4-linux@fw-web.de/

regards Frank

