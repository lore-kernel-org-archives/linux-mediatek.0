Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B99C7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwAO0z9En6mLxOF3Ju75lHjUXBw+TZ9xk9DabZ0leYY=; b=q4tXB39D+tnbdt
	7EGpRDQm4zXw9TVYPmvT/sT3xtimI0OpLNHsTBVnxCbUB3WZvS+lDhKlwFTjsMnAxWCpqF4xDtQ8C
	pBP+X3qWsLYf8wVJjZa8T/fFmoq8kjUx1VZ3SwikBmNzgTyPsc60c6z1YwhG6FvIUthXueql+JxdV
	mY6nsa3GnSNPCpwMSA2RBhmxijKswv/5fYBp8CcaUHxgnFgWAYxX96R2lubzTLvv6s4d3HlHsvoW0
	ijUsj7dShpU6fnE71/cYadfhWDV9rbaArBU67pT4CTaEbH0QC0OAOD7zvUzsh+tFikqzFWJemE/P0
	gLm9saVbXNN3ZdHG7Ipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe08f-007Qa1-1f;
	Sun, 19 Mar 2023 21:00:25 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe08Z-007QYh-2J;
	Sun, 19 Mar 2023 21:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1679259590; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=naJvgxfc7mo6cG95E8IVzExgl38hmPTl3Dg8QD7cpxvy/GOj++FhCIUTQpJvoK7WF+tv7MhFrDCtJFzfRffDGNK3PjzuGjNjYHPNx7BtPc+c1F/zF4QoGtBP0qVVJ9//7BR5mL1byBcu3M9Lly52bmY2Bc06wL5C3QD8w65UV+k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1679259590; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=jwAO0z9En6mLxOF3Ju75lHjUXBw+TZ9xk9DabZ0leYY=; 
	b=mN3SK0xIJuOmOEaGxG6TGO/YhSRERPCOXaeAqYuQtPnACHI6CxvJ+2vttCI804IbvYFx2wFlgLGuEbk417ZC7QGEh4/jHEWGW7bqGWyTHZYWEb2e/qbqLAne8fn62OOyzPPn919pAyCcYU3q/YA/oNAYg36LGv6WkfN/vrt5s4I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1679259590;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=jwAO0z9En6mLxOF3Ju75lHjUXBw+TZ9xk9DabZ0leYY=;
	b=S1gNH/qjIJ3Rn11Tb0cC4wAdVehaPSBKBzmHCyDXSzUHUXSqRG50yIG4gFcoL43w
	QDMy2Q6jQSpUtVynindMK846Id2HgMVmxybXSmKJiNLpU0rl3IF85VclIE3tsG7de+O
	8Wn9cJa7DAZXqv/FOsuJGjyZrj54OrDMI5pVFj7M=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1679259589012624.8771487940448; Sun, 19 Mar 2023 13:59:49 -0700 (PDT)
Message-ID: <e9e6ad87-2db5-9767-ff39-64a302b06185@arinc9.com>
Date: Sun, 19 Mar 2023 23:59:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/21] pinctrl: ralink: fix ABI, improve driver, move
 to mediatek, improve dt-bindings
To: Linus Walleij <linus.walleij@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <CACRpkdbWmtBtpkW2=DUX2v6CR7aJz52R6y5mJ=W+VDena+Fzng@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CACRpkdbWmtBtpkW2=DUX2v6CR7aJz52R6y5mJ=W+VDena+Fzng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_140019_833566_B56FA17C 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 19.03.2023 23:49, Linus Walleij wrote:
> On Fri, Mar 17, 2023 at 10:30 PM <arinc9.unal@gmail.com> wrote:
> 
>> This is an ambitious effort I've been wanting to do for months.
> 
> I don't see any major missing ACKs so I just applied the patches, we
> can fix any remaining issues in-tree.
> 
> Good work!

Music to my ears. It was pretty final so I don't expect more issues.

Thanks for applying them.

Cheers.
Arınç

