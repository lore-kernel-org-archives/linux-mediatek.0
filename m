Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430B7C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 11:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCjTfzTmeWy9n8dw4GQW7kp4u3L3AAf/DvNOBU2t9cE=; b=eFihFh0ak/Gq3jV0WmNDzkwGVG
	FCAt8uuxYXtZSTiLdu3gdoMgcF8ji8PmhJUsBCGKFhuHfS4X1vQ7OqXBHeBa+LKlVCYwntXYr5hc/
	ef37Md8nq4PvhslKAfLadCQIQXYSNs7X1CTzVcaA/gtOJ93Oiz+g/fu/8y8LZnTmUC1ZFBBWyBUtq
	yjsDL8EBOLMa+qSlpZi3v1DPTkGspIM9rYN+SAfKXPJRjQTd+o+qi98efa2p0koddgBA1L1KxTSnU
	DSGN/x7rE/xpFCRZVwdXXEOOIc+4NJ6hTwWd7CPI/WMka9KFEHP13NcF1He9QUDqmKz7h7XePfYd6
	gOB0sOZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBDwr-008mHg-BD; Fri, 30 Dec 2022 11:53:17 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBDr3-008iyb-Ji; Fri, 30 Dec 2022 11:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1672400818;
	bh=SCjTfzTmeWy9n8dw4GQW7kp4u3L3AAf/DvNOBU2t9cE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TCZgW7Jz2UMLmD1MvJS6LSHAcB66OPer/q7uju6GiGdk8LcQp9j0Jio99KmybXOdy
	 BF0710uw0BeOWcY3uAyQLcOmGKkwkpYU00v9hcks1n60XP+uv5pkf9jel9PSSPU8Qh
	 qQIjxbF5tF5GWQNjb6g6ntqTkO4kMWGU9ljbiMWwRh2H4bm57N7Yj6dQ/2dkLZRSN8
	 V4ZR+PAvBsgF36rnm0LmIRt9QSsgKIKHfZf3+M1DvuIDHkusEjtMjw7t0W4rxs4DcC
	 JQ5CX79VY4tyJJw00afd00hIgFyvCMRKXZJ3gDlla/kBO04aGRneE+ODbVgEDgPONL
	 9vpDAyNGxB1Zg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.149.221] ([217.61.149.221]) by web-mail.gmx.net
 (3c-app-gmx-bap18.server.lan [172.19.172.88]) (via HTTP); Fri, 30 Dec 2022
 12:46:58 +0100
MIME-Version: 1.0
Message-ID: <trinity-a07d48f4-11cf-4a24-a797-03ad4b1150d9-1672400818371@3c-app-gmx-bap18>
From: Frank Wunderlich <frank-w@public-files.de>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc: drop generic
 vlan rx offload, only use DSA untagging
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Dec 2022 12:46:58 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20221230073145.53386-4-nbd@nbd.name>
References: <20221230073145.53386-1-nbd@nbd.name>
 <20221230073145.53386-4-nbd@nbd.name>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:pBNX6Fm1zCmCsuMmsd1KSJ5HZYIqM0xAkIkqg2IFo2qZR7S6v3CdQN4iioTk9cBQFBIM2
 NG2WoYifTmk82CZEkXlsSpNNdrr9dzS0svrYVuFUFFf4PUGZfgOH9K358SuF+TatXMpr7NGE51oO
 Sq+nuKq39CEgTBTLblkL2dn2pXy6MVVc6CCUqIuZnvJJ5OvyiQ+kux0+kPI3Ha/qh7Fvs6Rnygje
 WJAlu2zIuQE44I0N7WrPlr5nBXDghvR7abfXc8uTiQ/qKJi3RJrNPuf38w7x064KN7oTQ5V00uDI
 DY=
UI-OutboundReport: notjunk:1;M01:P0:s55aR2gjtdA=;MoY7pO6ZbycU6xxZxfaR/brva33
 7eL872kep8tdBUIoc4USr2MnC3XvpnKVTvuzumL8rmH175hu/mOA0s1Nc6ltGIzqyUdJhDi4P
 zRMyVSOiHDZ8YVFK6LC0NE0rqnrMCBh+Myu+ajV3K8UsqwntNMNXLAB7k5UGbUKQWHdJjoTrA
 /prcZJlwDyRnLrRs4pQU6UwVUNVf+jyrH/0Ix5LW7wsf/m+Pquyax7N3HfldP4H/SK8a95P8o
 xrImIyU7zozpM+uxBgkNK4BjlAgqy2TXMHFOfbkXccUF+UsiKGkS7Z3is9GFqv20Ytnytlpf7
 lkiGMJLU32H1GfLL2lV8/zaqngjXD4NMz3n1kDdNLfCZmNMntfAPYO9ZBKEYZyGIWe9W3wIvZ
 4VHVOi6rCDwvBWhekeBNg4uHkXAyo9FB1O/9W4wdlPIh70zOaJoHTrwsrJdeSnnXYRsmKUndU
 9a6F2xLcKaUIl/QPvR+b0QFBSiqvW0cVzO5n+MiIwbyLF9JyM4ejOFxBq4YYMq0hURjN3wMkG
 dOmoWqBaXTX7UwcHf10wlMUfyvqeK2hd9T0gDdKyJrGBH/Til3dteI41yyR2RnCTpPywo5PxF
 Z1+l0gnFXFRDeZCz/2009y4sVZFU8zQVVWibHHVOMdZzNzArhSfFLFGV1oogj2Nu0XR7sYVFU
 ekRhSSd6rIFCJqCPoj08FyLNyCq+4T2skuKjn55yjXGazLPnrmcLZKsPtLn5vnB5KlujQpTc/
 jP6tAcIQBIgF12oSKl1ukKKCulwghowd1BFI869uFLcFIE+e1rGjhIeEYWXtjXyXpUxqFi8Ot
 tQy7pZ+PZxtJSAC2WX7K9wyg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_034724_101072_754B72EC 
X-CRM114-Status: UNSURE (   7.09  )
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

v2 or v3 seems to break vlan on mt7986 over eth0 (mt7531 switch). v1 was working on next from end of November. But my rebased tree with v1 on 6.2-rc1 has same issue, so something after next 2711 was added which break vlan over mt7531.

Directly over eth1 it works (was not working before).

if i made no mistake there is still something wrong.

btw. mt7622/r64 can also use second gmac (over vlan aware bridge with aux-port of switch to wan-port) it is only not default in mainline. But maybe this should not be used as decision for dropping "dsa-tag" (wrongly vlan-tag).

regards Frank

