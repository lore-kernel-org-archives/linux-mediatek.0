Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDB4C636D7
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Feb 2023 10:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVrDaub62HuqRk2C0zeAgvtpey2w2onmZg2Tso2bcx8=; b=MfTwWC2cYmg3ICU90GNbKhfZvI
	Zck4hVNsWIu+SpIloR/I7jDUuyhwb8wNJmmgWfac+PP8dpVywNkmEjowGPj0x20YjYUh+14baw4pd
	Ak1ghcJ5y2vETFbyQC5BTB31LXGJGsRm8OKqcSSZZ+Sa8NGx5j+WF7tWHTWYvtqGJS3iJ8um7GwPY
	dqmwJ8vo9nKiBPvKmBz5lnZvtaO8uD9Am4y4v6fo0u5XOHXrDTmX2A7SAx2pVp9ZjvBOXToM5ezDx
	ajCf0oiAz5Ha6vLVoxxayioJtKsWueSWXncvojNAhioEdTrFs+Uj31Y7ShWZ6FQnCzMkYCXJBbmq3
	uiaaBi8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTKOl-00Gm74-PE; Sat, 18 Feb 2023 10:24:55 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTKOW-00Gm44-QP; Sat, 18 Feb 2023 10:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1676715866; i=frank-w@public-files.de;
	bh=yVrDaub62HuqRk2C0zeAgvtpey2w2onmZg2Tso2bcx8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hn7nm0/3OZtO+vZuNNd8CtEEQ3pO51L6FCbqj0lv+k0YCr4d5pNZymwVoKGwIaPwG
	 MhZsXjl6/8KmKNpsPYvII+s19fSk2xtSmj3vDiWZ7OWuYWHV6mGfei2chBxuXwfUJa
	 8Me2uxChRpNTwgfjAUOdHRh8ahKgFmZ7dGi/XGiNGyQyholYWzp736PbSi7cMriZca
	 QYzPaGfp3nucwSovXsmpbNtMxzvJ2q5WLT/o6OHvG89/rmTbHjHkGvsx3uZFjLXbhV
	 s4DNUYE0gplhFNQCkU3J9x653S3snsXvsCq5XUT7+gBEU1qhUnLEV9mGtzLKY9Wwlk
	 IorxvCJx0s26Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.5] ([217.61.153.5]) by web-mail.gmx.net
 (3c-app-gmx-bap53.server.lan [172.19.172.123]) (via HTTP); Sat, 18 Feb 2023
 11:24:26 +0100
MIME-Version: 1.0
Message-ID: <trinity-dab715b9-3953-40da-bc25-c4c2a5e9b7c3-1676715866453@3c-app-gmx-bap53>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Aw: Re: [PATCH v3 0/5] arm: dts: mt7623: relocate gmacs, mt7530
 switch, and add port@5
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Feb 2023 11:24:26 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
 <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:dlJes5PJE7yl4BFksi3ruUFwrsZ+gOjgCEWZwdqImKbxOQ4mJrY+hbKHZzDTcwAZDU36r
 UpRlrQ7x5zDoSLhDZdPvfsI3BiqXWEmZnTLzI57EZMBkg4LdBGn5StwAqnnfKLwFPClt6aAzhuSn
 k/5vebZpSKTW4ExKvXSZZ1+0GNXrzUTsmm03eyImJXzmBgtvu+tU7JAjcVfOsMyUHNFPz+YuOp+v
 BV6YnVgXyKtyKY86UJGqMvhS6XqlYisRfv39FXmAkX+dibjvkfE0RMtRC1xPOYTO6MZnpqHFd6BS
 r4=
UI-OutboundReport: notjunk:1;M01:P0:3sNueGfNIgM=;V01yQ6u4y9GW9Z9zZ6gAk5ljJBd
 prWDMJFESH7D4902GrYDOpaCb+jK9F3i9mScgBqxZo2xr5UHU+DDDGXfPf0H/Bf9LiFV3vVia
 fe/OmiReOA6NaQCsMj6UKAxsq4hESdzUceB+AUz3Ulvup7teGD42xnFa1EiZstHPEscBS3Z6C
 tCTxS+x3eFa0J5VSNG2xPbOgWuosgYc1dasnxXQgxWJr7SmnyiFM7OORH0LVPTOaiehHk5BcI
 0OoHP8rrh+qAm81TRS8AllYc27UNMnESK43CskotlMTXxl2aqtWBbWJuZSSZF7JkWtQX5b3qm
 O5entk1YqHWOEBz3lgVwOW8fYu7lUl6h+u6DanTeeNcuxCfAtyhdojkWVQFQtHklZVb5oK9/w
 KR6Aqayulcd+Mgv16+Jy3PC6+xs/NJXvbT1Sk3KFLOMJgQTA3yBwW+yMPc3oeuTa17n8Ng84s
 uEB70aPxm6R8cDfbPTmezSSlo0wNKvJr0mqWzZLel0sqp/p0I+eOTRmtn8F5oeJ9DysDX/aoG
 xAojxISbDudD4aWPblC+cyg2UyePdQZPqOzx2Cd+AW0JqCmiYtU8pnBr8IwtO5l4dD20F9AXF
 XwIMvLB9oXHqzDCVcavVtWq+NpDkdtALV8OQy57E4YU6xa5yX7WVTwd+zI72HFqJktM3Cwpyc
 qLBiHiL1Ww1U5Jl733mr/emypkw74fq1umFlVmAnZlqMK1GJDpmU4vZ0zjPszpqPQu2ZM3GuX
 4hGoMqe4YSIJp+EvIZI4Wb9TIgDZFKinWSlyX1AVvtDEgEqTcd6o4Aqgbomll6oF0FNTGmzN/
 lZppnwZ7+UxkhmB5ccptNXGg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_022441_259245_7E5AA108 
X-CRM114-Status: GOOD (  10.84  )
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

finally get some time to bootup with this series on my r2.

I see that inserting the port@5 as cpu-port maps this as default-cpu becau=
se dsa-core uses first found cpu-port as
default (dsa_tree_setup_cpu_ports in dsa.c) and because of lower bandwidth=
 (rgmii instead of trgmii) not the best choice.

But it look worse...network is currently broken (set both gmacs up).
I see arp-packets reaching remote side, but reponse is not received by r2

I have tested it on 6.2-rc8 (wan-port), maybe additional patches are neede=
d?...userspace setup should be right.

so i added series on top of net-next (no additional patches except some ba=
sic like build-script,defconfig and such)...same result...

i'm not sure if i change the mapping from userspace back to eth0, so disab=
led port@5 in switch, now port6 is
cpu-port again and it works...so something is wrong with port5 of switch o=
r gmac1.

regards Frank

