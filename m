Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0B7C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJ42TYXNstwFFfe6ILMTlfwXNOmGVKYsc07XVk19C3Q=; b=zeyCrLmfE40Eg8s8RjbO4LSgXC
	+Xc0piS02soX3i1ncMaaTMRfQjRnnCUi6lbks28KQt/G2vKk++d5JH0rD2ek6Wrfyw+ePxilXVVbE
	DngPqD7g2DA3jCMfsrcFxxnJ0c57Cffo+lU8v9KdbwpCztUNVwF1z0c0k+1vTw7/tz9M7E6ADhhEx
	0nNX9PHG6F55RrHjRyKmcjXeG5a7Dvb6SLZqOuHUAz5PdP4oGR9BJTwPe/QfE9p6JJtXxFZ9ZP4by
	lHA9bSHyV0LhVyzdmlY9WbFUOPr/n2P5M8xTtvtgigBw03KgJE5HZO8fFEljUaRv4MsqU/zCzVdIj
	ijdm6bsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtwM-005E3L-WF; Wed, 08 Mar 2023 13:34:47 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtwC-005E0K-Qu; Wed, 08 Mar 2023 13:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678282460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jEgIGIj/R9+TCbQjpVB+yRelWtUfRmVhc4sVl9k4fMfV3Rw5CY6KSxE4Hno/phvwkINYlExmaa5lbqXE3F21cImwPkF3dhdZvYUt2sRqHhwOcZnEvLBg5XMQ9RkF32XzbSwhN/a5BXsIcStozJhVYjldb7W53omsFXXANpXdu8k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678282460; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qJ42TYXNstwFFfe6ILMTlfwXNOmGVKYsc07XVk19C3Q=; 
	b=mz7PSeRcc0j8mcTgdFqP7VRWtS4Byv3IWYPiAQaCSd1MtM1VKWo8yrABcyQNHdQkMTvFzAVJ6U1hIMQn/bb4I+ZEmwObj8r99j2+rImHj35zPdk90aomze95f2Hx9YlkKbgQ75smRI2UEcBhtkqOfB5/OxlJDx3dv7XjiCOdYeQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678282460;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qJ42TYXNstwFFfe6ILMTlfwXNOmGVKYsc07XVk19C3Q=;
	b=P7+afE+EgFgNc4vdOd8BcOu1m9RjdUx20r9HAXqNC7AiSmzxKHHMXiWnri0DsA0A
	xf9lPd/uO15RAY5/fnr20+WrSMYv+dX31NSfiQ6zB5GE2tcq6MXjquKVolTdlxKzRc5
	lh2GK+P3HrqxEbXRUf8138q4kFqhXz40C1dtmvus=
Received: from [10.10.10.3] (212.68.60.226 [212.68.60.226]) by mx.zohomail.com
	with SMTPS id 1678282457259930.2971623266512; Wed, 8 Mar 2023 05:34:17 -0800 (PST)
Message-ID: <6da6d5bf-be12-ec7a-58ac-a1a1cef23fd0@arinc9.com>
Date: Wed, 8 Mar 2023 16:34:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Fix Flooding: Disable by default on User ports and Enable
 on CPU ports
To: Richard van Schagen <richard@routerhints.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230212214027.672501-1-richard@routerhints.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230212214027.672501-1-richard@routerhints.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_053436_918653_5A98BEE9 
X-CRM114-Status: UNSURE (   6.75  )
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

Richard, will you send a new patch series for this and your other two 
patches? They are essential for the port5 <-> gmac1 link to work 
properly. Without them, port5 as a CPU port won't work properly.

Arınç

