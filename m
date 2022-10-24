Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13497C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 18:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5eN1nKoPXuoCK7Gl3+FMCs35j1iBuKnWx40bT8XwGo8=; b=TQ9pf65a4+cSUm
	berca6kltq6GAkzWwswuClVJ/G/1h8KD/GyBpQReo8m1Ri3pMCn390nlXZmW9LpoDzC2Mpz4zLYGa
	i5bl/d5Z20KP2i118EMdNRDRCffX8Yo+MdwynK6dGNAWnWS7eQujVvWoprjWEgcCyIwZHFNI9snbR
	lBB3hJS7MHubv4VOkWEmPR8L4LThuREpUBgaDJIHhDWNnz5e5NSY2FFLBcIQuQ75gykIbudmVWjed
	IEaMIxvx/FZ7Y9sAxSdMVJUv04W5Rl+dDDcTiWGd66mu/6VCQ7oOYiWunD2/z5Y6TcgrUozxIYcBO
	bChcyJtntmnlU+946PiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on2Pa-002hXB-R0; Mon, 24 Oct 2022 18:42:58 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on2PQ-002hUQ-3l; Mon, 24 Oct 2022 18:42:49 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout3.routing.net (Postfix) with ESMTP id E5FBF62179;
	Mon, 24 Oct 2022 18:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666636962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5eN1nKoPXuoCK7Gl3+FMCs35j1iBuKnWx40bT8XwGo8=;
	b=DKp3owzY4XDL0mekK+h8sxv0vm1jog+pcq3JAPdytguMVom3skwnsN7RNZOuua8ih3SNdC
	yipXSLIYHtQKTOusPa4XVFSmSipZLGZGQQJnSAOaAAY0eNkHjJeqvDnnTRfkPv61TJa3QA
	wS7yc+nZ/PHp8DUk3hn2+4o01DjMIgI=
Received: from [127.0.0.1] (fttx-pool-80.245.75.40.bambit.de [80.245.75.40])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id DB82C803C9;
	Mon, 24 Oct 2022 18:42:40 +0000 (UTC)
Date: Mon, 24 Oct 2022 20:42:36 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: =?ISO-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/7=5D_dt-bindings=3A_mmc=3A_?= =?US-ASCII?Q?mtk-sd=3A_Set_clocks_based_on_compatible?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20221024164353.jzvx4ea442e4vahj@notapiano>
References: <20221023091247.70586-1-linux@fw-web.de> <20221023091247.70586-3-linux@fw-web.de> <20221024164353.jzvx4ea442e4vahj@notapiano>
Message-ID: <9940F0A3-9834-4614-A838-2E15BEABAC94@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 579f50de-c9e1-4760-9af4-fc1bfa646ae7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_114248_357152_BCDFBB0A 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 24=2E Oktober 2022 18:43:53 MESZ schrieb "N=C3=ADcolas F=2E R=2E A=2E Pr=
ado" <nfraprado@collabora=2Ecom>:
>Hi,
>
>thank you for picking this up=2E
>
>On Sun, Oct 23, 2022 at 11:12:42AM +0200, Frank Wunderlich wrote:
>> From: N=C3=ADcolas F=2E R=2E A=2E Prado <nfraprado@collabora=2Ecom>
>>=20
>> The binding was describing a single clock list for all platforms, but
>> that's not really suitable:
>>=20
>> Most platforms using at least 2 clocks (source, hclk), some of them
>> a third "source_cg"=2E Mt2712 requires an extra 'bus_clk' on some of
>> its controllers, while mt8192 requires 8 clocks=2E
>>=20
>> Move the clock definitions inside if blocks that match on the
>> compatibles=2E
>>=20
>> I used Patch from N=C3=ADcolas F=2E R=2E A=2E Prado and modified it to =
not using
>> "not" statement=2E
>>=20
>> Fixes: 59a23395d8aa ("dt-bindings: mmc: Add support for MT8192 SoC")
>> Signed-off-by: N=C3=ADcolas F=2E R=2E A=2E Prado <nfraprado@collabora=
=2Ecom>
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> ---
>> v2:
>> - add this patch
>> v3:
>> - add blank lines and change "not" to matchlist
>> - reorder entries - make generic first then order alphanumeric
>> - rewrite commit description
>> - drop soc-specific mt8183 - constraints were also set for it above
>
>This is wrong, see below=2E

You are right,will fix in v4

>> ---
>>  =2E=2E=2E/devicetree/bindings/mmc/mtk-sd=2Eyaml       | 113 ++++++++++=
+++-----
>>  1 file changed, 83 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml b/Docu=
mentation/devicetree/bindings/mmc/mtk-sd=2Eyaml
>> index 3cbf0208f1b4=2E=2E31bb6dc329d2 100644
>> --- a/Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml
>> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd=2Eyaml
>[=2E=2E]
>> =20
>> -if:
>> -  properties:
>> -    compatible:
>> -      contains:
>> -        const: mediatek,mt8183-mmc
>> -then:
>> -  properties:
>> -    reg:
>> -      minItems: 2
>
>You can't drop this=2E Nodes with the mt8183 compatible should keep requi=
ring two
>reg values=2E It's not covered by the branch below=2E
>
>Thanks,
>N=C3=ADcolas


regards Frank

