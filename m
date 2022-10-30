Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167ACECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bbvkGLwb/l1l5DfSEEWjM8y6U4gTUldLMgsN2ZwJHI=; b=VxH/BzFLPGPFArg3l62iGd8pZZ
	gsJzlzu1Cl95SeJ+OgrELUTWPnyZGt2lqU0JW9RgNVMs/NQmbaWhwuKuQZ4GN+0BAZXIuUp9ZgddP
	xzBBfZ/jsSThdQuODF973UB7fwj7O3WYSHiMhtdAvCXPOmOGtY7hQhZaG5FPr5AGGEQDnHV6EO2xW
	xsOXZJzZVeBHuvC9HfZ7BQHHIwcAPHHgyPbQFugaVq2kf2qT+3+Gm+hw0AA75lve/O9p4AQY1DuPw
	dkoxbsbEXEthN6zvicwGPqQeRe4ibgGug9gfwACq9rSHa7PlYSblDIUbj6CqEQCx7djqWLYOYNC/m
	03OiMvQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opCKv-001JjL-Ll; Sun, 30 Oct 2022 17:43:05 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opCKt-001JgU-IE; Sun, 30 Oct 2022 17:43:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1667151762; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LoQgOqNpF8Wwcu6VtLKcO4yYoCvOKAdIVCYF9kaDjStJS7UpaFt6+gdxBlbPtZ3q2AhTueAktG3rTOBOAl/ZlRzWFtKPXQXbP/2Y8hKYsSkJtz5lu8YyAZma6cVn3G3cJ6hUp5vRc+t2RqFvag57ztmd0POErtRJRrdFRJ93how=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1667151762; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9bbvkGLwb/l1l5DfSEEWjM8y6U4gTUldLMgsN2ZwJHI=; 
	b=d/INXma4ZfwxCDKG6YckAw79LjrhUW3sxofmHWm6WUj2S1wj4YE80ny6R3T98/xS8/xpkwpPszBjwrqheeet7UVG7YG7HYg95avPUITQZep7aaPzIaPpyuzsOs9OtpE2KLdLHZMFIZWs+OOVVea2V1oRhivHEJ0pGNSgsX04IFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1667151762;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9bbvkGLwb/l1l5DfSEEWjM8y6U4gTUldLMgsN2ZwJHI=;
	b=BgJlSSBIjCMuklesP4o7xxtQBHELhJLioMpT0uZ/6IziR5QiJ3g7DtK6SY/DK/z8
	+XNGl1kZovw21Rwa8t4UsBugjGTAzdqGXKLVuUrB1AANgJkKufZi/Fu9qcgAUKdyBQp
	Zegg27gAXPxIotcEcuusabwUk1eWrnEosEjSdv3Q=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1667151759719557.7288943473982; Sun, 30 Oct 2022 10:42:39 -0700 (PDT)
Message-ID: <a75564ec-3a9a-1bd6-3f4f-aae28ac933ad@arinc9.com>
Date: Sun, 30 Oct 2022 20:42:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 net-next 4/7] dt-bindings: net: dsa: mediatek,mt7530:
 remove unnecessary dsa-port reference
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Vladimir Oltean
 <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>
References: <20221025050355.3979380-1-colin.foster@in-advantage.com>
 <20221025050355.3979380-5-colin.foster@in-advantage.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20221025050355.3979380-5-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_104303_693990_0E33BB85 
X-CRM114-Status: UNSURE (   7.02  )
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

On 25.10.2022 08:03, Colin Foster wrote:
> dsa.yaml contains a reference to dsa-port.yaml, so a duplicate reference to
> the binding isn't necessary. Remove this unnecessary reference.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Thanks.
Arınç

