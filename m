Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CE9C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKmgSryl+fWz7W3RkCUzclzCEhaa4WImtJO0zq+15Zw=; b=chZfgpRIpohCxodlZILb+lkCbi
	Zhx4/0pPbVR18BWE1VeYjy+G1YVq+yRajzybg3KqC0PWfJ4T1Wiptg7lx5mCBRI3Mvj9hkz4+pZUX
	L6wIakjR448/hudpGraKGwVLah5ZuEX5gOsfZVaJHzQBFMnFrlSboBqCpVeFq6/Flqu0JMJP2tzg+
	bB7i07vdTAw4RMz/+N236yrri2CQcR2GyUhEia5weNVmZM4Yav0u9ODst8fH8s1y2FIrjGIoDoHBl
	5jpQ/MXgfGxUvUQSD7U8CQBDvn4w7DkSVoij1CVXg/G5/zbZ6WJD7Bd5xiqifJOzBSa3jssgg626Z
	9PS5WPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oEI-007jyH-12; Sun, 04 Dec 2022 12:36:22 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1oE3-007jgH-8I; Sun, 04 Dec 2022 12:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1670157335;
	bh=QKmgSryl+fWz7W3RkCUzclzCEhaa4WImtJO0zq+15Zw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Vwbzr/DWKYPnydhgSYw+CDy+dtOp8pTitcy0QkA0kQ+44cfktbPft7nNYT1bfaKUH
	 ttyGGZno6+taom0zUiz1s4SEXnZoH2WMyOFJqSYPHULCfQPThLBqLGVUt91fXKVmbS
	 vDOvDXFDv5qVEA/Wy7W97IpWT8stZ9qcZO47t0efffO/z+jvxurzrWEit3DLWKJ1GY
	 S1Mt6SpNZIPwjlseQ4ImEeCiPNm2D50RBjI8mWNQLu9Gg1a8v0NndNChRWVK32rXu2
	 WCev+WKAaCSr3K6aRpSFGBMXIQRx0lsSHjoovn40ZR40c3xVTydN4v1UYXtFwlmE0R
	 vYK0/b9wqvFtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.148.219] ([217.61.148.219]) by web-mail.gmx.net
 (3c-app-gmx-bap34.server.lan [172.19.172.104]) (via HTTP); Sun, 4 Dec 2022
 13:35:35 +0100
MIME-Version: 1.0
Message-ID: <trinity-4e4e0da1-db81-4a48-986c-a68328a84b45-1670157335627@3c-app-gmx-bap34>
From: Frank Wunderlich <frank-w@public-files.de>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: [PATCH 5/5] net: ethernet: mtk_eth_soc: drop generic vlan rx
 offload, only use DSA untagging
Content-Type: text/plain; charset=UTF-8
Date: Sun, 4 Dec 2022 13:35:35 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221123095754.36821-5-nbd@nbd.name>
References: <20221123095754.36821-1-nbd@nbd.name>
 <20221123095754.36821-5-nbd@nbd.name>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:hPIsZNZBUMYLcObVTy2iqrd05dLeAn6ye5PtJjxYLRR03vcKJkhDpnXrmwaDGyofxU0c5
 o9cbE6jjXfIEgLuTQjJXXT7h7f7ccS0DZFngMbVKHIW35osKA7kcZYQiHPB/3GeoXnT4XEYPYmGX
 j1s6B1a2oERrbkSNTw/nMAq3UFNbKIuiiBsWHVwZ3YKWvcgnjOx+sN9dEAnh0blkx1B2Aa0LfCwf
 sWSI9AAMf4m5zMR8GnS15OxMuLjAnurt5nZqTQRgtp39TEQ2C2p/zImUkqMzyjrxTHvhKvgD3p9m
 mk=
UI-OutboundReport: notjunk:1;M01:P0:gQi/31dsW8M=;wsNvnjdfBkK61ftkq6/PG12X12G
 mjZYuCjTYuk/86SK+iGDbmcuCk/p/U1vP0+RXWAH0KPxPaikWw0S2sm/87K8AFIE06DF+Gf0d
 m5nmRUu+We//cJs+43AXTfMnNsClKZSfC7GRW9SUev2u6HXqtDsR5T8BRf0pJPD4MDvfxVuug
 2cr6JDMJ40/wGT4IW18lTuUV0Xtd9fWLMp4S5+GYuFDWff8sTPorHq6ZO+2sMZmKUHNDUgoM0
 dyglzt+EyCy7mc460SpIi/jQ/GZQXsyT34z+bS8uAzqqi9Pct1p1U0W5bxz3lyoibcNbjA5oj
 8saeHCBj+zyNHiVO4mCz8fmiUgFlL78D5BpvBgTP2bsrhj4acgy4LpRH9uauuT6Ew3MKjLiz4
 pBmjfonmwxWgGX2qgB4S4626wZo3cSblMg3aoSApQYN3lOOoFlOSXFKmkYk37ZitykRYrNxMH
 L5xc9tFK3j0vYon9dUJYalySUbMQpJSMvjh7YiB3cj/S0vZRTzy/Pry4ra/91ilNpby4P0k2I
 Uyq3M5SPe8kB106OH/qW+pBDZX6tBNu4tvKhKZkXk3VjEs2xEriLN06dhqN7Co+xFtjaILeGR
 mmyICQoHyFfOwo8c+1fFmfnj2QMUSG5meCiTlIQpcWSbJLZ156RJGBHaglrseqQ+1sxboC+Rt
 rCosEOZMcxom8cBdPMsL3XDrhLwx6WQ7m/Cnzqlkoo+81NGcTsM18ToGDJd9sNmAOkJY9uN8i
 nPiK9sV8pH6/2Xb0iHBkJgOpghgApqwpHL2+sNro7VAaI5jmFbJEkq25iy9RKW+nsOw6gHFq8
 uJiTwzWwEhIC9sUpbiUIObU2ZQ/PhUZTG+cZj1Ilrv9hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_043607_600840_95566DC4 
X-CRM114-Status: UNSURE (   7.52  )
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

tested this series on 6.1-next and it fixes my vlan-issues on gmac (Bananapi-R3 sfp-wan). maybe it can be
backported including depencies to 6.1 as this becomes the next lts?

this series on 6.1 is not enough to fix vlan-issue...so i miss anything there

but for next

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

