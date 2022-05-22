Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D82C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRejQe0CEFSEK/PM6OHzMO4hueRHWCKr/KusqbHyAbU=; b=r6i8B55AOZDsMn
	hvabgB5TJCo+dHsKUgwE/vUr/D3x6SOcWaJQT/CdQoA8fYSiVkBt4/lYLISI9ZCT6mFgtwO30SihN
	SUihnapOwj3LxskDKmcfXnsE5uV2kz9AuTn6cioTlhyKms+/KYVNCdySfcivzvbQvfCuz2LMSwaks
	i8ym5fa4s0I+Xkg8PseEXYGI+APyDu7SwLJK75hlMg9C26IfAtO3JGQD/NsNHiyf/I+gI6R057U3X
	6dQeRBIAhwDTSZbnf2m67+mVI796bD3A6+MzTHA90m21Qjk+AyMavQXtXgrzKD+POLV2jIVRld4Os
	Tvas+g7r1d6+9Wz7frtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4Vo-002u6M-R5; Mon, 23 May 2022 09:38:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt358-002GHj-MY; Mon, 23 May 2022 08:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=NhsfUTBkrWji55/hehG2eMsJ42bdgjLISxqITUjpUg0=; b=no+tIPu8c9lj5c8RaB3EWPLvJE
 S2X6L48UvLmVtQyLjuSVup+pyQP6YHBC6Z7d5DPyei9O+G2jKzkKvbXg0uGU4Zhwx8NM0nTKyb0vo
 9EMoVOhczz9Atq2UxmeX2UC2jSQiw5MTsqr/fqjognSJ9V6h3n4YtSNd9JjOUqyiPXvT3D1cUoGNK
 dsY1yeQS/zemX5B5IbLfkoeARgXNNAwwv9GAZCZg4D/arrbPeVcmaso22XppwIoECObtxyCWG1ilS
 lRAjWZ43szJPXlMOkjQt0Zhdf1DeunXyLsTyRA4aQMYJ/jUNpTzSuy6gWI+y3aKzvoYDZAo+CHPwD
 tCC1GBow==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsp69-000YN1-6H; Sun, 22 May 2022 17:10:37 +0000
X-UUID: 4a6ba431919c46d19f0efeb4ac21d1a3-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:8d4ceaf8-8be5-4ce9-a499-28f093205b12, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:f1dc1be3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 4a6ba431919c46d19f0efeb4ac21d1a3-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 291991826; Sun, 22 May 2022 10:10:05 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 10:02:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 01:02:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 23 May 2022 01:02:39 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <bgolaszewski@baylibre.com>, <chun-jie.chen@mediatek.com>,
 <devicetree@vger.kernel.org>, <ikjn@chromium.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <mturquette@baylibre.com>,
 <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <sam.shih@mediatek.com>,
 <sboyd@kernel.org>, <tinghan.shen@mediatek.com>, <weiyi.lu@mediatek.com>,
 <wenst@chromium.org>, <y.oudjana@protonmail.com>,
 <yassine.oudjana@gmail.com>, <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v2 4/4] clk: mediatek: Add drivers for MediaTek MT6735
 main clock drivers
Date: Mon, 23 May 2022 01:02:39 +0800
Message-ID: <20220522170239.18519-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <c7b98ee4-cd4f-d7b7-726d-1acd4fafd50a@collabora.com>
References: <c7b98ee4-cd4f-d7b7-726d-1acd4fafd50a@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_181034_355946_E3434040 
X-CRM114-Status: GOOD (  26.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Angelo, Yassine,

>>>
>>> I'd actually argue that macros make it less readable. While reading
>>> other drivers I had a lot of trouble figuring out which argument
>>> is which field of the struct, and had to constantly go back to the
>>> macro definitions and count arguments to find it. Having it this
>>> way, each value is labeled clearly with the field it's in. I think
>>> the tradeoff between line count and readability here is worth it.
>> 
>> It is easier for multiple developers to work together if we have a common style.
>> 
>> How do you think?
>> 
>
>In my opinion, Yassine is definitely right about this one: unrolling these macros
>will make the code more readable, even though this has the side effect of making
>it bigger in the source code form (obviously, when compiled, it's going to be the
>exact same size).
>
>I wouldn't mind getting this clock driver in without the usage of macros, as much
>as I wouldn't mind converting all of the existing drivers to open-code everything
>instead of using macros that you have to find in various headers... this practice
>was done in multiple drivers (clock or elsewhere), so I don't think that it would
>actually be a bad idea to do it here on MediaTek too, even though I'm not aware of
>any *rule* that may want us to do that: if you check across drivers/clk/*, there's
>a big split in how drivers are made, where some are using macros (davinci, renesas,
>samsung, sprd, etc), and some are not (bcm, sunxi-ng, qcom, tegra, versatile, etc),
>so it's really "do it as you wish"...
>

Thanks for the explanation and guide. I think we can do that for all MediaTek
clock driver in the future, not having two styles in MediaTek clock driver now.

>
>... *but:*
>
>Apart from that, I also don't think that it is a good idea to convert the other
>MTK clock drivers right now, as this would make the upstreaming of MediaTek clock
>drivers harder for some of the community in this moment... especially when we look
>at how many MTK SoCs are out there in the wild, and how many we have upstream:
>something like 10% of them, or less.

and thanks for considering this too.

>
>I see the huge benefit of having a bigger community around MediaTek platforms as
>that's beneficial to get a way better support and solidity for all SoCs as they
>are sharing the same drivers and same framework, and expanding the support to more
>of them will only make it better with highly valuable community contributions.
>
>
>That said, Yassine, you should've understood that you have my full support on
>unrolling these macros - but it's not time to do that yet: you definitely know
>that MediaTek clock drivers are going through a big cleanup phase which is, at
>this point, unavoidable... if we are able to get the aid of scripts (cocci and
>others), that will make our life easier in this cleanup, and will also make us
>able to perform the entire cleanup with less effort and in less overall time.
>
>With that, I'm sad but I have to support Miles' decision on this one, and I also
>have to ask you to use macros in this driver.
>
>
>I am sure - and it is my wish - to see MediaTek clock drivers open-coding stuff
>instead of using macros, but that's something for the future - which will happen
>after the more important cleanups.
>
>After all, it will be just about running "gcc -E xxxx.c" and copy-pasting the
>unrolled macros to the clock drivers, which will be pretty fast and straightforward.
>
>
>Sorry for the wall of text, by the way.

Sounds good and I want to say thank you again, I learned a lot from your post
and patches you submitted.

and I also want to say thank you to Yassine for the patch.

thanks,
Miles
>
>Cheers,
>Angelo
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
