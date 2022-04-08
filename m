Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB214C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 07:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:Cc:References:Message-Id
	:Date:Subject:Mime-Version:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKAykwoHkSO1NXrwfkTDdsSBlAzNZ/vl5ZCPD3ktEz8=; b=mhnmL7EhYya5Fh
	mpuUnTIlqgwq+wtE3DsxDvKCaeihXOuEBAztQz/RPU9/VjQ+q1pIiNNu3xnzgntAC23jmB2yb+lIE
	kxwmAcRc3uuA/+KBKtdkkHPsXWJc2VOvowMHPMinR13sJmfKXur0TQKb4yzX26U12nt4mX+X8LcXK
	LWmERI6TIZwge7W9YRRuawODV2MfeWZLjUd++PDtvNXiRlwWKKOxVF9QGbu6c8fuVwxso+ijdsEV3
	6m6Onw0leSW5f9cccCA2iXksdqpT6JZJfLtRoVPkzi2RhoNOl+F0H1PbvTQlwPMFn8OmFZYvrH8xj
	xvENSOhP/NJKzluki5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncilJ-00FQFU-M4; Fri, 08 Apr 2022 07:10:29 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncil5-00FQB9-7B; Fri, 08 Apr 2022 07:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649401800; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MmiAXIAKk19pYhrM4Aik2YO5yTmZ1UPPK6sKjaV1qtG638cf4uDWPIS3M9jo8MkEcBY+LKqoNjbfP9XzV/nza1kdeWvfi4kLgB4DPTxJhHumOIEdIBEeCwRYuaA6INYhFb1v0hvHjo+TowSGzsf70OlU/K/2qbrDPImMc9F+B9Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649401800;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=eg9fa4mgvSov9adJT7QuT/g9DxpZmotsvTIi0D2NY64=; 
 b=Wxv4dadT6rIS6uIqF9YsJFoHEZvwe8Qhmx30iX5MOwgiEBHXizQFINIJwFcnSk0ggKGEMMXyJ4Eue262LFbP/PMTdsZsiUbY0qZNA81gxviolKbTzwlTFKuxKwXcSi7rJY3LaCH7wjeEpUnJAmgbtkNELAPHh28WzRyouov/nUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649401800; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:Cc:Cc:In-Reply-To:To:To:Reply-To;
 bh=eg9fa4mgvSov9adJT7QuT/g9DxpZmotsvTIi0D2NY64=;
 b=aEvyzih9cImRpRa+B7JZwXqnjhk5sXPYln1IGy9nzpbOLadJNq0GK0B/lx996zsV
 ft/sKqbsEt/n8WR4cVJmHSXUNynpMQcOOpOPxfF52dH9OqJ0kCi132ivBnEHubUumux
 tS1lE8S1XdjQ9bfVqFHj3Z43QWkmODhhIalkVJho=
Received: from [10.10.9.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
 with SMTPS id 1649401797701217.1237282746249;
 Fri, 8 Apr 2022 00:09:57 -0700 (PDT)
From: =?utf-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] MIPS: dts: align SPI NOR node name with dtschema
Date: Fri, 8 Apr 2022 10:09:45 +0300
Message-Id: <DD1B5C64-D5F2-4AA7-8420-92E06B51D6B9@arinc9.com>
References: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: iPhone Mail (17H35)
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_001015_341472_1FAE4277 
X-CRM114-Status: UNSURE (   6.25  )
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

PiBPbiA3IEFwciAyMDIyLCBhdCAxNzozMywgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9m
Lmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiAKPiDvu79UaGUgbm9kZSBuYW1lcyBzaG91
bGQgYmUgZ2VuZXJpYyBhbmQgU1BJIE5PUiBkdHNjaGVtYSBleHBlY3RzICJmbGFzaCIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBs
aW5hcm8ub3JnPgoKRm9yIHJhbGluayBtdDc2MjE6CgpBY2tlZC1ieTogQXLEsW7DpyDDnE5BTCA8
YXJpbmMudW5hbEBhcmluYzkuY29tPgoKVGhhbmtzLgpBcsSxbsOnCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
