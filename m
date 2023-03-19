Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C90BC7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 15:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaY0Xl4jfnqhSvRMHOlCX3MBxMkltd1/bLTF73k4weg=; b=QbllTOwV+hbrQV0HGYihRSWlhx
	QxKOoEQsej4bZBnpRfoE5BfWr62hHT7f29dMv5gj34fMAML6pMNEzFn2aNCQLAf6aPVqR1yq6GkCs
	TdGZYdHRvz37LqWR2ZzDX5EUZKu9zoC2u4X8DyLOfZTMbo34Jnf4Uz6DusD58w3yCCS/2wiPaBbmF
	fuS8zhsEF3UQfcoOqPhlANrESIs7J+sxc95fadaw3eUkGT8lxJWwAX+j8lU20KcINHcxUOkJiBGgp
	XW/729qJXeFNTVlmAVqDqTqZ27GgrwNCtFNH7p72MeqHz2r5demRpd2Wn5GJsFLduKjVS2b+6SFd2
	S/vP37zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdvDr-006xLp-1s;
	Sun, 19 Mar 2023 15:45:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdvDq-006xLg-01;
	Sun, 19 Mar 2023 15:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FaY0Xl4jfnqhSvRMHOlCX3MBxMkltd1/bLTF73k4weg=; b=ReQiMxXZISECbBA1UkgWmZeEk7
	YXKgHQlH6C4le3KVNvzZ6Sso06I2GjRwroAzKm6DAyJ1/umT4kdM4KjFVeYdqRzODN6djmF6vdQSj
	9xTQN4YkeDmDAx8HYJGqpM//yntqxqjNuIM9bEFSRVZZ+MC2Ct+GpNoRvibQ08HpqZYF4SXfG1mq6
	40djWtGiVPmp5LW07W2jEskUxh8l3gWYiUzAxvmyruTvUSKtvT7kiU/CWjUsEMKy2sPuMiJJMWhRN
	j8ThoX55R/TxGyWgxZvGSwCnkvmTsioucrEbp9GBKYnXn23UMqBlC+ZHumcFBUsNHrrizDn44/kJx
	NDpOLLiw==;
Received: from mout.gmx.net ([212.227.15.15])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pduVu-003XJg-0L;
	Sun, 19 Mar 2023 15:00:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1679237954; i=frank-w@public-files.de;
	bh=FaY0Xl4jfnqhSvRMHOlCX3MBxMkltd1/bLTF73k4weg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DKFNt2WZoREtt+jN1ck1xolqt6Qiz6THIkpIfPuXTRq/Uc2Abd6AVHAGEKUFA9/89
	 mDb2dUp8omXPHSnEqsDO4Jg4+9/KA/w8LGg/x7jyHmLWKbd0MT9t6HHS6N4o+fbAIo
	 6ToGjm0KteUH2KrWCh6YAzXSwt0wgQuR1Q0KxiE9qC2oR1J6Fhz7v9C0AM7pTc8wT8
	 fdY8DslxjZSMD9zrQXZURZDOotWTQz87LR2VyIfy1ZbYU3ZydesjbWMNNQ/JFLARkE
	 Zd4Tw3q0DnX5kTQGDYh9WtCtu48YS0Zfe0oeIaIWSoLF9wiJTh0G5V42Fved085/gg
	 f28dTjnZCv1lA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.158.68] ([217.61.158.68]) by web-mail.gmx.net
 (3c-app-gmx-bs27.server.lan [172.19.170.79]) (via HTTP); Sun, 19 Mar 2023
 15:59:14 +0100
MIME-Version: 1.0
Message-ID: <trinity-a9f91337-a6df-4c4d-86ba-f5ff5118c3cd-1679237954332@3c-app-gmx-bs27>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell
 King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang
 <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, Alexander Couzens <lynxis@fe80.eu>
Subject: Aw: [PATCH net-next v14 7/9] net: pcs: add driver for MediaTek
 SGMII PCS
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Mar 2023 15:59:14 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <cf8a52216cfe4651695669936bd4bb1b9500c57b.1679230025.git.daniel@makrotopia.org>
References: <cover.1679230025.git.daniel@makrotopia.org>
 <cf8a52216cfe4651695669936bd4bb1b9500c57b.1679230025.git.daniel@makrotopia.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:QlaKsSUYzhoHNVHDU4Rq0bkFMZFnwpaPu5MLgsBtp8NUsWc9o5S8LdeCQ2xzWzeAFwRt4
 Mxc17gdJOEOGXzEsWcJo6EZGPoMqwW0V1U3GeuO4/Z3SJzOql+e3/TBcCdOl7ocqDQckGIofFMMg
 3NFdoHc56LvqaiWj9Fh3f0NxCmZzPeIKfy5rbdVf/OC1ZYe/xa4tHtlGCYGHeD0NIj9VAJXJCXGV
 10Q2a3270UkO09xLwG9GMB1QW5JC+XRdTnC4+GAAjp53h3eL4e+Z9Qn/Ex1nrdoRI3WEn+uj18cS
 6s=
UI-OutboundReport: notjunk:1;M01:P0:eznMuFIIR60=;TcBxrqYLL8IXUHWdmSvm7sSx/yF
 klFeVRm/A0/rGq75P4jMohykpfRmQu+2ALaAOa3bZwmBn2mmTg7EbnW31GiYPZKTTK/OXwmte
 i6jI3k856t7uBjZ2/Ow0CWz8kctXTcAP5pvb7nlSLpRI8gEwu7q7OLweDs6JCNdVCutHR2cK6
 BvRCjnj4nHV+8tUDVxN/9jma+ruVIfhAfq6s47UjEmF0q8txpN3kl6c7uRGuCS25GT94PoGsJ
 YJikkrCtnxWJhKbfmODBjtpb5NxPDttiCmspJOVzqEMfYHZDpBQHtoDmMMbVgLfJP8HtdnSuX
 j1MBV3b1qujWoxgn6bYcWNgggB3BQhkoNhn4JTaFGJqogbcb/UgxGuPdr3jK1bfcv7clyIsIB
 og00aDaCWKv6QPj3rYgPZFGE/rEkunnVxTmCYK1GXZiFruHEOGfZ0iKXw3tYKEK8mZ7XtDsD8
 y0I6y82h4nLMHKpd7PSA6Uxmj2JaMnm9Pbf8eFfGiFmxHirQVUp+NkkGGe5ynTGO2XbLta4YK
 oQswLwvbhxPJ7nMo8urh1zgga8HJr9d/c237oduv+CWbLbjX++y3ugeMr03dH2jtj5gYCLNCu
 nUOeEbao8xek3yAbDGG//Wd0DSJZgCAcIlRWekai9264JvYYZqnQcKc2VeD+hOHc/vqBZ+CxW
 0vjxH/RoASEFfmiF/RgJExNW2f8TuQljfXEZFHj0seGiKiUblwKBgrUwb4nEUKinDOb3/0YDF
 i58Clg6jjcTcj/4H0oiT8GF1DWIr5nSPOzR8kV8Owol1ZEd+sWEuUAICL7DJLgk2YTqorPoNB
 qxzuVLOiT1e2eGOsRbC7JoOQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_150002_413460_2B276F01 
X-CRM114-Status: UNSURE (   6.38  )
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

as Patches are the same as v13

Tested-By: Frank Wunderlich <frank-w@public-files.de>

regards Frank

