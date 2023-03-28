Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E25C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 21:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dtkb18ovKMaH43unnBPf7khKxODc/lZ7PabQ5gaNQy4=; b=465bpED4puSsn+
	oKlbAvf0Z2QwjLii3WM4uZXkb6xvX3msZY00/VdzyRUUslsM0dRYU+TXAL5YxBFr/DFOxz41UDNxj
	4u/T2tkIDZ1rwvAK7D+lU410JnWKwvk6lWWVhwiMFbCWp4e8KaCKuKOAj791O0/VaIlq0vzpwsSKl
	rHfsq/RNMXYpTNdtqDvh9dxNMWt2fK18VvEI1ZjuUWYcdGHaP4dhabnvXEEhweDPEE7IACJQgZZy+
	NyiJNocxRvpWG+yqFpsi7uYJCk4mtQIMA9eiY49WFyrjIOK19mEHuuQNX+hDy5vZCzKwgY+HpSE1k
	+3pNSUploFKhqo/LcERw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phGWk-00FsFp-1C;
	Tue, 28 Mar 2023 21:06:46 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phGWi-00FsEs-0k;
	Tue, 28 Mar 2023 21:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1680037585; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K3l+6cKlXTkJUHIja2qwDUU7cu+a8Rz+Gdw24HGBpKoIzOJ8vfmxi5gomdSRo3hB+ftJsTbY6mDeK9XzqG3ffCHE/07KCrn+FBaF08SbFGiC62IMJ+cJmBvf8cxCYobLT06itKX22R/XHnDvEa/JfKa6u6ajhSfLx5UjqXIkZZE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1680037585; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=dtkb18ovKMaH43unnBPf7khKxODc/lZ7PabQ5gaNQy4=; 
	b=S9FSj28Nsi6/etwDQlZ5k9YJE4DWFkN43BNMr4YzGYq7DIBj+qaV9IPabOSM8EIK4Ap3BYCvnzhmfWqpMC3N54quSqk52tK6qQFWCSaCrtcAr1Ty2+k943NrNgcAc2kTnc1hqjgT6lVTklKVNh8dMorDvuUHmcj0LVpvzoIGkEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680037585;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dtkb18ovKMaH43unnBPf7khKxODc/lZ7PabQ5gaNQy4=;
	b=PKmlQKkw4hyHAu+5NoHDphTDP0scndRBlGhQYcooVl0W1DLiU524odRu62YuKRAz
	hqFKtH3egX7y6vaU9CSe0+KQa5gjR2jmDe6d8GRT1q0tElvBczSJoj8QQapFc6XoaaQ
	UvmqYhmj6Lw55tHg5hFbk6BpIfeuX3133huAvmNM=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1680037584024831.8337484799076; Tue, 28 Mar 2023 14:06:24 -0700 (PDT)
Message-ID: <c12d50aa-7485-9ee4-3af1-8374de64eb07@arinc9.com>
Date: Wed, 29 Mar 2023 00:06:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 01/21] pinctrl: ralink: reintroduce
 ralink,rt2880-pinmux compatible string
To: Rob Herring <robh+dt@kernel.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-2-arinc.unal@arinc9.com>
 <CAL_JsqLDRHs=TfcLsc0RJzF6rj84eXZooejmhx4hBDnpvCTk5A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAL_JsqLDRHs=TfcLsc0RJzF6rj84eXZooejmhx4hBDnpvCTk5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_140644_326912_443A38ED 
X-CRM114-Status: UNSURE (   6.95  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28/03/2023 23:59, Rob Herring wrote:
> On Fri, Mar 17, 2023 at 4:30 PM <arinc9.unal@gmail.com> wrote:
>>
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> There have been stable releases with the ralink,rt2880-pinmux compatible
>> string included. Having it removed breaks the ABI. Reintroduce it.
> 
> ralink,rt2880-pinmux now shows up as an undocumented compatible string
> in linux-next. Where's the binding for it?

This is exactly what I was talking about here:

https://lore.kernel.org/linux-devicetree/3fdc7db4-0df3-f922-3dbf-9f9250c271aa@arinc9.com/

Arınç

