Return-Path: <SRS0=N3vC=BV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9FCC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 08:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02B98206B2
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2020 08:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="btmxzBDe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="jw4kmYkd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02B98206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L0U4aHmKGhXjOmldWeTlQr0nnMD3BdLIi7eWc0it5fg=; b=btmxzBDeIEdYEqPhGIxhCq+JMG
	wVlyI47Zmn1dDVedVrc4WVtphzMJnSmdQfmQ7BJs8Esg38v6/l8uwf2YYlaNUTTCHM/evct3tJiZy
	zEMaPhxgjh8lFWBlXqA39fEkIGFssWQX0ko3Cm4L1RGLNQ+ugU/wUPG7dZnH37FMZZd9b1SCSAwio
	J4x4uUa12E+uuz+HXOnQgA03zV80XCobqWF7bCX2CIBmb8Ag3fi1W/Urk1Slx69OAsxSGMLTrSFb8
	tIY3em5WIwjBhlohPwZeu2Ry5YtPACQqcSJonAaSS9L2HomY3gailx3VMdKAjo3nlFYU5UM/8Bf2n
	sfdtkk4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5PwK-0004s8-T5; Tue, 11 Aug 2020 08:47:24 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5PwG-0004rc-0B; Tue, 11 Aug 2020 08:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597135619;
 bh=M9M7qYL8VZFfg/dq2QG/8WazSOytN0i1RiT2ZH3VShU=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=jw4kmYkda4Abh/fHKBk5KP8TF8AW0E7uTvjH+gxQnPoDL60P61+Hm2m9qyUfTSvRL
 sUjZyTMsnxDyViHlahMCBFpv/EHmoOgHlsdnjJ/Z6obU+/C6AsscKWuSu+kRX4BysK
 qrZ+HkyNJlUZjzqamkM1oQtq8VOBSD2G02EP6x5k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([185.53.41.139]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M26vB-1k7sgQ1b21-002Xlb; Tue, 11
 Aug 2020 10:41:19 +0200
Date: Tue, 11 Aug 2020 10:41:10 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAAOTY__4Qs93EMjrpK_jW4NsxyZf7w3RHa7vDSRecea_JwAxKw@mail.gmail.com>
References: <20200807082754.6790-1-linux@fw-web.de>
 <20200807082754.6790-2-linux@fw-web.de>
 <trinity-f5a5deb1-c123-44d7-b7ca-1f7a8dbe1c1c-1596889651064@3c-app-gmx-bap69>
 <CAAOTY_9o_hBWxWBdDoeeJ6zuV4rb4R_yEoN5+L0uHBGMw4Kduw@mail.gmail.com>
 <cefc273c226c93c605f4dc76afa9eb5aacceaf26.camel@infradead.org>
 <CAAOTY__4Qs93EMjrpK_jW4NsxyZf7w3RHa7vDSRecea_JwAxKw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] arm: dts: mt7623: move more display-related nodes to
 mt7623n.dtsi
