Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35981C7115D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jun 2025 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ymGnUSpkRYHimfXYhbTcSoJdcHrDDRnjSW4Hs85r/BU=; b=vXK9LG/3+ln8Ak
	H43ev6yEvp/i8cAkR6+B3TZf2bocgiaQxvuOLlvxe3L7zaTb/eEETToVTtB7LWBC8BbSpwyURauTx
	V+QJa1kO4/HuiBdB/kNJymCFjKyJwSMQNdE1zT2YW00xjfg2uTdebpCuuqJIyLhTvSswlCcYkcL1O
	Yph+nAqTYL0/phizC4UvkwLXw0cI1coHzyjbT1Ml8aylHo/igDCDItGOmN6Fbv3sEWZD7s58PiOQC
	E4WWsAB/oYA6GtjxbYJ6xEhpXycgTKCBuqNwOF62uQHB9GPTUI9dnb/LKzEZoBSTXa5/z8JbavZKs
	D3FsJTJ8e+gQzgUArx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZnZ-0000000FS6n-0lmt;
	Fri, 20 Jun 2025 11:20:45 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZ6e-0000000FLhi-1QIs;
	Fri, 20 Jun 2025 10:36:25 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout1.routing.net (Postfix) with ESMTP id CFE9440265;
	Fri, 20 Jun 2025 10:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1750415782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymGnUSpkRYHimfXYhbTcSoJdcHrDDRnjSW4Hs85r/BU=;
	b=BWZHLfWL6yztxVhkUvb6zkqvR+EVMfS3EFL+phNtPF05FcCJtKkzgV+XzVTyfpvhF6uzgl
	WfjlMArQzLuwmI7YLZLPOPD4hE21LQJBmbVArjo8W4rd1hNEGz/6lECib4SZGX1vD0w0u8
	hVxlUDd2Rdd8DARtsQCVbfb3HBqu6Hk=
Received: from [127.0.0.1] (fttx-pool-157.180.225.81.bambit.de [157.180.225.81])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 12D1580238;
	Fri, 20 Jun 2025 10:36:20 +0000 (UTC)
Date: Fri, 20 Jun 2025 12:36:22 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Daniel Golle <daniel@makrotopia.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_01/13=5D_dt-bindings=3A_n?=
 =?US-ASCII?Q?et=3A_mediatek=2Cnet=3A_update_for_mt7988?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aFU4jSUFjWJlJCWJ@pidgin.makrotopia.org>
References: <20250620083555.6886-1-linux@fw-web.de> <20250620083555.6886-2-linux@fw-web.de> <aFU4jSUFjWJlJCWJ@pidgin.makrotopia.org>
Message-ID: <8EFC68B9-E560-4BB0-AD16-98A847D2F084@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 2c931364-7c27-4fb5-b79b-85688067c00d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_033624_521671_D0BE5763 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 20=2E Juni 2025 12:31:41 MESZ schrieb Daniel Golle <daniel@makrotopia=2E=
org>:
>On Fri, Jun 20, 2025 at 10:35:32AM +0200, Frank Wunderlich wrote:
>> @@ -40,7 +43,11 @@ properties:
>> =20
>>    interrupts:
>>      minItems: 1
>> -    maxItems: 4
>> +    maxItems: 8
>> +
>> +  interrupt-names:
>> +    minItems: 1
>> +    maxItems: 8
>
>Shouldn't interrupt-names only be required for MT7988 (and future SoCs)?
>Like this at least one entry in interrupt-names is now always required=2E

No,this section only allows this property and it
 is not listed in required section and so an
 optional property=2E But if it is defined in
 devicetree it needs 1 to 8 items=2E


regards Frank

