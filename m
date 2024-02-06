Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D03EC4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2lFZZPCNVNZhzbCa5T+MjLLbKaAPsyPoqZFZFvC6rVk=; b=Y9uNWQQQRwO1ItnHdPea1JEkSq
	95c3tYGnUM44ZcGJDSYhS+rEgWluoB9Wcqe/IFSVEUt76rmtnPd1KnaLlzOfeSfxgGJrFf4czMQKd
	eEZEsns6KxcNwCAMhBeLSEV2IWRwS+zYTXIf2UF0wbmUZISfmQCppnKICjkIx98IZBn+9SdgkskL5
	VIK9NCtHFnupgZFt8oy6qDdWJNe7iYmcevn4+tcfM6z9QxPOWS1RU+9YcM8imM7fAVoGqrIb0bEUo
	FnRGLO6CDO1/QJr8O+rha1lLxHAKSHHza4M+s1Pn9JQ/pp4T18TdqB0LWEeQHxhRkNLG8JuCptEuC
	2OXEMalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFG5-00000006Doe-1Vkz;
	Tue, 06 Feb 2024 06:48:41 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXFG1-00000006DoA-2nYJ
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 06:48:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1707202098; x=1707806898; i=markus.elfring@web.de;
	bh=2lFZZPCNVNZhzbCa5T+MjLLbKaAPsyPoqZFZFvC6rVk=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=iuBBtHdqFjB2sYjgipc1iMpbV22LTAxj/3DgvdYl3uIEJWFxCcYew29Q7bHs/CmC
	 ebgQQuQha25yh96Yogx11P2ij3Lb8McRD5dIRQK4ItDbAoGjFpa5WbPJI7DjPOg/1
	 kNsm3eQarO7JkVjzZhvyA8wI9wFgESt0Y8aKqRGy/YVzRcEeLNPcZOMHqrKyWBjG0
	 0YCkVCT6WtbbqkCazeJ/riTNzaUgSMQi4RYqLGQ+aWDjNToJfE6xtTzMlQxxmYBnu
	 P6WYaRX6iRu84ODQ39o85UpHHDJ7DQabUN3opJP5eR3MpnSWzy9pzxQz2D7fCtjrT
	 FLR68XxRgSCaWbQIpQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N30ZN-1qs6gh0KuD-013NaD; Tue, 06
 Feb 2024 07:48:18 +0100
Message-ID: <8ffda85d-8fc4-4329-ac7c-1afa6c1eaa2e@web.de>
Date: Tue, 6 Feb 2024 07:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: Use
 devm_platform_get_and_ioremap_resource() in init_scp()
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de>
 <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
 <8f011126-c95a-4c71-8bc9-a6b0a5823c96@web.de>
 <CAMuHMdUQLWBQemtgnCHj64wCYAET8J2-MgbisyMChSbh0k0L7w@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAMuHMdUQLWBQemtgnCHj64wCYAET8J2-MgbisyMChSbh0k0L7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:o/3aMV1nQUNLqPKmjne/+7bI2APDOaggdys0QHaQrW0+OKONMkj
 sbqB6ZmxIPsUzqviRRKqYrOo3CpGDTOwnTZMY0Y6r9FAOqGGz3hMJjedOanCNM0Gn6TS2u0
 sCfXkd+jN4WNZByF3kKzfTjMGNjfMfaMHrF9rAnF/Ys0KvHM42yTwzsTcgGerrfjFN6MqDZ
 PqQMjLlgpR61ZYKxM66tg==
UI-OutboundReport: notjunk:1;M01:P0:7MxG6CeOe7w=;413LJvkTnNOJdKCs/lCykWnD2Kt
 BQT/UvQT71F5jO2KIRqATDo8w4RUIuLmDApmmtav+YMa3Ji20AeE3JMk1vJlau7eLC0kowAV4
 /8IRhk0BKXY+UmudkMp4AkAXEcO/sOCnsVJAHPlScYHgQA4fqMGlo5kKsm98BPLy8Zi+z3E00
 fFF2noJrZssdxBxxo54CTmSZ5NFukL5H1t48QwpFoYrAlfNAiiiisHPo1LwzUu4a5S73U++VC
 e3Tmv1VpghL2FEvxf5cy30cOzdTGIsHGWfieiBRd7HtnVyBEDn4F13kMK+G3SezR4vJv2X+rH
 DjhitoPaQkHncYR7tjral7yvnnVEdVyMuj7PIO19TpzsVcObV1aZg3ATqCuiup3aRzl/KxCM5
 RP8OAxbdLX3kRshzRs+D5RccfWOxbkrZUyqlHbs7cr2yDbjktuR5q8q3meiBLKOL3KsHGaaDM
 eGgo77a/UhN0Bwt2r3zcFwCIS8GVWKqUXx+ycJggwZN5uv51p9grMQpc4bTSNW6bEMjI6eH9o
 az2EmGRbt6Znsj2thyYziC7egRaYLBFKoRUKPvTHG8k+upFJUmvWWYs/87gXc34NzjfppYgV5
 NUJ5XG80ztfLvV4bP5qimen441rNJVSHLA7T06isu0DDd0KBJD6ytPxvJXDsx67STTDaT7XXL
 0Jx5yG3N+4c8S8k/dHBwq6KxZe8ObazKVBbLHnrfFzhpyxauE/O/OxA2Rzle5Yia+MCwTrK6Z
 1Z6tA9n4I5VcHcdWuBfuSveB8XqnHNiQSM4ovo1q1aO8lN6Bmzbx9erfx8Y2TVO0m3dWmAt/V
 HTjHOgUjvW1hi6+VUAz7ANL9DJdVtKEgZGsdeKIU7indI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_224838_089113_286A7DC3 
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

=E2=80=A6
>> I got another idea after looking at the implementation of the function
>> =E2=80=9Cdevm_platform_get_and_ioremap_resource=E2=80=9D once more.
>> https://elixir.bootlin.com/linux/v6.8-rc3/source/drivers/base/platform.=
c#L87
=E2=80=A6
> Yes, you can pass a NULL pointer as the last parameter.

Would you like to support any approaches which can make interface descript=
ions clearer
for such an implementation detail?


> And as this is very common, the wrapper devm_platform_ioremap_resource()=
 exists.

I find further collateral evolution interesting for the involved parameter=
 reduction.

Regards,
Markus