To: linux-mediatek@lists.infradead.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <363F05E9-8D03-4CFD-83C3-1E874DA34309@public-files.de>
X-Provags-ID: V03:K1:ZNP3U6E48qwNApq7w86xi3lRf1wvP7J2P3fv+9MmDvflbc90kRU
 UNDIqQJOtP4hVaiDFfbEwVPzgkHgtgrRs3f+xv1TBSpshhMuXxjpV1UJhr9z/twLft1AurV
 TP41dErgCY9+JWekywsyK+R/hnQAXc1bzVRwzAV9auDSEiemgH1RhIRxJNAsuUjg8TpbQ2K
 Z6onIfvwHsD4BxUOoaRkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b57eCO5gZBI=:nFSGWm/YpJfKptj2ClS9CW
 bHegfo+Zwipz1Vn+2txnZa9ygcbLt2QlLNyIG2pdsDtSi4CdZzRqUFzY912fr05cD/LXLCE1U
 qR4zgGESbxZmHVTNyMHRO4TzpRZyegXsU6dCXE8WaIB9YDlKPrzlSb335RkDbvHzfEOp5LFhY
 jZZMm3H7e05D6auEa9yy2qOAgHrGSJmaHAUF00VgVBlAMjgWb/QWhiABVrUFq0jGXpeDc/CTN
 cWEh5yyrNm+slnc+7LBQ6UrQN6RjnzkcXlQ9M4QXgPLxsCdzMzik5eZm6VEUNDKKQNDwDfsh7
 km7zEjHQvlvRrj9FIoMUHxq3N0afSteg4dIOn/rQ9yIhAG5mp+8IVlZubB1O6QV2CV1jgPjsB
 WokImN8TmDXg6RulAMc5WaZhItCZ6VImDZlOnYJ+VPUSqBBEvVeSS3T3gknUH8tJ0bp7zLu03
 aoy7qX9yrpJpbc5pc8vrMfvAo2pgKZYTRIUs8YF5Jgh3n4ATQj2q0/YDhrDM6r8QRhQ61bMkh
 3OzuVbgRQ2iQTpHEDiwi55CrK4gbMknQf1VlrElHECsvyX2zcg3zXl0Ma4bWIhG+kO3UZybBC
 Evnc15BaFJ/VdNz9ZpTbpRCl2CuvJ6jaGLXipmYHQUJ/kMbXTcYnKgF+fRaoyxFriE/02XSKz
 jHZIHTkM+IIz7pbfyR9vff/u2/7uYzg7EN6Ac0cO1h+dz1vi7wLca6EUb7P8CT+7w7KKWtF2z
 r1UDLEnqJZML9HmQfAJ/8CN+wVe0C/PizQIB/03B6Ar8KnmrkIjvemgwg7M4kF2CKItklJ7mR
 vczabc70nhtoqSam6a2MKBF33eWhIFjgJuOoGEhUI0b4JA3lYbTi/CXcUabbKhH4J0UGQU7qD
 c4s6GFhs7IkeKeuE9B/WXyFe+khuENXUst2+sz9uXfd5+8t8tXQr6RXEXGXI4q1OGuTLK2prw
 Vt0gzkaQoCWYxqnMwSUxfsuOu9EN/N9HIWGN23fCrUClTL9YsCdQa1UULHAa2rkb+r/qIVLTY
 sV7xLrQZIrXq3Vn/1JfIS7eIWXZ/Huuj5k1J/YPLS0tlGCYtfQR15x9HqBk5jVQNRl0KyGHkP
 Z8rXQS2vv1uOUsQF51QIvIN1EdmcOufrWYnbOnQlgx2/SESbvNZ9Qs+zR8CP7OTW3c16hLM+q
 gk4Kvwm+qO2cV8FeeQZemr42mHPi/lUD3qVHgxZanmZT9zJiSS2hv6ahGBVd08tDf3Yl+2BE9
 NmkLKBhyPv5VKbGFS9R+sxqcfdgz4h/kJhMf2zA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200811_044720_266396_90ADC542 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: frank-w@public-files.de
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

Am 11. August 2020 01:28:25 MESZ schrieb Chun-Kuang Hu <chunkuang.hu@kernel.org>:
>Sorry I does not notice that mt7623a and mt7623n are different SoC.
>Because they are different SoC, I think the first step is to upstream
>mt7623a.dtsi and mt7623n.dtsi independently. That means in each dtsi,
>it include all devices of its SoC. After both dtsi is upsteamed, we
>could find out what is the common part, then we create a common dtsi
>these two SoC, for example mt7623a_mt7623n_common.dtsi. (Maybe there
>is a SoC's name is exactly 'mt7623', so I prefer mt7623.dtsi is
>reserved for that SoC, and mt7623_common.dtsi is not preferred because
>I don't know there are how many mt7623 family SoC and
>mt7623_common.dtsi should be use for all mt7623 family)

Afair there is only mt7623a and mt7623n. Mt7623a uses mt7623.dtsi as common part. These 2 soc are released 5 years ago...and only these 2 from that family).

https://www.mediatek.com/news-events/press-releases/mediatek-launches-the-mt7623-and-mt7683-multi-standard-iot-gateways-with-high-speed-wlan-to-lan-to-drive-the-secure-smart-home

So from my current pov the best way (to no more delay my hdmi series) is to move display related stuff in new mt7623n.dtsi and keep mt7623.dtsi as common. So we can avoid touching mt7623a.dtsi for now (can be done later if really needed).
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
