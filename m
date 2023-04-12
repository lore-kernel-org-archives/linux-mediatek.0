Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C12CC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyLMRZ7l6QPvBPSTkFg57mjxK4zHgNRbpfQN6gXBjUU=; b=qN9+Rsxqfn7JBrBQu/q6QbJTa/
	wDtWS08wjfJOxNSzkJI9Td3U0R7tdfpLQsqUzUmtknmOBfyW6isEINLJyYS0xyVd178kPonMzYs7S
	M2+MBPL+uWhGBucHvBm6TWAF4cLWJ/dslZVmnBYto9xD8on5kaK4gir4x4A8z+E0+FpjlXak9g7j4
	xYeRp5Cyg9Sa9S5ylsY5S/yiGlhnoh1mjBGXma4hPtnsOByGpwVGDbM9gd8DyvZJfTKwb0I1HVCn7
	U0c5Pm5VQq1uiM8VbC2LfRPNktZ0GvyRy+24B+VJ+PWeXtJ20WKLA/WHV1Er4+RyS8RM2jtFyuYOk
	8LHbqXjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZvA-003DWO-0K;
	Wed, 12 Apr 2023 12:49:56 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmZv5-003DVf-2z;
	Wed, 12 Apr 2023 12:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1681303779; i=frank-w@public-files.de;
	bh=UyLMRZ7l6QPvBPSTkFg57mjxK4zHgNRbpfQN6gXBjUU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sslBj3aE9iF2C7G1oH3NeKKwJuFLMUr4KaDZ/h8vGszrGHoHPBB19327aQVu7Q/dm
	 r4ERucD0/C3tFHtMky7htCuQR741VVcneeuHV1oqs9eUCCH8PLaolRzVjnJVriydqr
	 Liq4cnrQpyfnK/fBI3Ydu8FIb/GQomtSMA49XAKuDTdBsaWdah+avlubloQBI79Hmw
	 2ZB9KBRjIGqPqiQlA9ys4G7nVuSMYFFAFouWVBwLPwa8/186gWiIvy/2VjTpi4GwMh
	 crNXJ7YkxAzTkh2UUm3XjQTYFXH8FB6NN3aHL5TlBTggGl9bN3AlOVxG5kylMVudfE
	 nk/bWkyJG58FA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.157.203] ([217.61.157.203]) by web-mail.gmx.net
 (3c-app-gmx-bap50.server.lan [172.19.172.120]) (via HTTP); Wed, 12 Apr 2023
 14:49:39 +0200
MIME-Version: 1.0
Message-ID: <trinity-3f46d325-bc45-4ee7-ae86-c8db4467aa94-1681303779505@3c-app-gmx-bap50>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Aw: Re:  Re: Re: [PATCH v3 0/5] arm: dts: mt7623: relocate gmacs,
 mt7530 switch, and add port@5
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Apr 2023 14:49:39 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-899c01a6-0fc5-4900-aea8-2b43802c8329-1676814734826@3c-app-gmx-bs35>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
 <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
 <trinity-dab715b9-3953-40da-bc25-c4c2a5e9b7c3-1676715866453@3c-app-gmx-bap53>
 <27a26da8-8297-5327-7493-54d8359b6970@arinc9.com>
 <trinity-dd260791-3637-4193-8f93-a9fcdb013dcb-1676722705920@3c-app-gmx-bap53>
 <2dc2fc39-b0d5-c872-36bf-fde851debe4b@arinc9.com>
 <A329B2DF-04B7-40FA-BBCE-1F1012A6DBBD@public-files.de>
 <fb96d8eb-2eb7-db19-1135-1a833294dd67@arinc9.com>
 <trinity-899c01a6-0fc5-4900-aea8-2b43802c8329-1676814734826@3c-app-gmx-bs35>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:29b826fSfORpy+Qrstb1Vp5t1pfu/RkhsZDoqVqFLBbLiGanozYyp8mBL/se+ZpI2g9i4
 K/T8ZDU5wYc8UvDKFjpv9j04igMgqHiMl53kpgrXWd92blZeJpJYR2xphqdfLURpZZy1KaJTw5ew
 RoqcYBVfTn61rb2Bad1VGZ34ql4rH5eFOwGbtt6Zeny/G+DAo2LX1Fzj6iGTvaIgdtIk0iDj4yLu
 GNtNog5O51tSwQSngbvFdTVyz2iwRYhfCUxQojB2Omt9A8frimBgYTiaddcmXAu+ydR0UXEUQunZ
 8U=
UI-OutboundReport: notjunk:1;M01:P0:pGyeBCCJSc0=;0dql2H5OJQ9h6xPk73wJ5eNbtce
 BfX759M9+hcfjsRBLxPc+QDOBT7h1S9/r27jDXKj3TNFuwYOcEXBFFt/CO4LlOiQcVHPzLlz+
 S+3ilCWCXzfOYE/jvPxBj0CXP4xLnnD7AvlLU16XyXZ8XUA7GmedHsMStm9d0S9IuhtV7ioLP
 EoI1DgdilEnzNMTJX+mqCy5KpjGQh62Sb8kmydX8RyKDRJUZbkgoYxAm5nZQB0py4DT16kJij
 hsLa51BHbdTLJ2DE1itv2+gwg4noJSi5gOwXt5hMO1raAYfpWgDt1zsfhLNRLp8e93o/NQrr5
 CspkIT7pDA5gUR2HsGBzDbLmhI+3owUk1z9rJMyk7yZ+dETmtarPl2hy6qnn7HkO/cB2P1pQJ
 XriN8Q0BzOD/Ud/zpkoDJSsyS0Z4P6FUuX+IoFzaas5Ip3XTp7Kr7G7SqcraE6FmmUDcc/hz4
 4rhCorQT7XKKjtBu+ehcrl+XU60zpJ9dDKLWdklgujDrB9gUnTKZJlZ/7hf92oq+Mk9kgXyPx
 6Yeual7lxWR7IrUJazCY4Kn07v8vE2UPX9E/H5VkbjMFK4aHJHmVLhjRuQ7lfVMzIQ+tofVKs
 xie/9fb+evS0QxVlkWpdesEK0MtRa6AWQxxNTCzAIg1oQc7WvtlvlQuVKIljj3AvO42NQ0wua
 zDB2j4lZoWpLMcy0oVGuWMKvkNsUijq59I9rpDZASg6JPcH3SEGLMdhFuQtHGehxdDlfa9sHH
 kjdOcm5SjNneu23FOcHXgyyJcfXmWRecLWsBq0c3Bslm27TR6+FkD2QNq0u5c4FUZnC4RpZ70
 opwQb9h9aWHDxoio8Q0CDkcg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_054952_276829_58B34563 
X-CRM114-Status: UNSURE (   9.73  )
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

Hi,

retested series on bananpi r2 on 6.3-rc6 (after throughput is fixed for mt7623/trgmii too) with additional patches:

"net: dsa: implement preferred cpu port handling" by Vladimir Oltean to stay on gmac0 by default
"net: dsa: mt7530: add support for changing DSA master" by Richard van Schagen

looks good so far, but i have not managed how to change dsa master from the preferred port (eth0) to the second one...
any idea how the correct syntax is for iproute2?

at least vladimirs patch should be included when applying this series

regards Frank

