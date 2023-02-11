Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C1FC636CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 18:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28OqwzMczbBnmFl55pTjZ3gvNBAL8TvorcFiXJ75KCQ=; b=mynv+iiN3Tr6FW
	wWPRESQodFTEMTGerx+Cm86nd64sydNoOuathTlciAofGKmQdXEXCMQl0fF11v8vZkLdtcsCAXSWr
	VBlL1pUONysnWo4pC8lDKJtsO2elMH8e7UcIEmOFkvyqyMf6o2q5tXH/jkkLA/ROM+Tkwtt1uZAkZ
	M57nLzAv8spAM5DtzlZpe21n4SebBVs71uUo9JFXtwR75Cnabh+rfQ1B3OEDT/ytZdxYfi9PlCnjU
	2OXtsNo/F/6RbgYF0ITDMCvt6RITDmKfTDDY9Ez1/KLyruNahTzamfvkyWDAO013O/GiOzHov8898
	4Kn2znZohinFoOsvv8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQuF6-00A2aJ-1b; Sat, 11 Feb 2023 18:04:56 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQuEz-00A2Ys-5E; Sat, 11 Feb 2023 18:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1676138658;
	bh=28OqwzMczbBnmFl55pTjZ3gvNBAL8TvorcFiXJ75KCQ=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=ECSK4yWdNoemE+cCBAgLfXD60BepoIdTEIFpe7nuuW8CtzxtBaOFe2/G6VCkOzUgY
	 pQF/NVFD1uWNZH0lEwK8Khw7taSlymBhiem3JWTGFTtWMuDB2OdxT7LeM80D7vNoI1
	 GPLNCWAtbPWCjwaKEDfM0mjdJmrIZS9jZDpLFB20r1wBilY1w56APFa2zYsKLvZIFe
	 uhi0kFft9AwfschT8d/eMdmwZN10pDuLfTpIzOHZ7P5PSF4NPjG5ae6Sul8aaYkvyn
	 D9A5Rn/gfj/rWdYru9fYM5xNEYW+ylPPMt9oLXy267LW2IYfyOcyGncemhctXHbIdZ
	 I48BI9lK4IXIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.152.186]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6sit-1oVnIr0UEZ-018NDE; Sat, 11
 Feb 2023 19:04:18 +0100
Date: Sat, 11 Feb 2023 19:04:14 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net=5D_net=3A_dsa=3A_mt7530=3A_don=27t_chang?= =?US-ASCII?Q?e_PVC=5FEG=5FTAG_when_CPU_port_becomes_VLAN-aware?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
Message-ID: <1C64196D-371F-41AC-B357-41100DC66C2D@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SNjFAbPRNFfoTNnvYGgdmYJcqUiHRQ3qrLy965bMJv1604ANcU3
 r4yh85tvfLGSiRU5wSWoU0QgHBY53nbMyxuICdSjBKzGdrJu384A+BmTHZwXnpN778ZNrDq
 67G5w2ED4WrVqIldQDanuuNt+5RiTnxomcs6ztl9g+fevVKGlMGzA7EfLMHMUpWf2F9Drnc
 RiM4CRDD6fiqso/up2Afg==
UI-OutboundReport: notjunk:1;M01:P0:AntX5itq5M4=;VF74289oWQIAN+nPAdD/r83w895
 d6eMssTXJyYIU+/Pg6tNFXYiEz+svlikUjPuqQ8DOzZXTUYWOswrd5xfQDiTq536xWHi95D1V
 utlo2Isi7zagQpgmYb0Y5Qny7C2MECpOIKNiTj6O9drWN42tACQBntyuT8jmUuR69BMeZNWIt
 W0dWiRL0pzsxrsBkkyE9zRJG7Lq4pQlkAN+Zu6wzT2w8Fk5OEFJqdc3N/cDq6iDvswaz+0NQC
 QprKMc0Gb7BJcS7HT9l9ZdD0kIB8Meye8dG4ah/Ml514t5O/XBx9kZ6NAiEUPJm0T5r7zRSJz
 CusVA+gaD0SdwOLW4hpTiRe36DKXlH9ZB9jjlkb/nU+SOuG85Uw5TVC3DkIuSmbb8T2JZNud1
 0hXEbE7v+GxyY+5A02Brz8w4hfQLmH4rPMNs24NuGHc3IacYxxImJRxj8Prtmu39VChsGJQ2Y
 wbjQcdelzfozLwFg2pNLsC1bHm/Jc2XGYJ0nA3/v/MeKEtc3Tb8edAuiH+8wFAJwO6cItUiqZ
 8pdwucMII6BOrXKq/eOas5PlAE3OGW7Yc3KwDt3MAAfMIH0eWi6VOVxX/tNiW/Ap790Xxrgob
 0iWBzkey03kW8xZ9Ej9XsXtrEjz+fZM+d/WUtLvZRSHX4S7+X88lNLUTXsG3cI1rdq6moI5d0
 /qqI5hq/s2rpMegefh+lQjB52I0MRWj0t5K5AZRjoh+YxgFVMNLkNn85zU4tMVFtjTYxyw8rR
 1KSeoQAxSFGQ1ZE0HL4P+wqXnXL8GesoFrORSs3le8zFBCC0NCMGFbUforMvXncUGgvKuWU94
 kHTLO8KnAju9IywSqjPvq5OzMJ7lNUybOlSgzOlgSO4A7xMk/VwKL22XlgfUei4xSq+QA8Fji
 M7AIcF/iuDpkLGHPwYb3q3JtNHsLDMrGB9nal0ebiUBcvHcCmvRxNWbNwjwLHW+iBMn5Nt8Uw
 i0qSMg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_100453_227791_D41A3B72 
X-CRM114-Status: UNSURE (   5.86  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Can this be applied to next too?

It looks like discussion about different issues in mt7530 driver prevents =
it picking it up=2E
regards Frank

